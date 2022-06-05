-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: pia_bdm
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.22-MariaDB

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(100) NOT NULL,
  `COLOR` varchar(50) NOT NULL,
  `ORDER_CATEGORY` int(11) NOT NULL,
  `CREATION_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `LAST_UPDATE_DATE` datetime DEFAULT NULL,
  `CREATED_BY` int(11) NOT NULL,
  `LAST_UPDATE_BY` int(11) DEFAULT NULL,
  `ACTIVE` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`CATEGORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (9,'Nacional','Rojo',1,'2022-05-23 20:14:56',NULL,0,NULL,1),(10,'Tecnologia','Azul',2,'2022-05-23 20:15:25',NULL,0,NULL,1),(11,'Internacional','Amarillo',3,'2022-05-23 20:31:58',NULL,0,NULL,1),(12,'Entretenimiento','Verde',4,'2022-05-25 15:53:40',NULL,0,NULL,1),(13,'Videojuegos','Azul',8,'2022-05-31 16:23:18',NULL,0,NULL,1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `COMMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COMMENT_TEXT` varchar(500) NOT NULL,
  `CREATION_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `CREATED_BY` int(11) NOT NULL,
  `ACTIVE` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`COMMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'comentario 1','2022-05-30 18:53:48',25,1),(2,'comentario editor','2022-05-30 18:55:56',26,1);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `comments_by_news`
--

