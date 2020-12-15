-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: mjimeno2
-- ------------------------------------------------------
-- Server version	5.5.68-MariaDB

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
-- Table structure for table `addedto`
--

DROP TABLE IF EXISTS `addedto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addedto` (
  `inventory_id` int(11) unsigned NOT NULL,
  `cart_id` int(11) unsigned NOT NULL,
  `quantity` int(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  KEY `fk_addinventory_id` (`inventory_id`),
  KEY `fk_addcart_id` (`cart_id`),
  CONSTRAINT `fk_addinventory_id` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_addcart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addedto`
--

LOCK TABLES `addedto` WRITE;
/*!40000 ALTER TABLE `addedto` DISABLE KEYS */;
INSERT INTO `addedto` VALUES (4,10,43,'2020-11-28'),(1,9,46,'2020-11-04'),(13,9,11,'2020-12-05'),(11,14,46,'2020-11-05'),(12,12,16,'2020-11-02'),(9,6,6,'2020-12-07'),(11,5,35,'2020-11-25'),(4,7,11,'2020-11-11'),(8,3,1,'2020-11-07'),(12,2,23,'2020-11-06'),(9,15,26,'2020-11-11'),(3,10,6,'2020-10-31'),(9,14,48,'2020-10-30'),(11,7,48,'2020-11-27'),(15,5,13,'2020-12-01');
/*!40000 ALTER TABLE `addedto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'marc','2020-12-14'),(2,'marbien','2020-01-12');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) unsigned NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `open_date` date DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_customer_id` (`customer_id`),
  CONSTRAINT `pk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,15,0,'2020-09-29','2020-12-12'),(2,1,0,'2020-10-30','2020-11-19'),(3,12,0,'2020-07-01','2020-07-02'),(4,2,0,'2020-08-08','2020-10-12'),(5,10,0,'2020-10-12','2020-10-12'),(6,1,0,'2020-05-24','2020-06-15'),(7,14,0,'2020-10-03','2020-12-12'),(8,2,0,'2020-09-02','2020-09-22'),(9,7,0,'2020-08-04','2020-08-24'),(10,14,0,'2020-07-14','2020-08-02'),(11,7,0,'2020-06-07','2020-06-30'),(12,2,0,'2020-06-20','2020-07-14'),(13,3,0,'2020-07-09','2020-07-09'),(14,13,0,'2020-07-22','2020-08-15'),(15,1,0,'2020-06-27','2020-09-29');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `delivery_address` varchar(200) DEFAULT NULL,
  `payment_info` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'bcheesworthe@cisco.com','C0sbUaRMMFC','Bartholomeus Cheesworth','15742 Eggendart Plaza','9 Grim Crossing','jcb'),(2,'graftery0@cnet.com','yvBTps','Grove Raftery','30829 Duke Parkway','376 Dakota Lane','visa'),(3,'jridolfi1@sakura.ne.jp','0QCCzvR3','Jereme Ridolfi','9 Stuart Trail','21 Shasta Junction','jcb'),(4,'wgodlee2@baidu.com','xZ1gR3sur6','Willy Godlee','65942 Ludington Junction','0 Ohio Trail','mastercard'),(5,'tjakubowicz3@apache.org','ha8TeiX7','Tybalt Jakubowicz','1518 Washington Circle','5499 Ridgeway Pass','mastercard'),(6,'cdeavin4@vinaora.com','KevcczW','Candra Deavin','1256 Marcy Point','32294 Bellgrove Crossing','jcb'),(7,'dbluck5@dmoz.org','0jY9GKKElu9B','Dell Bluck','1 Monument Lane','4494 Hovde Junction','maestro'),(8,'ralsopp6@noaa.gov','hgJMlfPvu','Reagan Alsopp','1 Blue Bill Park Crossing','003 Ryan Center','china-unionpay'),(9,'fgelly7@hao123.com','ij8GmC0yZoh','Fredek Gelly','646 Dryden Center','020 Charing Cross Lane','visa'),(10,'htoke8@bluehost.com','L9QIqX2xdN','Hedi Toke','3585 Bobwhite Circle','456 Anniversary Lane','visa'),(11,'cbarkes9@europa.eu','OuJg5PZg','Carolyn Barkes','82189 Anhalt Avenue','4074 Golf Pass','mastercard'),(12,'mhempela@theglobeandmail.com','ybQbOdm0Si','Marysa Hempel','24577 Muir Junction','5655 Nevada Pass','maestro'),(13,'mtarquinib@usda.gov','b8ImtI9g','Myrle Tarquini','26510 Ridgeview Alley','2641 Texas Circle','visa'),(14,'kealamc@w3.org','E86hauFK','Kinny Ealam','525 Crescent Oaks Hill','66 Killdeer Lane','jcb'),(15,'dmatusovd@paginegialle.it','Uoo1uheR','Duky Matusov','10 Bonner Lane','99 Westport Place','mastercard');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `storage_id` int(11) unsigned NOT NULL,
  `quantity` int(100) DEFAULT NULL,
  `admin_id` int(11) NOT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_storage_id` (`storage_id`),
  KEY `fk_admin_id` (`admin_id`),
  CONSTRAINT `fk_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_storage_id` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,21,269,1,'2020-07-31'),(2,17,144,2,'2020-09-26'),(3,26,112,1,'2020-10-24'),(4,20,104,2,'2020-06-14'),(5,23,60,2,'2020-07-17'),(6,16,51,2,'2020-09-23'),(7,13,284,2,'2020-08-26'),(8,10,1,1,'2020-07-06'),(9,14,151,2,'2020-12-03'),(10,12,1,2,'2020-08-01'),(11,15,69,1,'2020-12-08'),(12,27,74,2,'2020-10-03'),(13,22,141,1,'2020-07-29'),(14,24,246,1,'2020-08-28'),(15,19,136,1,'2020-08-14');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) unsigned NOT NULL,
  `subtotal` decimal(11,2) DEFAULT NULL,
  `tax` decimal(7,2) DEFAULT NULL,
  `admin_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_id` (`cart_id`),
  KEY `fk_admin_invoice_id` (`admin_id`),
  CONSTRAINT `fk_admin_invoice_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,2,4206.97,301.28,2,0),(2,14,2010.43,247.16,1,0),(3,9,1008.83,313.86,1,0),(4,6,4470.23,198.26,2,0),(5,4,2369.51,160.39,1,0),(6,12,1599.60,175.67,2,0),(7,8,2222.41,396.58,1,0),(8,3,2856.36,376.19,1,0),(9,11,2516.43,144.60,1,0),(10,13,4688.35,453.93,1,0),(11,1,804.58,494.06,1,0),(12,5,2742.15,352.59,2,0),(13,15,715.00,232.31,1,0),(14,10,1480.35,496.80,1,0),(15,7,2695.76,88.54,1,0);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `quantity` mediumint(9) NOT NULL,
  `update_date` date DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_admin` (`admin_id`),
  CONSTRAINT `fk_admin` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
INSERT INTO `storage` VALUES (3,'equipment','loader',3451.48,1,'2020-05-09',1),(4,'equipment','tractor',819.75,1,'2020-10-11',1),(5,'equipment','plow',9306.43,1,'2019-12-20',1),(6,'equipment','loader',7545.53,1,'2020-05-19',1),(7,'equipment','plow',154.27,1,'2020-06-07',1),(8,'equipment','manure spreader',1732.81,1,'2019-03-09',1),(9,'equipment','manure',6634.46,1,'2020-06-30',1),(10,'equipment','loader',1266.99,1,'2019-01-25',1),(11,'equipment','rake',8554.05,1,'2019-01-02',1),(12,'equipment','loader',9509.41,1,'2020-04-24',1),(13,'produce','mango',5.85,825,'2019-09-18',1),(14,'produce','watermelon',3.68,922,'2019-09-14',1),(15,'produce','pineapple',2.93,942,'2019-09-03',1),(16,'produce','orange',4.28,803,'2019-09-15',1),(17,'produce','watermelon',2.64,991,'2019-09-06',1),(18,'produce','mango',5.68,896,'2019-09-16',1),(19,'produce','avocado',3.78,906,'2019-09-06',1),(20,'produce','pineapple',0.68,941,'2019-09-04',1),(21,'produce','avocado',0.34,867,'2019-09-09',1),(22,'produce','papaya',2.90,843,'2019-09-08',1),(23,'produce','mango',3.68,935,'2019-09-08',1),(24,'produce','orange',2.93,894,'2019-09-01',1),(25,'produce','durian',4.28,963,'2019-09-01',1),(26,'produce','avocado',2.64,943,'2019-09-10',1),(27,'produce','watermelon',5.68,924,'2019-09-12',1);
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-15  1:15:46
