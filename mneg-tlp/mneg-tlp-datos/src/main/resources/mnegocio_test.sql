-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mnegocio_test
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

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
-- Table structure for table `datosCliente`
--

DROP TABLE IF EXISTS `datosCliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datosCliente` (
  `idDatosCliente` int(11) NOT NULL AUTO_INCREMENT,
  `rfc` varchar(45) NOT NULL,
  `razonSocial` varchar(45) DEFAULT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `numExterior` varchar(45) DEFAULT NULL,
  `numInterior` varchar(45) DEFAULT NULL,
  `colonia` varchar(45) DEFAULT NULL,
  `delegacion` varchar(45) DEFAULT NULL,
  `localidad` varchar(45) DEFAULT NULL,
  `entidadFederativa` varchar(45) DEFAULT NULL,
  `codigoPostal` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDatosCliente`),
  UNIQUE KEY `rfc_UNIQUE` (`rfc`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosCliente`
--

LOCK TABLES `datosCliente` WRITE;
/*!40000 ALTER TABLE `datosCliente` DISABLE KEYS */;
INSERT INTO `datosCliente` VALUES (13,'PIRA820426','Alex','Mi calle','74',NULL,'Copilco','Coyoacan','DF','DF',15300);
/*!40000 ALTER TABLE `datosCliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_ejemplo`
--

DROP TABLE IF EXISTS `t_ejemplo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_ejemplo` (
  `id_t_ejemplo` bigint(20) NOT NULL AUTO_INCREMENT,
  `c_nombre` varchar(50) DEFAULT NULL,
  `c_apellido` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_t_ejemplo`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ejemplo`
--

LOCK TABLES `t_ejemplo` WRITE;
/*!40000 ALTER TABLE `t_ejemplo` DISABLE KEYS */;
INSERT INTO `t_ejemplo` VALUES (1,'Alejandro','Pimentel'),(6,'Alex','Pi'),(7,'Alex','Pi'),(16,'Alex','Pi'),(17,'Alex','Pi'),(18,'Alex','Pi'),(23,'Alex','Pi'),(28,'Alex','Pi'),(29,'Alex','Pi');
/*!40000 ALTER TABLE `t_ejemplo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-09-15 19:17:36
