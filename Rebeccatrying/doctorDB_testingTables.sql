-- MySQL Script generated by MySQL Workbench
-- Wed Nov 28 07:47:33 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

-- -----------------------------------------------------
-- Schema DoctorDB
-- -----------------------------------------------------
-- This is my Doctor CPSC 471 Databases database. 
DROP SCHEMA IF EXISTS `DoctorDB` ;

-- -----------------------------------------------------
-- Schema DoctorDB
--
-- This is my Doctor CPSC 471 Databases database. 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DoctorDB` ;
USE `DoctorDB` ;

-- -----------------------------------------------------
-- Table `DoctorDB`.`PATIENTS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DoctorDB`.`PATIENTS` ;

CREATE TABLE IF NOT EXISTS `DoctorDB`.`PATIENTS` (
  `patient_SIN` INT(9) NOT NULL AUTO_INCREMENT,
  `patient_username` VARCHAR(45) NOT NULL,
  `patient_Health_Card_no` VARCHAR(45) NOT NULL,
  `patient_password` VARCHAR(45) NULL,
  `patient_Lname` VARCHAR(45) NULL,
  `patient_Fname` VARCHAR(45) NULL,
  `patient_isAdmin` TINYINT NULL DEFAULT 0,
  `patient_City` VARCHAR(45) NULL,
  `patient_Street` VARCHAR(45) NULL,
  `patient_Province` VARCHAR(45) NULL,
  `patient_Insurance_Provider` VARCHAR(45) NULL,
  PRIMARY KEY (`patient_SIN`, `patient_username`, `patient_Health_Card_no`),
  UNIQUE INDEX `username_UNIQUE` (`patient_username` ASC),
  UNIQUE INDEX `patient_SIN_UNIQUE` (`patient_SIN` ASC),
  UNIQUE INDEX `Health_Card_no_UNIQUE` (`patient_Health_Card_no` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DoctorDB`.`MEDICALSTAFF`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DoctorDB`.`MEDICALSTAFF` ;

CREATE TABLE IF NOT EXISTS `DoctorDB`.`MEDICALSTAFF` (
  `MedStaff_SIN` INT(9) NOT NULL AUTO_INCREMENT,
  `MedStaff_username` VARCHAR(45) NOT NULL,
  `MedStaff_password` VARCHAR(45) NULL,
  `MedStaff_Lname` VARCHAR(45) NULL,
  `MedStaff_Fname` VARCHAR(45) NULL,
  `MedStaff_isAdmin` TINYINT NULL,
  `MedStaff_isSpecialist` TINYINT NULL,
  `MedStaff_isSurgeon` TINYINT NULL,
  PRIMARY KEY (`MedStaff_SIN`, `MedStaff_username`),
  UNIQUE INDEX `username_UNIQUE` (`MedStaff_username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DoctorDB`.`MEDICALINSTITUTION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DoctorDB`.`MEDICALINSTITUTION` ;

CREATE TABLE IF NOT EXISTS `DoctorDB`.`MEDICALINSTITUTION` (
  `mi_MedInst_ID` INT NOT NULL AUTO_INCREMENT,
  `mi_Inst_Name` VARCHAR(45) NOT NULL,
  `mi_Inst_Location` VARCHAR(45) NULL,
  `mi_Inst_Type` VARCHAR(45) NULL,
  `mi_Opening_Time` VARCHAR(45) NULL COMMENT '//Should be Time(???) ???',
  `mi_Closing_Time` VARCHAR(45) NULL COMMENT '//Should be Time(???) ???',
  PRIMARY KEY (`mi_MedInst_ID`),
  UNIQUE INDEX `idMEDICALINSTITUTION_UNIQUE` (`mi_MedInst_ID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DoctorDB`.`SURGEONAREAS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DoctorDB`.`SURGEONAREAS` ;

CREATE TABLE IF NOT EXISTS `DoctorDB`.`SURGEONAREAS` (
  `surg_Type_of_Surgery` VARCHAR(45) NOT NULL,
  `surg_MedStaff_SIN` INT(9) NOT NULL,
  PRIMARY KEY (`surg_Type_of_Surgery`, `surg_MedStaff_SIN`),
  INDEX `MedStaff_SIN_idx` (`surg_MedStaff_SIN` ASC),
  CONSTRAINT `MedStaff_SIN`
    FOREIGN KEY (`surg_MedStaff_SIN`)
    REFERENCES `DoctorDB`.`MEDICALSTAFF` (`MedStaff_SIN`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DoctorDB`.`SPECIALISTAREAS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DoctorDB`.`SPECIALISTAREAS` ;

