-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cat_shelter
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `adopters`
--

DROP TABLE IF EXISTS `adopters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adopters` (
  `Id_Adopters` int(11) NOT NULL AUTO_INCREMENT,
  `First_name` varchar(100) DEFAULT NULL,
  `Last_name` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Postal_code` varchar(10) DEFAULT NULL,
  `Street` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Adopters`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adopters`
--

LOCK TABLES `adopters` WRITE;
/*!40000 ALTER TABLE `adopters` DISABLE KEYS */;
/*!40000 ALTER TABLE `adopters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adoptions`
--

DROP TABLE IF EXISTS `adoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoptions` (
  `Id_Adoptions` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Cats` int(11) NOT NULL,
  `Id_Adopters` int(11) NOT NULL,
  `Adoption_date` date DEFAULT NULL,
  `Adoption_contract` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`Id_Adoptions`),
  KEY `Id_Cats` (`Id_Cats`),
  KEY `Id_Adopters` (`Id_Adopters`),
  CONSTRAINT `adoptions_ibfk_1` FOREIGN KEY (`Id_Cats`) REFERENCES `cats` (`Id_cats`) ON DELETE CASCADE,
  CONSTRAINT `adoptions_ibfk_2` FOREIGN KEY (`Id_Adopters`) REFERENCES `adopters` (`Id_Adopters`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoptions`
--

LOCK TABLES `adoptions` WRITE;
/*!40000 ALTER TABLE `adoptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `adoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cat_basic_info`
--

DROP TABLE IF EXISTS `cat_basic_info`;
/*!50001 DROP VIEW IF EXISTS `cat_basic_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cat_basic_info` AS SELECT 
 1 AS `Name`,
 1 AS `Age`,
 1 AS `Gender`,
 1 AS `Height`,
 1 AS `Weight`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cats`
--

DROP TABLE IF EXISTS `cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cats` (
  `Id_cats` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` enum('Male','Female','Unknown') NOT NULL,
  PRIMARY KEY (`Id_cats`)
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cats`
--

LOCK TABLES `cats` WRITE;
/*!40000 ALTER TABLE `cats` DISABLE KEYS */;
INSERT INTO `cats` VALUES (1002,'Jerzy',5,'Male'),(1003,'Pipi',2,'Male'),(1004,'Malina',1,'Female'),(1005,'Malinka',1,'Female'),(1006,'Kiki',2,'Female');
/*!40000 ALTER TABLE `cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cats_parameters`
--

DROP TABLE IF EXISTS `cats_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cats_parameters` (
  `Id_Cats_parameters` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Cats` int(11) DEFAULT NULL,
  `Height` float DEFAULT NULL,
  `Weight` float DEFAULT NULL,
  PRIMARY KEY (`Id_Cats_parameters`),
  KEY `cats_parameters_ibfk_1` (`Id_Cats`),
  CONSTRAINT `cats_parameters_ibfk_1` FOREIGN KEY (`Id_Cats`) REFERENCES `cats` (`Id_cats`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cats_parameters`
--

LOCK TABLES `cats_parameters` WRITE;
/*!40000 ALTER TABLE `cats_parameters` DISABLE KEYS */;
INSERT INTO `cats_parameters` VALUES (3,1002,30,5),(4,1004,NULL,NULL),(5,1005,NULL,NULL),(6,1006,NULL,NULL);
/*!40000 ALTER TABLE `cats_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characteristics`
--

DROP TABLE IF EXISTS `characteristics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characteristics` (
  `Id_Characteristics` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Cats` int(11) NOT NULL,
  `Friendly_with_children` tinyint(1) DEFAULT NULL,
  `Friendly_with_dogs` tinyint(1) DEFAULT NULL,
  `Friendly_with_cats` tinyint(1) DEFAULT NULL,
  `Energetic` tinyint(1) DEFAULT NULL,
  `Likes_cuddles` tinyint(1) DEFAULT NULL,
  `Additional_notes` text DEFAULT NULL,
  PRIMARY KEY (`Id_Characteristics`),
  KEY `characteristics_ibfk_1` (`Id_Cats`),
  CONSTRAINT `characteristics_ibfk_1` FOREIGN KEY (`Id_Cats`) REFERENCES `cats` (`Id_cats`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characteristics`
--

LOCK TABLES `characteristics` WRITE;
/*!40000 ALTER TABLE `characteristics` DISABLE KEYS */;
INSERT INTO `characteristics` VALUES (1,1004,0,0,0,0,0,''),(2,1005,0,0,0,0,0,''),(3,1006,0,0,0,0,0,'');
/*!40000 ALTER TABLE `characteristics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diet`
--

DROP TABLE IF EXISTS `diet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diet` (
  `Id_Diet` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Cats` int(11) DEFAULT NULL,
  `Diet_type` enum('regular','grain_free','vet_prescribed') DEFAULT NULL,
  `Wet_food` tinyint(1) DEFAULT NULL,
  `Dry_food` tinyint(1) DEFAULT NULL,
  `Special_diet` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_Diet`),
  KEY `diet_ibfk_1` (`Id_Cats`),
  CONSTRAINT `diet_ibfk_1` FOREIGN KEY (`Id_Cats`) REFERENCES `cats` (`Id_cats`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diet`
--

LOCK TABLES `diet` WRITE;
/*!40000 ALTER TABLE `diet` DISABLE KEYS */;
INSERT INTO `diet` VALUES (1,1004,'regular',0,0,''),(2,1005,'regular',0,0,''),(3,1006,'regular',0,0,'');
/*!40000 ALTER TABLE `diet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stays`
--

DROP TABLE IF EXISTS `stays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stays` (
  `Id_Stays` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Cats` int(11) NOT NULL,
  `Admission_date` date DEFAULT NULL,
  `Admission_reason` varchar(255) DEFAULT NULL,
  `Status` enum('Shelter','Adopted','Fostered') DEFAULT NULL,
  PRIMARY KEY (`Id_Stays`),
  KEY `Id_Cats` (`Id_Cats`),
  CONSTRAINT `stays_ibfk_1` FOREIGN KEY (`Id_Cats`) REFERENCES `cats` (`Id_cats`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stays`
--

LOCK TABLES `stays` WRITE;
/*!40000 ALTER TABLE `stays` DISABLE KEYS */;
INSERT INTO `stays` VALUES (1,1004,'2025-02-19','New arrival','Shelter'),(2,1005,'2025-02-19','New arrival','Shelter'),(3,1006,'2025-02-19','New arrival','Shelter');
/*!40000 ALTER TABLE `stays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinary_care`
--

DROP TABLE IF EXISTS `veterinary_care`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinary_care` (
  `Id_Veterinary_care` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Cats` int(11) NOT NULL,
  `Vaccinations` tinyint(1) DEFAULT NULL,
  `Sterilization` tinyint(1) DEFAULT NULL,
  `Deworming` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id_Veterinary_care`),
  KEY `Id_Cats` (`Id_Cats`),
  CONSTRAINT `veterinary_care_ibfk_1` FOREIGN KEY (`Id_Cats`) REFERENCES `cats` (`Id_cats`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinary_care`
--

LOCK TABLES `veterinary_care` WRITE;
/*!40000 ALTER TABLE `veterinary_care` DISABLE KEYS */;
INSERT INTO `veterinary_care` VALUES (1,1004,0,0,0),(2,1005,0,0,0),(3,1006,0,0,0);
/*!40000 ALTER TABLE `veterinary_care` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `cat_basic_info`
--

/*!50001 DROP VIEW IF EXISTS `cat_basic_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cat_basic_info` AS select `c`.`Name` AS `Name`,`c`.`Age` AS `Age`,`c`.`Gender` AS `Gender`,`cp`.`Height` AS `Height`,`cp`.`Weight` AS `Weight` from (`cats` `c` join `cats_parameters` `cp` on(`c`.`Id_cats` = `cp`.`Id_Cats`)) */;
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

-- Dump completed on 2025-02-19 21:44:50
