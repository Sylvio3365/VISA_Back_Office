package com.visa.bo.models.demande;

import java.io.Serializable;
import java.util.Objects;
import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class CheckPieceId implements Serializable {
    @Column(name = "id_demande_resident", length = 50)
    private String idDemandeResident;

    @Column(name = "id_piece", length = 50)
    private String idPiece;

    public String getIdDemandeResident() {
        return idDemandeResident;
    }

    public void setIdDemandeResident(String idDemandeResident) {
        this.idDemandeResident = idDemandeResident;
    }

    public String getIdPiece() {
        return idPiece;
    }

    public void setIdPiece(String idPiece) {
        this.idPiece = idPiece;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        CheckPieceId that = (CheckPieceId) o;
        return Objects.equals(idDemandeResident, that.idDemandeResident)
            && Objects.equals(idPiece, that.idPiece);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idDemandeResident, idPiece);
    }
}
