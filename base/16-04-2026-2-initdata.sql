
insert INTO type_visa (id_type_visa, libelle) VALUES ('TV00000' || nextval('seq_type_visa'), 'Travailleur');
insert INTO type_visa (id_type_visa, libelle) VALUES ('TV00000' || nextval('seq_type_visa'), 'investisseur');

select * from type_visa;

insert into situation_famille (id_situation_famille, libelle) VALUES ('SF00000' || nextval('seq_situation_famille'), 'Célibataire');
insert into situation_famille (id_situation_famille, libelle) VALUES ('SF00000' || nextval('seq_situation_famille'), 'Marié');

insert into categorie_demande (id_categorie, libelle) VALUES ('CD00000' || nextval('seq_categorie_demande'), 'Nouvelle demande');
insert into categorie_demande (id_categorie, libelle) VALUES ('CD00000' || nextval('seq_categorie_demande'), 'Duplicata');

insert into piece_complementaire (id_piece_complementaire, libelle, id_type_visa) VALUES ('PC00000' || nextval('seq_piece_complementaire'), 'Autorisation emploi délivrée à Madagascar par le Ministère de la Fonction publique', 'TV000001');
insert into piece_complementaire (id_piece_complementaire, libelle, id_type_visa) VALUES ('PC00000' || nextval('seq_piece_complementaire'), 'Attestation d’emploi délivré par l’employeur (Original)', 'TV000001');
insert into piece_complementaire (id_piece_complementaire, libelle, id_type_visa) VALUES ('PC00000' || nextval('seq_piece_complementaire'), 'Statut de la Société', 'TV000002');
insert into piece_complementaire (id_piece_complementaire, libelle, id_type_visa) VALUES ('PC00000' || nextval('seq_piece_complementaire'), 'Extrait d’inscription au registre de commerce', 'TV000002');
insert into piece_complementaire (id_piece_complementaire, libelle, id_type_visa) VALUES ('PC00000' || nextval('seq_piece_complementaire'), 'Carte fiscale', 'TV000002');

insert into piece_commune (id_piece_commune, libelle) VALUES ('PCO00000' || nextval('seq_piece_commune'), '02 photos d’identité');
insert into piece_commune (id_piece_commune, libelle) VALUES ('PCO00000' || nextval('seq_piece_commune'), 'Notice de renseignement');
insert into piece_commune (id_piece_commune, libelle) VALUES ('PCO00000' || nextval('seq_piece_commune'), 'Demande adressée à Mr le Ministère de l’Intérieur et de la Décentralisation avec adresse e-mail et numéro téléphone portable');
insert into piece_commune (id_piece_commune, libelle) VALUES ('PCO00000' || nextval('seq_piece_commune'), 'Photocopie certifiée du visa en cours de validité');
insert into piece_commune (id_piece_commune, libelle) VALUES ('PCO00000' || nextval('seq_piece_commune'), 'Photocopie certifiée de la première page du passeport');
insert into piece_commune (id_piece_commune, libelle) VALUES ('PCO00000' || nextval('seq_piece_commune'), 'Photocopie certifiée de la carte résident en cours de validité');
insert into piece_commune (id_piece_commune, libelle) VALUES ('PCO00000' || nextval('seq_piece_commune'), 'Certificat de résidence à Madagascar');
insert into piece_commune (id_piece_commune, libelle) VALUES ('PCO00000' || nextval('seq_piece_commune'), 'Extrait de casier judiciaire moins de 3 mois');
