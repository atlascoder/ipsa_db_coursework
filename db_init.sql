-- MySQL Script generated by MySQL Workbench
-- Thu Nov  4 01:01:40 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_coursework
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_coursework
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_coursework` DEFAULT CHARACTER SET utf8 ;
USE `db_coursework` ;

-- -----------------------------------------------------
-- Table `db_coursework`.`university`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`university` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `address` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coursework`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`faculty` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `university_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `signature` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_faculty_university1_idx` (`university_id` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  UNIQUE INDEX `signature_UNIQUE` (`signature` ASC) VISIBLE,
  CONSTRAINT `fk_faculty_university1`
    FOREIGN KEY (`university_id`)
    REFERENCES `db_coursework`.`university` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coursework`.`cathedra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`cathedra` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `faculty_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cathedra_faculty1_idx` (`faculty_id` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  CONSTRAINT `fk_cathedra_faculty1`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `db_coursework`.`faculty` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coursework`.`speciality`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`speciality` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `faculty_id` INT NOT NULL,
  `name` VARCHAR(128) NOT NULL,
  `signature` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_speciality_faculty1_idx` (`faculty_id` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  UNIQUE INDEX `signature_UNIQUE` (`signature` ASC) VISIBLE,
  CONSTRAINT `fk_speciality_faculty1`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `db_coursework`.`faculty` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coursework`.`student_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`student_group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `speciality_id` INT NOT NULL,
  `form_year` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_student_group_speciality1_idx` (`speciality_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_group_speciality1`
    FOREIGN KEY (`speciality_id`)
    REFERENCES `db_coursework`.`speciality` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coursework`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `children` INT NOT NULL DEFAULT 0,
  `birthdate` DATE NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NULL,
  `gender` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coursework`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`student` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `student_group_id` INT NOT NULL,
  `person_id` INT NOT NULL,
  `scholarship` DECIMAL(10,2) NOT NULL DEFAULT 0,0,
  `started` DATETIME NOT NULL,
  `finished` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_student_student_group1_idx` (`student_group_id` ASC) VISIBLE,
  INDEX `fk_student_person1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_student_group1`
    FOREIGN KEY (`student_group_id`)
    REFERENCES `db_coursework`.`student_group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `db_coursework`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coursework`.`student_has_student_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`student_has_student_group` (
  `student_id` INT NOT NULL,
  `student_group_id` INT NOT NULL,
  `student_group_speciality_id` INT NOT NULL,
  `student_group_speciality_faculty_id` INT NOT NULL,
  `student_group_speciality_faculty_university_id` INT NOT NULL,
  PRIMARY KEY (`student_id`, `student_group_id`, `student_group_speciality_id`, `student_group_speciality_faculty_id`, `student_group_speciality_faculty_university_id`),
  INDEX `fk_student_has_student_group_student_group1_idx` (`student_group_id` ASC, `student_group_speciality_id` ASC, `student_group_speciality_faculty_id` ASC, `student_group_speciality_faculty_university_id` ASC) VISIBLE,
  INDEX `fk_student_has_student_group_student1_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_has_student_group_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `db_coursework`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_student_group_student_group1`
    FOREIGN KEY (`student_group_id`)
    REFERENCES `db_coursework`.`student_group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coursework`.`sci_title`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`sci_title` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `rank` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coursework`.`teacher_rank`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`teacher_rank` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `required_sci_title_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_teacher_rank_sci_title1_idx` (`required_sci_title_id` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  CONSTRAINT `fk_teacher_rank_sci_title1`
    FOREIGN KEY (`required_sci_title_id`)
    REFERENCES `db_coursework`.`sci_title` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coursework`.`cathedra_teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`cathedra_teachers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cathedra_id` INT NOT NULL,
  `person_id` INT NOT NULL,
  `teacher_rank_id` INT NOT NULL,
  `wage` DECIMAL(10,2) NOT NULL DEFAULT 100000,
  `hired` DATETIME NOT NULL,
  `fired` DATETIME NULL,
  INDEX `fk_cathedra_teachers_person1_idx` (`person_id` ASC) VISIBLE,
  INDEX `fk_cathedra_teachers_teacher_rank1_idx` (`teacher_rank_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  INDEX `fk_cathedra_teachers_cathedra1_idx` (`cathedra_id` ASC) VISIBLE,
  CONSTRAINT `fk_cathedra_teachers_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `db_coursework`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cathedra_teachers_teacher_rank1`
    FOREIGN KEY (`teacher_rank_id`)
    REFERENCES `db_coursework`.`teacher_rank` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cathedra_teachers_cathedra1`
    FOREIGN KEY (`cathedra_id`)
    REFERENCES `db_coursework`.`cathedra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coursework`.`person_sci_career`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`person_sci_career` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NOT NULL,
  `sci_title_id` INT NOT NULL,
  `science` VARCHAR(45) NOT NULL,
  `date` DATETIME NOT NULL,
  INDEX `fk_person_carrier_person1_idx` (`person_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  INDEX `fk_sci_career_sci_title1_idx` (`sci_title_id` ASC) VISIBLE,
  UNIQUE INDEX `science_UNIQUE` (`science` ASC) VISIBLE,
  CONSTRAINT `fk_person_carrier_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `db_coursework`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sci_career_sci_title1`
    FOREIGN KEY (`sci_title_id`)
    REFERENCES `db_coursework`.`sci_title` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coursework`.`discipline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`discipline` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coursework`.`studying_work_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`studying_work_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coursework`.`plan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`plan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `speciality_id` INT NOT NULL,
  `discipline_id` INT NOT NULL,
  `course` INT NOT NULL,
  `semester` INT NOT NULL,
  `studying_work_type_id` INT NOT NULL,
  `year` INT NOT NULL,
  `hours` DECIMAL NOT NULL,
  INDEX `fk_plan_speciality1_idx` (`speciality_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  INDEX `fk_plan_discipline1_idx` (`discipline_id` ASC) VISIBLE,
  INDEX `fk_plan_studying_work_type1_idx` (`studying_work_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_plan_speciality1`
    FOREIGN KEY (`speciality_id`)
    REFERENCES `db_coursework`.`speciality` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plan_discipline1`
    FOREIGN KEY (`discipline_id`)
    REFERENCES `db_coursework`.`discipline` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plan_studying_work_type1`
    FOREIGN KEY (`studying_work_type_id`)
    REFERENCES `db_coursework`.`studying_work_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coursework`.`study_control_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`study_control_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coursework`.`cathedra_plan_charge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`cathedra_plan_charge` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `faculty_id` INT NOT NULL,
  `plan_id` INT NOT NULL,
  `cathedra_id` INT NOT NULL,
  INDEX `fk_cathedra_plan_charge_faculty1_idx` (`faculty_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  INDEX `fk_cathedra_plan_charge_plan1_idx` (`plan_id` ASC) VISIBLE,
  INDEX `fk_cathedra_plan_charge_cathedra1_idx` (`cathedra_id` ASC) VISIBLE,
  CONSTRAINT `fk_cathedra_plan_charge_faculty1`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `db_coursework`.`faculty` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cathedra_plan_charge_plan1`
    FOREIGN KEY (`plan_id`)
    REFERENCES `db_coursework`.`plan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cathedra_plan_charge_cathedra1`
    FOREIGN KEY (`cathedra_id`)
    REFERENCES `db_coursework`.`cathedra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coursework`.`cathedra_plan_assignment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`cathedra_plan_assignment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cathedra_plan_charge_id` VARCHAR(45) NOT NULL,
  `cathedra_teachers_id` INT NOT NULL,
  `hours` DECIMAL NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cathedra_plan_assignment_cathedra_plan_charge1_idx` (`cathedra_plan_charge_id` ASC) VISIBLE,
  INDEX `fk_cathedra_plan_assignment_cathedra_teachers1_idx` (`cathedra_teachers_id` ASC) VISIBLE,
  CONSTRAINT `fk_cathedra_plan_assignment_cathedra_plan_charge1`
    FOREIGN KEY (`cathedra_plan_charge_id`)
    REFERENCES `db_coursework`.`cathedra_plan_charge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cathedra_plan_assignment_cathedra_teachers1`
    FOREIGN KEY (`cathedra_teachers_id`)
    REFERENCES `db_coursework`.`cathedra_teachers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coursework`.`plan_study_control`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`plan_study_control` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `score` INT NULL,
  `study_control_type_id` INT NOT NULL,
  `plan_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_plan_study_control_study_control_type1_idx` (`study_control_type_id` ASC) VISIBLE,
  INDEX `fk_plan_study_control_plan1_idx` (`plan_id` ASC) VISIBLE,
  CONSTRAINT `fk_plan_study_control_study_control_type1`
    FOREIGN KEY (`study_control_type_id`)
    REFERENCES `db_coursework`.`study_control_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plan_study_control_plan1`
    FOREIGN KEY (`plan_id`)
    REFERENCES `db_coursework`.`plan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_coursework`.`student_study_plan_control_result`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_coursework`.`student_study_plan_control_result` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `cathedra_teachers_id` INT NOT NULL,
  `plan_study_control_id` INT NOT NULL,
  `score` INT NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_stident_study_plan_control_result_student1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_stident_study_plan_control_result_cathedra_teachers1_idx` (`cathedra_teachers_id` ASC) VISIBLE,
  INDEX `fk_stident_study_plan_control_result_plan_study_control1_idx` (`plan_study_control_id` ASC) VISIBLE,
  CONSTRAINT `fk_stident_study_plan_control_result_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `db_coursework`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stident_study_plan_control_result_cathedra_teachers1`
    FOREIGN KEY (`cathedra_teachers_id`)
    REFERENCES `db_coursework`.`cathedra_teachers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stident_study_plan_control_result_plan_study_control1`
    FOREIGN KEY (`plan_study_control_id`)
    REFERENCES `db_coursework`.`plan_study_control` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;