-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema portofolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portofolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portofolio` DEFAULT CHARACTER SET utf8 ;
USE `portofolio` ;

-- -----------------------------------------------------
-- Table `portofolio`.`pro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portofolio`.`pro` (
  `idPro` INT NOT NULL,
  `periode` VARCHAR(45) NOT NULL,
  `job` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `entreprise` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portofolio`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portofolio`.`skills` (
  `idSkills` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `lvl` INT NOT NULL,
  `soft_hard` TINYINT NOT NULL,
  PRIMARY KEY (`idSkills`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portofolio`.`professionnal_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portofolio`.`professionnal_skills` (
  `id_Pro_skill` INT NOT NULL,
  `Pro_idPro` INT NOT NULL,
  `Skills_idSkills` INT NOT NULL,
  PRIMARY KEY (`id_Pro_skill`),
  INDEX `fk_Pro_has_Skills_Skills1_idx` (`Skills_idSkills` ASC) VISIBLE,
  INDEX `fk_Pro_has_Skills_Pro1_idx` (`Pro_idPro` ASC) VISIBLE,
  CONSTRAINT `fk_Pro_has_Skills_Pro1`
    FOREIGN KEY (`Pro_idPro`)
    REFERENCES `portofolio`.`pro` (`idPro`),
  CONSTRAINT `fk_Pro_has_Skills_Skills1`
    FOREIGN KEY (`Skills_idSkills`)
    REFERENCES `portofolio`.`skills` (`idSkills`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portofolio`.`projet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portofolio`.`projet` (
  `idProjet` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `link_github` VARCHAR(100) NOT NULL,
  `description` TEXT NOT NULL,
  `illustration` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`idProjet`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portofolio`.`project_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portofolio`.`project_skills` (
  `id_projet_skill` INT NOT NULL AUTO_INCREMENT,
  `Projet_idProjet` INT NOT NULL,
  `Skills_idSkills` INT NOT NULL,
  PRIMARY KEY (`id_projet_skill`),
  INDEX `fk_Projet_has_Skills_Skills1_idx` (`Skills_idSkills` ASC) VISIBLE,
  INDEX `fk_Projet_has_Skills_Projet1_idx` (`Projet_idProjet` ASC) VISIBLE,
  CONSTRAINT `fk_Projet_has_Skills_Projet1`
    FOREIGN KEY (`Projet_idProjet`)
    REFERENCES `portofolio`.`projet` (`idProjet`),
  CONSTRAINT `fk_Projet_has_Skills_Skills1`
    FOREIGN KEY (`Skills_idSkills`)
    REFERENCES `portofolio`.`skills` (`idSkills`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portofolio`.`scolaire`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portofolio`.`scolaire` (
  `idScolaire` INT NOT NULL,
  `year` YEAR NOT NULL,
  `degree` VARCHAR(100) NOT NULL,
  `school` VARCHAR(75) NULL DEFAULT NULL,
  `location` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idScolaire`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portofolio`.`scholar_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portofolio`.`scholar_skills` (
  `id_scol_skill` INT NOT NULL,
  `Scolaire_idScolaire` INT NOT NULL,
  `Skills_idSkills` INT NOT NULL,
  PRIMARY KEY (`id_scol_skill`),
  INDEX `fk_Scolaire_has_Skills_Skills1_idx` (`Skills_idSkills` ASC) VISIBLE,
  INDEX `fk_Scolaire_has_Skills_Scolaire_idx` (`Scolaire_idScolaire` ASC) VISIBLE,
  CONSTRAINT `fk_Scolaire_has_Skills_Scolaire`
    FOREIGN KEY (`Scolaire_idScolaire`)
    REFERENCES `portofolio`.`scolaire` (`idScolaire`),
  CONSTRAINT `fk_Scolaire_has_Skills_Skills1`
    FOREIGN KEY (`Skills_idSkills`)
    REFERENCES `portofolio`.`skills` (`idSkills`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
