-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: baseisdatabase
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `budget`
--

DROP TABLE IF EXISTS `budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budget` (
  `id_budget` bigint NOT NULL AUTO_INCREMENT,
  `amount` float NOT NULL,
  `in_out` text NOT NULL,
  `description` text NOT NULL,
  `date` text NOT NULL,
  `username` varchar(40) NOT NULL,
  PRIMARY KEY (`id_budget`),
  KEY `fk_budget_user1_idx1` (`username`),
  CONSTRAINT `fk_budget_user1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget`
--

LOCK TABLES `budget` WRITE;
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
INSERT INTO `budget` VALUES (22,630,'Income','Got paid from my job!','2022-01-02','ikara'),(23,50,'Income','Christmas gift from mum!','2022-01-02','ikara'),(24,23,'Expense','Supermaket','2022-01-02','ikara'),(25,20,'Expense','Dinner with my best friend','2022-01-03','ikara'),(26,60,'Expense','New backpack','2022-01-04','ikara'),(27,20,'Income','Won the lottery!!','2022-01-05','ikara'),(28,30,'Expense','supermarket ','2022-01-06','ikara'),(29,15,'Expense','Barbershop :)','2022-01-06','ikara'),(30,5,'Expense','Coffeeeee','2022-01-07','ikara'),(31,30,'Income','Gift from grandma','2022-01-09','ikara'),(32,40,'Income','Gift from grandpa','2022-01-09','ikara'),(33,500,'Income','&#928;&#955;&#951;&#961;&#974;&#952;&#951;&#954;&#945;&#945;&#945;&#945;&#945;&#945;&#945;','2022-01-03','xebit'),(34,7,'Expense','Burger with friends!','2022-01-05','ikara'),(36,30,'Expense','road trip with besties','2022-01-06','ikara'),(37,70,'Income','Gift from my sister','2022-01-07','ikara'),(38,5,'Expense','coffee with my friends','2022-01-07','ikara');
/*!40000 ALTER TABLE `budget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-07 16:41:53
