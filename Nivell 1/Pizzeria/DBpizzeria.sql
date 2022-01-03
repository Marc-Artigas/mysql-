CREATE DATABASE  IF NOT EXISTS `pizzeria` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pizzeria`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pizzeria
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
-- Table structure for table `begudes`
--

DROP TABLE IF EXISTS `begudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `begudes` (
  `id` int NOT NULL,
  `nom` varchar(45) NOT NULL,
  `descripcio` text,
  `imatge` longblob,
  `preu` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `begudes`
--

LOCK TABLES `begudes` WRITE;
/*!40000 ALTER TABLE `begudes` DISABLE KEYS */;
INSERT INTO `begudes` VALUES (1,'Aigua',NULL,NULL,1.80),(2,'Aigua amb gas',NULL,NULL,1.90),(3,'Cervesa',NULL,NULL,2.00);
/*!40000 ALTER TABLE `begudes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `botiga`
--

DROP TABLE IF EXISTS `botiga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `botiga` (
  `id` int NOT NULL,
  `adreça` varchar(45) NOT NULL,
  `codi_postal` int NOT NULL,
  `id_provincia` int NOT NULL,
  `localitat_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_provincia_idx` (`id_provincia`),
  KEY `fk_botiga_localitat1_idx` (`localitat_id`),
  CONSTRAINT `fk_botiga_localitat1` FOREIGN KEY (`localitat_id`) REFERENCES `localitat` (`id`),
  CONSTRAINT `id_provincia` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `botiga`
--

LOCK TABLES `botiga` WRITE;
/*!40000 ALTER TABLE `botiga` DISABLE KEYS */;
INSERT INTO `botiga` VALUES (1,'Trav. de Les corts 140',8028,1,1),(2,'carrer dels Calderers 12',17004,2,3),(3,'Avinguda de Jaume Recoder 85',8301,1,2);
/*!40000 ALTER TABLE `botiga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_pizzes`
--

DROP TABLE IF EXISTS `categoria_pizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_pizzes` (
  `id` int NOT NULL,
  `nom` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_pizzes`
--

LOCK TABLES `categoria_pizzes` WRITE;
/*!40000 ALTER TABLE `categoria_pizzes` DISABLE KEYS */;
INSERT INTO `categoria_pizzes` VALUES (1,'primavera'),(2,'estiu');
/*!40000 ALTER TABLE `categoria_pizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL,
  `nom` varchar(45) NOT NULL,
  `primer_cognom` varchar(45) DEFAULT NULL,
  `segon_cognom` varchar(45) DEFAULT NULL,
  `adreça` varchar(45) DEFAULT NULL,
  `codi_postal` int DEFAULT NULL,
  `telefon` int DEFAULT NULL,
  `localitat_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clients_localitat1_idx` (`localitat_id`),
  CONSTRAINT `fk_clients_localitat1` FOREIGN KEY (`localitat_id`) REFERENCES `localitat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Joan','Garcia','Perez','Trav. de Les corts 131, 3-1',8028,654987123,1),(2,'Marta ','Torres ','Martinez','carrer dels Calderers 6, 1-1',17004,652947358,3),(3,'Pere ','Trias ','Pruna','Avinguda de Jaume Recoder 67, 1-1',8301,617147852,2);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comandes`
--

DROP TABLE IF EXISTS `comandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comandes` (
  `id` int NOT NULL,
  `data_hora_comanda` datetime NOT NULL,
  `tipus_entrega` enum('domicili','botiga') NOT NULL,
  `botiga_id` int NOT NULL,
  `quant_pizzes` int DEFAULT NULL,
  `quant_hamburgueses` int DEFAULT NULL,
  `quant_begudes` int DEFAULT NULL,
  `preu_total` decimal(4,2) NOT NULL,
  `id_client` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_botiga_idx` (`botiga_id`),
  CONSTRAINT `botiga_id` FOREIGN KEY (`botiga_id`) REFERENCES `botiga` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comandes`
--

LOCK TABLES `comandes` WRITE;
/*!40000 ALTER TABLE `comandes` DISABLE KEYS */;
INSERT INTO `comandes` VALUES (1,'2021-12-10 21:15:10','domicili',1,1,1,2,20.00,1),(2,'2021-12-11 21:10:05','botiga',2,2,NULL,2,24.00,2),(3,'2021-12-12 21:05:00','domicili',3,1,3,4,34.00,3);
/*!40000 ALTER TABLE `comandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleats`
--

DROP TABLE IF EXISTS `empleats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleats` (
  `id` int NOT NULL,
  `nom` varchar(45) NOT NULL,
  `primer_cognom` varchar(45) NOT NULL,
  `segon_cognom` varchar(45) NOT NULL,
  `nif` varchar(9) NOT NULL,
  `telefon` int NOT NULL,
  `posicio` enum('cuiner','repartidor') NOT NULL,
  `idbotiga` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_botiga_idx` (`idbotiga`),
  CONSTRAINT `idbotiga` FOREIGN KEY (`idbotiga`) REFERENCES `botiga` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleats`
--

LOCK TABLES `empleats` WRITE;
/*!40000 ALTER TABLE `empleats` DISABLE KEYS */;
INSERT INTO `empleats` VALUES (1,'Carles','Perez','Garcia','35897456P',668974582,'cuiner',1),(2,'Pau','Torres','Puig','45789258Z',651187954,'repartidor',1),(3,'Marta','Martinez','Sanchez','48597825Q',623874895,'cuiner',2),(4,'Joan','Roca','Junyent','48752958O',654879257,'repartidor',2),(5,'Antoni','Fuster','Ribes','47856213P',625784857,'cuiner',3),(6,'Claudia','Freixa','Castells','45879251T',648228534,'repartidor',3);
/*!40000 ALTER TABLE `empleats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hamburgueses`
--

DROP TABLE IF EXISTS `hamburgueses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hamburgueses` (
  `id` int NOT NULL,
  `nom` varchar(45) NOT NULL,
  `descripcio` text,
  `imatge` longblob,
  `preu` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hamburgueses`
--

LOCK TABLES `hamburgueses` WRITE;
/*!40000 ALTER TABLE `hamburgueses` DISABLE KEYS */;
INSERT INTO `hamburgueses` VALUES (1,'clasica',NULL,NULL,8.00),(2,'completa',NULL,NULL,9.00);
/*!40000 ALTER TABLE `hamburgueses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localitat`
--

DROP TABLE IF EXISTS `localitat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localitat` (
  `id` int NOT NULL,
  `nom` varchar(45) NOT NULL,
  `provincia_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_localitat_provincia1_idx` (`provincia_id`),
  CONSTRAINT `fk_localitat_provincia1` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localitat`
--

LOCK TABLES `localitat` WRITE;
/*!40000 ALTER TABLE `localitat` DISABLE KEYS */;
INSERT INTO `localitat` VALUES (1,'Barcelona',1),(2,'Mataro',1),(3,'Girona',2);
/*!40000 ALTER TABLE `localitat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzes`
--

DROP TABLE IF EXISTS `pizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzes` (
  `id` int NOT NULL,
  `nom` varchar(45) NOT NULL,
  `descripcio` text,
  `imatge` longblob,
  `preu` decimal(4,2) NOT NULL,
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categoria_idx` (`id_categoria`),
  CONSTRAINT `id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_pizzes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzes`
--

LOCK TABLES `pizzes` WRITE;
/*!40000 ALTER TABLE `pizzes` DISABLE KEYS */;
INSERT INTO `pizzes` VALUES (1,'margarita',NULL,NULL,8.00,1),(2,'prosciutto','',NULL,9.00,2),(3,'4 estacions',NULL,NULL,7.50,1);
/*!40000 ALTER TABLE `pizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `id` int NOT NULL,
  `nom` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Barcelona'),(2,'Girona');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repartiment_domicili`
--

DROP TABLE IF EXISTS `repartiment_domicili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repartiment_domicili` (
  `id` int NOT NULL,
  `id_empleat` int NOT NULL,
  `data_hora_entrega` datetime NOT NULL,
  `id_comanda` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_empleat_idx` (`id_empleat`),
  KEY `id_comanda_idx` (`id_comanda`),
  CONSTRAINT `id_comanda` FOREIGN KEY (`id_comanda`) REFERENCES `comandes` (`id`),
  CONSTRAINT `id_empleat` FOREIGN KEY (`id_empleat`) REFERENCES `empleats` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repartiment_domicili`
--

LOCK TABLES `repartiment_domicili` WRITE;
/*!40000 ALTER TABLE `repartiment_domicili` DISABLE KEYS */;
INSERT INTO `repartiment_domicili` VALUES (1,2,'2021-12-10 21:40:05',1),(2,4,'2021-12-12 21:30:15',3);
/*!40000 ALTER TABLE `repartiment_domicili` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-03 13:03:39
