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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `usdate` date DEFAULT NULL COMMENT '계약 날짜-시작일',
  `uedate` date DEFAULT NULL COMMENT '계약 날짜 - 종료일',
  `usort` varchar(10) DEFAULT NULL COMMENT '고객 분류',
  `uid` varchar(45) NOT NULL COMMENT '정보 아이디(로그인 아이디)',
  `upass` varchar(45) DEFAULT NULL COMMENT '로그인 패스워드',
  `uname` varchar(45) DEFAULT NULL COMMENT '사용자 이름(고객명)',
  `uphone` varchar(45) DEFAULT NULL COMMENT '고객 전화번호',
  `uemail` varchar(200) DEFAULT NULL COMMENT '고객 이메일',
  `uaquaaddr` varchar(100) DEFAULT NULL COMMENT '수조 주소(고객 주소?)',
  `uaquaurl` varchar(100) DEFAULT NULL COMMENT '카메라URL',
  `uaquasize` text COMMENT '수조 크기',
  `uheater` varchar(45) DEFAULT NULL COMMENT '히터 종류(w)',
  `ufilter1` varchar(45) DEFAULT NULL COMMENT '필터 종류1\n예) 스펀지',
  `ufilter2` varchar(45) DEFAULT NULL COMMENT '필터 종류2\n예) 필그린 500',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('2014-01-01',NULL,NULL,'admin','1234','관리자',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2013-06-25','2014-07-23','기업','daeguuniv',NULL,'대구대학교','053-850-5000','nsadmin@daegu.ac.kr','경상북도 경산시 진량읍 대구대로 201','http://','100*450*500','100','상면','모름'),('2012-01-03','2014-04-01','개인','gahui',NULL,'백가희','010-5555-4444','gahui12@naver.com','구미','http://tix.dnsd.me:9060/','30*30*30','100','스펀지','아마존 2개'),('2013-09-10','2015-01-01','개인','hong',NULL,'홍길동','054-123-4567','hong@hotmail.com','김천','http://','200*50*50','200','상면','모르는 회사 1개'),('2013-11-12','2014-09-19','개인','jhchang',NULL,'장중혁','','','','http://','','','상면',''),('2013-07-09','2015-06-11','개인','ki0000',NULL,'김봉진','010-8888-9344','ki0000@naver.com','대구 어딘가','http://','1200*600*600','300','외부','1200 200L'),('2014-06-10','2015-02-21','개인','test',NULL,'테스트','010-4323-3349','test@alpa.com','대기권','http://','','','상면','');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-08 22:17:32