DROP TABLE IF EXISTS `comments_by_news`;
/*!50001 DROP VIEW IF EXISTS `comments_by_news`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `comments_by_news` AS SELECT 
 1 AS `COMMENT_ID`,
 1 AS `COMMENT_TEXT`,
 1 AS `CREATED_BY`,
 1 AS `NEWS_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `key_words_news`
--

DROP TABLE IF EXISTS `key_words_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `key_words_news` (
  `key_word` varchar(100) NOT NULL,
  `news_id` int(11) NOT NULL,
  PRIMARY KEY (`key_word`,`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `key_words_news`
--

LOCK TABLES `key_words_news` WRITE;
/*!40000 ALTER TABLE `key_words_news` DISABLE KEYS */;
INSERT INTO `key_words_news` VALUES ('keyword',119),('keyword',120),('keyword',121),('keyword',122),('tag1',33),('tag1',34),('tag1',35),('tag1',36),('tag1',37),('tag2',33),('tag2',34),('tagnuevanoticia',123),('tagTest',32),('terminada',40),('test1',139),('test1',140),('test1',141),('test2',139),('test2',140),('test2',141),('undefined',38),('undefined',39),('undefined',41),('undefined',42),('undefined',43),('undefined',44),('undefined',45),('undefined',46),('undefined',47),('undefined',48),('undefined',49),('undefined',50),('undefined',51),('undefined',60),('undefined',64),('undefined',65),('undefined',66),('undefined',67),('undefined',68),('undefined',70),('undefined',71),('undefined',72),('undefined',73),('undefined',80),('undefined',85),('undefined',86),('undefined',87),('undefined',91),('undefined',92),('undefined',93),('undefined',94),('undefined',95),('undefined',96),('undefined',97),('undefined',98),('undefined',99),('undefined',100),('undefined',101),('undefined',102),('undefined',103),('undefined',104),('undefined',105),('undefined',106),('undefined',107),('undefined',108),('undefined',109),('undefined',110),('undefined',111),('undefined',112),('undefined',113),('undefined',114),('undefined',115),('undefined',116),('undefined',117),('undefined',118),('undefined',124),('undefined',125),('undefined',126),('undefined',127),('undefined',128),('undefined',129),('undefined',130),('undefined',131),('undefined',132),('undefined',133),('undefined',134),('undefined',135),('undefined',136),('undefined',137),('undefined',138),('undefined',142);
/*!40000 ALTER TABLE `key_words_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `NEWS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CITY` varchar(100) DEFAULT NULL,
  `STATE` varchar(100) DEFAULT NULL,
  `COUNTRY` varchar(100) DEFAULT NULL,
  `SIGNATURE` varchar(100) DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `LEAD_TEXT` varchar(300) DEFAULT NULL,
  `NEWS_TEXT` varchar(500) DEFAULT NULL,
  `PUBLISHED_DATE` date DEFAULT current_timestamp(),
  `DATE_OF_EVENTS` datetime DEFAULT NULL,
  `LIKES` int(11) NOT NULL DEFAULT 0,
  `CREATION_DATE` datetime DEFAULT current_timestamp(),
  `CREATED_BY` int(11) DEFAULT 117,
  `LAST_UPDATE_BY` int(11) DEFAULT NULL,
  `ACTIVE` tinyint(4) NOT NULL DEFAULT 1,
  `STATUS` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`NEWS_ID`),
  KEY `FK_STATUS_NEWS_idx` (`STATUS`),
  CONSTRAINT `FK_STATUS_NEWS` FOREIGN KEY (`STATUS`) REFERENCES `news_status` (`STATUS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Monterrey','Nuevo Leon','MExico','Mi firma','Titulo','Descripcion','Texto',NULL,'2022-05-26 01:15:58',0,'2022-05-26 01:22:23',25,NULL,1,1),(2,'Monterrey','Nuevo Leon','MExico','Mi firma','Titulo','Descripcion','Texto',NULL,'2022-05-26 01:15:58',0,'2022-05-26 01:40:43',25,NULL,1,1),(3,'Monterrey','Nuevo Leon','MExico','Mi firma','Titulo','Descripcion','Texto',NULL,'2022-05-26 01:15:58',0,'2022-05-26 01:41:00',25,NULL,1,1),(4,'','','','','','','',NULL,'2022-05-26 02:01:21',0,'2022-05-26 02:02:15',0,NULL,1,1),(5,'','','','','','','',NULL,'2022-05-26 02:01:21',0,'2022-05-26 02:03:48',0,NULL,1,1),(6,'','','','','','','',NULL,'2022-05-26 02:01:21',0,'2022-05-26 02:04:04',0,NULL,1,1),(7,'fd','dfd','dfd','dfdf','dfdf','dfdf','dfd',NULL,'2022-05-26 02:06:02',0,'2022-05-26 02:06:19',0,NULL,1,1),(8,'fd','dfd','dfd','dfdf','dfdf','dfdf','dfd',NULL,'2022-05-26 02:06:02',0,'2022-05-26 02:07:46',0,NULL,1,1),(9,'','','','','','','',NULL,'2022-05-26 02:08:20',0,'2022-05-26 02:11:41',0,NULL,1,1),(10,'','','','','','','',NULL,'2022-05-26 02:08:20',0,'2022-05-26 02:12:36',0,NULL,1,1),(11,'','','','','','','',NULL,'2022-05-26 02:14:06',0,'2022-05-26 02:14:16',0,NULL,1,1),(12,'','','','','','','',NULL,'2022-05-26 02:14:06',0,'2022-05-26 02:14:29',0,NULL,1,1),(13,'','','','','','','',NULL,'2022-05-26 02:14:06',0,'2022-05-26 02:15:04',0,NULL,1,1),(14,'','','','','','','',NULL,'2022-05-26 02:14:06',0,'2022-05-26 02:17:08',0,NULL,1,1),(15,'','','','','','','',NULL,'2022-05-26 02:14:06',0,'2022-05-26 02:17:48',0,NULL,1,1),(16,'','','','','','','',NULL,'2022-05-26 02:14:06',0,'2022-05-26 02:22:05',0,NULL,1,1),(17,'','','','','','','',NULL,'2022-05-26 02:14:06',0,'2022-05-26 02:29:09',0,NULL,1,1),(18,'','','','','','','',NULL,'2022-05-26 02:14:06',0,'2022-05-26 02:31:23',0,NULL,1,1),(19,'','','','','','','',NULL,'2022-05-26 02:50:49',0,'2022-05-26 02:50:56',0,NULL,1,1),(20,'','','','','','','',NULL,'2022-05-26 02:50:49',0,'2022-05-26 02:52:27',0,NULL,1,1),(21,'','','','','','','',NULL,'2022-05-26 02:50:49',0,'2022-05-26 02:52:59',0,NULL,1,1),(22,'','','','','','','',NULL,'2022-05-26 02:50:49',0,'2022-05-26 02:59:11',0,NULL,1,1),(23,'','','','','','','',NULL,'2022-05-26 02:50:49',0,'2022-05-26 03:31:28',0,NULL,1,1),(24,'','','','','','','',NULL,'2022-05-26 02:50:49',0,'2022-05-26 03:35:37',0,NULL,1,1),(25,'','','','','','','',NULL,'2022-05-26 02:50:49',0,'2022-05-26 03:36:03',0,NULL,1,1),(26,'','','','','','','',NULL,'2022-05-26 02:50:49',0,'2022-05-26 03:37:48',0,NULL,1,1),(27,'','','','','','','',NULL,'2022-05-26 02:50:49',0,'2022-05-26 03:38:09',0,NULL,1,1),(28,'','','','','','','',NULL,'2022-05-26 02:50:49',0,'2022-05-26 03:38:41',0,NULL,1,1),(29,'','','','','','','',NULL,'2022-05-26 02:50:49',0,'2022-05-26 03:41:08',0,NULL,1,1),(30,'','','','','','','',NULL,'2022-05-26 02:50:49',0,'2022-05-26 03:41:21',0,NULL,1,1),(31,'','','','','','','',NULL,'2022-05-26 02:50:49',0,'2022-05-26 03:46:38',0,NULL,1,1),(32,'','','','','','','',NULL,'2022-05-26 02:50:49',0,'2022-05-26 03:48:14',0,NULL,1,1),(33,'','','','','','','',NULL,'2022-05-26 02:50:49',0,'2022-05-26 03:51:44',0,NULL,1,1),(34,'','','','','','','',NULL,'2022-05-26 02:50:49',0,'2022-05-26 03:53:01',0,NULL,1,1),(35,'','','','','','','',NULL,'2022-05-26 02:50:49',0,'2022-05-26 03:54:02',0,NULL,1,1),(36,'','','','','','','',NULL,'2022-05-26 02:50:49',0,'2022-05-26 04:04:54',0,NULL,1,1),(37,'','','','','','','',NULL,'2022-05-26 02:50:49',0,'2022-05-26 04:05:43',0,NULL,1,1),(38,'','','','','','','',NULL,'2022-05-26 04:12:32',0,'2022-05-26 04:12:36',0,NULL,1,1),(39,'','','','','','','',NULL,'2022-05-26 04:13:26',0,'2022-05-26 04:13:27',0,NULL,1,1),(40,'asa','asas','asa','sdsdsd','asas','asas','asas',NULL,'2022-05-26 04:13:56',0,'2022-05-26 04:14:22',0,NULL,1,2),(41,'','','','','','','',NULL,'2022-05-26 04:39:58',0,'2022-05-26 04:40:02',25,NULL,1,1),(42,'','','','','','','',NULL,'2022-05-26 04:39:58',0,'2022-05-26 04:40:11',25,NULL,1,1),(43,'','','','','','','',NULL,'2022-05-26 04:39:58',0,'2022-05-26 04:40:48',25,NULL,1,1),(44,'','','','','','','',NULL,'2022-05-26 04:41:14',0,'2022-05-26 04:41:32',0,NULL,1,1),(45,'','','','','','','',NULL,'2022-05-26 04:41:14',0,'2022-05-26 04:42:31',0,NULL,1,1),(46,'','','','','','','',NULL,'2022-05-26 04:41:14',0,'2022-05-26 04:44:20',0,NULL,1,1),(47,'','','','','','','',NULL,'2022-05-26 04:41:14',0,'2022-05-26 04:44:39',0,NULL,1,1),(48,'','','','','','','',NULL,'2022-05-26 04:41:14',0,'2022-05-26 04:46:16',0,NULL,1,1),(49,'','','','','','','',NULL,'2022-05-26 04:41:14',0,'2022-05-26 04:47:16',0,NULL,1,1),(50,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 04:49:25',0,NULL,1,1),(51,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 04:49:42',0,NULL,1,1),(52,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 04:53:42',0,NULL,1,1),(53,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 04:54:27',0,NULL,1,1),(54,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 04:55:32',0,NULL,1,1),(55,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 04:57:30',0,NULL,1,1),(56,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 04:58:24',0,NULL,1,1),(57,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:00:57',0,NULL,1,1),(58,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:01:56',0,NULL,1,1),(59,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:02:50',0,NULL,1,1),(60,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:04:07',0,NULL,1,1),(61,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:04:31',0,NULL,1,1),(62,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:06:54',0,NULL,1,1),(63,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:09:37',0,NULL,1,1),(64,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:10:52',0,NULL,1,1),(65,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:11:53',0,NULL,1,1),(66,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:12:51',0,NULL,1,1),(67,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:13:23',0,NULL,1,1),(68,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:13:35',0,NULL,1,1),(69,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:13:44',0,NULL,1,1),(70,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:14:07',0,NULL,1,1),(71,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:14:22',0,NULL,1,1),(72,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:15:06',0,NULL,1,1),(73,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:15:16',0,NULL,1,1),(74,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:19:17',0,NULL,1,1),(75,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:20:27',0,NULL,1,1),(76,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:22:28',0,NULL,1,1),(77,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:24:15',0,NULL,1,1),(78,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:25:51',0,NULL,1,1),(79,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:29:31',0,NULL,1,1),(80,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:31:15',0,NULL,1,1),(81,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:31:51',0,NULL,1,1),(82,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:32:06',0,NULL,1,1),(83,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:32:22',0,NULL,1,1),(84,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:32:26',0,NULL,1,1),(85,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:32:44',0,NULL,1,1),(86,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:38:54',0,NULL,1,1),(87,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:39:12',0,NULL,1,1),(88,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:39:59',0,NULL,1,1),(89,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:41:42',0,NULL,1,1),(90,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:43:22',0,NULL,1,1),(91,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:56:15',0,NULL,1,1),(92,'','','','','','','',NULL,'2022-05-26 04:48:49',0,'2022-05-26 05:56:47',0,NULL,1,1),(93,'','','','','','','',NULL,'2022-05-26 06:04:02',0,'2022-05-26 06:04:12',0,NULL,1,1),(94,'','','','','','','',NULL,'2022-05-26 06:04:02',0,'2022-05-26 06:04:31',0,NULL,1,1),(95,'','','','','','','',NULL,'2022-05-26 06:05:24',0,'2022-05-26 06:05:27',0,NULL,1,1),(96,'','','','','','','',NULL,'2022-05-26 06:05:24',0,'2022-05-26 06:05:42',0,NULL,1,1),(97,'','','','','','','',NULL,'2022-05-26 06:05:24',0,'2022-05-26 06:05:48',0,NULL,1,1),(98,'','','','','','','',NULL,'2022-05-26 06:10:25',0,'2022-05-26 06:10:28',0,NULL,1,1),(99,'','','','','','','',NULL,'2022-05-26 06:10:25',0,'2022-05-26 06:10:38',0,NULL,1,1),(100,'','','','','','','',NULL,'2022-05-26 06:10:25',0,'2022-05-26 06:10:46',0,NULL,1,1),(101,'','','','','','','',NULL,'2022-05-26 06:11:08',0,'2022-05-26 06:11:27',0,NULL,1,1),(102,'','','','','','','',NULL,'2022-05-26 06:13:25',0,'2022-05-26 06:15:08',0,NULL,1,1),(103,'','','','','','','',NULL,'2022-05-26 06:17:20',0,'2022-05-26 06:17:24',0,NULL,1,1),(104,'','','','','','','',NULL,'2022-05-26 06:17:20',0,'2022-05-26 06:17:36',0,NULL,1,1),(105,'','','','','','','',NULL,'2022-05-26 06:17:20',0,'2022-05-26 06:17:42',0,NULL,1,1),(106,'','','','','','','',NULL,'2022-05-26 06:17:20',0,'2022-05-26 06:17:50',0,NULL,1,1),(107,'','','','','','','',NULL,'2022-05-26 06:20:00',0,'2022-05-26 06:20:08',0,NULL,1,1),(108,'','','','','','','',NULL,'2022-05-26 06:20:00',0,'2022-05-26 06:20:16',0,NULL,1,1),(109,'','','','','','','',NULL,'2022-05-26 06:21:44',0,'2022-05-26 06:22:10',0,NULL,1,1),(110,'','','','','','','',NULL,'2022-05-26 06:21:44',0,'2022-05-26 06:23:28',0,NULL,1,1),(111,'','','','','','','',NULL,'2022-05-26 06:21:44',0,'2022-05-26 06:23:50',0,NULL,1,1),(112,'','','','','','','',NULL,'2022-05-26 06:29:24',0,'2022-05-26 06:29:30',0,NULL,1,1),(113,'','','','','','','',NULL,'2022-05-26 06:30:31',0,'2022-05-26 06:30:38',0,NULL,1,1),(114,'','','','','','','',NULL,'2022-05-26 06:30:44',0,'2022-05-26 06:30:57',0,NULL,1,1),(115,'','','','','','','',NULL,'2022-05-26 06:32:43',0,'2022-05-26 06:32:51',0,NULL,1,3),(116,'','','','','','','',NULL,'2022-05-26 06:33:33',0,'2022-05-26 06:33:43',0,NULL,1,3),(117,'','','','','','','',NULL,'2022-05-26 06:33:33',0,'2022-05-26 06:36:06',0,NULL,1,3),(118,'','','','','','','',NULL,'2022-05-26 07:10:39',0,'2022-05-26 07:10:53',0,NULL,1,3),(119,'Mty','NL','MExico','Firma','Titulo','Descripcion','Texto','2022-05-26','2022-05-26 09:14:37',0,'2022-05-26 09:16:28',25,NULL,1,2),(120,'Mty','NL','MExico','Firma','Titulo','Descripcion','Texto','2022-05-26','2022-05-26 09:14:37',0,'2022-05-26 09:17:40',25,NULL,1,3),(121,'Mty','NL','MExico','Firma','Titulo','Descripcion','Texto','2022-05-26','2022-05-26 09:14:37',0,'2022-05-26 09:17:49',25,NULL,1,3),(122,'Mty','NL','MExico','Firma','Titulo','Descripcion','Texto','2022-05-26','2022-05-26 09:14:37',0,'2022-05-26 09:17:59',25,NULL,1,3),(123,'Mty','NL','Mexico','Chuck','nueva noticia','nueva descripcion','nuevo texto','2022-05-30','2022-05-30 21:34:48',0,'2022-05-30 21:35:54',27,NULL,1,3),(124,'','','','','','','','2022-05-31','2022-05-31 13:25:31',0,'2022-05-31 13:25:33',27,NULL,1,1),(125,'','','','','','','','2022-05-31','2022-05-31 13:25:31',0,'2022-05-31 13:39:28',27,NULL,1,1),(126,'','','','','','','','2022-05-31','2022-05-31 13:25:31',0,'2022-05-31 13:40:59',27,NULL,1,1),(127,'','','','','','','','2022-05-31','2022-05-31 14:09:46',0,'2022-05-31 14:10:08',0,NULL,1,1),(128,'','','','','','','','2022-05-31','2022-05-31 14:09:46',0,'2022-05-31 14:10:55',0,NULL,1,1),(129,'','','','','','','','2022-05-31','2022-05-31 14:09:46',0,'2022-05-31 14:11:42',0,NULL,1,1),(130,'','','','','','','','2022-05-31','2022-05-31 14:09:46',0,'2022-05-31 14:12:06',0,NULL,1,1),(131,'','','','','','','','2022-05-31','2022-05-31 14:09:46',0,'2022-05-31 14:12:43',0,NULL,1,1),(132,'','','','','','','','2022-05-31','2022-05-31 14:13:00',0,'2022-05-31 14:13:09',0,NULL,1,1),(133,'','','','','','','','2022-05-31','2022-05-31 14:13:00',0,'2022-05-31 14:13:38',0,NULL,1,1),(134,'','','','','','','','2022-05-31','2022-05-31 14:14:07',0,'2022-05-31 14:14:08',0,NULL,1,1),(135,'','','','','','','','2022-05-31','2022-05-31 14:14:07',0,'2022-05-31 14:15:09',0,NULL,1,1),(136,'','','','','','','','2022-05-31','2022-05-31 14:14:07',0,'2022-05-31 14:15:14',0,NULL,1,1),(137,'','','','','','','','2022-05-31','2022-05-31 14:14:07',0,'2022-05-31 14:15:58',0,NULL,1,1),(138,'','','','','','','','2022-05-31','2022-05-31 14:14:07',0,'2022-05-31 14:16:22',0,NULL,1,1),(139,'','','','','','','','2022-05-31','2022-05-31 14:14:07',0,'2022-05-31 14:18:07',0,NULL,1,1),(140,'','','','','','','','2022-05-31','2022-05-31 14:14:07',0,'2022-05-31 14:18:59',0,NULL,1,1),(141,'','','','','','','','2022-05-31','2022-05-31 14:14:07',0,'2022-05-31 14:20:13',0,NULL,1,1),(142,'','','','','','','','2022-05-31','2022-05-31 14:20:17',0,'2022-05-31 14:20:19',0,NULL,1,1),(143,'','','','','','','','2022-05-31','2022-05-31 14:21:04',0,'2022-05-31 14:21:06',0,NULL,1,1),(144,'','','','','','','','2022-05-31','2022-05-31 14:21:04',0,'2022-05-31 14:21:53',0,NULL,1,1),(145,'','','','','','','','2022-05-31','2022-05-31 14:21:04',0,'2022-05-31 14:22:31',0,NULL,1,1),(146,'','','','','','','','2022-05-31','2022-05-31 16:40:04',0,'2022-05-31 16:41:25',0,NULL,1,1);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_categories`
--

DROP TABLE IF EXISTS `news_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_categories` (
  `NEWS_ID` int(11) NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  `CREATION_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `CREATED_BY` int(11) DEFAULT NULL,
  `ACTIVE` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`NEWS_ID`,`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_categories`
--

LOCK TABLES `news_categories` WRITE;
/*!40000 ALTER TABLE `news_categories` DISABLE KEYS */;
INSERT INTO `news_categories` VALUES (24,9,'2022-05-25 18:57:38',NULL,1),(36,9,'2022-05-26 04:04:54',NULL,1),(37,9,'2022-05-26 04:05:43',NULL,1),(37,11,'2022-05-26 04:05:43',NULL,1),(37,12,'2022-05-26 04:05:43',NULL,1),(40,9,'2022-05-26 04:14:22',NULL,1),(45,9,'2022-05-26 04:42:31',NULL,1),(47,9,'2022-05-26 04:44:39',NULL,1),(48,9,'2022-05-26 04:46:17',NULL,1),(49,9,'2022-05-26 04:47:16',NULL,1),(51,9,'2022-05-26 04:49:42',NULL,1),(60,9,'2022-05-26 05:04:07',NULL,1),(64,9,'2022-05-26 05:10:52',NULL,1),(65,9,'2022-05-26 05:11:53',NULL,1),(66,9,'2022-05-26 05:12:51',NULL,1),(67,9,'2022-05-26 05:13:24',NULL,1),(68,9,'2022-05-26 05:13:35',NULL,1),(70,9,'2022-05-26 05:14:07',NULL,1),(71,9,'2022-05-26 05:14:22',NULL,1),(72,9,'2022-05-26 05:15:06',NULL,1),(73,9,'2022-05-26 05:15:16',NULL,1),(80,9,'2022-05-26 05:31:15',NULL,1),(85,9,'2022-05-26 05:32:44',NULL,1),(86,9,'2022-05-26 05:38:54',NULL,1),(87,9,'2022-05-26 05:39:13',NULL,1),(91,9,'2022-05-26 05:56:16',NULL,1),(92,9,'2022-05-26 05:56:50',NULL,1),(94,9,'2022-05-26 06:04:34',NULL,1),(97,9,'2022-05-26 06:05:49',NULL,1),(100,9,'2022-05-26 06:10:49',NULL,1),(101,9,'2022-05-26 06:11:29',NULL,1),(102,9,'2022-05-26 06:15:10',NULL,1),(105,9,'2022-05-26 06:17:44',NULL,1),(106,9,'2022-05-26 06:17:52',NULL,1),(108,9,'2022-05-26 06:20:18',NULL,1),(109,9,'2022-05-26 06:22:13',NULL,1),(110,9,'2022-05-26 06:23:31',NULL,1),(111,9,'2022-05-26 06:23:53',NULL,1),(114,9,'2022-05-26 06:31:00',NULL,1),(115,9,'2022-05-26 06:32:53',NULL,1),(116,9,'2022-05-26 06:33:46',NULL,1),(117,9,'2022-05-26 06:36:09',NULL,1),(118,9,'2022-05-26 07:10:56',NULL,1),(119,9,'2022-05-26 09:16:28',NULL,1),(120,9,'2022-05-26 09:17:41',NULL,1),(121,9,'2022-05-26 09:17:50',NULL,1),(122,9,'2022-05-26 09:18:00',NULL,1),(123,10,'2022-05-30 21:35:57',NULL,1),(125,9,'2022-05-31 13:39:28',NULL,1),(136,9,'2022-05-31 14:15:14',NULL,1),(139,9,'2022-05-31 14:18:07',NULL,1),(139,10,'2022-05-31 14:18:07',NULL,1),(144,9,'2022-05-31 14:21:53',NULL,1),(144,11,'2022-05-31 14:21:54',NULL,1);
/*!40000 ALTER TABLE `news_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_comments`
--

DROP TABLE IF EXISTS `news_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_comments` (
  `COMMENT_ID` int(11) NOT NULL,
  `NEWS_ID` int(11) NOT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `CREATION_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `ACTIVE` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`COMMENT_ID`,`NEWS_ID`),
  KEY `NEWS_ID_idx` (`NEWS_ID`),
  CONSTRAINT `COMMENT_ID` FOREIGN KEY (`COMMENT_ID`) REFERENCES `comments` (`COMMENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `NEWS_ID` FOREIGN KEY (`NEWS_ID`) REFERENCES `news` (`NEWS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_comments`
--

LOCK TABLES `news_comments` WRITE;
/*!40000 ALTER TABLE `news_comments` DISABLE KEYS */;
INSERT INTO `news_comments` VALUES (1,121,NULL,'2022-05-30 18:53:48',1),(2,119,NULL,'2022-05-30 18:55:56',1);
/*!40000 ALTER TABLE `news_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_status`
--

DROP TABLE IF EXISTS `news_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_status` (
  `STATUS` varchar(50) NOT NULL,
  `CREATION_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `CREATED_BY` int(11) NOT NULL DEFAULT 117,
  `ACTIVE` tinyint(4) NOT NULL DEFAULT 1,
  `STATUS_ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`STATUS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_status`
--

LOCK TABLES `news_status` WRITE;
/*!40000 ALTER TABLE `news_status` DISABLE KEYS */;
INSERT INTO `news_status` VALUES ('EN REDACCION','2022-05-24 22:52:13',117,1,1),('TERMINADA','2022-05-24 22:52:32',117,1,2),('PUBLICADA','2022-05-24 22:52:40',117,1,3);
/*!40000 ALTER TABLE `news_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `noticias_en_redaccion`
--

DROP TABLE IF EXISTS `noticias_en_redaccion`;
/*!50001 DROP VIEW IF EXISTS `noticias_en_redaccion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `noticias_en_redaccion` AS SELECT 
 1 AS `NEWS_ID`,
 1 AS `TITLE`,
 1 AS `LEAD_TEXT`,
 1 AS `CITY`,
 1 AS `STATE`,
 1 AS `COUNTRY`,
 1 AS `SIGNATURE`,
 1 AS `NEWS_TEXT`,
 1 AS `DATE_OF_EVENTS`,
 1 AS `LIKES`,
 1 AS `CREATED_BY`,
 1 AS `PUBLISHED_DATE`,
 1 AS `MULTIMEDIA_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `noticias_publicadas`
--

DROP TABLE IF EXISTS `noticias_publicadas`;
/*!50001 DROP VIEW IF EXISTS `noticias_publicadas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `noticias_publicadas` AS SELECT 
 1 AS `NEWS_ID`,
 1 AS `TITLE`,
 1 AS `LEAD_TEXT`,
 1 AS `CITY`,
 1 AS `STATE`,
 1 AS `COUNTRY`,
 1 AS `SIGNATURE`,
 1 AS `NEWS_TEXT`,
 1 AS `DATE_OF_EVENTS`,
 1 AS `LIKES`,
 1 AS `CREATED_BY`,
 1 AS `PUBLISHED_DATE`,
 1 AS `MULTIMEDIA_ID`,
 1 AS `REPORTER_NAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `noticias_publicadas_completas`
--

DROP TABLE IF EXISTS `noticias_publicadas_completas`;
/*!50001 DROP VIEW IF EXISTS `noticias_publicadas_completas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `noticias_publicadas_completas` AS SELECT 
 1 AS `NEWS_ID`,
 1 AS `TITLE`,
 1 AS `LEAD_TEXT`,
 1 AS `CITY`,
 1 AS `STATE`,
 1 AS `COUNTRY`,
 1 AS `SIGNATURE`,
 1 AS `NEWS_TEXT`,
 1 AS `DATE_OF_EVENTS`,
 1 AS `LIKES`,
 1 AS `CREATED_BY`,
 1 AS `PUBLISHED_DATE`,
 1 AS `MULTIMEDIA_ID`,
 1 AS `REPORTER_NAME`,
 1 AS `MEDIA`,
 1 AS `IS_VIDEO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `noticias_terminadas`
--

DROP TABLE IF EXISTS `noticias_terminadas`;
/*!50001 DROP VIEW IF EXISTS `noticias_terminadas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `noticias_terminadas` AS SELECT 
 1 AS `NEWS_ID`,
 1 AS `TITLE`,
 1 AS `LEAD_TEXT`,
 1 AS `CITY`,
 1 AS `STATE`,
 1 AS `COUNTRY`,
 1 AS `SIGNATURE`,
 1 AS `NEWS_TEXT`,
 1 AS `DATE_OF_EVENTS`,
 1 AS `LIKES`,
 1 AS `CREATED_BY`,
 1 AS `PUBLISHED_DATE`,
 1 AS `MULTIMEDIA_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_types` (
  `USER_TYPES_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(100) NOT NULL,
  `CREATION_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `ACTIVE` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`USER_TYPES_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_types`
--

LOCK TABLES `user_types` WRITE;
/*!40000 ALTER TABLE `user_types` DISABLE KEYS */;
INSERT INTO `user_types` VALUES (1,'Editor','2022-03-29 04:48:55',1),(2,'Reportero','2022-03-29 04:49:28',1),(3,'Usuario','2022-03-29 04:49:36',1);
/*!40000 ALTER TABLE `user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `USERS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `PASSWORD` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `NAME` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `LAST_NAME` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `PICTURE` mediumblob DEFAULT NULL,
  `USER_TYPES_ID` int(11) NOT NULL DEFAULT 3,
  `PHONE` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CREATION_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `LAST_UPDATE_DATE` datetime DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `LAST_UPDATE_BY` int(11) DEFAULT NULL,
  `ACTIVE` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`USERS_ID`),
  UNIQUE KEY `EMAIL_UNIQUE` (`EMAIL`),
  KEY `USER_TYPE_ID_idx` (`USER_TYPES_ID`),
  CONSTRAINT `USER_TYPE_ID` FOREIGN KEY (`USER_TYPES_ID`) REFERENCES `user_types` (`USER_TYPES_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (19,'123@gmail.com','1233$$%##TRT445s','jose carlos ','torres',NULL,3,NULL,'2022-05-02 21:23:11',NULL,0,NULL,1),(20,'343444@gmail.com','232323$$$RRTT55','343','3434',NULL,3,NULL,'2022-05-02 21:29:58',NULL,0,NULL,1),(21,'12ww3@gmail.com','wewewe###E3334r','wewe','wqwew',NULL,3,NULL,'2022-05-02 23:06:10',NULL,0,NULL,1),(22,'1232323@gmail.com','EREURUE#$&*#&$RER22','2323','2323',NULL,3,NULL,'2022-05-02 23:06:47',NULL,0,NULL,1),(23,'343434@gmail.com','343434434##$R@@Eee','3434','3434',NULL,3,NULL,'2022-05-06 07:00:04',NULL,0,NULL,1),(24,'454545@gmail.com','4545323233$$$$%4445tT','454545','4545',NULL,3,NULL,'2022-05-06 08:27:43',NULL,0,NULL,1),(25,'alextest@gmail.com','#Test123','alex','quintero',NULL,3,NULL,'2022-05-26 01:15:31',NULL,NULL,NULL,1),(26,'editor@gmail.com','#Test123','Editor','Apellido',NULL,1,NULL,'2022-05-26 11:06:39',NULL,NULL,NULL,1),(27,'reportero@gmail.com','#Test123','Don','Julio',NULL,2,NULL,'2022-05-26 11:08:56',NULL,NULL,NULL,1),(28,'new@gmail.com','#Test123','123','1233',NULL,2,NULL,'2022-05-26 11:33:14',NULL,NULL,NULL,1),(29,'jctorresc@gmail.com','#Password123','Jose Carlos','Torres Coronado',NULL,3,NULL,'2022-05-26 13:38:36',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pia_bdm'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_categories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categories`(
IN pOpc varchar(100),
IN pCategoryId INT,
IN pDescription varchar(100),
IN pColor varchar(100),
IN pOrder varchar(100),
IN pCreationDate datetime,
IN pLastUpdateDate datetime,
IN pCreatedBy INT,
IN pLastUpdateBy INT,
IN pActive tinyint,
IN pNewsId INT
)
BEGIN


IF pOpc = 'Insert'
THEN 
INSERT INTO categories
( DESCRIPTION, COLOR, ORDER_CATEGORY)
VALUES
(pDescription, pColor, pOrder);


END IF;

IF pOpc = 'InsertIntoNewsCategories'
THEN 
INSERT INTO news_categories
( NEWS_ID, CATEGORY_ID)
VALUES
((SELECT NEWS_ID FROM news ORDER BY NEWS_ID DESC LIMIT 1), (SELECT CATEGORY_ID FROM categories WHERE DESCRIPTION = pDescription));


END IF;

IF pOpc = 'UpdateNewsCategories'
THEN 
INSERT INTO news_categories
( NEWS_ID, CATEGORY_ID)
VALUES
(pNewsId, (SELECT CATEGORY_ID FROM categories WHERE DESCRIPTION = pDescription));


END IF;

IF pOpc = 'SelectCategories'
THEN 
SELECT DESCRIPTION FROM categories WHERE ACTIVE=1;


END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_comments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_comments`(
IN pOpc varchar(100),
IN pCommentId INT,
IN pCommentText varchar(100),
IN pCreatedBy INT,
IN pCreationDate datetime,
IN pNewsId INT,
IN pParentId INT
)
BEGIN

IF pOpc = 'Insert'
THEN 
INSERT INTO comments
(COMMENT_TEXT, CREATED_BY)
VALUES
(pCommentText, pCreatedBy);

INSERT INTO news_comments
(COMMENT_ID, NEWS_ID, PARENT_ID)
VALUES
((SELECT COMMENT_ID FROM comments ORDER BY COMMENT_ID DESC LIMIT 1), pNewsId, pParentId);



END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_multimedia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_multimedia`(
IN pOpc varchar(100),
IN pMultimediaId INT,
IN pMedia MEDIUMBLOB,
IN pIsVideo TINYINT,
IN pNewsId INT
)
BEGIN

IF pOpc = 'Insert'
THEN 
INSERT INTO multimedia(MEDIA,IS_VIDEO)
VALUES
(pMedia, pIsVideo);

INSERT INTO news_multimedia(NEWS_ID, MULTIMEDIA_ID)
VALUES
((SELECT NEWS_ID FROM news ORDER BY NEWS_ID DESC LIMIT 1), (SELECT MULTIMEDIA_ID FROM multimedia ORDER BY MULTIMEDIA_ID DESC LIMIT 1));

END IF;

IF pOpc = 'UpdateNewsMultimedia'
THEN 
INSERT INTO multimedia(MEDIA,IS_VIDEO)
VALUES
(pMedia, pIsVideo);

INSERT INTO news_multimedia(NEWS_ID, MULTIMEDIA_ID)
VALUES
(pNewsId, (SELECT MULTIMEDIA_ID FROM multimedia ORDER BY MULTIMEDIA_ID DESC LIMIT 1));

END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_news` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_news`(
IN pOpc varchar(100),
IN pNewsId INT,
IN pCity varchar(100),
IN pState varchar(100),
IN pCountry varchar(100),
IN pSignature varchar(100),
IN pTitle varchar(100),
IN pLead varchar(100),
IN pText varchar(100),
IN pPublishedDate date,
IN pDateOfEvents datetime,
IN pLikes INT,
IN pStatus INT,
IN pLastUpdateDate datetime,
IN pCreatedBy INT,
IN pLastUpdateBy INT,
IN pActive tinyint
)
BEGIN

IF pOpc = 'Insert'
THEN 
INSERT INTO news
(CITY, STATE, COUNTRY, SIGNATURE, TITLE, LEAD_TEXT, NEWS_TEXT, DATE_OF_EVENTS, CREATED_BY, STATUS)
VALUES
(pCity, pState, pCountry ,pSignature, pTitle, pLead, pText, pDateOfEvents, pCreatedBy, pStatus);


END IF;

IF pOpc = 'SelectNewsRecent'
THEN 

SELECT NEWS_ID,TITLE,LEAD_TEXT,CITY,STATE,COUNTRY,SIGNATURE,NEWS_TEXT,DATE_OF_EVENTS, LIKES, CREATED_BY, PUBLISHED_DATE, MEDIA,IS_VIDEO,REPORTER_NAME
FROM NOTICIAS_PUBLICADAS_COMPLETAS GROUP BY NEWS_ID ORDER BY PUBLISHED_DATE  DESC LIMIT 3;


END IF;

IF pOpc = 'SelectNewsRecentVideos'
THEN 

SELECT NEWS_ID, MEDIA,IS_VIDEO
FROM NOTICIAS_PUBLICADAS_COMPLETAS WHERE IS_VIDEO = 1 GROUP BY NEWS_ID ORDER BY PUBLISHED_DATE  DESC LIMIT 3;


END IF;

IF pOpc = 'SelectNewsTerminadas'
THEN 

SELECT NEWS_ID,TITLE,LEAD_TEXT,CITY,STATE,COUNTRY,SIGNATURE,NEWS_TEXT,DATE_OF_EVENTS, LIKES, CREATED_BY, PUBLISHED_DATE, MEDIA,IS_VIDEO
FROM NOTICIAS_COMPLETAS GROUP BY NEWS_ID ORDER BY PUBLISHED_DATE  DESC LIMIT 3;


END IF;

IF pOpc = 'SelectNewsById'
THEN 

SELECT NEWS_ID,TITLE,LEAD_TEXT,CITY,STATE,COUNTRY,SIGNATURE,NEWS_TEXT,DATE_OF_EVENTS, LIKES, CREATED_BY, PUBLISHED_DATE, MEDIA,IS_VIDEO,REPORTER_NAME
FROM NOTICIAS_PUBLICADAS_COMPLETAS WHERE NEWS_ID = pNewsId;


END IF;

IF pOpc = 'UpdateNews'
THEN 

DELETE FROM news_categories where NEWS_ID = pNewsId;
DELETE FROM key_words_news where NEWS_ID = pNewsId;
DELETE FROM news_multimedia where NEWS_ID = pNewsId;

UPDATE news 
SET TITLE = pTitle, LEAD_TEXT =  pLeadText, CITY = pCity, STATE = pState, COUNTRY = pCountry, SIGNATURE = pSignature, 
NEWS_TEXT = pNewsText , DATE_OF_EVENTS = pDateOfEvents, STATUS = pStatus
WHERE NEWS_ID =  pNewsId;


END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tags`(
IN pOpc varchar(100),
IN pKeyWord varchar(100),
IN pNewsId INT
)
BEGIN

IF pOpc = 'Insert'
THEN 
INSERT INTO key_words_news
(key_word, news_id)
VALUES
(pKeyWord, (SELECT NEWS_ID FROM news ORDER BY NEWS_ID DESC LIMIT 1));


END IF;


IF pOpc = 'UpdateNewsTags'
THEN 
INSERT INTO key_words_news
(key_word, news_id)
VALUES
(pKeyWord, pNewsId);


END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_users`(
IN pOpc varchar(100),
IN pUsersId INT,
IN pEmail varchar(100),
IN pPassword varchar(100),
IN pName varchar(100),
IN pLastName varchar(100),
IN pPicture mediumblob,
IN pUserTypesId INT,
IN pPhone varchar(100),
IN pLastUpdateDate datetime,
IN pCreatedBy INT,
IN pLastUpdateBy INT,
IN pActive tinyint
)
BEGIN

IF pOpc = 'Insert'
THEN 
INSERT INTO users
(EMAIL, PASSWORD, NAME, LAST_NAME, USER_TYPES_ID)
VALUES
(pEmail, pPassword, pName ,pLastName, pUserTypesId);


END IF;


IF pOpc = 'Login'
THEN 
SELECT users.EMAIL, users.NAME, users.LAST_NAME, user_types.DESCRIPTION, users.USERS_ID, users.PICTURE FROM users INNER JOIN user_types ON
user_types.USER_TYPES_ID = users.USER_TYPES_ID AND users.EMAIL = pEmail AND users.PASSWORD = pPassword AND users.ACTIVE = 1;

END IF;

IF pOpc = 'CheckUsers'
THEN 
SELECT * FROM users WHERE EMAIL = pEmail;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `comments_by_news`
--

/*!50001 DROP VIEW IF EXISTS `comments_by_news`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `comments_by_news` AS select `comments`.`COMMENT_ID` AS `COMMENT_ID`,`comments`.`COMMENT_TEXT` AS `COMMENT_TEXT`,`comments`.`CREATED_BY` AS `CREATED_BY`,`news_comments`.`NEWS_ID` AS `NEWS_ID` from (`comments` join `news_comments` on(`news_comments`.`COMMENT_ID` = `comments`.`COMMENT_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `noticias_en_redaccion`
--

/*!50001 DROP VIEW IF EXISTS `noticias_en_redaccion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `noticias_en_redaccion` AS select `news`.`NEWS_ID` AS `NEWS_ID`,`news`.`TITLE` AS `TITLE`,`news`.`LEAD_TEXT` AS `LEAD_TEXT`,`news`.`CITY` AS `CITY`,`news`.`STATE` AS `STATE`,`news`.`COUNTRY` AS `COUNTRY`,`news`.`SIGNATURE` AS `SIGNATURE`,`news`.`NEWS_TEXT` AS `NEWS_TEXT`,`news`.`DATE_OF_EVENTS` AS `DATE_OF_EVENTS`,`news`.`LIKES` AS `LIKES`,`news`.`CREATED_BY` AS `CREATED_BY`,`news`.`PUBLISHED_DATE` AS `PUBLISHED_DATE`,`news_multimedia`.`MULTIMEDIA_ID` AS `MULTIMEDIA_ID` from (`news` join `news_multimedia` on(`news`.`NEWS_ID` = `news_multimedia`.`NEWS_ID` and `news`.`STATUS` = 1 and `news`.`ACTIVE` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `noticias_publicadas`
--

/*!50001 DROP VIEW IF EXISTS `noticias_publicadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `noticias_publicadas` AS select `news`.`NEWS_ID` AS `NEWS_ID`,`news`.`TITLE` AS `TITLE`,`news`.`LEAD_TEXT` AS `LEAD_TEXT`,`news`.`CITY` AS `CITY`,`news`.`STATE` AS `STATE`,`news`.`COUNTRY` AS `COUNTRY`,`news`.`SIGNATURE` AS `SIGNATURE`,`news`.`NEWS_TEXT` AS `NEWS_TEXT`,`news`.`DATE_OF_EVENTS` AS `DATE_OF_EVENTS`,`news`.`LIKES` AS `LIKES`,`news`.`CREATED_BY` AS `CREATED_BY`,`news`.`PUBLISHED_DATE` AS `PUBLISHED_DATE`,`news_multimedia`.`MULTIMEDIA_ID` AS `MULTIMEDIA_ID`,concat(`users`.`NAME`,' ',`users`.`LAST_NAME`) AS `REPORTER_NAME` from ((`news` join `news_multimedia` on(`news`.`NEWS_ID` = `news_multimedia`.`NEWS_ID` and `news`.`STATUS` = 3 and `news`.`ACTIVE` = 1)) join `users` on(`users`.`USERS_ID` = `news`.`CREATED_BY`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `noticias_publicadas_completas`
--

/*!50001 DROP VIEW IF EXISTS `noticias_publicadas_completas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `noticias_publicadas_completas` AS select `noticias_publicadas`.`NEWS_ID` AS `NEWS_ID`,`noticias_publicadas`.`TITLE` AS `TITLE`,`noticias_publicadas`.`LEAD_TEXT` AS `LEAD_TEXT`,`noticias_publicadas`.`CITY` AS `CITY`,`noticias_publicadas`.`STATE` AS `STATE`,`noticias_publicadas`.`COUNTRY` AS `COUNTRY`,`noticias_publicadas`.`SIGNATURE` AS `SIGNATURE`,`noticias_publicadas`.`NEWS_TEXT` AS `NEWS_TEXT`,`noticias_publicadas`.`DATE_OF_EVENTS` AS `DATE_OF_EVENTS`,`noticias_publicadas`.`LIKES` AS `LIKES`,`noticias_publicadas`.`CREATED_BY` AS `CREATED_BY`,`noticias_publicadas`.`PUBLISHED_DATE` AS `PUBLISHED_DATE`,`noticias_publicadas`.`MULTIMEDIA_ID` AS `MULTIMEDIA_ID`,`noticias_publicadas`.`REPORTER_NAME` AS `REPORTER_NAME`,`multimedia`.`MEDIA` AS `MEDIA`,`multimedia`.`IS_VIDEO` AS `IS_VIDEO` from (`noticias_publicadas` join `multimedia` on(`multimedia`.`MULTIMEDIA_ID` = `noticias_publicadas`.`MULTIMEDIA_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `noticias_terminadas`
--

/*!50001 DROP VIEW IF EXISTS `noticias_terminadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `noticias_terminadas` AS select `news`.`NEWS_ID` AS `NEWS_ID`,`news`.`TITLE` AS `TITLE`,`news`.`LEAD_TEXT` AS `LEAD_TEXT`,`news`.`CITY` AS `CITY`,`news`.`STATE` AS `STATE`,`news`.`COUNTRY` AS `COUNTRY`,`news`.`SIGNATURE` AS `SIGNATURE`,`news`.`NEWS_TEXT` AS `NEWS_TEXT`,`news`.`DATE_OF_EVENTS` AS `DATE_OF_EVENTS`,`news`.`LIKES` AS `LIKES`,`news`.`CREATED_BY` AS `CREATED_BY`,`news`.`PUBLISHED_DATE` AS `PUBLISHED_DATE`,`news_multimedia`.`MULTIMEDIA_ID` AS `MULTIMEDIA_ID` from (`news` join `news_multimedia` on(`news`.`NEWS_ID` = `news_multimedia`.`NEWS_ID` and `news`.`STATUS` = 2 and `news`.`ACTIVE` = 1)) */;
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

-- Dump completed on 2022-06-05 13:50:08
