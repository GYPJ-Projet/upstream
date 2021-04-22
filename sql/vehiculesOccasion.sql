-- MySQL Script generated by MySQL Workbench
-- Wed Apr 14 14:36:07 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vehiculesOccasion
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vehiculesOccasion
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vehiculesOccasion` DEFAULT CHARACTER SET utf8 ;
USE `vehiculesOccasion` ;

-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `permission` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

INSERT INTO `role`(`nom`, `permission`) VALUES ('gestionnaire', 'tous les privilèges');
INSERT INTO `role`(`nom`, `permission`) VALUES ('employé', 'Insertion, Modification, Suppression');
INSERT INTO `role`(`nom`, `permission`) VALUES ('client', 'Lecture et Insertion d\'une commande');
INSERT INTO `role`(`nom`, `permission`) VALUES ('inactif', 'Lecture et Insertion d\'une commande');

-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`usager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`usager` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nomUsager` VARCHAR(45) NOT NULL,
  `motPasse` VARCHAR(255) NOT NULL,
  `idRole` INT NOT NULL,
  `token` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `idRole`
    FOREIGN KEY (`idRole`)
    REFERENCES `vehiculesOccasion`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `usager`(`nomUsager`, `motPasse`, `idRole`) VALUES ('yulia','1234',2);
INSERT INTO `usager`(`nomUsager`, `motPasse`, `idRole`) VALUES ('jean','1234',2);
INSERT INTO `usager`(`nomUsager`, `motPasse`, `idRole`) VALUES ('gloria','1234',1);
INSERT INTO `usager`(`nomUsager`, `motPasse`, `idRole`) VALUES ('phil','1234',3);

-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`pays`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`pays` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

INSERT INTO `pays`(`nom`) VALUES ('Canada');
INSERT INTO `pays`(`nom`) VALUES ('USA');

-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`langue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`langue` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

INSERT INTO `langue`(`nom`, `code`) VALUES ('Français','fr-fr');
INSERT INTO `langue`(`nom`, `code`) VALUES ('English','en-gb');

