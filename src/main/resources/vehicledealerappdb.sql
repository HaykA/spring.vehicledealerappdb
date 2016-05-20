CREATE DATABASE  IF NOT EXISTS `vehicledealerappdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `vehicledealerappdb`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: vehicledealerappdb
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(12) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created` date NOT NULL,
  `creatorid` int(9) unsigned NOT NULL,
  `modified` date DEFAULT NULL,
  `modifierid` int(9) unsigned DEFAULT NULL,
  `state` enum('DEFAULT','NEW','USED') NOT NULL DEFAULT 'DEFAULT',
  `baseprice` decimal(10,0) NOT NULL DEFAULT '-1',
  `pricereduction` decimal(10,0) NOT NULL DEFAULT '0',
  `branchid` int(9) unsigned NOT NULL,
  `views` int(9) unsigned NOT NULL DEFAULT '0',
  `description` varchar(2000) DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_article$branchid_idx` (`branchid`),
  KEY `fk_article$creator_idx` (`creatorid`),
  KEY `fk_article$modifier_idx` (`modifierid`),
  CONSTRAINT `fk_article$branch` FOREIGN KEY (`branchid`) REFERENCES `branch` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_article$creator` FOREIGN KEY (`creatorid`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_article$modifier` FOREIGN KEY (`modifierid`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (4,'C001','OPEL ZAFIRA 1.7 TDi Cosmo','2016-05-16',1,'2016-05-17',1,'USED',2550,7,1,6,'First car');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_person`
--

DROP TABLE IF EXISTS `article_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_person` (
  `articleid` int(9) unsigned NOT NULL,
  `personid` int(9) unsigned NOT NULL,
  PRIMARY KEY (`articleid`,`personid`),
  KEY `fk_article_person$person_idx` (`personid`),
  CONSTRAINT `fk_article_person$article` FOREIGN KEY (`articleid`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_article_person$person` FOREIGN KEY (`personid`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_person`
--

LOCK TABLES `article_person` WRITE;
/*!40000 ALTER TABLE `article_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_tag`
--

DROP TABLE IF EXISTS `article_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_tag` (
  `articleid` int(9) unsigned NOT NULL,
  `tagid` int(9) unsigned NOT NULL,
  PRIMARY KEY (`articleid`,`tagid`),
  KEY `fk_article_category$categoryid_idx` (`tagid`),
  CONSTRAINT `fk_article_tag$article` FOREIGN KEY (`articleid`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_article_tag$tag` FOREIGN KEY (`tagid`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_tag`
--

LOCK TABLES `article_tag` WRITE;
/*!40000 ALTER TABLE `article_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_authority`
--

DROP TABLE IF EXISTS `auth_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_authority` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_authority`
--

LOCK TABLES `auth_authority` WRITE;
/*!40000 ALTER TABLE `auth_authority` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `personid` int(9) unsigned NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `personid_UNIQUE` (`personid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,1,'hayk','demo',1);
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_authority`
--

DROP TABLE IF EXISTS `auth_user_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_authority` (
  `userid` int(9) unsigned NOT NULL,
  `authorityid` int(9) unsigned NOT NULL,
  PRIMARY KEY (`userid`,`authorityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_authority`
--

LOCK TABLES `auth_user_authority` WRITE;
/*!40000 ALTER TABLE `auth_user_authority` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `house` varchar(10) DEFAULT NULL,
  `apt` varchar(10) DEFAULT NULL,
  `cityid` int(9) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_branch$city_idx` (`cityid`),
  CONSTRAINT `fk_branch$city` FOREIGN KEY (`cityid`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,NULL,'Koningstraat','5','2',1);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `alt_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'opel',NULL);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(9) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `postalcode` varchar(45) DEFAULT NULL,
  `countryid` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_city$country_idx` (`countryid`),
  CONSTRAINT `fk_city$country` FOREIGN KEY (`countryid`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Brussel','1000',1);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `continent`
--

DROP TABLE IF EXISTS `continent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `continent` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continent`
--

LOCK TABLES `continent` WRITE;
/*!40000 ALTER TABLE `continent` DISABLE KEYS */;
INSERT INTO `continent` VALUES (1,'Asia Pasific',0),(2,'Europe',1),(3,'Latin America',0),(4,'Middle East & Africa',0),(5,'North America',0);
/*!40000 ALTER TABLE `continent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `continentid` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_country$continent_idx` (`continentid`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Afghanistan',0,4),(2,'Albania',0,2),(3,'Algeria',0,4),(4,'Andorra',0,2),(5,'Angola',0,4),(6,'Antigua and Barbuda',0,3),(7,'Argentina',0,3),(8,'Armenia',0,2),(9,'Australia',0,1),(10,'Austria',0,2),(11,'Azerbaijan',0,2),(12,'Bahamas',0,3),(13,'Bahrain',0,4),(14,'Bangladesh',0,1),(15,'Barbados',0,3),(16,'Belarus',0,2),(17,'Belgium',1,2),(18,'Belize',0,3),(19,'Benin',0,4),(20,'Bhutan',0,1),(21,'Bolivia',0,3),(22,'Bosnia and Herzegovina',0,2),(23,'Botswana',0,4),(24,'Brazil',0,3),(25,'Brunei',0,1),(26,'Bulgaria',0,2),(27,'Burkina Faso',0,4),(29,'Burundi',0,4),(30,'Cambodia',0,1),(31,'Cameroon',0,4),(32,'Cape Verde',0,4),(33,'Central African Republic',0,4),(34,'Chad',0,4),(35,'Chile',0,3),(36,'China',0,1),(37,'Colombia',0,3),(38,'Comoros',0,4),(39,'Congo (DRC)',0,4),(40,'Congo (Republic)',0,4),(41,'Costa Rica',0,3),(42,'Croatia',0,2),(43,'Cuba',0,3),(44,'Cyprus',0,2),(45,'Czech Republic',0,2),(46,'Denmark',0,2),(47,'Djibouti',0,4),(48,'Dominica',0,3),(49,'Dominican Republic',0,3),(50,'East Timor',0,1),(51,'Ecuador',0,3),(52,'Egypt',0,4),(53,'El Salvador',0,3),(54,'Equatorial Guinea',0,4),(55,'Eritrea',0,4),(56,'Estonia',0,2),(57,'Ethiopia',0,4),(58,'Federated States of Micronesia',0,1),(59,'Fiji',0,1),(60,'Finland',0,2),(61,'France',0,2),(62,'Gabon',0,4),(63,'Gambia',0,4),(64,'Georgia',0,2),(65,'Germany',0,2),(66,'Ghana',0,4),(67,'Greece',0,2),(68,'Grenada',0,3),(69,'Guatemala',0,3),(70,'Guinea',0,4),(71,'Guinea-Bissau',0,4),(72,'Guyana',0,1),(73,'Haiti',0,3),(74,'Honduras',0,3),(75,'Hungary',0,2),(76,'Iceland',0,2),(77,'India',0,1),(78,'Indonesia',0,1),(79,'Iran',0,4),(80,'Iraq',0,4),(81,'Ireland',0,2),(82,'Israel',0,4),(83,'Italy',0,2),(84,'Ivory Coast',0,4),(85,'Jamaica',0,3),(86,'Japan',0,1),(87,'Jordan',0,4),(88,'Kazakhstan',0,1),(89,'Kenya',0,4),(90,'Kiribati',0,1),(91,'Kuwait',0,4),(92,'Kyrgyzstan',0,1),(93,'Laos',0,1),(94,'Latvia',0,2),(95,'Lebanon',0,4),(96,'Lesotho',0,4),(97,'Liberia',0,4),(98,'Libya',0,4),(99,'Liechtenstein',0,2),(100,'Lithuania',0,2),(101,'Luxembourg',0,2),(102,'Macedonia',0,2),(103,'Madagascar',0,4),(104,'Malawi',0,4),(105,'Malaysia',0,1),(106,'Maldives',0,1),(107,'Mali',0,4),(108,'Malta',0,2),(109,'Marshall Islands',0,1),(110,'Mauritania',0,4),(111,'Mauritius',0,4),(112,'Mexico',0,3),(113,'Moldova',0,2),(114,'Monaco',0,2),(115,'Mongolia',0,1),(116,'Montenegro',0,2),(117,'Morocco',0,4),(118,'Mozambique',0,4),(119,'Myanmar',0,1),(120,'Namibia',0,4),(121,'Nauru',0,1),(122,'Nepal',0,1),(123,'Netherlands',0,2),(124,'New Zealand',0,1),(125,'Nicaragua',0,3),(126,'Niger',0,4),(127,'Nigeria',0,4),(128,'North Korea',0,1),(129,'Norway',0,2),(130,'Oman',0,4),(131,'Pakistan',0,1),(132,'Palau',0,1),(133,'Palestine',0,4),(134,'Panama',0,3),(135,'Papua New Guinea',0,1),(136,'Paraguay',0,3),(137,'Peru',0,3),(138,'Philippines',0,1),(139,'Poland',0,2),(140,'Portugal',0,2),(141,'Qatar',0,4),(142,'Romania',0,2),(143,'Russia',0,2),(144,'Rwanda',0,4),(145,'Saint Kitts and Nevis',0,3),(146,'Saint Lucia',0,3),(147,'Saint Vincent and the Grenadines',0,3),(148,'Samoa',0,1),(149,'San Marino',0,2),(150,'São Tomé and Príncipe',0,4),(151,'Saudi Arabia',0,4),(152,'Senegal',0,4),(153,'Serbia',0,2),(154,'Seychelles',0,4),(155,'Sierra Leone',0,4),(156,'Singapore',0,1),(157,'Slovakia',0,2),(158,'Slovenia',0,2),(159,'Solomon Islands',0,1),(160,'Somalia',0,4),(161,'South Africa',0,4),(162,'South Korea',0,1),(163,'South Sudan',0,4),(164,'Spain',0,2),(165,'Sri Lanka',0,1),(166,'Sudan',0,4),(167,'Suriname',0,3),(168,'Swaziland',0,4),(169,'Sweden',0,2),(170,'Switzerland',0,2),(171,'Syria',0,4),(172,'Tajikistan',0,1),(173,'Tanzania',0,4),(174,'Thailand',0,1),(175,'Togo',0,4),(176,'Tonga',0,1),(177,'Trinidad and Tobago',0,3),(178,'Tunisia',0,4),(179,'Turkey',0,2),(180,'Turkmenistan',0,1),(181,'Tuvalu',0,1),(182,'Uganda',0,4),(183,'Ukraine',0,2),(184,'United Arab Emirates',0,4),(185,'United Kingdom',0,2),(186,'United States',0,5),(187,'Uruguay',0,3),(188,'Uzbekistan',0,1),(189,'Vanuatu',0,1),(190,'Vatican City',0,1),(191,'Venezuela',0,3),(192,'Vietnam',0,1),(193,'Yemen',0,4),(194,'Zambia',0,4),(195,'Zimbabwe',0,4),(196,'Canada',0,5);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `secondname` varchar(45) NOT NULL,
  `branchid` int(9) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Hayk','Avetisyan',1);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `articleid` int(9) unsigned NOT NULL,
  `modelid` int(9) unsigned DEFAULT NULL,
  `builddate` date DEFAULT NULL,
  `compliancedate` date DEFAULT NULL,
  `mileage` int(7) unsigned DEFAULT NULL,
  PRIMARY KEY (`articleid`),
  UNIQUE KEY `articleid_UNIQUE` (`articleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (1,1,'2005-04-25','2005-08-14',70000);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_model`
--

DROP TABLE IF EXISTS `vehicle_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_model` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `brandid` int(9) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_model`
--

LOCK TABLES `vehicle_model` WRITE;
/*!40000 ALTER TABLE `vehicle_model` DISABLE KEYS */;
INSERT INTO `vehicle_model` VALUES (1,1,'zafira');
/*!40000 ALTER TABLE `vehicle_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_option`
--

DROP TABLE IF EXISTS `vehicle_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_option` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_option`
--

LOCK TABLES `vehicle_option` WRITE;
/*!40000 ALTER TABLE `vehicle_option` DISABLE KEYS */;
INSERT INTO `vehicle_option` VALUES (1,'Manual Airco'),(2,'Climate Control'),(3,'Digital Airco'),(4,'SRS Airbags');
/*!40000 ALTER TABLE `vehicle_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_vehicle_option`
--

DROP TABLE IF EXISTS `vehicle_vehicle_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_vehicle_option` (
  `articleid` int(9) unsigned NOT NULL,
  `optionid` int(9) unsigned NOT NULL,
  PRIMARY KEY (`articleid`,`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_vehicle_option`
--

LOCK TABLES `vehicle_vehicle_option` WRITE;
/*!40000 ALTER TABLE `vehicle_vehicle_option` DISABLE KEYS */;
INSERT INTO `vehicle_vehicle_option` VALUES (1,2),(1,3);
/*!40000 ALTER TABLE `vehicle_vehicle_option` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-20 16:13:31
