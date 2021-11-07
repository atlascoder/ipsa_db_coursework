-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: 88.198.46.232    Database: db_coursework
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `PersonAllowedTeacherRank`
--

DROP TABLE IF EXISTS `PersonAllowedTeacherRank`;
/*!50001 DROP VIEW IF EXISTS `PersonAllowedTeacherRank`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `PersonAllowedTeacherRank` AS SELECT 
 1 AS `person_id`,
 1 AS `person_name`,
 1 AS `person_surname`,
 1 AS `sci_title`,
 1 AS `teacher_rank_id`,
 1 AS `teacher_rank_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `RandomCathedraTeachers`
--

DROP TABLE IF EXISTS `RandomCathedraTeachers`;
/*!50001 DROP VIEW IF EXISTS `RandomCathedraTeachers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `RandomCathedraTeachers` AS SELECT 
 1 AS `teacher_id`,
 1 AS `cathedra_id`,
 1 AS `rnd`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `aspirant`
--

DROP TABLE IF EXISTS `aspirant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspirant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cathedra_id` int NOT NULL,
  `person_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_aspirant_cathedra1_idx` (`cathedra_id`),
  KEY `fk_aspirant_person1_idx` (`person_id`),
  CONSTRAINT `fk_aspirant_cathedra1` FOREIGN KEY (`cathedra_id`) REFERENCES `cathedra` (`id`),
  CONSTRAINT `fk_aspirant_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cathedra`
--

DROP TABLE IF EXISTS `cathedra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cathedra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `faculty_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_cathedra_faculty1_idx` (`faculty_id`),
  CONSTRAINT `fk_cathedra_faculty1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cathedra_plan_assignment`
--

DROP TABLE IF EXISTS `cathedra_plan_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cathedra_plan_assignment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cathedra_plan_charge_id` int NOT NULL,
  `cathedra_teacher_id` int NOT NULL,
  `hours` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cathedra_plan_assignment_cathedra_plan_charge1_idx` (`cathedra_plan_charge_id`),
  KEY `fk_cathedra_plan_assignment_cathedra_teachers1_idx` (`cathedra_teacher_id`),
  CONSTRAINT `fk_cathedra_plan_assignment_cathedra_plan_charge1` FOREIGN KEY (`cathedra_plan_charge_id`) REFERENCES `cathedra_plan_charge` (`id`),
  CONSTRAINT `fk_cathedra_plan_assignment_cathedra_teachers1` FOREIGN KEY (`cathedra_teacher_id`) REFERENCES `cathedra_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cathedra_plan_charge`
--

DROP TABLE IF EXISTS `cathedra_plan_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cathedra_plan_charge` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plan_id` int NOT NULL,
  `cathedra_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cathedra_plan_charge_plan1_idx` (`plan_id`),
  KEY `fk_cathedra_plan_charge_cathedra1_idx` (`cathedra_id`),
  CONSTRAINT `fk_cathedra_plan_charge_cathedra1` FOREIGN KEY (`cathedra_id`) REFERENCES `cathedra` (`id`),
  CONSTRAINT `fk_cathedra_plan_charge_plan1` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cathedra_teacher`
--

DROP TABLE IF EXISTS `cathedra_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cathedra_teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cathedra_id` int NOT NULL,
  `person_id` int NOT NULL,
  `teacher_rank_id` int NOT NULL,
  `wage` decimal(10,2) NOT NULL DEFAULT '100000.00',
  PRIMARY KEY (`id`),
  KEY `fk_cathedra_teachers_person1_idx` (`person_id`),
  KEY `fk_cathedra_teachers_teacher_rank1_idx` (`teacher_rank_id`),
  KEY `fk_cathedra_teachers_cathedra1_idx` (`cathedra_id`),
  CONSTRAINT `fk_cathedra_teachers_cathedra1` FOREIGN KEY (`cathedra_id`) REFERENCES `cathedra` (`id`),
  CONSTRAINT `fk_cathedra_teachers_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  CONSTRAINT `fk_cathedra_teachers_teacher_rank1` FOREIGN KEY (`teacher_rank_id`) REFERENCES `teacher_rank` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diploma`
--

DROP TABLE IF EXISTS `diploma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diploma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `speciality_id` int NOT NULL,
  `cathedra_teacher_id` int NOT NULL,
  `student_id` int NOT NULL,
  `theme` varchar(255) NOT NULL,
  `score` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dimploma_speciality1_idx` (`speciality_id`),
  KEY `fk_dimploma_cathedra_teacher1_idx` (`cathedra_teacher_id`),
  KEY `fk_dimploma_student1_idx` (`student_id`),
  CONSTRAINT `fk_dimploma_cathedra_teacher1` FOREIGN KEY (`cathedra_teacher_id`) REFERENCES `cathedra_teacher` (`id`),
  CONSTRAINT `fk_dimploma_speciality1` FOREIGN KEY (`speciality_id`) REFERENCES `speciality` (`id`),
  CONSTRAINT `fk_dimploma_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discipline`
--

DROP TABLE IF EXISTS `discipline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discipline` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cathedra_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_discipline_cathedra1_idx` (`cathedra_id`),
  CONSTRAINT `fk_discipline_cathedra1` FOREIGN KEY (`cathedra_id`) REFERENCES `cathedra` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `university_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `signature` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `signature_UNIQUE` (`signature`),
  KEY `fk_faculty_university1_idx` (`university_id`),
  CONSTRAINT `fk_faculty_university1` FOREIGN KEY (`university_id`) REFERENCES `university` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `children` int NOT NULL DEFAULT '0',
  `birthdate` date NOT NULL,
  `address` varchar(128) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `gender` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1247 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `person_sci_career`
--

DROP TABLE IF EXISTS `person_sci_career`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_sci_career` (
  `id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `sci_title_id` int NOT NULL,
  `science` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `work_title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_person_carrier_person1_idx` (`person_id`),
  KEY `fk_sci_career_sci_title1_idx` (`sci_title_id`),
  CONSTRAINT `fk_person_carrier_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  CONSTRAINT `fk_sci_career_sci_title1` FOREIGN KEY (`sci_title_id`) REFERENCES `sci_title` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `speciality_id` int NOT NULL,
  `discipline_id` int NOT NULL,
  `course` int NOT NULL,
  `semester` int NOT NULL,
  `studying_work_type_id` int NOT NULL,
  `year` int NOT NULL,
  `hours` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plan_speciality1_idx` (`speciality_id`),
  KEY `fk_plan_discipline1_idx` (`discipline_id`),
  KEY `fk_plan_studying_work_type1_idx` (`studying_work_type_id`),
  CONSTRAINT `fk_plan_discipline1` FOREIGN KEY (`discipline_id`) REFERENCES `discipline` (`id`),
  CONSTRAINT `fk_plan_speciality1` FOREIGN KEY (`speciality_id`) REFERENCES `speciality` (`id`),
  CONSTRAINT `fk_plan_studying_work_type1` FOREIGN KEY (`studying_work_type_id`) REFERENCES `studying_work_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_study_control`
--

DROP TABLE IF EXISTS `plan_study_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_study_control` (
  `id` int NOT NULL AUTO_INCREMENT,
  `study_control_type_id` int NOT NULL,
  `plan_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plan_study_control_study_control_type1_idx` (`study_control_type_id`),
  KEY `fk_plan_study_control_plan1_idx` (`plan_id`),
  CONSTRAINT `fk_plan_study_control_plan1` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`),
  CONSTRAINT `fk_plan_study_control_study_control_type1` FOREIGN KEY (`study_control_type_id`) REFERENCES `study_control_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sci_title`
--

DROP TABLE IF EXISTS `sci_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sci_title` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `rank` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `speciality`
--

DROP TABLE IF EXISTS `speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `speciality` (
  `id` int NOT NULL AUTO_INCREMENT,
  `faculty_id` int NOT NULL,
  `name` varchar(128) NOT NULL,
  `signature` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `signature_UNIQUE` (`signature`),
  KEY `fk_speciality_faculty1_idx` (`faculty_id`),
  CONSTRAINT `fk_speciality_faculty1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_group_id` int NOT NULL,
  `person_id` int NOT NULL,
  `scholarship` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `fk_student_student_group1_idx` (`student_group_id`),
  KEY `fk_student_person1_idx` (`person_id`),
  CONSTRAINT `fk_student_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  CONSTRAINT `fk_student_student_group1` FOREIGN KEY (`student_group_id`) REFERENCES `student_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1181 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_group`
--

DROP TABLE IF EXISTS `student_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `speciality_id` int NOT NULL,
  `form_year` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_student_group_speciality1_idx` (`speciality_id`),
  CONSTRAINT `fk_student_group_speciality1` FOREIGN KEY (`speciality_id`) REFERENCES `speciality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_study_plan_control_result`
--

DROP TABLE IF EXISTS `student_study_plan_control_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_study_plan_control_result` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `cathedra_teacher_id` int NOT NULL,
  `plan_study_control_id` int NOT NULL,
  `score` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stident_study_plan_control_result_student1_idx` (`student_id`),
  KEY `fk_stident_study_plan_control_result_cathedra_teachers1_idx` (`cathedra_teacher_id`),
  KEY `fk_stident_study_plan_control_result_plan_study_control1_idx` (`plan_study_control_id`),
  CONSTRAINT `fk_stident_study_plan_control_result_cathedra_teachers1` FOREIGN KEY (`cathedra_teacher_id`) REFERENCES `cathedra_teacher` (`id`),
  CONSTRAINT `fk_stident_study_plan_control_result_plan_study_control1` FOREIGN KEY (`plan_study_control_id`) REFERENCES `plan_study_control` (`id`),
  CONSTRAINT `fk_stident_study_plan_control_result_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2047 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `study_control_type`
--

DROP TABLE IF EXISTS `study_control_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `study_control_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `studying_work_type`
--

DROP TABLE IF EXISTS `studying_work_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studying_work_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher_rank`
--

DROP TABLE IF EXISTS `teacher_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_rank` (
  `id` int NOT NULL AUTO_INCREMENT,
  `required_sci_title_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_teacher_rank_sci_title1_idx` (`required_sci_title_id`),
  CONSTRAINT `fk_teacher_rank_sci_title1` FOREIGN KEY (`required_sci_title_id`) REFERENCES `sci_title` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `university` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `city` varchar(45) NOT NULL,
  `address` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `PersonAllowedTeacherRank`
--

/*!50001 DROP VIEW IF EXISTS `PersonAllowedTeacherRank`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`db_coursework_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `PersonAllowedTeacherRank` AS select `p`.`id` AS `person_id`,`p`.`name` AS `person_name`,`p`.`surname` AS `person_surname`,`st`.`name` AS `sci_title`,`tr`.`id` AS `teacher_rank_id`,`tr`.`name` AS `teacher_rank_name` from (((`person` `p` join `person_sci_career` `psc` on((`p`.`id` = `psc`.`person_id`))) join `sci_title` `st` on((`st`.`id` = `psc`.`sci_title_id`))) join `teacher_rank` `tr` on((`tr`.`required_sci_title_id` <= `st`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `RandomCathedraTeachers`
--

/*!50001 DROP VIEW IF EXISTS `RandomCathedraTeachers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`db_coursework_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `RandomCathedraTeachers` AS select `ct`.`id` AS `teacher_id`,`ct`.`cathedra_id` AS `cathedra_id`,rand() AS `rnd` from `cathedra_teacher` `ct` order by rand() desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-08  0:09:32