-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`province`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`province` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idLangue` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `idPays` INT NOT NULL,
  PRIMARY KEY (`id`, `idLangue`),
  FOREIGN KEY (`idPays`)
  REFERENCES `vehiculesOccasion`.`pays` (`id`),
  FOREIGN KEY (`idLangue`)
  REFERENCES `vehiculesOccasion`.`langue` (`id`))
ENGINE = InnoDB;

INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (1,1,'Alberta',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (1,2,'Alberta',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (2,1,'Colombie-Britannique',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (2,2,'British Columbia',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (3,1,'Manitoba',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (3,2,'Manitoba',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (4,1,'Nouveau-Brunswick',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (4,2,'New Brunswick',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (5,1,'Nouvelle-Écosse',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (5,2,'Nova Scotia',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (6,1,'Terre-Neuve-et-Labrador',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (6,2,'Newfoundland and Labrador',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (7,1,'Territoires du Nord-Ouest',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (7,2,'Northwest Territories',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (8,1,'Nunavut',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (8,2,'Nunavut',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (9,1,'Ontario',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (9,2,'Ontario',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (10,1,'Île-du-Prince-Édouard',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (10,2,'Prince Edward Island',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (11,1,'Saskatchewan',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (11,2,'Saskatchewan',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (12,1,'Québec',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (12,2,'Quebec',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (13,1,'Yukon',1);
INSERT INTO `province`(`id`, `idLangue`, `nom`, `idPays`) VALUES (13,2,'Yukon',1);


-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`taxe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`taxe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `taux` DECIMAL(15,4) UNSIGNED NOT NULL,
  `idProvince` INT NOT NULL,
  `disponibilite` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  CONSTRAINT `idProvince`
    FOREIGN KEY (`idProvince`)
    REFERENCES `vehiculesOccasion`.`province` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `taxe`(`nom`, `taux`, `idProvince`,`disponibilite`) VALUES ('TPS',5,1,1);
INSERT INTO `taxe`(`nom`, `taux`, `idProvince`,`disponibilite`) VALUES ('TVP',7,2,1);
INSERT INTO `taxe`(`nom`, `taux`, `idProvince`,`disponibilite`) VALUES ('TPS',5,2,1);
INSERT INTO `taxe`(`nom`, `taux`, `idProvince`,`disponibilite`) VALUES ('TVP',7,3,1);
INSERT INTO `taxe`(`nom`, `taux`, `idProvince`,`disponibilite`) VALUES ('TPS',5,3,1);
INSERT INTO `taxe`(`nom`, `taux`, `idProvince`,`disponibilite`) VALUES ('TVH',15,4,1);
INSERT INTO `taxe`(`nom`, `taux`, `idProvince`,`disponibilite`) VALUES ('TVH',15,5,1);
INSERT INTO `taxe`(`nom`, `taux`, `idProvince`,`disponibilite`) VALUES ('TVH',15,6,1);
INSERT INTO `taxe`(`nom`, `taux`, `idProvince`,`disponibilite`) VALUES ('TPS',5,7,1);
INSERT INTO `taxe`(`nom`, `taux`, `idProvince`,`disponibilite`) VALUES ('TPS',5,8,1);
INSERT INTO `taxe`(`nom`, `taux`, `idProvince`,`disponibilite`) VALUES ('TVH',13,9,1);
INSERT INTO `taxe`(`nom`, `taux`, `idProvince`,`disponibilite`) VALUES ('TVH',15,10,1);
INSERT INTO `taxe`(`nom`, `taux`, `idProvince`,`disponibilite`) VALUES ('TPS',5,12,1);
INSERT INTO `taxe`(`nom`, `taux`, `idProvince`,`disponibilite`) VALUES ('TVQ',9.975,12,1);
INSERT INTO `taxe`(`nom`, `taux`, `idProvince`,`disponibilite`) VALUES ('TVP',6,11,1);
INSERT INTO `taxe`(`nom`, `taux`, `idProvince`,`disponibilite`) VALUES ('TPS',5,11,1);
INSERT INTO `taxe`(`nom`, `taux`, `idProvince`,`disponibilite`) VALUES ('TPS',5,13,1);

-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`client` (
  `id` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `prenom` VARCHAR(45) NOT NULL,
  `dateNaissance` DATE NULL,
  `adresse` VARCHAR(45) NOT NULL,
  `codePostal` VARCHAR(6) NOT NULL,
  `idProvince` INT NOT NULL,
  `ville` VARCHAR(45) NOT NULL,
  `telephone` VARCHAR(45) NULL,
  `telephoneCellulaire` VARCHAR(45) NOT NULL,
  `courreil` VARCHAR(45) NOT NULL,
  `idLangue` INT NOT NULL,
  PRIMARY KEY (`id`),
    FOREIGN KEY (`idProvince`)
    REFERENCES `vehiculesOccasion`.`province` (`id`),
    FOREIGN KEY (`idLangue`)
    REFERENCES `vehiculesOccasion`.`langue` (`id`),
    FOREIGN KEY (`id`)
    REFERENCES `vehiculesOccasion`.`usager` (`id`))
ENGINE = InnoDB;

INSERT INTO `vehiculesOccasion`.`client`(`id`,`nom`, `prenom`, `dateNaissance`, `adresse`, `codePostal`, `idProvince`, `ville`, `telephone`, `telephoneCellulaire`, `courreil`, `idLangue`) VALUES (1,'Merkulova','Yulia','2003-08-26','8480 rue Jean-Brillon','H8N2P6',12,'LaSalle','4384983850','4384983850','yliamik50@gmail.com',1);
INSERT INTO `vehiculesOccasion`.`client`(`id`,`nom`, `prenom`, `dateNaissance`, `adresse`, `codePostal`, `idProvince`, `ville`, `telephone`, `telephoneCellulaire`, `courreil`, `idLangue`) VALUES (4,'Houle','Philippe','2024-12-12','72 Latour','j3n1l1',12,'Saint-Basile-le-Grand','5145555555','5145555555','phil@gmail.com',1);
INSERT INTO `vehiculesOccasion`.`client`(`id`,`nom`, `prenom`, `dateNaissance`, `adresse`, `codePostal`, `idProvince`, `ville`, `telephone`, `telephoneCellulaire`, `courreil`, `idLangue`) VALUES (3,'Kiese','Cloria','2000-01-01','111 rue Lafontaine','H1N5T2',12,'Montreal','5145555555','5145555555','gloria@gmail.com',1);
INSERT INTO `vehiculesOccasion`.`client`(`id`,`nom`, `prenom`, `dateNaissance`, `adresse`, `codePostal`, `idProvince`, `ville`, `telephone`, `telephoneCellulaire`, `courreil`, `idLangue`) VALUES (2,'Senneville','Jean','1990-04-15','111 rue Lafontaine','H1N4K7',12,'Montréal','5145555555','5145555555','jean@gmail.com',1);

-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`journalConnexion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`journalConnexion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idUsager` INT,
  `date` DATE NOT NULL,
  `adresseIp` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`idUsager`)
  REFERENCES `vehiculesOccasion`.`usager` (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`motopropulseur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`motopropulseur` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
   `disponibilite` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

INSERT INTO motopropulseur (nom) VALUES 
                    ('4x2'), ('4x4');

-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`annee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`annee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `annee` YEAR NOT NULL,
  `disponibilite` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

INSERT INTO annee (annee) VALUES
                    ('2010'), ('2011'), ('2012'), ('2013'), ('2014'), ('2014'), ('2016'), ('2017'), ('2018'), ('2019'), ('2020'), ('2021');

-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`marque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`marque` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `disponibilite` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

INSERT INTO marque (nom) VALUES 
			('Chevrolet'), ('Ford'), ('Honda'), ('Hyundai'), ('Kia'), ('Mercedes'), ('Nissan'), ('Toyota'), ('Volkswagen'), ('Jeep'),
			('Dodge'), ('Mazda'), ('Ram'), ('GMC');        

-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`modele`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`modele` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `idMarque` INT NOT NULL,
  `disponibilite` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  CONSTRAINT `idMarque`
    FOREIGN KEY (`idMarque`)
    REFERENCES `vehiculesOccasion`.`marque` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO modele (nom, idMarque) VALUES
		('Cruze', 1), ('Focus', 2), ('Civic', 3), ('Forte', 5), ('Accent', 4), ('Elantra', 4), ('Micra', 7), ('Sentra', 7), ('Jetta', 9), 
		('Optima', 5), ('Benz-CLA250', 6), ('Versa_Note', 7), ('Compass', 10), ('Escape', 2), ('Rogue', 7), ('Journey', 11), 
		('Equinox', 1), ('CX-3', 12), ('Pathfinder', 7), ('Santa Fe', 4), ('CX-5', 12), ('Rav4', 8), ('Sedona', 5), ('Grand Caravan', 11), 
		('Odyssey', 3), ('Sienna', 8), ('Routan', 9), ('2500', 13), ('Ranger', 2), ('Gladiator', 10), ('3500', 13), ('Sierra 3500', 14), ('Canyon', 14);
					
-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`typeCarburant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`typeCarburant` (
  `id` INT NOT NULL,
  `idLangue` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `disponibilite` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`, `idLangue`),
  FOREIGN KEY (`idLangue`)    REFERENCES `vehiculesOccasion`.`langue` (`id`))
