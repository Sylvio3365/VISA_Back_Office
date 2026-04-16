package com.visa.bo.models.visa;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "piece_commune")
public class PieceCommune {
    @Id
    @Column(name = "id_piece_commune", length = 50)
    private String idPieceCommune;

    @Column(name = "libelle", nullable = false, length = 150)
    private String libelle;

    public String getIdPieceCommune() {
        return idPieceCommune;
    }

    public void setIdPieceCommune(String idPieceCommune) {
        this.idPieceCommune = idPieceCommune;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }
}
