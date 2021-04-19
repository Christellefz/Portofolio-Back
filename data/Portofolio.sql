-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Portofolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Portofolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Portofolio` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema portofolio
-- -----------------------------------------------------
USE `Portofolio` ;

-- -----------------------------------------------------
-- Table `Portofolio`.`Scolaire`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portofolio`.`Scolaire` (
  `idScolaire` INT NOT NULL,
  `year` YEAR(4) NOT NULL,
  `degree` VARCHAR(100) NOT NULL,
  `school` VARCHAR(75) NULL,
  `location` VARCHAR(45) NULL,
  PRIMARY KEY (`idScolaire`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portofolio`.`Pro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portofolio`.`Pro` (
  `idPro` INT NOT NULL,
  `periode` VARCHAR(45) NOT NULL,
  `job` VARCHAR(45) NOT NULL,
  `description` TEXT(300) NOT NULL,
  PRIMARY KEY (`idPro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portofolio`.`Projet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portofolio`.`Projet` (
  `idProjet` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `link_github` VARCHAR(100) NOT NULL,
  `description` TEXT(300) NOT NULL,
  `illustration` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`idProjet`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portofolio`.`Skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portofolio`.`Skills` (
  `idSkills` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `lvl` INT NOT NULL,
  `soft_hard` TINYINT NOT NULL,
  PRIMARY KEY (`idSkills`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portofolio`.`Scholar_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portofolio`.`Scholar_skills` (
  `id_scol_skill` INT NOT NULL,
  `Scolaire_idScolaire` INT NOT NULL,
  `Skills_idSkills` INT NOT NULL,
  INDEX `fk_Scolaire_has_Skills_Skills1_idx` (`Skills_idSkills` ASC) VISIBLE,
  INDEX `fk_Scolaire_has_Skills_Scolaire_idx` (`Scolaire_idScolaire` ASC) VISIBLE,
  PRIMARY KEY (`id_scol_skill`),
  CONSTRAINT `fk_Scolaire_has_Skills_Scolaire`
    FOREIGN KEY (`Scolaire_idScolaire`)
    REFERENCES `Portofolio`.`Scolaire` (`idScolaire`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Scolaire_has_Skills_Skills1`
    FOREIGN KEY (`Skills_idSkills`)
    REFERENCES `Portofolio`.`Skills` (`idSkills`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portofolio`.`Professionnal_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portofolio`.`Professionnal_skills` (
  `id_Pro_skill` INT NOT NULL,
  `Pro_idPro` INT NOT NULL,
  `Skills_idSkills` INT NOT NULL,
  PRIMARY KEY (`id_Pro_skill`),
  INDEX `fk_Pro_has_Skills_Skills1_idx` (`Skills_idSkills` ASC) VISIBLE,
  INDEX `fk_Pro_has_Skills_Pro1_idx` (`Pro_idPro` ASC) VISIBLE,
  CONSTRAINT `fk_Pro_has_Skills_Pro1`
    FOREIGN KEY (`Pro_idPro`)
    REFERENCES `Portofolio`.`Pro` (`idPro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pro_has_Skills_Skills1`
    FOREIGN KEY (`Skills_idSkills`)
    REFERENCES `Portofolio`.`Skills` (`idSkills`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portofolio`.`Project_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portofolio`.`Project_skills` (
  `id_projet_skill` INT NOT NULL AUTO_INCREMENT,
  `Projet_idProjet` INT NOT NULL,
  `Skills_idSkills` INT NOT NULL,
  INDEX `fk_Projet_has_Skills_Skills1_idx` (`Skills_idSkills` ASC) VISIBLE,
  INDEX `fk_Projet_has_Skills_Projet1_idx` (`Projet_idProjet` ASC) VISIBLE,
  PRIMARY KEY (`id_projet_skill`),
  CONSTRAINT `fk_Projet_has_Skills_Projet1`
    FOREIGN KEY (`Projet_idProjet`)
    REFERENCES `Portofolio`.`Projet` (`idProjet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projet_has_Skills_Skills1`
    FOREIGN KEY (`Skills_idSkills`)
    REFERENCES `Portofolio`.`Skills` (`idSkills`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