ENGINE = InnoDB;

 

INSERT INTO typeCarburant (id, idLangue, nom) VALUES
                    (1,1, 'Essence'), (1,2, 'Gasoline '), (2,1, 'Diesel'), (2,2, 'Diesel ');



-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`couleur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`couleur` (
  `id` INT NOT NULL,
  `idLangue` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `disponibilite` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`, `idLangue`),
  FOREIGN KEY (`idLangue`)    REFERENCES `vehiculesOccasion`.`langue` (`id`))
ENGINE = InnoDB;

 

INSERT INTO couleur (id, idLangue, nom) VALUES
                    (1, 1, 'Noir'), (1, 2, 'Black'), (2, 1,'Blanc'), (2, 2, 'White'), (3, 1, 'Rouge'), (3, 2, 'Red'), (4, 1, 'Vert'), (4, 2, 'Green'), (5, 1, 'Bleu'), (5, 2, 'Blue'), (6, 1, 'Gris'), 	(6, 2, 'Grey'), (7, 1, 'Brun'), (7, 2, 'Brown'), (8, 1, 'Bourgogne'), (8, 2, 'Burgundy ');



-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`transmission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`transmission` (
  `id` INT NOT NULL,
  `idLangue` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `disponibilite` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`, `idLangue`),
  FOREIGN KEY (`idLangue`)    REFERENCES `vehiculesOccasion`.`langue` (`id`))