CREATE TABLE IF NOT EXISTS `DoctorDB`.`SPECIALISTAREAS` (
  `sa_Area_of_Expertice` VARCHAR(45) NOT NULL,
  `sa_MS_SIN` INT(9) NOT NULL,
  PRIMARY KEY (`sa_Area_of_Expertice`, `sa_MS_SIN`),
  INDEX `MedStaff_SIN_idx` (`sa_MS_SIN` ASC),
  CONSTRAINT `MedStaff_SIN2`
    FOREIGN KEY (`sa_MS_SIN`)
    REFERENCES `DoctorDB`.`MEDICALSTAFF` (`MedStaff_SIN`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DoctorDB`.`MEDSTAFFQUALIFICATIONS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DoctorDB`.`MEDSTAFFQUALIFICATIONS` ;

CREATE TABLE IF NOT EXISTS `DoctorDB`.`MEDSTAFFQUALIFICATIONS` (
  `msq_MedStaff_SIN` INT(9) NOT NULL,
  `msq_Qualification` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`msq_MedStaff_SIN`, `msq_Qualification`),
  INDEX `MedStaff_SIN_idx` (`msq_MedStaff_SIN` ASC),
  CONSTRAINT `MedStaff_SIN3`
    FOREIGN KEY (`msq_MedStaff_SIN`)
    REFERENCES `DoctorDB`.`MEDICALSTAFF` (`MedStaff_SIN`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DoctorDB`.`RECORD`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DoctorDB`.`RECORD` ;

CREATE TABLE IF NOT EXISTS `DoctorDB`.`RECORD` (
  `rec_Record_ID` INT NOT NULL AUTO_INCREMENT,
  `rec_Patient_SIN` INT(9) NOT NULL,
  `rec_Date` DATE NULL,
  PRIMARY KEY (`rec_Record_ID`, `rec_Patient_SIN`),
  CONSTRAINT `Patient_SIN`
    FOREIGN KEY (`rec_Patient_SIN`)
    REFERENCES `DoctorDB`.`PATIENTS` (`patient_SIN`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DoctorDB`.`PRESCRIPTION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DoctorDB`.`PRESCRIPTION` ;

CREATE TABLE IF NOT EXISTS `DoctorDB`.`PRESCRIPTION` (
  `pres_Script_ID` INT NOT NULL AUTO_INCREMENT,
  `pres_Patient_SIN` INT(9) NOT NULL,
  `pres_presType` VARCHAR(45) NULL,
  `pres_presName` VARCHAR(45) NULL,
  `pres_length` VARCHAR(45) NULL,
  `pres_Times_Renewable` VARCHAR(45) NULL,
  PRIMARY KEY (`pres_Script_ID`, `pres_Patient_SIN`),
  CONSTRAINT `Patient_SIN2`
    FOREIGN KEY (`pres_Patient_SIN`)
    REFERENCES `DoctorDB`.`PATIENTS` (`patient_SIN`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DoctorDB`.`INSURANCE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DoctorDB`.`INSURANCE` ;

CREATE TABLE IF NOT EXISTS `DoctorDB`.`INSURANCE` (
  `insr_Patient_SIN` INT(9) NOT NULL,
  `insr_Item_Covered` VARCHAR(45) NOT NULL,
  `insr_PercentCovered` INT(3) NULL,
  PRIMARY KEY (`insr_Patient_SIN`, `insr_Item_Covered`),
  CONSTRAINT `Patient_SIN3`
    FOREIGN KEY (`insr_Patient_SIN`)
    REFERENCES `DoctorDB`.`PATIENTS` (`patient_SIN`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DoctorDB`.`MEDICALHISTORYITEM`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DoctorDB`.`MEDICALHISTORYITEM` ;

CREATE TABLE IF NOT EXISTS `DoctorDB`.`MEDICALHISTORYITEM` (
  `mhitem_Med_Hist_ID` INT NOT NULL AUTO_INCREMENT,
  `mhitem_Record_ID` INT(9) NOT NULL,
  `mhitem_Diagnosis` VARCHAR(45) NULL,
  `mhitem_Recommended_Treatment` VARCHAR(45) NULL,
  `mhitem_Notes` VARCHAR(1500) NULL,
  PRIMARY KEY (`mhitem_Med_Hist_ID`, `mhitem_Record_ID`),
  CONSTRAINT `Record_ID`
    FOREIGN KEY (`mhitem_Record_ID`)
    REFERENCES `DoctorDB`.`RECORD` (`rec_Record_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DoctorDB`.`ATTACHMENT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DoctorDB`.`ATTACHMENT` ;

CREATE TABLE IF NOT EXISTS `DoctorDB`.`ATTACHMENT` (
  `Att_Record_ID` INT(9) NOT NULL,
  `Att_DocName` VARCHAR(100) NOT NULL,
  `Att_Type` VARCHAR(10) NULL,
  PRIMARY KEY (`Att_Record_ID`, `Att_DocName`),
  CONSTRAINT `Record_ID2`
    FOREIGN KEY (`Att_Record_ID`)
    REFERENCES `DoctorDB`.`RECORD` (`rec_Record_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DoctorDB`.`MEDHISTSYMPTOMS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DoctorDB`.`MEDHISTSYMPTOMS` ;

CREATE TABLE IF NOT EXISTS `DoctorDB`.`MEDHISTSYMPTOMS` (
  `mh_MedHist_ID` INT(9) NOT NULL,
  `mh_Symptom` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`mh_MedHist_ID`, `mh_Symptom`),
  CONSTRAINT `Med_Hist_ID`
    FOREIGN KEY (`mh_MedHist_ID`)
    REFERENCES `DoctorDB`.`MEDICALHISTORYITEM` (`mhitem_Med_Hist_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DoctorDB`.`ACCESS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DoctorDB`.`ACCESS` ;

CREATE TABLE IF NOT EXISTS `DoctorDB`.`ACCESS` (
  `Acc_MedStaff_SIN` INT(9) NOT NULL,
  `Acc_Record_ID` INT NOT NULL,
  PRIMARY KEY (`Acc_MedStaff_SIN`, `Acc_Record_ID`),
  INDEX `Record_ID_idx` (`Acc_Record_ID` ASC),
  CONSTRAINT `MedStaff_ID`
    FOREIGN KEY (`Acc_MedStaff_SIN`)
    REFERENCES `DoctorDB`.`MEDICALSTAFF` (`MedStaff_SIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Record_ID3`
    FOREIGN KEY (`Acc_Record_ID`)
    REFERENCES `DoctorDB`.`RECORD` (`rec_Record_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DoctorDB`.`APPOINTMENT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DoctorDB`.`APPOINTMENT` ;

CREATE TABLE IF NOT EXISTS `DoctorDB`.`APPOINTMENT` (
  `App_ConfirmationNum` INT NOT NULL AUTO_INCREMENT,
  `App_Patient_SIN` INT(9) NULL,
  `App_MedStaff_SIN` INT(9) NULL,
  `App_Inst_Name` VARCHAR(45) NULL COMMENT 'inst_name foreign key isn’t working.',
  
 -- had to remove inst_name here 
  
  `App_appointmentType` VARCHAR(1500) NULL,
  `App_Date` DATE NULL,
  `App_Start_time` DATETIME NULL COMMENT '//time(???)???',
  `App_End_Time` DATETIME NULL,
  PRIMARY KEY (`App_ConfirmationNum`),
  INDEX `Patient_SIN_idx` (`App_Patient_SIN` ASC),
  INDEX `MedStaff_SIN_idx` (`App_MedStaff_SIN` ASC),
  CONSTRAINT `Patient_SIN4`
    FOREIGN KEY (`App_Patient_SIN`)
    REFERENCES `DoctorDB`.`PATIENTS` (`patient_SIN`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `MedStaff_SIN4`
    FOREIGN KEY (`App_MedStaff_SIN`)
    REFERENCES `DoctorDB`.`MEDICALSTAFF` (`MedStaff_SIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DoctorDB`.`WORKPLACEMENTS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DoctorDB`.`WORKPLACEMENTS` ;

-- had to get rid of inst_name foreign key; inst_ID works the same way

CREATE TABLE IF NOT EXISTS `DoctorDB`.`WORKPLACEMENTS` (
  `wp_DayWorking` VARCHAR(45) NOT NULL,
  `wp_MedInst_ID` INT NOT NULL,
  `wp_MedStaff_SIN` INT(9) NOT NULL,
  `wp_Inst_name` VARCHAR(45) NULL COMMENT 'inst name not working',
  `wp_workLocationName` VARCHAR(45) NULL COMMENT '...wtf is this attribute supposed to be again?',
  `wp_Type` VARCHAR(45) NULL,
  PRIMARY KEY (`wp_DayWorking`, `wp_MedInst_ID`, `wp_MedStaff_SIN`),
  INDEX `MedInst_ID_idx` (`wp_MedInst_ID` ASC),
  INDEX `MedStaff_SIN_idx` (`wp_MedStaff_SIN` ASC),
  CONSTRAINT `MedInst_ID`
    FOREIGN KEY (`wp_MedInst_ID`)
    REFERENCES `DoctorDB`.`MEDICALINSTITUTION` (`mi_MedInst_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `MedStaff_SIN5`
    FOREIGN KEY (`wp_MedStaff_SIN`)
    REFERENCES `DoctorDB`.`MEDICALSTAFF` (`MedStaff_SIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DoctorDB`.`DAYSCLOSED`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DoctorDB`.`DAYSCLOSED` ;

CREATE TABLE IF NOT EXISTS `DoctorDB`.`DAYSCLOSED` (
  `DC_MedInst_ID` INT(9) NOT NULL,
  `DC_DayClosed` DATE NOT NULL,
  PRIMARY KEY (`DC_MedInst_ID`, `DC_DayClosed`),
  CONSTRAINT `MedInst_ID2`
    FOREIGN KEY (`DC_MedInst_ID`)
    REFERENCES `DoctorDB`.`MEDICALINSTITUTION` (`mi_MedInst_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;