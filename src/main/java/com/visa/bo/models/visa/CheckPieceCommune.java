package com.visa.bo.models.visa;

import com.visa.bo.models.demande.DemandeResident;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;

@Entity
@Table(name = "check_piece_commune")
public class CheckPieceCommune {
    @EmbeddedId
    private CheckPieceCommuneId id;

    @ManyToOne(optional = false)
    @MapsId("idDemandeResident")
    @JoinColumn(name = "id_demande_resident", nullable = false)
    private DemandeResident demandeResident;

    @ManyToOne(optional = false)
    @MapsId("idPieceCommune")
    @JoinColumn(name = "id_piece_commune", nullable = false)
    private PieceCommune pieceCommune;

    @Column(name = "est_fourni", nullable = false)
    private Boolean estFourni;

    public CheckPieceCommuneId getId() {
        return id;
    }

    public void setId(CheckPieceCommuneId id) {
        this.id = id;
    }

    public DemandeResident getDemandeResident() {
        return demandeResident;
    }

    public void setDemandeResident(DemandeResident demandeResident) {
        this.demandeResident = demandeResident;
    }

    public PieceCommune getPieceCommune() {
        return pieceCommune;
    }

    public void setPieceCommune(PieceCommune pieceCommune) {
        this.pieceCommune = pieceCommune;
    }

    public Boolean getEstFourni() {
        return estFourni;
    }

    public void setEstFourni(Boolean estFourni) {
        this.estFourni = estFourni;
    }
}