ENGINE = InnoDB;

 

INSERT INTO transmission (id, idLangue, nom) VALUES
                    (1 , 1, 'Manuelle'), (1, 2, 'Manual'), (2, 1, 'Automatique'), (2, 2, 'Automatic ');


 -- -----------------------------------------------------
-- Table `vehiculesOccasion`.`typeCarrosserie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`typeCarrosserie` (
  `id` INT NOT NULL,
  `idLangue` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `disponibilite` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`, `idLangue`),
  FOREIGN KEY (`idLangue`)    REFERENCES `vehiculesOccasion`.`langue` (`id`))
ENGINE = InnoDB;


INSERT INTO typeCarrosserie (id, idLangue, nom) VALUES
                    (1, 1, 'Berline'), (1, 2, 'Sedan '), (2, 1, 'Coupé'), (2, 2, 'Coupe'), (3, 1, 'Hayon'), (3, 2, 'Hatchback'), (4, 1, 'Familiale'), (4, 2, 'Station wagon'), (5, 1, 'Cabriolet'), (5, 2, 'Convertible '), (6, 1, 'VUS'), (6, 2, 'SUV'), (7, 1, 'Pick-up'), (7, 2, 'Pickup Truck'), (8, 1, 'Mini-fourgonnette'), (8, 2, 'Minivan');                  


