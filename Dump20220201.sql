CREATE DATABASE  IF NOT EXISTS `blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `blog`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: blog
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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `IdCategoria` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `CAtegoriaSuperior` int DEFAULT NULL,
  PRIMARY KEY (`IdCategoria`),
  KEY `CAtegoriaSuperior` (`CAtegoriaSuperior`),
  CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`CAtegoriaSuperior`) REFERENCES `categoria` (`IdCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `IdComentario` int NOT NULL AUTO_INCREMENT,
  `Comentario` varchar(500) NOT NULL,
  `IdPost` int NOT NULL,
  `IdUsuario` int NOT NULL,
  `Fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `Respuesta` int DEFAULT NULL,
  PRIMARY KEY (`IdComentario`),
  KEY `IdPost` (`IdPost`),
  KEY `IdUsuario` (`IdUsuario`),
  KEY `Respuesta` (`Respuesta`),
  CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`IdPost`) REFERENCES `post` (`IdPost`),
  CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`),
  CONSTRAINT `comentario_ibfk_3` FOREIGN KEY (`Respuesta`) REFERENCES `comentario` (`IdComentario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenido`
--

DROP TABLE IF EXISTS `contenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenido` (
  `IdContenido` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(50) NOT NULL,
  `Contenido` varchar(250) NOT NULL,
  `IdPost` int NOT NULL,
  PRIMARY KEY (`IdContenido`),
  KEY `IdPost` (`IdPost`),
  CONSTRAINT `contenido_ibfk_1` FOREIGN KEY (`IdPost`) REFERENCES `post` (`IdPost`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenido`
--

LOCK TABLES `contenido` WRITE;
/*!40000 ALTER TABLE `contenido` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo` (
  `IdGrupo` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_permiso`
--

DROP TABLE IF EXISTS `grupo_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_permiso` (
  `IdGrupo` int NOT NULL,
  `IdPermiso` int NOT NULL,
  KEY `IdGrupo` (`IdGrupo`),
  KEY `IdPermiso` (`IdPermiso`),
  CONSTRAINT `grupo_permiso_ibfk_1` FOREIGN KEY (`IdGrupo`) REFERENCES `grupo` (`IdGrupo`),
  CONSTRAINT `grupo_permiso_ibfk_2` FOREIGN KEY (`IdPermiso`) REFERENCES `permiso` (`IdPermiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_permiso`
--

LOCK TABLES `grupo_permiso` WRITE;
/*!40000 ALTER TABLE `grupo_permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permiso` (
  `IdPermiso` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdPermiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `IdPost` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) NOT NULL,
  `Slug` varchar(75) NOT NULL,
  `Extracto` varchar(50) NOT NULL,
  `IdUsuario` int NOT NULL,
  `Categoria` int NOT NULL,
  `ImagenDestacada` varchar(255) DEFAULT NULL,
  `Tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`IdPost`),
  KEY `Categoria` (`Categoria`),
  KEY `IdUsuario` (`IdUsuario`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`Categoria`) REFERENCES `categoria` (`IdCategoria`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_metadata`
--

DROP TABLE IF EXISTS `post_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_metadata` (
  `IdPostMetadata` int NOT NULL AUTO_INCREMENT,
  `Clave` varchar(500) NOT NULL,
  `Valor` varchar(500) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `IdPost` int NOT NULL,
  PRIMARY KEY (`IdPostMetadata`),
  KEY `IdPost` (`IdPost`),
  CONSTRAINT `post_metadata_ibfk_1` FOREIGN KEY (`IdPost`) REFERENCES `post` (`IdPost`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_metadata`
--

LOCK TABLES `post_metadata` WRITE;
/*!40000 ALTER TABLE `post_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `IdUsuario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Contrasena` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `IdGrupo` int NOT NULL,
  PRIMARY KEY (`IdUsuario`),
  UNIQUE KEY `Correo` (`Correo`),
  KEY `IdGrupo` (`IdGrupo`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`IdGrupo`) REFERENCES `grupo` (`IdGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_metadata`
--

DROP TABLE IF EXISTS `usuario_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_metadata` (
  `IdUsuarioMetadata` int NOT NULL AUTO_INCREMENT,
  `IdUsuario` int NOT NULL,
  `Clave` varchar(500) NOT NULL,
  `Valor` varchar(500) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`IdUsuarioMetadata`),
  KEY `IdUsuario` (`IdUsuario`),
  CONSTRAINT `usuario_metadata_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_metadata`
--

LOCK TABLES `usuario_metadata` WRITE;
/*!40000 ALTER TABLE `usuario_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_metadata` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-01 19:19:07
