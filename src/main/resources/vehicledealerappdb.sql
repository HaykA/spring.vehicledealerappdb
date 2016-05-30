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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
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
  `name` varchar(45) NOT NULL,
  `countryid` int(3) unsigned NOT NULL,
  `postalcode` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_city$country_idx` (`countryid`),
  CONSTRAINT `fk_city$country` FOREIGN KEY (`countryid`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Brussel',17,'1000'),(2,'Yerevan',8,'0004'),(3,'Antwerpen',17,'2018'),(6,'Gent',17,'9000'),(7,'Roeselare',17,'8800'),(8,'Kortrijk',17,'8500'),(9,'Antwerpen',17,'2020'),(10,'Brugge',17,'8000'),(11,'Antwerpen',17,'2000'),(12,'Yerevan',8,'0001');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continent`
--

LOCK TABLES `continent` WRITE;
/*!40000 ALTER TABLE `continent` DISABLE KEYS */;
INSERT INTO `continent` VALUES (1,'Asia Pasific'),(2,'Europe'),(3,'Latin America'),(4,'Middle East & Africa'),(5,'North America');
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
  `nativename` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `continentid` int(1) unsigned DEFAULT NULL,
  `postalcodeprefixenabled` tinyint(1) NOT NULL DEFAULT '0',
  `postalcodesuffixenabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_country$continent_idx` (`continentid`),
  CONSTRAINT `fk_country$continent` FOREIGN KEY (`continentid`) REFERENCES `continent` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Afghanistan',NULL,0,4,0,0),(2,'Albania',NULL,0,2,0,0),(3,'Algeria',NULL,0,4,0,0),(4,'Andorra',NULL,0,2,0,0),(5,'Angola',NULL,0,4,0,0),(6,'Antigua and Barbuda',NULL,0,3,0,0),(7,'Argentina',NULL,0,3,0,0),(8,'Armenia','Հայաստան',0,2,0,0),(9,'Australia',NULL,0,1,0,0),(10,'Austria',NULL,0,2,0,0),(11,'Azerbaijan',NULL,0,2,0,0),(12,'Bahamas',NULL,0,3,0,0),(13,'Bahrain',NULL,0,4,0,0),(14,'Bangladesh',NULL,0,1,0,0),(15,'Barbados',NULL,0,3,0,0),(16,'Belarus',NULL,0,2,0,0),(17,'Belgium','',1,2,0,0),(18,'Belize',NULL,0,3,0,0),(19,'Benin',NULL,0,4,0,0),(20,'Bhutan',NULL,0,1,0,0),(21,'Bolivia',NULL,0,3,0,0),(22,'Bosnia and Herzegovina',NULL,0,2,0,0),(23,'Botswana',NULL,0,4,0,0),(24,'Brazil',NULL,0,3,0,0),(25,'Brunei',NULL,0,1,0,0),(26,'Bulgaria',NULL,1,2,0,0),(27,'Burkina Faso',NULL,0,4,0,0),(28,'Burundi',NULL,0,4,0,0),(29,'Cambodia',NULL,0,1,0,0),(30,'Cameroon',NULL,0,4,0,0),(31,'Canada',NULL,1,5,0,0),(32,'Cape Verde',NULL,0,4,0,0),(33,'Central African Republic',NULL,0,4,0,0),(34,'Chad',NULL,0,4,0,0),(35,'Chile',NULL,0,3,0,0),(36,'China',NULL,0,1,0,0),(37,'Colombia',NULL,0,3,0,0),(38,'Comoros',NULL,0,4,0,0),(39,'Congo (DRC)',NULL,0,4,0,0),(40,'Congo (Republic)',NULL,0,4,0,0),(41,'Costa Rica',NULL,0,3,0,0),(42,'Croatia',NULL,0,2,0,0),(43,'Cuba',NULL,0,3,0,0),(44,'Cyprus',NULL,0,2,0,0),(45,'Czech Republic',NULL,0,2,0,0),(46,'Denmark',NULL,0,2,0,0),(47,'Djibouti',NULL,0,4,0,0),(48,'Dominica',NULL,0,3,0,0),(49,'Dominican Republic',NULL,0,3,0,0),(50,'East Timor',NULL,0,1,0,0),(51,'Ecuador',NULL,0,3,0,0),(52,'Egypt',NULL,0,4,0,0),(53,'El Salvador',NULL,0,3,0,0),(54,'Equatorial Guinea',NULL,0,4,0,0),(55,'Eritrea',NULL,0,4,0,0),(56,'Estonia',NULL,0,2,0,0),(57,'Ethiopia',NULL,0,4,0,0),(58,'Federated States of Micronesia',NULL,0,1,0,0),(59,'Fiji',NULL,0,1,0,0),(60,'Finland',NULL,0,2,0,0),(61,'France',NULL,0,2,0,0),(62,'Gabon',NULL,0,4,0,0),(63,'Gambia',NULL,0,4,0,0),(64,'Georgia',NULL,0,2,0,0),(65,'Germany',NULL,0,2,0,0),(66,'Ghana',NULL,0,4,0,0),(67,'Greece',NULL,0,2,0,0),(68,'Grenada',NULL,0,3,0,0),(69,'Guatemala',NULL,0,3,0,0),(70,'Guinea',NULL,0,4,0,0),(71,'Guinea-Bissau',NULL,0,4,0,0),(72,'Guyana',NULL,0,1,0,0),(73,'Haiti',NULL,0,3,0,0),(74,'Honduras',NULL,0,3,0,0),(75,'Hungary',NULL,0,2,0,0),(76,'Iceland',NULL,0,2,0,0),(77,'India',NULL,0,1,0,0),(78,'Indonesia',NULL,0,1,0,0),(79,'Iran',NULL,0,4,0,0),(80,'Iraq',NULL,0,4,0,0),(81,'Ireland',NULL,0,2,0,0),(82,'Israel',NULL,0,4,0,0),(83,'Italy',NULL,0,2,0,0),(84,'Ivory Coast',NULL,0,4,0,0),(85,'Jamaica',NULL,0,3,0,0),(86,'Japan',NULL,0,1,0,0),(87,'Jordan',NULL,0,4,0,0),(88,'Kazakhstan',NULL,0,1,0,0),(89,'Kenya',NULL,0,4,0,0),(90,'Kiribati',NULL,0,1,0,0),(91,'Kuwait',NULL,0,4,0,0),(92,'Kyrgyzstan',NULL,0,1,0,0),(93,'Laos',NULL,0,1,0,0),(94,'Latvia',NULL,0,2,0,0),(95,'Lebanon',NULL,0,4,0,0),(96,'Lesotho',NULL,0,4,0,0),(97,'Liberia',NULL,0,4,0,0),(98,'Libya',NULL,0,4,0,0),(99,'Liechtenstein',NULL,0,2,0,0),(100,'Lithuania',NULL,0,2,0,0),(101,'Luxembourg',NULL,0,2,0,0),(102,'Macedonia',NULL,0,2,0,0),(103,'Madagascar',NULL,0,4,0,0),(104,'Malawi',NULL,0,4,0,0),(105,'Malaysia',NULL,0,1,0,0),(106,'Maldives',NULL,0,1,0,0),(107,'Mali',NULL,0,4,0,0),(108,'Malta',NULL,0,2,0,0),(109,'Marshall Islands',NULL,0,1,0,0),(110,'Mauritania',NULL,0,4,0,0),(111,'Mauritius',NULL,0,4,0,0),(112,'Mexico',NULL,0,3,0,0),(113,'Moldova',NULL,0,2,0,0),(114,'Monaco',NULL,0,2,0,0),(115,'Mongolia',NULL,0,1,0,0),(116,'Montenegro',NULL,0,2,0,0),(117,'Morocco',NULL,0,4,0,0),(118,'Mozambique',NULL,0,4,0,0),(119,'Myanmar',NULL,0,1,0,0),(120,'Namibia',NULL,0,4,0,0),(121,'Nauru',NULL,0,1,0,0),(122,'Nepal',NULL,0,1,0,0),(123,'Netherlands','Nederland',1,2,0,1),(124,'New Zealand',NULL,0,1,0,0),(125,'Nicaragua',NULL,0,3,0,0),(126,'Niger',NULL,0,4,0,0),(127,'Nigeria',NULL,0,4,0,0),(128,'North Korea',NULL,0,1,0,0),(129,'Norway',NULL,0,2,0,0),(130,'Oman',NULL,0,4,0,0),(131,'Pakistan',NULL,0,1,0,0),(132,'Palau',NULL,0,1,0,0),(133,'Palestine',NULL,0,4,0,0),(134,'Panama',NULL,0,3,0,0),(135,'Papua New Guinea',NULL,0,1,0,0),(136,'Paraguay',NULL,0,3,0,0),(137,'Peru',NULL,0,3,0,0),(138,'Philippines',NULL,0,1,0,0),(139,'Poland',NULL,0,2,0,0),(140,'Portugal',NULL,0,2,0,0),(141,'Qatar',NULL,0,4,0,0),(142,'Romania',NULL,0,2,0,0),(143,'Russia',NULL,0,2,0,0),(144,'Rwanda',NULL,0,4,0,0),(145,'Saint Kitts and Nevis',NULL,0,3,0,0),(146,'Saint Lucia',NULL,0,3,0,0),(147,'Saint Vincent and the Grenadines',NULL,0,3,0,0),(148,'Samoa',NULL,0,1,0,0),(149,'San Marino',NULL,0,2,0,0),(150,'Saudi Arabia',NULL,0,4,0,0),(151,'Senegal',NULL,0,4,0,0),(152,'Serbia',NULL,0,2,0,0),(153,'Seychelles',NULL,0,4,0,0),(154,'Sierra Leone',NULL,0,4,0,0),(155,'Singapore',NULL,0,1,0,0),(156,'Slovakia',NULL,0,2,0,0),(157,'Slovenia',NULL,0,2,0,0),(158,'Solomon Islands',NULL,0,1,0,0),(159,'Somalia',NULL,0,4,0,0),(160,'South Africa',NULL,0,4,0,0),(161,'South Korea',NULL,0,1,0,0),(162,'South Sudan',NULL,0,4,0,0),(163,'Spain',NULL,0,2,0,0),(164,'Sri Lanka',NULL,0,1,0,0),(165,'Sudan',NULL,0,4,0,0),(166,'Suriname',NULL,0,3,0,0),(167,'Swaziland',NULL,0,4,0,0),(168,'Sweden',NULL,0,2,0,0),(169,'Switzerland',NULL,0,2,0,0),(170,'Syria',NULL,0,4,0,0),(171,'São Tomé and Príncipe',NULL,0,4,0,0),(172,'Tajikistan',NULL,0,1,0,0),(173,'Tanzania',NULL,0,4,0,0),(174,'Thailand',NULL,0,1,0,0),(175,'Togo',NULL,0,4,0,0),(176,'Tonga',NULL,0,1,0,0),(177,'Trinidad and Tobago',NULL,0,3,0,0),(178,'Tunisia',NULL,0,4,0,0),(179,'Turkey',NULL,0,2,0,0),(180,'Turkmenistan',NULL,0,1,0,0),(181,'Tuvalu',NULL,0,1,0,0),(182,'Uganda',NULL,0,4,0,0),(183,'Ukraine',NULL,0,2,0,0),(184,'United Arab Emirates',NULL,0,4,0,0),(185,'United Kingdom',NULL,0,2,0,0),(186,'United States',NULL,0,5,0,0),(187,'Uruguay',NULL,0,3,0,0),(188,'Uzbekistan',NULL,0,1,0,0),(189,'Vanuatu',NULL,0,1,0,0),(190,'Vatican City',NULL,0,1,0,0),(191,'Venezuela',NULL,0,3,0,0),(192,'Vietnam',NULL,0,1,0,0),(193,'Yemen',NULL,0,4,0,0),(194,'Zambia',NULL,0,4,0,0),(195,'Zimbabwe',NULL,0,4,0,0);
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
-- Table structure for table `street`
--

DROP TABLE IF EXISTS `street`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `street` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `postalcodeprefix` varchar(5) DEFAULT NULL,
  `postalcodesuffix` varchar(5) DEFAULT NULL,
  `cityid` int(9) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_street$city_idx` (`cityid`),
  CONSTRAINT `fk_street$city` FOREIGN KEY (`cityid`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `street`
--

LOCK TABLES `street` WRITE;
/*!40000 ALTER TABLE `street` DISABLE KEYS */;
INSERT INTO `street` VALUES (1,'Appelmansstraat',NULL,NULL,3);
/*!40000 ALTER TABLE `street` ENABLE KEYS */;
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

-- Dump completed on 2016-05-30 16:16:43