-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`voiture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`voiture` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idModele` INT NOT NULL,
  `idAnnee` INT NOT NULL,
  `kilometrage` INT UNSIGNED NULL,
  `dateArivee` DATE NOT NULL,
  `prixAchat` DECIMAL(15,2) UNSIGNED NOT NULL,
  `prixVente` DECIMAL(15,2) UNSIGNED NOT NULL,
  `idMotopropulseur` INT NOT NULL,
  `idTypeCarburant` INT NOT NULL,
  `idCouleur` INT NOT NULL,
  `idTransmission` INT NOT NULL,
  `idTypeCarrosserie` INT NOT NULL,
  `disponibilite` TINYINT NOT NULL DEFAULT 1,
  `vna` VARCHAR(17) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `idMotopropulseur`
    FOREIGN KEY (`idMotopropulseur`)
    REFERENCES `vehiculesOccasion`.`motopropulseur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idAnnee`
    FOREIGN KEY (`idAnnee`)
    REFERENCES `vehiculesOccasion`.`annee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idModele`
    FOREIGN KEY (`idModele`)
    REFERENCES `vehiculesOccasion`.`modele` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTypeCarburant`
    FOREIGN KEY (`idTypeCarburant`)
    REFERENCES `vehiculesOccasion`.`typeCarburant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCouleur`
    FOREIGN KEY (`idCouleur`)
    REFERENCES `vehiculesOccasion`.`couleur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTransmission`
    FOREIGN KEY (`idTransmission`)
    REFERENCES `vehiculesOccasion`.`transmission` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTypeCarrosserie`
    FOREIGN KEY (`idTypeCarrosserie`)
    REFERENCES `vehiculesOccasion`.`typeCarrosserie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


INSERT INTO voiture (idModele, idAnnee, kilometrage, dateArivee, prixAchat, prixVente, idMotopropulseur, idTypeCarburant, idCouleur, idTransmission, idTypeCarrosserie, disponibilite, vna) VALUES
                    ( 1, 7, 90873, '2018-10-24', 8538.75, 11385, 1, 1, 2, 2, 2, 1, '1D4GP25B038108775'), 
                    ( 2, 5, 116456, '2018-10-24', 6746.25, 8995, 1, 1, 2, 2, 1, 1, '1D4GP25B038108775'), 
                    ( 3, 6, 65724, '2018-10-27', 8846.25, 11795, 1, 1, 6, 2, 2, 1, '1D4GP25B038108775'), 
                    ( 2, 7, 74573, '2018-10-31', 9120, 12160, 1, 1, 6, 1, 3, 1, '1D4GP25B038108775'),
	( 4, 5, 101243, '2020-11-05', 5996.25, 7995, 1, 1, 1, 2, 2,1, '1D4GP25B038108775'), 
	( 5, 3, 114234, '2021-03-15', 4837.5, 6450, 1, 1, 7, 2, 1, 1, '1D4GP25B038108775'), 
	( 6, 7, 65000, '2021-03-15', 8246.25, 10995, 1, 1, 3, 2, 2, 1, '1D4GP25B038108775'), 
	( 7, 6, 107585, '2021-03-15', 7421.25, 9895, 1, 1, 3, 2, 3, 1, '1D4GP25B038108775'), 
	( 6, 6, 100665, '2021-03-15', 7162.5, 9550, 1, 1, 2, 1, 2, 1, '1D4GP25B038108775'), 
	( 8, 7, 51238, '2021-03-15', 9371.25, 12495, 1, 1, 5, 2, 1, 1, '1D4GP25B038108775'), 
	( 9, 5, 86887, '2021-04-15', 7421.25, 9895, 1, 1, 1, 1, 1, 1, '1D4GP25B038108775'), 
	( 10, 7, 94100, '2021-04-15', 11246.2, 14995, 2, 1, 6, 2, 2, 1, '1D4GP25B038108775'), 
	( 3, 6, 65724, '2021-04-15', 8981.25, 11975, 1, 1, 6, 2, 2, 1, '1D4GP25B038108775'), 
	( 11, 6, 104, '2021-04-15', 15963.75, 21285, 1, 2, 2, 1, 2, 1, '1D4GP25B038108775'), 
	( 12, 7, 46201, '2021-04-15', 8437.5, 11250, 1, 1, 6, 2, 3, 1, '1D4GP25B038108775'), 
	( 13, 6, 100599, '2021-01-17', 9637.5, 12850, 2, 1, 1, 2, 6, 1, '1D4GP25B038108775'),
	( 14, 6, 127453, '2021-01-17', 10785, 14380, 2, 2, 6, 1, 6, 1, '1D4GP25B038108775'),
	( 15, 6, 96221, '2021-01-17', 10192.5, 14550, 2, 1, 6, 2, 6, 1, '1D4GP25B038108775'),
	( 16, 7, 116058, '2021-01-17', 19871.25, 26495, 2, 2, 1, 1, 6, 1, '1D4GP25B038108775'),
	( 18, 7, 35622, '2021-01-17', 14246.25, 18995, 1, 1, 6, 2, 6, 1, '1D4GP25B038108775'),
	( 19, 7, 79157, '2021-01-17', 15817.5, 21090, 2, 1, 6, 2, 6, 1, '1D4GP25B038108775'),
	( 20, 7, 119783, '2021-01-17', 13470, 17960, 2, 1, 7, 1, 6, 1, '1D4GP25B038108775'),
	( 17, 9, 69942, '2021-01-17', 15855, 21140, 1, 1, 6, 2, 6, 1, '1D4GP25B038108775'),
	( 21, 7, 84763, '2021-01-17', 12746.25, 16995, 2, 1, 1, 2, 6, 1, '1D4GP25B038108775'),
	( 22, 9, 45436, '2021-01-17', 19511.25, 26015, 2, 1, 2, 2, 6, 1, '1D4GP25B038108775'),
	( 23, 7, 137789, '2021-01-17', 12371.25, 16495, 1, 1, 2, 2, 8, 1, '1D4GP25B038108775'),
	( 24, 8, 103000, '2021-01-17', 13496.25, 17995, 1, 2, 8, 2, 8, 1, '1D4GP25B038108775'),
	( 25, 7, 89049, '2021-01-17', 14572.5, 19430, 2, 1, 2, 2, 8, 1, '1D4GP25B038108775'),
	( 24, 9, 59900, '2021-01-17', 17621.25, 23495, 2, 1, 6, 2, 8, 1, '1D4GP25B038108775'),
	( 23, 11, 50805, '2021-01-17', 19496.25, 25995, 2, 1, 1, 2, 8, 1, '1D4GP25B038108775'),
	( 26, 6, 133896, '2021-01-17', 14208.75, 18945, 1, 1, 5, 2, 8, 1, '1D4GP25B038108775'),
	( 27, 2, 141461, '2021-01-17', 5962.5, 7950, 1, 2, 6, 1, 8, 1, '1D4GP25B038108775'),
	( 26, 11, 35902, '2021-01-17', 22871.25, 30495, 2, 1, 1, 2, 8, 1, '1D4GP25B038108775'),
	( 28, 10, 53334, '2021-01-17', 56246.25, 74995, 2, 2, 1, 2, 7, 1, '1D4GP25B038108775'),
	( 29, 10, 31935, '2021-01-17', 35212.5, 46950, 2, 2, 1, 2, 7, 1, '1D4GP25B038108775'),
	( 30, 11, 1016, '2021-01-17', 47925, 63900, 2, 2, 2, 2, 7, 1, '1D4GP25B038108775'),
	( 28, 9, 9409, '2021-01-17', 35100, 46800, 2, 2, 2, 1, 7, 1, '1D4GP25B038108775'),
	( 31, 5, 99583, '2021-01-17', 29996.25, 39995, 2, 2, 2, 2, 7, 1, '1D4GP25B038108775'),
	( 32, 9, 81926, '2021-01-17', 52496.25, 69995, 2, 2, 1, 2, 7, 1, '1D4GP25B038108775'),
	( 33, 10, 50235, '2021-01-17', 29246.25, 38995, 2, 2, 3, 2, 7, 1, '1D4GP25B038108775');

-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`description`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`description` (
  `id` INT NOT NULL,
  `idLangue` INT NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`, `idLangue`),
  CONSTRAINT `idLangue`
    FOREIGN KEY (`idLangue`)
    REFERENCES `vehiculesOccasion`.`langue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id`
    FOREIGN KEY (`id`)
    REFERENCES `vehiculesOccasion`.`voiture` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
					
