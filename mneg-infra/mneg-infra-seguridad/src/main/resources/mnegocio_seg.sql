-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mnegocio_seg
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
-- Table structure for table `acl_class`
--

DROP TABLE IF EXISTS `acl_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(100) NOT NULL COMMENT 'Aqui se debe colocar el nombre calificado de una clase, ya que estamos usando la implementación default de ACL''s de Spring.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `acl_class_class_key` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Catálogo de clases cuyas instancias se quieren asegurar.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_class`
--

LOCK TABLES `acl_class` WRITE;
/*!40000 ALTER TABLE `acl_class` DISABLE KEYS */;
INSERT INTO `acl_class` VALUES (1,'com.mx.mneg.infra.modelo.ModuloMenu'),(2,'com.mx.mneg.infra.modelo.OpcionMenu');
/*!40000 ALTER TABLE `acl_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_entry`
--

DROP TABLE IF EXISTS `acl_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ace_order` int(11) NOT NULL,
  `audit_failure` tinyint(1) NOT NULL,
  `audit_success` tinyint(1) NOT NULL,
  `granting` tinyint(1) NOT NULL COMMENT 'Indica si se está cediendo o denegando el permiso.',
  `mask` int(11) NOT NULL COMMENT 'Puede tomar los valores: 1-Read,2-Write,4-Create,8-Delete,16-Administer.',
  `acl_object_identity` int(11) NOT NULL COMMENT 'La referencia al objeto que se está asegurando.',
  `sid` int(11) NOT NULL COMMENT 'El sid al cual se le asigna el permiso.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `acl_entry_acl_object_identity_key` (`acl_object_identity`,`ace_order`),
  KEY `fk_acl_entry_acl_sid` (`sid`),
  CONSTRAINT `fk_acl_entry_acl_object_identity` FOREIGN KEY (`acl_object_identity`) REFERENCES `acl_object_identity` (`id`),
  CONSTRAINT `fk_acl_entry_acl_sid` FOREIGN KEY (`sid`) REFERENCES `acl_sid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='Cada entrada representa un permiso a un objeto.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_entry`
--

LOCK TABLES `acl_entry` WRITE;
/*!40000 ALTER TABLE `acl_entry` DISABLE KEYS */;
INSERT INTO `acl_entry` VALUES (1,1,1,1,1,1,1,3),(2,1,1,1,1,1,2,3),(3,1,1,1,1,1,3,3),(4,2,1,1,1,1,1,1),(5,2,1,1,1,1,2,1),(6,2,1,1,0,1,3,1),(7,3,1,1,1,1,1,2),(8,3,1,1,0,1,2,2),(9,3,1,1,0,1,3,2);
/*!40000 ALTER TABLE `acl_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_object_identity`
--

DROP TABLE IF EXISTS `acl_object_identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_object_identity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entries_inheriting` tinyint(1) NOT NULL,
  `object_id_identity` int(11) NOT NULL COMMENT 'El identificador del objeto que se asegura.',
  `object_id_class` int(11) NOT NULL COMMENT 'Referencia al tipo del objeto',
  `parent_object` int(11) DEFAULT NULL,
  `owner_sid` int(11) DEFAULT NULL COMMENT 'Se recomienda que sea el principal de un administrador.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `acl_object_identity_object_id_class_key` (`object_id_class`,`object_id_identity`),
  KEY `fk_acl_object_identity_acl_sid` (`owner_sid`),
  CONSTRAINT `fk_acl_object_identity_acl_class` FOREIGN KEY (`object_id_class`) REFERENCES `acl_class` (`id`),
  CONSTRAINT `fk_acl_object_identity_acl_sid` FOREIGN KEY (`owner_sid`) REFERENCES `acl_sid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Catálogo de objetos a asegurar.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_object_identity`
--

LOCK TABLES `acl_object_identity` WRITE;
/*!40000 ALTER TABLE `acl_object_identity` DISABLE KEYS */;
INSERT INTO `acl_object_identity` VALUES (1,0,6,1,NULL,3),(2,1,10,1,NULL,3),(3,1,11,1,NULL,3);
/*!40000 ALTER TABLE `acl_object_identity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_sid`
--

DROP TABLE IF EXISTS `acl_sid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_sid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `principal` tinyint(1) NOT NULL COMMENT 'Indica (true) si se trata de un principal indiviudal. Típicamente un Usuario. False si es algún rol (authority).',
  `sid` varchar(100) NOT NULL COMMENT 'El identificador de algún usuario (principal). O algún nombre de rol (authority).',
  PRIMARY KEY (`id`),
  UNIQUE KEY `acl_sid_sid_key` (`sid`,`principal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Security identity. P.e. un rol o un principal.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_sid`
--

LOCK TABLES `acl_sid` WRITE;
/*!40000 ALTER TABLE `acl_sid` DISABLE KEYS */;
INSERT INTO `acl_sid` VALUES (3,0,'ROLE_ADMINISTRADOR'),(1,0,'ROLE_USUARIO'),(2,0,'ROLE_USUARIO2');
/*!40000 ALTER TABLE `acl_sid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_opcion_menu`
--

DROP TABLE IF EXISTS `t_opcion_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_opcion_menu` (
  `id_t_opcion` int(11) NOT NULL AUTO_INCREMENT,
  `v_descripcion` varchar(120) NOT NULL,
  `v_opcion` varchar(80) NOT NULL,
  `v_url` varchar(200) DEFAULT NULL,
  `id_t_opcion_padre` int(11) DEFAULT NULL COMMENT 'Referencia a la opción padre.',
  PRIMARY KEY (`id_t_opcion`),
  KEY `fk_t_opcion_padre` (`id_t_opcion_padre`),
  CONSTRAINT `fk_t_opcion_padre` FOREIGN KEY (`id_t_opcion_padre`) REFERENCES `t_opcion_menu` (`id_t_opcion`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COMMENT='Opciones de menú de la aplicación.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_opcion_menu`
--

LOCK TABLES `t_opcion_menu` WRITE;
/*!40000 ALTER TABLE `t_opcion_menu` DISABLE KEYS */;
INSERT INTO `t_opcion_menu` VALUES (1,'Opción 1.1','Opción 1.1',NULL,1),(6,'Módulo 1','Módulo 1',NULL,NULL),(10,'Módulo 2','Módulo 2',NULL,NULL),(11,'Módulo 3','Módulo 3',NULL,NULL);
/*!40000 ALTER TABLE `t_opcion_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_r_usuario_rol`
--

DROP TABLE IF EXISTS `t_r_usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_r_usuario_rol` (
  `id_tr_usuario` int(11) NOT NULL,
  `id_tr_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_tr_usuario`,`id_tr_rol`),
  KEY `t_r_usuario_rol_id_tr_rol_fkey` (`id_tr_rol`),
  CONSTRAINT `t_r_usuario_rol_id_tr_rol_fkey` FOREIGN KEY (`id_tr_rol`) REFERENCES `t_rol_seguridad` (`id_t_rol`),
  CONSTRAINT `t_r_usuario_rol_id_tr_usuario_fkey` FOREIGN KEY (`id_tr_usuario`) REFERENCES `t_usuario_seguridad` (`id_t_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_r_usuario_rol`
--

LOCK TABLES `t_r_usuario_rol` WRITE;
/*!40000 ALTER TABLE `t_r_usuario_rol` DISABLE KEYS */;
INSERT INTO `t_r_usuario_rol` VALUES (2,1),(2,2),(3,2),(1,3);
/*!40000 ALTER TABLE `t_r_usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_rol_seguridad`
--

DROP TABLE IF EXISTS `t_rol_seguridad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_rol_seguridad` (
  `id_t_rol` int(11) NOT NULL AUTO_INCREMENT,
  `v_rol` varchar(30) NOT NULL COMMENT 'Debe iniciar siempre con el prefijo ROLE_',
  `l_rol_activo` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Indica si el rol está activo o no.',
  PRIMARY KEY (`id_t_rol`),
  UNIQUE KEY `t_rol_seguridad_v_rol_key` (`v_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Roles de seguridad de la aplicación.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_rol_seguridad`
--

LOCK TABLES `t_rol_seguridad` WRITE;
/*!40000 ALTER TABLE `t_rol_seguridad` DISABLE KEYS */;
INSERT INTO `t_rol_seguridad` VALUES (1,'ROLE_USUARIO',1),(2,'ROLE_USUARIO2',1),(3,'ROLE_ADMINISTRADOR',1);
/*!40000 ALTER TABLE `t_rol_seguridad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_usuario_seguridad`
--

DROP TABLE IF EXISTS `t_usuario_seguridad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_usuario_seguridad` (
  `id_t_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `v_username` varchar(50) NOT NULL,
  `v_password` varchar(25) NOT NULL,
  `v_nombre_usuario` varchar(100) NOT NULL COMMENT 'Nombre completo del usuario.',
  `l_usuario_activo` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Indica si el usuario está activo o no.',
  PRIMARY KEY (`id_t_usuario`),
  UNIQUE KEY `t_usuario_seguridad_v_username_key` (`v_username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Usuarios de la aplicación.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_usuario_seguridad`
--

LOCK TABLES `t_usuario_seguridad` WRITE;
/*!40000 ALTER TABLE `t_usuario_seguridad` DISABLE KEYS */;
INSERT INTO `t_usuario_seguridad` VALUES (1,'pi','pipo','Alejandro Pimentel',1),(2,'usain','bolt','Usain Bolt',1),(3,'pepe','pepe','Pepe el Toro',1);
/*!40000 ALTER TABLE `t_usuario_seguridad` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-09-05 23:48:07
