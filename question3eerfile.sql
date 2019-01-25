-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`chromosome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`chromosome` (
  `idchromosome` INT NOT NULL,
  `chromosome` VARCHAR(45) NULL,
  PRIMARY KEY (`idchromosome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`geneid`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`geneid` (
  `idgene` INT NOT NULL,
  `gene-name` VARCHAR(45) NULL,
  `discription affected gene` VARCHAR(6000) NULL,
  `chromosome_idchromosome` INT NOT NULL,
  PRIMARY KEY (`idgene`),
  INDEX `fk_geneid_chromosome1_idx` (`chromosome_idchromosome` ASC) VISIBLE,
  CONSTRAINT `fk_geneid_chromosome1`
    FOREIGN KEY (`chromosome_idchromosome`)
    REFERENCES `mydb`.`chromosome` (`idchromosome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`syndrome` (
  `idsyndrome` INT NOT NULL,
  `syndrome discription` VARCHAR(5000) NULL,
  PRIMARY KEY (`idsyndrome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patient` (
  `idpatient` INT NOT NULL,
  `age of diagnosis` DATE NULL,
  `patient-syndrome` VARCHAR(45) NULL,
  `geneid_idgene` INT NOT NULL,
  `syndrome_idsyndrome` INT NOT NULL,
  PRIMARY KEY (`idpatient`),
  INDEX `fk_patient_geneid1_idx` (`geneid_idgene` ASC) VISIBLE,
  INDEX `fk_patient_syndrome1_idx` (`syndrome_idsyndrome` ASC) VISIBLE,
  CONSTRAINT `fk_patient_geneid1`
    FOREIGN KEY (`geneid_idgene`)
    REFERENCES `mydb`.`geneid` (`idgene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_syndrome1`
    FOREIGN KEY (`syndrome_idsyndrome`)
    REFERENCES `mydb`.`syndrome` (`idsyndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patientinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patientinfo` (
  `idpatientinfo` INT NOT NULL,
  `patientname` VARCHAR(45) NULL,
  `patientgender` ENUM('M', 'F') NULL,
  `patient_idpatient` INT NOT NULL,
  PRIMARY KEY (`idpatientinfo`),
  INDEX `fk_patientinfo_patient_idx` (`patient_idpatient` ASC) VISIBLE,
  CONSTRAINT `fk_patientinfo_patient`
    FOREIGN KEY (`patient_idpatient`)
    REFERENCES `mydb`.`patient` (`idpatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`start-end`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`start-end` (
  `idgene start-end` INT NOT NULL,
  `start` VARCHAR(45) NULL,
  `end` VARCHAR(45) NULL,
  `geneid_idgene` INT NOT NULL,
  PRIMARY KEY (`idgene start-end`),
  INDEX `fk_start-end_geneid1_idx` (`geneid_idgene` ASC) VISIBLE,
  CONSTRAINT `fk_start-end_geneid1`
    FOREIGN KEY (`geneid_idgene`)
    REFERENCES `mydb`.`geneid` (`idgene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
