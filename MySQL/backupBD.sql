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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `multimedia`
--

DROP TABLE IF EXISTS `multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multimedia` (
  `MULTIMEDIA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MEDIA` longblob NOT NULL,
  `CREATION_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `CREATED_BY` int(11) DEFAULT NULL,
  `ACTIVE` tinyint(4) NOT NULL DEFAULT 1,
  `IS_VIDEO` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`MULTIMEDIA_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `news_multimedia`
--

DROP TABLE IF EXISTS `news_multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_multimedia` (
  `NEWS_ID` int(11) NOT NULL,
  `MULTIMEDIA_ID` int(11) NOT NULL,
  `CREATION_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `CREATED_BY` int(11) DEFAULT NULL,
  `ACTIVE` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`NEWS_ID`,`MULTIMEDIA_ID`),
  KEY `MULTIMEDIA_ID_idx` (`MULTIMEDIA_ID`),
  CONSTRAINT `MULTIMEDIA_ID` FOREIGN KEY (`MULTIMEDIA_ID`) REFERENCES `multimedia` (`MULTIMEDIA_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `NEWS_ID_MULTIMEDIA` FOREIGN KEY (`NEWS_ID`) REFERENCES `news` (`NEWS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Temporary view structure for view `noticias_completas`
--

DROP TABLE IF EXISTS `noticias_completas`;
/*!50001 DROP VIEW IF EXISTS `noticias_completas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `noticias_completas` AS SELECT 
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
 1 AS `MEDIA`,
 1 AS `IS_VIDEO`*/;
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
IN pActive tinyint
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
IN pIsVideo TINYINT

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




SELECT NEWS_ID,TITLE,LEAD_TEXT,CITY,STATE,COUNTRY,SIGNATURE,NEWS_TEXT,DATE_OF_EVENTS, LIKES, CREATED_BY, PUBLISHED_DATE, MEDIA,IS_VIDEO
FROM NOTICIAS_COMPLETAS GROUP BY NEWS_ID ORDER BY PUBLISHED_DATE  DESC LIMIT 3;


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
-- Final view structure for view `noticias_completas`
--

/*!50001 DROP VIEW IF EXISTS `noticias_completas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `noticias_completas` AS select `noticias_publicadas`.`NEWS_ID` AS `NEWS_ID`,`noticias_publicadas`.`TITLE` AS `TITLE`,`noticias_publicadas`.`LEAD_TEXT` AS `LEAD_TEXT`,`noticias_publicadas`.`CITY` AS `CITY`,`noticias_publicadas`.`STATE` AS `STATE`,`noticias_publicadas`.`COUNTRY` AS `COUNTRY`,`noticias_publicadas`.`SIGNATURE` AS `SIGNATURE`,`noticias_publicadas`.`NEWS_TEXT` AS `NEWS_TEXT`,`noticias_publicadas`.`DATE_OF_EVENTS` AS `DATE_OF_EVENTS`,`noticias_publicadas`.`LIKES` AS `LIKES`,`noticias_publicadas`.`CREATED_BY` AS `CREATED_BY`,`noticias_publicadas`.`PUBLISHED_DATE` AS `PUBLISHED_DATE`,`noticias_publicadas`.`MULTIMEDIA_ID` AS `MULTIMEDIA_ID`,`multimedia`.`MEDIA` AS `MEDIA`,`multimedia`.`IS_VIDEO` AS `IS_VIDEO` from (`noticias_publicadas` join `multimedia` on(`multimedia`.`MULTIMEDIA_ID` = `noticias_publicadas`.`MULTIMEDIA_ID`)) */;
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
/*!50001 VIEW `noticias_publicadas` AS select `news`.`NEWS_ID` AS `NEWS_ID`,`news`.`TITLE` AS `TITLE`,`news`.`LEAD_TEXT` AS `LEAD_TEXT`,`news`.`CITY` AS `CITY`,`news`.`STATE` AS `STATE`,`news`.`COUNTRY` AS `COUNTRY`,`news`.`SIGNATURE` AS `SIGNATURE`,`news`.`NEWS_TEXT` AS `NEWS_TEXT`,`news`.`DATE_OF_EVENTS` AS `DATE_OF_EVENTS`,`news`.`LIKES` AS `LIKES`,`news`.`CREATED_BY` AS `CREATED_BY`,`news`.`PUBLISHED_DATE` AS `PUBLISHED_DATE`,`news_multimedia`.`MULTIMEDIA_ID` AS `MULTIMEDIA_ID` from (`news` join `news_multimedia` on(`news`.`NEWS_ID` = `news_multimedia`.`NEWS_ID` and `news`.`STATUS` = 3 and `news`.`ACTIVE` = 1)) */;
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

-- Dump completed on 2022-05-29 17:11:52
