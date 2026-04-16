
insert INTO type_visa (id_type_visa, libelle) VALUES ('TV00000' || nextval('seq_type_visa'), 'Travailleur');
insert INTO type_visa (id_type_visa, libelle) VALUES ('TV00000' || nextval('seq_type_visa'), 'investisseur');


insert into situation_famille (id_situation_famille, libelle) VALUES ('SF00000' || nextval('seq_situation_famille'), 'Célibataire');
insert into situation_famille (id_situation_famille, libelle) VALUES ('SF00000' || nextval('seq_situation_famille'), 'Marié');

insert into categorie_demande (id_categorie, libelle) VALUES ('CD00000' || nextval('seq_categorie_demande'), 'Nouvelle demande');
insert into categorie_demande (id_categorie, libelle) VALUES ('CD00000' || nextval('seq_categorie_demande'), 'Duplicata');

insert into piece (id_piece, libelle, id_type_visa) VALUES ('P00000' || nextval('seq_piece'), 'Autorisation emploi délivrée à Madagascar par le Ministère de la Fonction publique', 'TV000001');
insert into piece (id_piece, libelle, id_type_visa) VALUES ('P00000' || nextval('seq_piece'), 'Attestation d’emploi délivré par l’employeur (Original)', 'TV000001');
insert into piece (id_piece, libelle, id_type_visa) VALUES ('P00000' || nextval('seq_piece'), 'Statut de la Société', 'TV000002');
insert into piece (id_piece, libelle, id_type_visa) VALUES ('P00000' || nextval('seq_piece'), 'Extrait d’inscription au registre de commerce', 'TV000002');
insert into piece (id_piece, libelle, id_type_visa) VALUES ('P00000' || nextval('seq_piece'), 'Carte fiscale', 'TV000002');

insert into piece (id_piece, libelle, id_type_visa) VALUES ('P00000' || nextval('seq_piece'), '02 photos d’identité', NULL);
insert into piece (id_piece, libelle, id_type_visa) VALUES ('P00000' || nextval('seq_piece'), 'Notice de renseignement', NULL);
insert into piece (id_piece, libelle, id_type_visa) VALUES ('P00000' || nextval('seq_piece'), 'Demande adressée à Mr le Ministère de l’Intérieur et de la Décentralisation avec adresse e-mail et numéro téléphone portable', NULL);
insert into piece (id_piece, libelle, id_type_visa) VALUES ('P00000' || nextval('seq_piece'), 'Photocopie certifiée du visa en cours de validité', NULL);
insert into piece (id_piece, libelle, id_type_visa) VALUES ('P00000' || nextval('seq_piece'), 'Photocopie certifiée de la première page du passeport', NULL);
insert into piece (id_piece, libelle, id_type_visa) VALUES ('P00000' || nextval('seq_piece'), 'Photocopie certifiée de la carte résident en cours de validité', NULL);
insert into piece (id_piece, libelle, id_type_visa) VALUES ('P00000' || nextval('seq_piece'), 'Certificat de résidence à Madagascar', NULL);
insert into piece (id_piece, libelle, id_type_visa) VALUES ('P00000' || nextval('seq_piece'), 'Extrait de casier judiciaire moins de 3 mois', NULL);
