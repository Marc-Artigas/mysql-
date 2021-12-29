CREATE DATABASE  IF NOT EXISTS `optica` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `optica`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: optica
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `adreça`
--

DROP TABLE IF EXISTS `adreça`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adreça` (
  `id_adreça` int NOT NULL AUTO_INCREMENT,
  `carrer` varchar(45) NOT NULL,
  `numero` int NOT NULL,
  `pis` int DEFAULT NULL,
  `porta` varchar(45) DEFAULT NULL,
  `ciutat` varchar(45) NOT NULL,
  `codi_postal` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  PRIMARY KEY (`id_adreça`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adreça`
--

LOCK TABLES `adreça` WRITE;
/*!40000 ALTER TABLE `adreça` DISABLE KEYS */;
INSERT INTO `adreça` VALUES (1,'Travessera de Les Corts',128,3,'1','Barcelona','08028','Espanya'),(2,'Avinguda Madrid ',213,5,'2','Barcelona','08014','Espanya'),(3,'Carrer Tarragona',76,1,'2','Barcelona','08015','Espanya');
/*!40000 ALTER TABLE `adreça` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `cognom1` varchar(45) NOT NULL,
  `cognom2` varchar(45) DEFAULT NULL,
  `telefon` varchar(45) NOT NULL,
  `correu_electronic` varchar(45) DEFAULT NULL,
  `data_registre` date NOT NULL,
  `recomanat_per_id_client` int DEFAULT NULL,
  `adreça_id_adreça` int NOT NULL,
  PRIMARY KEY (`id_client`),
  KEY `fk_clients_clients1_idx` (`recomanat_per_id_client`),
  KEY `fk_clients_adreça1_idx` (`adreça_id_adreça`),
  CONSTRAINT `fk_clients_adreça1` FOREIGN KEY (`adreça_id_adreça`) REFERENCES `adreça` (`id_adreça`),
  CONSTRAINT `fk_clients_clients1` FOREIGN KEY (`recomanat_per_id_client`) REFERENCES `clients` (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Pere','Garcia','Hernandez','679854128','pgarcia@gmail.com','2021-12-01',NULL,1),(2,'Joan','Terrats','Perez','648795218',NULL,'2021-11-21',NULL,2),(3,'Antoni','Prats','','645821236',NULL,'2021-10-12',1,3);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleats`
--

DROP TABLE IF EXISTS `empleats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleats` (
  `id_empleat` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `cognom1` varchar(45) NOT NULL,
  `cognom2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_empleat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleats`
--

LOCK TABLES `empleats` WRITE;
/*!40000 ALTER TABLE `empleats` DISABLE KEYS */;
INSERT INTO `empleats` VALUES (1,'Jordi','Estrada','Almirall'),(2,'Esteve','Rovira','Perez'),(3,'Marta','Torres','Ferrer');
/*!40000 ALTER TABLE `empleats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `proveidor_id` int NOT NULL,
  PRIMARY KEY (`id_marca`),
  KEY `fk_marca_proveidor1_idx` (`proveidor_id`),
  CONSTRAINT `fk_marca_proveidor1` FOREIGN KEY (`proveidor_id`) REFERENCES `proveïdor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Polaroid',1),(2,'Oakley',2),(3,'Ray-Ban',3);
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveïdor`
--

DROP TABLE IF EXISTS `proveïdor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveïdor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NIF` varchar(9) DEFAULT NULL,
  `nom` varchar(45) NOT NULL,
  `telefon` varchar(45) NOT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `adreça_id_adreça` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NIF_UNIQUE` (`NIF`),
  KEY `fk_proveidor_adreça_idx` (`adreça_id_adreça`),
  CONSTRAINT `fk_proveidor_adreça` FOREIGN KEY (`adreça_id_adreça`) REFERENCES `adreça` (`id_adreça`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveïdor`
--

LOCK TABLES `proveïdor` WRITE;
/*!40000 ALTER TABLE `proveïdor` DISABLE KEYS */;
INSERT INTO `proveïdor` VALUES (1,'42874978P','Òptics','687954179',NULL,1),(2,'39548789O','Òptica','654789256','654789256',2),(3,'36895741O','Optical','645789521',NULL,3);
/*!40000 ALTER TABLE `proveïdor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ulleres`
--

DROP TABLE IF EXISTS `ulleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ulleres` (
  `id_ulleres` int NOT NULL AUTO_INCREMENT,
  `graduacio_v_dreta` decimal(10,2) NOT NULL,
  `graduacio_v_esquerra` decimal(10,2) NOT NULL,
  `tipus_muntura` varchar(45) NOT NULL,
  `color_muntura` varchar(45) NOT NULL,
  `color_vidre` varchar(45) NOT NULL,
  `preu` decimal(10,2) NOT NULL,
  `data_venta` varchar(45) NOT NULL,
  `marca_id_marca` int NOT NULL,
  `empleats_id_empleat` int NOT NULL,
  `clients_id_client` int NOT NULL,
  PRIMARY KEY (`id_ulleres`),
  KEY `fk_ulleres_marca1_idx` (`marca_id_marca`),
  KEY `fk_ulleres_empleats1_idx` (`empleats_id_empleat`),
  KEY `fk_ulleres_clients1_idx` (`clients_id_client`),
  CONSTRAINT `fk_ulleres_clients1` FOREIGN KEY (`clients_id_client`) REFERENCES `clients` (`id_client`),
  CONSTRAINT `fk_ulleres_empleats1` FOREIGN KEY (`empleats_id_empleat`) REFERENCES `empleats` (`id_empleat`),
  CONSTRAINT `fk_ulleres_marca1` FOREIGN KEY (`marca_id_marca`) REFERENCES `marca` (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ulleres`
--

LOCK TABLES `ulleres` WRITE;
/*!40000 ALTER TABLE `ulleres` DISABLE KEYS */;
INSERT INTO `ulleres` VALUES (1,3.25,3.25,'Pasta','Blau','Negre',125.00,'2021-12-27',1,1,1),(2,2.25,3.25,'Flotant','Negre','Negre',100.00,'2021-12-21',2,2,2),(3,1.25,1.50,'Metàl·lica','Gris','Transparent',95.00,'2021-12-20',3,1,1);
/*!40000 ALTER TABLE `ulleres` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-29  8:24:01
