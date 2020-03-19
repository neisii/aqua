CREATE DATABASE  IF NOT EXISTS `aquadb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `aquadb`;
-- MySQL dump 10.13  Distrib 5.6.19, for Win64 (x86_64)
--
-- Host: localhost    Database: aquadb
-- ------------------------------------------------------
-- Server version	5.6.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `jhchang_c`
--

DROP TABLE IF EXISTS `jhchang_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jhchang_c` (
  `chlight` varchar(10) NOT NULL,
  `chheat` varchar(10) DEFAULT NULL,
  `chcool` varchar(10) DEFAULT NULL,
  `cltimes` varchar(10) DEFAULT NULL,
  `cltimee` varchar(10) DEFAULT NULL,
  `chtemp` double DEFAULT NULL,
  `cctemp` double DEFAULT NULL,
  `ck2` varchar(10) DEFAULT NULL COMMENT '히터 옵션',
  `ck1` varchar(10) DEFAULT NULL COMMENT '타이머 옵션',
  PRIMARY KEY (`chlight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhchang_c`
--

LOCK TABLES `jhchang_c` WRITE;
/*!40000 ALTER TABLE `jhchang_c` DISABLE KEYS */;
INSERT INTO `jhchang_c` VALUES ('off','off','off','00:00:00','00:00:00',22,27,'no','no');
/*!40000 ALTER TABLE `jhchang_c` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-08 22:17:31
