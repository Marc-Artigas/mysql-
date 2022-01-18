-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: youtube
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
-- Table structure for table `canal`
--

DROP TABLE IF EXISTS `canal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canal` (
  `idcanal` int NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `descripcio` varchar(45) DEFAULT NULL,
  `data_creacio` varchar(45) DEFAULT NULL,
  `canalcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcanal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canal`
--

LOCK TABLES `canal` WRITE;
/*!40000 ALTER TABLE `canal` DISABLE KEYS */;
/*!40000 ALTER TABLE `canal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentaris`
--

DROP TABLE IF EXISTS `comentaris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentaris` (
  `idcomentaris` int NOT NULL,
  `text` varchar(100) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `usuari_idusuari` int NOT NULL,
  PRIMARY KEY (`idcomentaris`),
  KEY `fk_comentaris_usuari1_idx` (`usuari_idusuari`),
  CONSTRAINT `fk_comentaris_usuari1` FOREIGN KEY (`usuari_idusuari`) REFERENCES `usuari` (`idusuari`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentaris`
--

LOCK TABLES `comentaris` WRITE;
/*!40000 ALTER TABLE `comentaris` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentaris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estats`
--

DROP TABLE IF EXISTS `estats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estats` (
  `idestats` int NOT NULL,
  `estat` varchar(45) NOT NULL,
  PRIMARY KEY (`idestats`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estats`
--

LOCK TABLES `estats` WRITE;
/*!40000 ALTER TABLE `estats` DISABLE KEYS */;
/*!40000 ALTER TABLE `estats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiquetes`
--

DROP TABLE IF EXISTS `etiquetes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiquetes` (
  `idetiquetes` int NOT NULL,
  `nom` varchar(45) NOT NULL,
  PRIMARY KEY (`idetiquetes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiquetes`
--

LOCK TABLES `etiquetes` WRITE;
/*!40000 ALTER TABLE `etiquetes` DISABLE KEYS */;
/*!40000 ALTER TABLE `etiquetes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `idplaylists` int NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `data_creacio` date DEFAULT NULL,
  `estat` enum('publica','privada') DEFAULT NULL,
  `usuari_idusuari` int NOT NULL,
  PRIMARY KEY (`idplaylists`),
  KEY `fk_playlists_usuari1_idx` (`usuari_idusuari`),
  CONSTRAINT `fk_playlists_usuari1` FOREIGN KEY (`usuari_idusuari`) REFERENCES `usuari` (`idusuari`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists_has_videos`
--

DROP TABLE IF EXISTS `playlists_has_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists_has_videos` (
  `playlists_idplaylists` int NOT NULL,
  `videos_idvideos` int NOT NULL,
  PRIMARY KEY (`playlists_idplaylists`,`videos_idvideos`),
  KEY `fk_playlists_has_videos_videos1_idx` (`videos_idvideos`),
  KEY `fk_playlists_has_videos_playlists1_idx` (`playlists_idplaylists`),
  CONSTRAINT `fk_playlists_has_videos_playlists1` FOREIGN KEY (`playlists_idplaylists`) REFERENCES `playlists` (`idplaylists`),
  CONSTRAINT `fk_playlists_has_videos_videos1` FOREIGN KEY (`videos_idvideos`) REFERENCES `videos` (`idvideos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists_has_videos`
--

LOCK TABLES `playlists_has_videos` WRITE;
/*!40000 ALTER TABLE `playlists_has_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlists_has_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registre_like_dislike_comments`
--

DROP TABLE IF EXISTS `registre_like_dislike_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registre_like_dislike_comments` (
  `idregistre_like_dislike_comments` int NOT NULL,
  `data_hora` datetime DEFAULT NULL,
  `like_dislike` enum('LIKE','DISLIKE') DEFAULT NULL,
  `usuari_idusuari` int NOT NULL,
  `comentaris_idcomentaris` int NOT NULL,
  PRIMARY KEY (`idregistre_like_dislike_comments`),
  KEY `fk_registre_like_dislike_comments_usuari1_idx` (`usuari_idusuari`),
  KEY `fk_registre_like_dislike_comments_comentaris1_idx` (`comentaris_idcomentaris`),
  CONSTRAINT `fk_registre_like_dislike_comments_comentaris1` FOREIGN KEY (`comentaris_idcomentaris`) REFERENCES `comentaris` (`idcomentaris`),
  CONSTRAINT `fk_registre_like_dislike_comments_usuari1` FOREIGN KEY (`usuari_idusuari`) REFERENCES `usuari` (`idusuari`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registre_like_dislike_comments`
--

LOCK TABLES `registre_like_dislike_comments` WRITE;
/*!40000 ALTER TABLE `registre_like_dislike_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `registre_like_dislike_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registre_likes_dislikes`
--

DROP TABLE IF EXISTS `registre_likes_dislikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registre_likes_dislikes` (
  `idregistre_likes_dislikes` int NOT NULL,
  `data_hora` datetime NOT NULL,
  `usuari_idusuari` int NOT NULL,
  `videos_idvideos` int NOT NULL,
  PRIMARY KEY (`idregistre_likes_dislikes`),
  KEY `fk_registre_likes_dislikes_usuari1_idx` (`usuari_idusuari`),
  KEY `fk_registre_likes_dislikes_videos1_idx` (`videos_idvideos`),
  CONSTRAINT `fk_registre_likes_dislikes_usuari1` FOREIGN KEY (`usuari_idusuari`) REFERENCES `usuari` (`idusuari`),
  CONSTRAINT `fk_registre_likes_dislikes_videos1` FOREIGN KEY (`videos_idvideos`) REFERENCES `videos` (`idvideos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registre_likes_dislikes`
--

LOCK TABLES `registre_likes_dislikes` WRITE;
/*!40000 ALTER TABLE `registre_likes_dislikes` DISABLE KEYS */;
/*!40000 ALTER TABLE `registre_likes_dislikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscripcions`
--

DROP TABLE IF EXISTS `subscripcions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscripcions` (
  `idsubscripcions` int NOT NULL,
  `usuari_idusuari` int NOT NULL,
  `canal_idcanal` int NOT NULL,
  PRIMARY KEY (`idsubscripcions`),
  KEY `fk_subscripcions_usuari1_idx` (`usuari_idusuari`),
  KEY `fk_subscripcions_canal1_idx` (`canal_idcanal`),
  CONSTRAINT `fk_subscripcions_canal1` FOREIGN KEY (`canal_idcanal`) REFERENCES `canal` (`idcanal`),
  CONSTRAINT `fk_subscripcions_usuari1` FOREIGN KEY (`usuari_idusuari`) REFERENCES `usuari` (`idusuari`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscripcions`
--

LOCK TABLES `subscripcions` WRITE;
/*!40000 ALTER TABLE `subscripcions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscripcions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuari`
--

DROP TABLE IF EXISTS `usuari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuari` (
  `idusuari` int NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `nom_usuari` varchar(45) NOT NULL,
  `data_naixement` date DEFAULT NULL,
  `sexe` enum('M','F') DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `codi_postal` int DEFAULT NULL,
  `canal_idcanal_creat` int DEFAULT NULL,
  PRIMARY KEY (`idusuari`),
  KEY `fk_usuari_canal1_idx` (`canal_idcanal_creat`),
  CONSTRAINT `fk_usuari_canal1` FOREIGN KEY (`canal_idcanal_creat`) REFERENCES `canal` (`idcanal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuari`
--

LOCK TABLES `usuari` WRITE;
/*!40000 ALTER TABLE `usuari` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `idvideos` int NOT NULL,
  `titol` varchar(45) NOT NULL,
  `descripcio` varchar(100) DEFAULT NULL,
  `grandaria` varchar(45) DEFAULT NULL,
  `nom_arxiu` varchar(45) DEFAULT NULL,
  `durada` time DEFAULT NULL,
  `thumbnail` tinyblob,
  `nombre_reproduccions` int DEFAULT NULL,
  `nombre_likes` int DEFAULT NULL,
  `nombre_dislikes` int DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `usuari_idusuari` int NOT NULL,
  `estats_idestats` int NOT NULL,
  PRIMARY KEY (`idvideos`),
  KEY `fk_videos_usuari_idx` (`usuari_idusuari`),
  KEY `fk_videos_estats1_idx` (`estats_idestats`),
  CONSTRAINT `fk_videos_estats1` FOREIGN KEY (`estats_idestats`) REFERENCES `estats` (`idestats`),
  CONSTRAINT `fk_videos_usuari` FOREIGN KEY (`usuari_idusuari`) REFERENCES `usuari` (`idusuari`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos_has_etiquetes`
--

DROP TABLE IF EXISTS `videos_has_etiquetes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos_has_etiquetes` (
  `videos_idvideos` int NOT NULL,
  `etiquetes_idetiquetes` int NOT NULL,
  PRIMARY KEY (`videos_idvideos`,`etiquetes_idetiquetes`),
  KEY `fk_videos_has_etiquetes_etiquetes1_idx` (`etiquetes_idetiquetes`),
  KEY `fk_videos_has_etiquetes_videos1_idx` (`videos_idvideos`),
  CONSTRAINT `fk_videos_has_etiquetes_etiquetes1` FOREIGN KEY (`etiquetes_idetiquetes`) REFERENCES `etiquetes` (`idetiquetes`),
  CONSTRAINT `fk_videos_has_etiquetes_videos1` FOREIGN KEY (`videos_idvideos`) REFERENCES `videos` (`idvideos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos_has_etiquetes`
--

LOCK TABLES `videos_has_etiquetes` WRITE;
/*!40000 ALTER TABLE `videos_has_etiquetes` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos_has_etiquetes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-18 19:08:22
