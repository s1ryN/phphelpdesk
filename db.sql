-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema jakubzeman
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema jakubzeman
-- -----------------------------------------------------
DROP DATABASE IF EXISTS jakubzeman;
CREATE SCHEMA IF NOT EXISTS `jakubzeman` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `jakubzeman` ;

-- -----------------------------------------------------
-- Table `jakubzeman`.`lokace`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jakubzeman`.`lokace` (
  `idLokace` INT NOT NULL AUTO_INCREMENT,
  `budova` VARCHAR(45) NOT NULL,
  `oddeleni` VARCHAR(20) NOT NULL,
  `cislo_stolu` INT NOT NULL,
  PRIMARY KEY (`idLokace`),
  UNIQUE INDEX `idLokace` (`idLokace` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jakubzeman`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jakubzeman`.`role` (
  `idRole` INT NOT NULL AUTO_INCREMENT,
  `nazev` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRole`),
  UNIQUE INDEX `idRole` (`idRole` ASC) VISIBLE,
  UNIQUE INDEX `nazev` (`nazev` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jakubzeman`.`osoba`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jakubzeman`.`osoba` (
  `idOsoba` INT NOT NULL AUTO_INCREMENT,
  `prihlasjmeno` VARCHAR(45) NOT NULL,
  `jmeno` VARCHAR(45) NOT NULL,
  `prijmeni` VARCHAR(45) NOT NULL,
  `heslo` VARCHAR(255) NOT NULL,
  `profilepicture` VARCHAR(255) NOT NULL DEFAULT "uploads/defaultpfp.jpeg",
  `Role_idRole` INT NOT NULL,
  `Lokace_idLokace` INT NOT NULL,
  PRIMARY KEY (`idOsoba`),
  UNIQUE INDEX `idOsoba` (`idOsoba` ASC) VISIBLE,
  UNIQUE INDEX `prihlasjmeno` (`prihlasjmeno` ASC) VISIBLE,
  INDEX `Role_idRole` (`Role_idRole` ASC) VISIBLE,
  INDEX `Lokace_idLokace` (`Lokace_idLokace` ASC) VISIBLE,
  CONSTRAINT `osoba_ibfk_1`
    FOREIGN KEY (`Role_idRole`)
    REFERENCES `jakubzeman`.`role` (`idRole`),
  CONSTRAINT `osoba_ibfk_2`
    FOREIGN KEY (`Lokace_idLokace`)
    REFERENCES `jakubzeman`.`lokace` (`idLokace`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jakubzeman`.`priorita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jakubzeman`.`priorita` (
  `idPriorita` INT NOT NULL AUTO_INCREMENT,
  `nazev` VARCHAR(45) NOT NULL,
  `barva` INT NOT NULL,
  PRIMARY KEY (`idPriorita`),
  UNIQUE INDEX `idPriorita` (`idPriorita` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jakubzeman`.`stav`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jakubzeman`.`stav` (
  `idStav` INT NOT NULL AUTO_INCREMENT,
  `status` TINYINT NOT NULL,
  PRIMARY KEY (`idStav`),
  UNIQUE INDEX `idStav` (`idStav` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jakubzeman`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jakubzeman`.`ticket` (
  `idTicket` INT NOT NULL AUTO_INCREMENT,
  `popis` TEXT NOT NULL,
  `jmeno` VARCHAR(45) NOT NULL,
  `prijmeni` VARCHAR(45) NOT NULL,
  `kategorie` VARCHAR(45) NOT NULL,
  `Osoba_idOsoba` INT NOT NULL,
  `Stav_idStav` INT NOT NULL,
  `Priorita_idPriorita` INT NOT NULL,
  PRIMARY KEY (`idTicket`),
  UNIQUE INDEX `idTicket` (`idTicket` ASC) VISIBLE,
  INDEX `Osoba_idOsoba` (`Osoba_idOsoba` ASC) VISIBLE,
  INDEX `Stav_idStav` (`Stav_idStav` ASC) VISIBLE,
  INDEX `Priorita_idPriorita` (`Priorita_idPriorita` ASC) VISIBLE,
  CONSTRAINT `ticket_ibfk_1`
    FOREIGN KEY (`Osoba_idOsoba`)
    REFERENCES `jakubzeman`.`osoba` (`idOsoba`),
  CONSTRAINT `ticket_ibfk_2`
    FOREIGN KEY (`Stav_idStav`)
    REFERENCES `jakubzeman`.`stav` (`idStav`),
  CONSTRAINT `ticket_ibfk_3`
    FOREIGN KEY (`Priorita_idPriorita`)
    REFERENCES `jakubzeman`.`priorita` (`idPriorita`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema jakubzeman
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema jakubzeman
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `jakubzeman` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `jakubzeman` ;

-- -----------------------------------------------------
-- Table `jakubzeman`.`lokace`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jakubzeman`.`lokace` (
  `idLokace` INT NOT NULL AUTO_INCREMENT,
  `budova` VARCHAR(45) NOT NULL,
  `oddeleni` VARCHAR(20) NOT NULL,
  `cislo_stolu` INT NOT NULL,
  PRIMARY KEY (`idLokace`),
  UNIQUE INDEX `idLokace` (`idLokace` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jakubzeman`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jakubzeman`.`role` (
  `idRole` INT NOT NULL AUTO_INCREMENT,
  `nazev` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRole`),
  UNIQUE INDEX `idRole` (`idRole` ASC) VISIBLE,
  UNIQUE INDEX `nazev` (`nazev` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jakubzeman`.`osoba`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jakubzeman`.`osoba` (
  `idOsoba` INT NOT NULL AUTO_INCREMENT,
  `prihlasjmeno` VARCHAR(45) NOT NULL,
  `jmeno` VARCHAR(45) NOT NULL,
  `prijmeni` VARCHAR(45) NOT NULL,
  `heslo` VARCHAR(255) NOT NULL,
  `profilepicture` VARCHAR(255) NOT NULL DEFAULT "uploads/defaultpfp.jpeg",
  `Role_idRole` INT NOT NULL,
  `Lokace_idLokace` INT NOT NULL,
  PRIMARY KEY (`idOsoba`),
  UNIQUE INDEX `idOsoba` (`idOsoba` ASC) VISIBLE,
  UNIQUE INDEX `prihlasjmeno` (`prihlasjmeno` ASC) VISIBLE,
  INDEX `Role_idRole` (`Role_idRole` ASC) VISIBLE,
  INDEX `Lokace_idLokace` (`Lokace_idLokace` ASC) VISIBLE,
  CONSTRAINT `osoba_ibfk_1`
    FOREIGN KEY (`Role_idRole`)
    REFERENCES `jakubzeman`.`role` (`idRole`),
  CONSTRAINT `osoba_ibfk_2`
    FOREIGN KEY (`Lokace_idLokace`)
    REFERENCES `jakubzeman`.`lokace` (`idLokace`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jakubzeman`.`priorita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jakubzeman`.`priorita` (
  `idPriorita` INT NOT NULL AUTO_INCREMENT,
  `nazev` VARCHAR(45) NOT NULL,
  `barva` INT NOT NULL,
  PRIMARY KEY (`idPriorita`),
  UNIQUE INDEX `idPriorita` (`idPriorita` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jakubzeman`.`stav`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jakubzeman`.`stav` (
  `idStav` INT NOT NULL AUTO_INCREMENT,
  `status` TINYINT NOT NULL,
  PRIMARY KEY (`idStav`),
  UNIQUE INDEX `idStav` (`idStav` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `jakubzeman`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jakubzeman`.`ticket` (
  `idTicket` INT NOT NULL AUTO_INCREMENT,
  `popis` TEXT NOT NULL,
  `jmeno` VARCHAR(45) NOT NULL,
  `prijmeni` VARCHAR(45) NOT NULL,
  `kategorie` VARCHAR(45) NOT NULL,
  `Osoba_idOsoba` INT NOT NULL,
  `Stav_idStav` INT NOT NULL,
  `Priorita_idPriorita` INT NOT NULL,
  PRIMARY KEY (`idTicket`),
  UNIQUE INDEX `idTicket` (`idTicket` ASC) VISIBLE,
  INDEX `Osoba_idOsoba` (`Osoba_idOsoba` ASC) VISIBLE,
  INDEX `Stav_idStav` (`Stav_idStav` ASC) VISIBLE,
  INDEX `Priorita_idPriorita` (`Priorita_idPriorita` ASC) VISIBLE,
  CONSTRAINT `ticket_ibfk_1`
    FOREIGN KEY (`Osoba_idOsoba`)
    REFERENCES `jakubzeman`.`osoba` (`idOsoba`),
  CONSTRAINT `ticket_ibfk_2`
    FOREIGN KEY (`Stav_idStav`)
    REFERENCES `jakubzeman`.`stav` (`idStav`),
  CONSTRAINT `ticket_ibfk_3`
    FOREIGN KEY (`Priorita_idPriorita`)
    REFERENCES `jakubzeman`.`priorita` (`idPriorita`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
