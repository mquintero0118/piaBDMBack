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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (9,'Nacional','Rojo',1,'2022-05-23 20:14:56',NULL,0,NULL,1),(10,'Tecnologia','Azul',2,'2022-05-23 20:15:25',NULL,0,NULL,1),(11,'Internacional','Amarillo',3,'2022-05-23 20:31:58',NULL,0,NULL,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40000 ALTER TABLE `key_words_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multimedia`
--

DROP TABLE IF EXISTS `multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multimedia` (
  `MULTIMEDIA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MEDIA` mediumblob NOT NULL,
  `CREATION_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `CREATED_BY` int(11) NOT NULL,
  `ACTIVE` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`MULTIMEDIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimedia`
--

LOCK TABLES `multimedia` WRITE;
/*!40000 ALTER TABLE `multimedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `multimedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `NEWS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CITY` varchar(100) NOT NULL,
  `SUBURB` varchar(100) NOT NULL,
  `COUNTRY` varchar(100) NOT NULL,
  `SIGNATURE` varchar(100) NOT NULL,
  `TITLE` varchar(100) NOT NULL,
  `LEAD` varchar(300) NOT NULL,
  `TEXT` varchar(500) NOT NULL,
  `PUBLISHED_DATE` date NOT NULL,
  `DATE_OF_EVENTS` datetime NOT NULL,
  `LIKES` int(11) NOT NULL DEFAULT 0,
  `STATUS` varchar(50) NOT NULL,
  `CREATION_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `CREATED_BY` int(11) NOT NULL,
  `LAST_UPDATE_BY` int(11) DEFAULT NULL,
  `ACTIVE` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`NEWS_ID`),
  KEY `NEWS_STATUS_idx` (`STATUS`),
  CONSTRAINT `NEWS_STATUS` FOREIGN KEY (`STATUS`) REFERENCES `news_status` (`STATUS`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
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
  `CREATED_BY` int(11) NOT NULL,
  `ACTIVE` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`NEWS_ID`,`CATEGORY_ID`),
  KEY `CATEGORY_ID_idx` (`CATEGORY_ID`),
  CONSTRAINT `CATEGORY_ID` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `categories` (`CATEGORY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `NEWS_ID_CATEGORY` FOREIGN KEY (`NEWS_ID`) REFERENCES `news` (`NEWS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_categories`
--

LOCK TABLES `news_categories` WRITE;
/*!40000 ALTER TABLE `news_categories` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `news_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_multimedia`
--

DROP TABLE IF EXISTS `news_multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_multimedia` (
  `NEWS_ID` int(11) NOT NULL,
  `MULTIMEDIA_ID` int(11) NOT NULL,
  `CREATION_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `CREATED_BY` int(11) NOT NULL,
  `ACTIVE` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`NEWS_ID`,`MULTIMEDIA_ID`),
  KEY `MULTIMEDIA_ID_idx` (`MULTIMEDIA_ID`),
  CONSTRAINT `MULTIMEDIA_ID` FOREIGN KEY (`MULTIMEDIA_ID`) REFERENCES `multimedia` (`MULTIMEDIA_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `NEWS_ID_MULTIMEDIA` FOREIGN KEY (`NEWS_ID`) REFERENCES `news` (`NEWS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_multimedia`
--

LOCK TABLES `news_multimedia` WRITE;
/*!40000 ALTER TABLE `news_multimedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_multimedia` ENABLE KEYS */;
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
  `CREATED_BY` int(11) NOT NULL,
  `ACTIVE` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_status`
--

LOCK TABLES `news_status` WRITE;
/*!40000 ALTER TABLE `news_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_status` ENABLE KEYS */;
UNLOCK TABLES;

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
  `CREATED_BY` int(11) NOT NULL,
  `LAST_UPDATE_BY` int(11) DEFAULT NULL,
  `ACTIVE` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`USERS_ID`),
  UNIQUE KEY `EMAIL_UNIQUE` (`EMAIL`),
  KEY `USER_TYPE_ID_idx` (`USER_TYPES_ID`),
  CONSTRAINT `USER_TYPE_ID` FOREIGN KEY (`USER_TYPES_ID`) REFERENCES `user_types` (`USER_TYPES_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (19,'123@gmail.com','1233$$%##TRT445s','jose carlos ','torres',NULL,3,NULL,'2022-05-02 21:23:11',NULL,0,NULL,1),(20,'343444@gmail.com','232323$$$RRTT55','343','3434',NULL,3,NULL,'2022-05-02 21:29:58',NULL,0,NULL,1),(21,'12ww3@gmail.com','wewewe###E3334r','wewe','wqwew',NULL,3,NULL,'2022-05-02 23:06:10',NULL,0,NULL,1),(22,'1232323@gmail.com','EREURUE#$&*#&$RER22','2323','2323',NULL,3,NULL,'2022-05-02 23:06:47',NULL,0,NULL,1),(23,'343434@gmail.com','343434434##$R@@Eee','3434','3434',NULL,3,NULL,'2022-05-06 07:00:04',NULL,0,NULL,1),(24,'454545@gmail.com','4545323233$$$$%4445tT','454545','4545',NULL,3,NULL,'2022-05-06 08:27:43',NULL,0,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-24 20:11:03
