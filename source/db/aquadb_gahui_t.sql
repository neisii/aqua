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
-- Table structure for table `gahui_t`
--

DROP TABLE IF EXISTS `gahui_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gahui_t` (
  `temperature` double NOT NULL COMMENT '온도',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '온도 체크 시간\n',
  PRIMARY KEY (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='수조 별 온도 데이터';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gahui_t`
--

LOCK TABLES `gahui_t` WRITE;
/*!40000 ALTER TABLE `gahui_t` DISABLE KEYS */;
INSERT INTO `gahui_t` VALUES (24.75,'2014-06-01 12:30:00'),(27.875,'2014-06-01 12:40:55'),(26.25,'2014-06-01 12:50:05'),(26.5,'2014-06-01 13:00:41'),(26.562,'2014-06-01 13:30:29'),(26.875,'2014-06-01 13:40:52'),(26.875,'2014-06-01 13:41:58'),(26.875,'2014-06-01 13:42:59'),(26.875,'2014-06-01 13:44:00'),(27.25,'2014-06-01 14:10:10'),(27.312,'2014-06-01 14:20:03'),(21,'2014-06-01 14:30:03'),(27.937,'2014-06-01 14:40:36'),(28.437,'2014-06-01 14:51:03'),(28.75,'2014-06-01 15:00:15'),(28.937,'2014-06-01 15:10:06'),(28.75,'2014-06-01 15:20:01'),(28.687,'2014-06-01 15:30:02'),(28.75,'2014-06-01 15:40:08'),(28.812,'2014-06-01 15:50:00'),(28.25,'2014-06-01 16:00:03'),(28.5,'2014-06-01 16:10:01'),(28.687,'2014-06-01 16:20:06'),(28.625,'2014-06-01 16:30:00'),(28.625,'2014-06-01 16:40:06'),(28.687,'2014-06-01 16:50:01'),(28.75,'2014-06-01 17:00:01'),(28.812,'2014-06-01 17:10:00'),(28.812,'2014-06-01 17:20:02'),(28.625,'2014-06-01 17:30:04'),(28.625,'2014-06-01 17:40:02'),(28.75,'2014-06-01 17:50:01'),(28.375,'2014-06-01 18:00:13'),(28.375,'2014-06-01 18:10:03'),(28.25,'2014-06-01 18:20:00'),(28.187,'2014-06-01 18:30:07'),(28.437,'2014-06-01 18:40:02'),(28.5,'2014-06-01 18:50:02'),(28.437,'2014-06-01 19:00:09'),(28.187,'2014-06-01 19:10:00'),(24.75,'2014-06-07 11:40:00'),(25.562,'2014-06-07 12:59:26'),(25.562,'2014-06-07 13:10:00'),(25.562,'2014-06-07 13:20:01'),(25.562,'2014-06-07 13:28:40'),(25.562,'2014-06-07 13:34:30'),(25.437,'2014-06-07 14:03:39'),(25.437,'2014-06-07 14:35:38'),(25.437,'2014-06-07 15:10:46'),(25.437,'2014-06-07 15:20:49'),(25.437,'2014-06-07 15:30:51'),(25.562,'2014-06-07 15:50:56'),(25.625,'2014-06-07 16:00:58'),(25.687,'2014-06-07 16:11:01'),(25.687,'2014-06-07 16:16:02'),(25.875,'2014-06-07 16:31:05'),(25.875,'2014-06-07 16:41:08'),(25.75,'2014-06-07 17:01:14'),(25.687,'2014-06-07 17:11:16'),(25.562,'2014-06-07 17:21:24'),(25.562,'2014-06-07 17:26:25'),(25.437,'2014-06-07 17:41:35'),(25.375,'2014-06-07 18:21:50'),(25.437,'2014-06-07 18:30:15'),(25.437,'2014-06-07 18:40:19'),(25.562,'2014-06-07 18:50:21'),(25.562,'2014-06-07 19:00:23'),(25.562,'2014-06-07 19:30:31'),(25.437,'2014-06-07 19:40:34'),(25.437,'2014-06-07 19:50:36'),(25.437,'2014-06-07 20:10:42'),(25.562,'2014-06-08 08:42:56'),(25.625,'2014-06-08 08:47:57'),(25.75,'2014-06-08 08:52:58'),(23.187,'2014-06-08 09:27:20'),(23.187,'2014-06-08 09:32:22'),(23.187,'2014-06-08 09:39:23'),(23.187,'2014-06-08 09:56:42'),(23.562,'2014-06-08 10:15:07'),(23.562,'2014-06-08 10:20:08'),(23.562,'2014-06-08 10:30:10'),(23.562,'2014-06-08 10:40:13'),(23.937,'2014-06-08 11:40:28'),(24.5,'2014-06-08 11:50:30'),(25.125,'2014-06-08 12:00:32'),(25.375,'2014-06-08 12:10:35'),(25.187,'2014-06-08 12:35:40'),(25.062,'2014-06-08 12:40:41'),(24.937,'2014-06-08 12:48:13'),(24.812,'2014-06-08 12:58:15'),(24.75,'2014-06-08 13:08:16');
/*!40000 ALTER TABLE `gahui_t` ENABLE KEYS */;
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
