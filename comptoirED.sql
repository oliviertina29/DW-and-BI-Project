-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema comptoirED
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema comptoirED
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `comptoirED` DEFAULT CHARACTER SET utf8 ;
USE `comptoirED` ;

-- -----------------------------------------------------
-- Table `comptoirED`.`Produits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comptoirED`.`Produits` (
  `idProduits` VARCHAR(4) NOT NULL,
  `Nom_produit` VARCHAR(45) NULL,
  `Prix_unitaire` DECIMAL(19,4) NULL,
  `Nom de Categorie` VARCHAR(45) NULL,
  PRIMARY KEY (`idProduits`),
  UNIQUE INDEX `idProduits_UNIQUE` (`idProduits` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comptoirED`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comptoirED`.`Clients` (
  `idClients` VARCHAR(5) NOT NULL,
  `adresse` VARCHAR(60) NULL,
  `Ville` VARCHAR(45) NULL,
  `Region` VARCHAR(45) NULL,
  `pays` VARCHAR(45) NULL,
  PRIMARY KEY (`idClients`),
  UNIQUE INDEX `Code_client_UNIQUE` (`idClients` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comptoirED`.`Temps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comptoirED`.`Temps` (
  `idTemps` INT NOT NULL AUTO_INCREMENT,
  `jour` INT NULL,
  `jour_semaine` VARCHAR(45) NULL,
  `mois` INT NULL,
  `annee` INT NULL,
  PRIMARY KEY (`idTemps`),
  UNIQUE INDEX `idTemps_UNIQUE` (`idTemps` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comptoirED`.`Ventes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comptoirED`.`Ventes` (
  `idVentes` INT NOT NULL AUTO_INCREMENT,
  `idProduits` VARCHAR(4) NULL,
  `idClients` VARCHAR(5) NULL,
  `idTemps` INT NULL,
  `nombre_de_vente` INT NULL,
  `montant` DECIMAL(19,4) NULL,
  PRIMARY KEY (`idVentes`),
  UNIQUE INDEX `idVentes_UNIQUE` (`idVentes` ASC) VISIBLE,
  INDEX `idProduits_idx` (`idProduits` ASC) VISIBLE,
  INDEX `idClients_idx` (`idClients` ASC) VISIBLE,
  INDEX `idTemps_idx` (`idTemps` ASC) VISIBLE,
  CONSTRAINT `idProduits`
    FOREIGN KEY (`idProduits`)
    REFERENCES `comptoirED`.`Produits` (`idProduits`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idClients`
    FOREIGN KEY (`idClients`)
    REFERENCES `comptoirED`.`Clients` (`idClients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTemps`
    FOREIGN KEY (`idTemps`)
    REFERENCES `comptoirED`.`Temps` (`idTemps`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
