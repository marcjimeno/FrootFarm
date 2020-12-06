-- MySQL dump 10.14  Distrib 5.5.65-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: mjimeno2
-- ------------------------------------------------------
-- Server version	5.5.65-MariaDB

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
-- Table structure for table `C1_User`
--

DROP TABLE IF EXISTS `C1_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C1_User` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(70) DEFAULT NULL,
  `customer_address` varchar(255) DEFAULT NULL,
  `type_of_business` varchar(255) DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `payment_info` varchar(255) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `fk_cart_id` (`cart_id`),
  CONSTRAINT `fk_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `C2_Cart` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C1_User`
--

LOCK TABLES `C1_User` WRITE;
/*!40000 ALTER TABLE `C1_User` DISABLE KEYS */;
/*!40000 ALTER TABLE `C1_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `C2_Cart`
--

DROP TABLE IF EXISTS `C2_Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C2_Cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `open_date` date DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C2_Cart`
--

LOCK TABLES `C2_Cart` WRITE;
/*!40000 ALTER TABLE `C2_Cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `C2_Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CI1_Cart`
--

DROP TABLE IF EXISTS `CI1_Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CI1_Cart` (
  `customer_id` int(11) DEFAULT NULL,
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `num_of_items` int(11) DEFAULT NULL,
  `cart_items` varchar(70) DEFAULT NULL,
  `sub_total` decimal(9,2) DEFAULT NULL,
  `cart_status` varchar(20) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `fk_customercart_id` (`customer_id`),
  KEY `fk_invoicecart_id` (`invoice_id`),
  CONSTRAINT `fk_customercart_id` FOREIGN KEY (`customer_id`) REFERENCES `CI3_Customer` (`customer_id`),
  CONSTRAINT `fk_invoicecart_id` FOREIGN KEY (`invoice_id`) REFERENCES `CI2_Invoice` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CI1_Cart`
--

LOCK TABLES `CI1_Cart` WRITE;
/*!40000 ALTER TABLE `CI1_Cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `CI1_Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CI2_Invoice`
--

DROP TABLE IF EXISTS `CI2_Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CI2_Invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchased_items` varchar(225) DEFAULT NULL,
  `sale_total` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CI2_Invoice`
--

LOCK TABLES `CI2_Invoice` WRITE;
/*!40000 ALTER TABLE `CI2_Invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `CI2_Invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CI3_Customer`
--

DROP TABLE IF EXISTS `CI3_Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CI3_Customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(70) DEFAULT NULL,
  `cust_payment_info` varchar(255) DEFAULT NULL,
  `cust_address` varchar(255) DEFAULT NULL,
  `type_of_business` varchar(70) DEFAULT NULL,
  `delivey_address` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CI3_Customer`
--

LOCK TABLES `CI3_Customer` WRITE;
/*!40000 ALTER TABLE `CI3_Customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `CI3_Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addedto`
--

DROP TABLE IF EXISTS `addedto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addedto` (
  `inventory_item_id` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `add_date` date DEFAULT NULL,
  KEY `fk_invadded_id` (`inventory_item_id`),
  KEY `fk_cartadded_id` (`cart_id`),
  CONSTRAINT `fk_invadded_id` FOREIGN KEY (`inventory_item_id`) REFERENCES `inventory` (`inventory_item_id`),
  CONSTRAINT `fk_cartadded_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addedto`
--

LOCK TABLES `addedto` WRITE;
/*!40000 ALTER TABLE `addedto` DISABLE KEYS */;
/*!40000 ALTER TABLE `addedto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `open_date` date DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `cart_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `fk_customer_id` (`customer_id`),
  CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartinvoice`
--

DROP TABLE IF EXISTS `cartinvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartinvoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `sales_tax` decimal(7,2) DEFAULT NULL,
  `subtotal` decimal(11,2) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `fk_invcart_id` (`cart_id`),
  KEY `fk_invcustomer_id` (`customer_id`),
  CONSTRAINT `fk_invcart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `fk_invcustomer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartinvoice`
--

LOCK TABLES `cartinvoice` WRITE;
/*!40000 ALTER TABLE `cartinvoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartinvoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(70) DEFAULT NULL,
  `customer_address` varchar(255) DEFAULT NULL,
  `type_of_business` int(11) DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `cust_email` varchar(70) DEFAULT NULL,
  `cust_pass` varchar(255) DEFAULT NULL,
  `payment_info` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `equip_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `equip_item_name` varchar(70) DEFAULT NULL,
  `equip_item_details` varchar(255) DEFAULT NULL,
  `equip_item_price` decimal(9,2) DEFAULT NULL,
  `storage_item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`equip_item_id`),
  KEY `fk_storage_item_id` (`storage_item_id`),
  CONSTRAINT `fk_storage_item_id` FOREIGN KEY (`storage_item_id`) REFERENCES `storage` (`storage_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freshproduce`
--

DROP TABLE IF EXISTS `freshproduce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freshproduce` (
  `fresh_prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `fresh_prod_name` varchar(70) DEFAULT NULL,
  `fresh_prod_details` varchar(225) DEFAULT NULL,
  `fresh_prod_price` decimal(9,2) DEFAULT NULL,
  `fresh_prod_quantity` int(10) unsigned DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `add_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `storage_item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`fresh_prod_id`),
  KEY `fk_fpstorage_item_id` (`storage_item_id`),
  CONSTRAINT `fk_fpstorage_item_id` FOREIGN KEY (`storage_item_id`) REFERENCES `storage` (`storage_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freshproduce`
--

LOCK TABLES `freshproduce` WRITE;
/*!40000 ALTER TABLE `freshproduce` DISABLE KEYS */;
/*!40000 ALTER TABLE `freshproduce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `inventory_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `iventory_item_name` varchar(70) DEFAULT NULL,
  `inventory_name_details` varchar(225) DEFAULT NULL,
  `inventory_item_price` decimal(9,2) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  PRIMARY KEY (`inventory_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replenishes`
--

DROP TABLE IF EXISTS `replenishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replenishes` (
  `fresh_prod_id` int(11) DEFAULT NULL,
  `inventory_item_id` int(11) DEFAULT NULL,
  `replen_date` date DEFAULT NULL,
  KEY `fk_freshpreplenish_id` (`fresh_prod_id`),
  KEY `fk_inventoryreplen_id` (`inventory_item_id`),
  CONSTRAINT `fk_freshpreplenish_id` FOREIGN KEY (`fresh_prod_id`) REFERENCES `freshproduce` (`fresh_prod_id`),
  CONSTRAINT `fk_inventoryreplen_id` FOREIGN KEY (`inventory_item_id`) REFERENCES `inventory` (`inventory_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replenishes`
--

LOCK TABLES `replenishes` WRITE;
/*!40000 ALTER TABLE `replenishes` DISABLE KEYS */;
/*!40000 ALTER TABLE `replenishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage` (
  `storage_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_item_type` varchar(70) DEFAULT NULL,
  `add_date` date DEFAULT NULL,
  PRIMARY KEY (`storage_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
INSERT INTO `storage` VALUES (1,'equipment','2020-01-01'),(2,'fresh produce','2020-01-10'),(3,'fresh produce','2020-02-01'),(4,'fresh produce','2020-01-24'),(5,'equipment','2020-01-24'),(6,'equipment','2020-10-20'),(7,'equipment','2020-07-03'),(8,'fresh produce','2020-05-17'),(9,'fresh produce','2020-05-19'),(10,'fresh produce','2020-05-25');
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(70) DEFAULT NULL,
  `user_email` varchar(225) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_role` tinyint(1) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `termin_date` date DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-05 20:29:44
