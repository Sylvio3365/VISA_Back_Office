package com.visa.bo.models.etatcivique;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "personne")
public class Personne {
    @Id
    @Column(name = "id_personne", length = 50)
    private String idPersonne;

    @Column(name = "nom", nullable = false, length = 250)
    private String nom;

    @Column(name = "prenom", nullable = false, length = 250)
    private String prenom;

    @Column(name = "profession", nullable = false, length = 50)
    private String profession;

    @Column(name = "nom_jeune_fille", length = 50)
    private String nomJeuneFille;

    @Column(name = "domicile", nullable = false, length = 50)
    private String domicile;

    @Column(name = "dtn", nullable = false)
    private LocalDate dtn;

    @Column(name = "email", nullable = false, length = 50)
    private String email;

    @Column(name = "telephone", nullable = false, length = 50)
    private String telephone;

    @ManyToOne(optional = false)
    @JoinColumn(name = "id_nationalite", nullable = false)
    private Nationalite nationalite;

    @ManyToOne(optional = false)
    @JoinColumn(name = "id_situation_famille", nullable = false)
    private SituationFamille situationFamille;

    public String getIdPersonne() {
        return idPersonne;
    }

    public void setIdPersonne(String idPersonne) {
        this.idPersonne = idPersonne;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getNomJeuneFille() {
        return nomJeuneFille;
    }

    public void setNomJeuneFille(String nomJeuneFille) {
        this.nomJeuneFille = nomJeuneFille;
    }

    public String getDomicile() {
        return domicile;
    }

    public void setDomicile(String domicile) {
        this.domicile = domicile;
    }

    public LocalDate getDtn() {
        return dtn;
    }

    public void setDtn(LocalDate dtn) {
        this.dtn = dtn;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Nationalite getNationalite() {
        return nationalite;
    }

    public void setNationalite(Nationalite nationalite) {
        this.nationalite = nationalite;
    }

    public SituationFamille getSituationFamille() {
        return situationFamille;
    }

    public void setSituationFamille(SituationFamille situationFamille) {
        this.situationFamille = situationFamille;
    }
}
