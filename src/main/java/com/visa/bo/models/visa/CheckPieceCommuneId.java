package com.visa.bo.models.visa;

import java.io.Serializable;
import java.util.Objects;
import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class CheckPieceCommuneId implements Serializable {
    @Column(name = "id_demande_resident", length = 50)
    private String idDemandeResident;

    @Column(name = "id_piece_commune", length = 50)
    private String idPieceCommune;

    public String getIdDemandeResident() {
        return idDemandeResident;
    }

    public void setIdDemandeResident(String idDemandeResident) {
        this.idDemandeResident = idDemandeResident;
    }

    public String getIdPieceCommune() {
        return idPieceCommune;
    }

    public void setIdPieceCommune(String idPieceCommune) {
        this.idPieceCommune = idPieceCommune;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        CheckPieceCommuneId that = (CheckPieceCommuneId) o;
        return Objects.equals(idDemandeResident, that.idDemandeResident)
            && Objects.equals(idPieceCommune, that.idPieceCommune);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idDemandeResident, idPieceCommune);
    }
}
