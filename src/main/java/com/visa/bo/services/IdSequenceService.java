package com.visa.bo.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;

import javax.sql.DataSource;

import org.springframework.stereotype.Service;

@Service
public class IdSequenceService {
    private static final Logger LOGGER = Logger.getLogger(IdSequenceService.class.getName());
    private static final Pattern IDENTIFIER = Pattern.compile("^[A-Za-z_][A-Za-z0-9_]*$");

    private final DataSource dataSource;

    public IdSequenceService(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public String generateId(String tableName, String idColumn, String prefix, int numericLength) {
        validateIdentifier(tableName, "tableName");
        validateIdentifier(idColumn, "idColumn");
        if (prefix == null || prefix.isBlank()) {
            throw new IllegalArgumentException("prefix ne peut pas etre vide");
        }
        if (numericLength <= 0) {
            throw new IllegalArgumentException("numericLength doit etre > 0");
        }

        try (Connection conn = dataSource.getConnection()) {
            return generateId(conn, tableName, idColumn, prefix, numericLength);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Erreur lors de la generation d'ID", e);
            throw new IllegalStateException("Erreur lors de la generation d'ID", e);
        }
    }

    private String generateId(
        Connection conn,
        String tableName,
        String idColumn,
        String prefix,
        int numericLength
    ) throws SQLException {
        ensureSequencesTableExists(conn);

        boolean previousAutoCommit = conn.getAutoCommit();
        conn.setAutoCommit(false);

        try {
            Long lastValue = null;
            String storedPrefix = null;
            Integer storedLength = null;

            String selectSql = "SELECT prefix, last_value, numeric_length FROM id_sequences WHERE table_name = ? FOR UPDATE";
            try (PreparedStatement ps = conn.prepareStatement(selectSql)) {
                ps.setString(1, tableName);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        storedPrefix = rs.getString("prefix");
                        long value = rs.getLong("last_value");
                        if (!rs.wasNull()) {
                            lastValue = value;
                        }
                        int length = rs.getInt("numeric_length");
                        if (!rs.wasNull()) {
                            storedLength = length;
                        }
                    }
                }
            }

            if (storedPrefix != null && !storedPrefix.isBlank()) {
                prefix = storedPrefix;
            }
            if (storedLength != null && storedLength > 0) {
                numericLength = storedLength;
            }

            if (lastValue == null) {
                long derived = deriveLastFromTable(conn, tableName, idColumn, prefix);
                String insertSql = "INSERT INTO id_sequences(table_name, prefix, last_value, numeric_length) VALUES (?, ?, ?, ?)";
                try (PreparedStatement psInsert = conn.prepareStatement(insertSql)) {
                    psInsert.setString(1, tableName);
                    psInsert.setString(2, prefix);
                    psInsert.setLong(3, derived);
                    psInsert.setInt(4, numericLength);
                    psInsert.executeUpdate();
                }
                lastValue = derived;
            }

            long next = lastValue + 1L;
            String updateSql = "UPDATE id_sequences SET last_value = ? WHERE table_name = ?";
            try (PreparedStatement psUpdate = conn.prepareStatement(updateSql)) {
                psUpdate.setLong(1, next);
                psUpdate.setString(2, tableName);
                psUpdate.executeUpdate();
            }

            conn.commit();

            String numericPart = String.format("%0" + numericLength + "d", next);
            return prefix + numericPart;

        } catch (SQLException e) {
            try {
                conn.rollback();
            } catch (SQLException ex) {
                LOGGER.log(Level.SEVERE, "Rollback failed", ex);
            }
            throw e;
        } finally {
            try {
                conn.setAutoCommit(previousAutoCommit);
            } catch (SQLException e) {
                LOGGER.log(Level.WARNING, "Impossible de restaurer autoCommit", e);
            }
        }
    }

    private void ensureSequencesTableExists(Connection conn) throws SQLException {
        final String ddl = "CREATE TABLE IF NOT EXISTS id_sequences (" +
            "table_name TEXT PRIMARY KEY," +
            "prefix TEXT NOT NULL," +
            "last_value BIGINT NOT NULL," +
            "numeric_length INT NOT NULL" +
            ")";
        try (Statement st = conn.createStatement()) {
            st.execute(ddl);
        }
    }

    private long deriveLastFromTable(Connection conn, String tableName, String idColumn, String prefix)
        throws SQLException {
        String sql = "SELECT MAX(" + idColumn + ") FROM " + tableName + " WHERE " + idColumn + " LIKE ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, prefix + "%");
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String maxId = rs.getString(1);
                    if (maxId != null && maxId.length() > prefix.length()) {
                        String numeric = maxId.substring(prefix.length());
                        try {
                            return Long.parseLong(numeric);
                        } catch (NumberFormatException ex) {
                            LOGGER.log(Level.WARNING, "Impossible de parser la partie numerique: " + maxId, ex);
                            return 0L;
                        }
                    }
                }
            }
        }
        return 0L;
    }

    private void validateIdentifier(String ident, String paramName) {
        if (ident == null || ident.trim().isEmpty()) {
            throw new IllegalArgumentException(paramName + " ne peut pas etre vide");
        }
        if (!IDENTIFIER.matcher(ident).matches()) {
            throw new IllegalArgumentException("Identifiant SQL invalide pour " + paramName + ": " + ident);
        }
    }
}