-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`statut`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`statut` (
  `id` INT NOT NULL,
  `idLangue` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `idLangue`),
  FOREIGN KEY (`idLangue`)
  REFERENCES `vehiculesOccasion`.`langue` (`id`))
ENGINE = InnoDB;

INSERT INTO `statut`(`id`, `idLangue`, `nom`) VALUES (1,1,'En attente');
INSERT INTO `statut`(`id`, `idLangue`, `nom`) VALUES (1,2,'Waiting');
INSERT INTO `statut`(`id`, `idLangue`, `nom`) VALUES (2,1,'Réservé');
INSERT INTO `statut`(`id`, `idLangue`, `nom`) VALUES (2,2,'Reserved');
INSERT INTO `statut`(`id`, `idLangue`, `nom`) VALUES (3,1,'Facturé');
INSERT INTO `statut`(`id`, `idLangue`, `nom`) VALUES (3,2,'Charged');

-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`expedition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`expedition` (
  `id` INT NOT NULL,
  `idLangue` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `disponibilite` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`, `idLangue`),
  FOREIGN KEY (`idLangue`)
  REFERENCES `vehiculesOccasion`.`langue` (`id`))
ENGINE = InnoDB;

INSERT INTO `expedition`(`id`, `idLangue`, `nom`) VALUES (1,1,'Livraison local');
INSERT INTO `expedition`(`id`, `idLangue`, `nom`) VALUES (1,2,'Local delivery');
INSERT INTO `expedition`(`id`, `idLangue`, `nom`) VALUES (2,1,'Ramassage');
INSERT INTO `expedition`(`id`, `idLangue`, `nom`) VALUES (2,2,'Pickup');

-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`modePaiement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`modePaiement` (
  `id` INT NOT NULL,
  `idLangue` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `disponibilite` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`, `idLangue`),
  FOREIGN KEY (`idLangue`)
  REFERENCES `vehiculesOccasion`.`langue` (`id`))
ENGINE = InnoDB;

INSERT INTO `modepaiement`(`id`, `idLangue`, `nom`) VALUES (1,1,'Argent comptant');
INSERT INTO `modepaiement`(`id`, `idLangue`, `nom`) VALUES (1,2,'Cash');
INSERT INTO `modepaiement`(`id`, `idLangue`, `nom`) VALUES (2,1,'Carte de crédit');
INSERT INTO `modepaiement`(`id`, `idLangue`, `nom`) VALUES (2,2,'Credit card');
INSERT INTO `modepaiement`(`id`, `idLangue`, `nom`) VALUES (3,1,'Carte de débit');
INSERT INTO `modepaiement`(`id`, `idLangue`, `nom`) VALUES (3,2,'Debit card');
INSERT INTO `modepaiement`(`id`, `idLangue`, `nom`) VALUES (4,1,'Virement bancaire');
INSERT INTO `modepaiement`(`id`, `idLangue`, `nom`) VALUES (4,2,'Bank transfer');

