<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:url var="defaultDemandesUrl" value="/demandes" />
<c:choose>
    <c:when test="${not empty demandesBackUrl}">
        <c:set var="finalDemandesBackUrl" value="${pageContext.request.contextPath}${demandesBackUrl}" />
    </c:when>
    <c:otherwise>
        <c:set var="finalDemandesBackUrl" value="${defaultDemandesUrl}" />
    </c:otherwise>
</c:choose>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_nouveau_titre.css">
<style>
    .detail-badge {
        display: inline-flex;
        align-items: center;
        gap: 0.35rem;
        padding: 0.28rem 0.62rem;
        border-radius: 999px;
        font-size: 0.78rem;
        font-weight: 700;
        border: 1px solid transparent;
    }

    .detail-badge-type {
        color: var(--accent-strong, #0a6d61);
        background: rgba(12, 138, 123, 0.12);
        border-color: rgba(12, 138, 123, 0.35);
    }

    .detail-badge-status {
        color: #1e3a8a;
        background: rgba(59, 130, 246, 0.14);
        border-color: rgba(59, 130, 246, 0.32);
    }

    .piece-item {
        border: 1px solid rgba(15, 23, 42, 0.08);
        border-radius: 0.8rem;
        padding: 0.7rem 0.85rem;
        background: #fff;
    }

    .piece-meta {
        display: flex;
        flex-wrap: wrap;
        gap: 0.45rem;
        margin-top: 0.4rem;
    }

    .piece-tag {
        display: inline-flex;
        align-items: center;
        gap: 0.3rem;
        border-radius: 999px;
        padding: 0.2rem 0.55rem;
        font-size: 0.74rem;
        font-weight: 700;
        border: 1px solid transparent;
    }

    .piece-tag-obligatoire {
        color: #7c2d12;
        background: rgba(251, 146, 60, 0.16);
        border-color: rgba(251, 146, 60, 0.45);
    }

    .piece-tag-optionnelle {
        color: #475569;
        background: rgba(148, 163, 184, 0.15);
        border-color: rgba(148, 163, 184, 0.35);
    }

    .piece-tag-fourni {
        color: var(--accent-strong, #0a6d61);
        background: rgba(12, 138, 123, 0.14);
        border-color: rgba(12, 138, 123, 0.35);
    }

    .piece-tag-manquant {
        color: #b91c1c;
        background: rgba(239, 68, 68, 0.14);
        border-color: rgba(239, 68, 68, 0.34);
    }
</style>

<div class="container nt-page">
    <div class="nt-page-head d-flex flex-wrap justify-content-between align-items-start gap-3">
        <div>
            <h1 class="nt-page-title"><i class="fas fa-folder-open me-2"></i>Fiche demande</h1>
            <p class="nt-page-subtitle">Consultation des informations principales d'une demande.</p>
        </div>
        <a class="btn btn-outline-secondary" href="${finalDemandesBackUrl}">
            <i class="fas fa-arrow-left me-2"></i>Retour a la liste
        </a>
    </div>

    <div class="row g-4">
        <div class="col-12">
            <div class="card shadow-sm nt-form-card">
                <div class="card-body p-4">
                    <h3 class="card-title nt-title mb-4"><i class="fas fa-clipboard-list me-2"></i>Informations generales</h3>
                    <div class="row g-3">
                        <div class="col-md-6 col-lg-4">
                            <label class="form-label mb-1">ID demande</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.idDemande}">${demande.idDemande}</c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <label class="form-label mb-1">Statut</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demandeStatus}">
                                        <span class="detail-badge detail-badge-status"><i class="fas fa-signal" aria-hidden="true"></i>${demandeStatus}</span>
                                    </c:when>
                                    <c:when test="${not empty demandeDetail and not empty demandeDetail.statut}">
                                        <span class="detail-badge detail-badge-status"><i class="fas fa-signal" aria-hidden="true"></i>${demandeDetail.statut}</span>
                                    </c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <label class="form-label mb-1">Categorie</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.categorie and not empty demande.categorie.libelle}">${demande.categorie.libelle}</c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <label class="form-label mb-1">Type visa</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.typeVisa and not empty demande.typeVisa.libelle}">
                                        <span class="detail-badge detail-badge-type"><i class="fas fa-id-card" aria-hidden="true"></i>${demande.typeVisa.libelle}</span>
                                    </c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <label class="form-label mb-1">Date creation</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.createdAt}">${demande.createdAt}</c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <label class="form-label mb-1">Derniere mise a jour</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.updatedAt}">${demande.updatedAt}</c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12">
            <div class="card shadow-sm nt-form-card">
                <div class="card-body p-4">
                    <h3 class="card-title nt-title mb-4"><i class="fas fa-user-circle me-2"></i>Informations du demandeur</h3>
                    <div class="row g-3">
                        <div class="col-md-6 col-lg-4">
                            <label class="form-label mb-1">ID demandeur</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.demandeur and not empty demande.demandeur.idDemandeur}">${demande.demandeur.idDemandeur}</c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <label class="form-label mb-1">Demandeur</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.demandeur}">
                                        <c:choose>
                                            <c:when test="${not empty demande.demandeur.nom or not empty demande.demandeur.prenom}">
                                                ${demande.demandeur.nom} ${demande.demandeur.prenom}
                                            </c:when>
                                            <c:when test="${not empty demande.demandeur.idDemandeur}">${demande.demandeur.idDemandeur}</c:when>
                                            <c:otherwise>Non renseigne</c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <label class="form-label mb-1">Date de naissance</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.demandeur and not empty demande.demandeur.dtn}">${demande.demandeur.dtn}</c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <label class="form-label mb-1">Nationalite</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.demandeur and not empty demande.demandeur.nationalite and not empty demande.demandeur.nationalite.libelle}">${demande.demandeur.nationalite.libelle}</c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <label class="form-label mb-1">Situation familiale</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.demandeur and not empty demande.demandeur.situationFamille and not empty demande.demandeur.situationFamille.libelle}">${demande.demandeur.situationFamille.libelle}</c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <label class="form-label mb-1">Telephone</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.demandeur and not empty demande.demandeur.telephone}">${demande.demandeur.telephone}</c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <label class="form-label mb-1">Email</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.demandeur and not empty demande.demandeur.email}">${demande.demandeur.email}</c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-12">
                            <label class="form-label mb-1">Adresse locale</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.demandeur and not empty demande.demandeur.adresseMada}">${demande.demandeur.adresseMada}</c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12">
            <div class="card shadow-sm nt-form-card">
                <div class="card-body p-4">
                    <h3 class="card-title nt-title mb-4"><i class="fas fa-passport me-2"></i>Informations du passeport</h3>
                    <div class="row g-3">
                        <div class="col-md-6 col-lg-3">
                            <label class="form-label mb-1">Numero passeport</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.passport and not empty demande.passport.numero}">${demande.passport.numero}</c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <label class="form-label mb-1">Date delivrance passeport</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.passport and not empty demande.passport.delivreLe}">${demande.passport.delivreLe}</c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <label class="form-label mb-1">Date expiration passeport</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.passport and not empty demande.passport.expireLe}">${demande.passport.expireLe}</c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <label class="form-label mb-1">ID passeport</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.passport and not empty demande.passport.idPassport}">${demande.passport.idPassport}</c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12">
            <div class="card shadow-sm nt-form-card">
                <div class="card-body p-4">
                    <h3 class="card-title nt-title mb-4"><i class="fas fa-stamp me-2"></i>Visa transformable</h3>
                    <div class="row g-3">
                        <div class="col-md-6 col-lg-3">
                            <label class="form-label mb-1">ID visa transformable</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.visaTransformable and not empty demande.visaTransformable.idVisaTransformable}">${demande.visaTransformable.idVisaTransformable}</c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <label class="form-label mb-1">Reference visa</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.visaTransformable and not empty demande.visaTransformable.refVisa}">${demande.visaTransformable.refVisa}</c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <label class="form-label mb-1">Date debut visa</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.visaTransformable and not empty demande.visaTransformable.dateDebut}">${demande.visaTransformable.dateDebut}</c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <label class="form-label mb-1">Date fin visa</label>
                            <div class="text-body text-break lh-sm">
                                <c:choose>
                                    <c:when test="${not empty demande and not empty demande.visaTransformable and not empty demande.visaTransformable.dateFin}">${demande.visaTransformable.dateFin}</c:when>
                                    <c:otherwise>Non renseigne</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12">
            <div class="card shadow-sm nt-form-card">
                <div class="card-body p-4">
                    <h3 class="card-title nt-title mb-4"><i class="fas fa-file-alt me-2"></i>Pieces communes</h3>
                    <c:choose>
                        <c:when test="${not empty piecesCommunes}">
                            <div class="row g-3">
                                <c:forEach var="piece" items="${piecesCommunes}">
                                    <div class="col-12 col-lg-6">
                                        <div class="piece-item">
                                            <div class="fw-semibold text-body">${piece.libelle}</div>
                                            <div class="text-muted small">${piece.idPiece}</div>
                                            <div class="piece-meta">
                                                <span class="piece-tag ${piece.obligatoire ? 'piece-tag-obligatoire' : 'piece-tag-optionnelle'}">
                                                    <i class="fas ${piece.obligatoire ? 'fa-asterisk' : 'fa-circle'}" aria-hidden="true"></i>
                                                    ${piece.obligatoire ? 'Obligatoire' : 'Optionnelle'}
                                                </span>
                                                <span class="piece-tag ${piece.fourni ? 'piece-tag-fourni' : 'piece-tag-manquant'}">
                                                    <i class="fas ${piece.fourni ? 'fa-check-circle' : 'fa-times-circle'}" aria-hidden="true"></i>
                                                    ${piece.fourni ? 'Fournie' : 'Non fournie'}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="text-muted">Aucune piece commune.</div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <div class="col-12">
            <div class="card shadow-sm nt-form-card">
                <div class="card-body p-4">
                    <h3 class="card-title nt-title mb-4"><i class="fas fa-file me-2"></i>Pieces complementaires</h3>
                    <c:choose>
                        <c:when test="${not empty piecesComplementaires}">
                            <div class="row g-3">
                                <c:forEach var="piece" items="${piecesComplementaires}">
                                    <div class="col-12 col-lg-6">
                                        <div class="piece-item">
                                            <div class="fw-semibold text-body">${piece.libelle}</div>
                                            <div class="text-muted small">${piece.idPiece}</div>
                                            <div class="piece-meta">
                                                <span class="piece-tag ${piece.obligatoire ? 'piece-tag-obligatoire' : 'piece-tag-optionnelle'}">
                                                    <i class="fas ${piece.obligatoire ? 'fa-asterisk' : 'fa-circle'}" aria-hidden="true"></i>
                                                    ${piece.obligatoire ? 'Obligatoire' : 'Optionnelle'}
                                                </span>
                                                <span class="piece-tag ${piece.fourni ? 'piece-tag-fourni' : 'piece-tag-manquant'}">
                                                    <i class="fas ${piece.fourni ? 'fa-check-circle' : 'fa-times-circle'}" aria-hidden="true"></i>
                                                    ${piece.fourni ? 'Fournie' : 'Non fournie'}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="text-muted">Aucune piece complementaire.</div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <div class="alert alert-info mt-4 mb-0" role="status">
        <i class="fas fa-info-circle me-2"></i>Les champs absents sont affiches comme "Non renseigne".
    </div>
</div>