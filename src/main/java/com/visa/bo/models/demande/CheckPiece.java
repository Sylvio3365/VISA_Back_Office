package com.visa.bo.models.demande;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;

@Entity
@Table(name = "check_piece")
public class CheckPiece {
    @EmbeddedId
    private CheckPieceId id;

    @ManyToOne(optional = false)
    @MapsId("idDemandeResident")
    @JoinColumn(name = "id_demande_resident", nullable = false)
    private DemandeResident demandeResident;

    @ManyToOne(optional = false)
    @MapsId("idPiece")
    @JoinColumn(name = "id_piece", nullable = false)
    private Piece piece;

    @Column(name = "est_fourni")
    private Boolean estFourni;

    public CheckPieceId getId() {
        return id;
    }

    public void setId(CheckPieceId id) {
        this.id = id;
    }

    public DemandeResident getDemandeResident() {
        return demandeResident;
    }

    public void setDemandeResident(DemandeResident demandeResident) {
        this.demandeResident = demandeResident;
    }

    public Piece getPiece() {
        return piece;
    }

    public void setPiece(Piece piece) {
        this.piece = piece;
    }

    public Boolean getEstFourni() {
        return estFourni;
    }

    public void setEstFourni(Boolean estFourni) {
        this.estFourni = estFourni;
    }
}