-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`facture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`facture` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idClient` INT NOT NULL,
  `date` DATE NOT NULL,
  `prixTotal` DECIMAL(15,2) UNSIGNED NOT NULL,
  `quantite` INT UNSIGNED NOT NULL,
  `idStatut` INT NOT NULL,
  `idExpedition` INT NOT NULL,
  `idModePaiement` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`idClient`)
  REFERENCES `vehiculesOccasion`.`client` (`id`),
  FOREIGN KEY (`idStatut`)
  REFERENCES `vehiculesOccasion`.`statut` (`id`),
  FOREIGN KEY (`idExpedition`)
  REFERENCES `vehiculesOccasion`.`expedition` (`id`),
  FOREIGN KEY (`idModePaiement`)
  REFERENCES `vehiculesOccasion`.`modePaiement` (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`listeAchat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`listeAchat` (
  `idCommande` INT NOT NULL,
  `idVoiture` INT NOT NULL,
  `prixVenteFinal` DECIMAL(15,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`idCommande`, `idVoiture`),
  CONSTRAINT `idCommande`
    FOREIGN KEY (`idCommande`)
    REFERENCES `vehiculesOccasion`.`facture` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idVoiture`
    FOREIGN KEY (`idVoiture`)
    REFERENCES `vehiculesOccasion`.`voiture` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lien` VARCHAR(100) NULL,
  `idVoiture` INT NOT NULL,
  `sort` INT NULL,
  PRIMARY KEY (`id`),

    FOREIGN KEY (`idVoiture`)
    REFERENCES `vehiculesOccasion`.`voiture` (`id`))
ENGINE = InnoDB;

INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/1/Chevrolet-Cruze-2016.jpg',1);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/2/Ford-Focus-2014.jpg',2);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/3/Honda-Civic-2015.jpg',3);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/4/Ford-Focus-2016.jpg',4);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/5/Kia-Forte-2014.jpg',5);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/6/Hyundai-Accent-2012.jpg',6);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/7/Hyundai-Elantra-2016.jpg',7);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/8/Nissan-Micra-2015.jpg',8);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/9/Hyundai-Elantra-2015.jpg',9);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/10/Nissan-Sentra-2016.jpg',10);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/11/Volkswagen-Jetta-2014.jpg',11);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/12/Kia-Optima-2016.jpg',12);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/13/Honda-Civic-2015.jpg',13);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/14/Mercedes_Benz-CLA250-2015.jpg',14);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/15/Nissan-Versa_Note-2016.jpg',15);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/16/Jeep-Compass-2015.jpg',16);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/17/Ford-Escape-2015.jpg',17);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/18/Nissan-Rogue-2015.jpg',18);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/19/Dodge-Journey-2016.jpg',19);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/20/Mazda-CX_3-2016.jpg',20);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/21/Nissan-Pathfinder-2016.jpg',21);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/22/Hyundai-Santa_Fe_Sport-2016.jpg',22);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/23/Chevrolet-Equinox-2018.jpg',23);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/24/Mazda-CX_5-2016.jpg',24);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/25/Toyota-Rav4-2018.jpg',25);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/26/Kia-Sedona-2016.jpg',26);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/27/Dodge-Grand_Caravan-2017.jpg',27);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/28/Honda-Odyssey-2016.jpg',28);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/29/Dodge-Grand_Caravan-2018.jpg',29);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/30/Kia-Sedona-2020.jpg',30);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/31/Toyota-Sienna-2015.jpg',31);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/32/Volkswagen-Routan-2011.jpg',32);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/33/Toyota-Sienna-2020.jpg',33);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/34/Ram-2500-2019.jpg',34);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/35/Ford-Ranger-2019.jpg',35);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/36/Jeep-Gladiator-2020.jpg',36);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/37/Ram-2500-2018.jpg',37);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/38/Ram-3500-2014.jpg',38);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/39/GMC-Sierra-2018.jpg',39);
INSERT INTO `vehiculesOccasion`.`image`(`lien`,`idVoiture`) VALUES ('./images/40/GMC-Canyon-2019.jpg',40);

-- -----------------------------------------------------
-- Table `vehiculesOccasion`.`url`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculesOccasion`.`url` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `query` VARCHAR(100) NOT NULL,
  `motCle` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
