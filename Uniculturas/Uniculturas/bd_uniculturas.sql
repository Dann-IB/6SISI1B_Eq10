CREATE DATABASE  IF NOT EXISTS `bd_uniculturas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bd_uniculturas`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_uniculturas
-- ------------------------------------------------------
-- Server version	5.6.47-log

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
-- Table structure for table `cproducto`
--

DROP TABLE IF EXISTS `cproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cproducto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `sku_prod` tinyint(4) NOT NULL,
  `marca_prod` varchar(45) NOT NULL,
  `cant_prod` float NOT NULL,
  `DCompra_id_compra` int(11) NOT NULL,
  `DCompra_EPedido_id_ped` int(11) NOT NULL,
  `MAlmacen_id_alm` int(11) NOT NULL,
  `MTienda_id_Tienda` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`,`DCompra_id_compra`,`DCompra_EPedido_id_ped`),
  KEY `fk_CProducto_DCompra1_idx` (`DCompra_id_compra`,`DCompra_EPedido_id_ped`),
  KEY `fk_CProducto_MAlmacen1_idx` (`MAlmacen_id_alm`),
  KEY `fk_CProducto_MTienda1_idx` (`MTienda_id_Tienda`),
  CONSTRAINT `fk_CProducto_DCompra1` FOREIGN KEY (`DCompra_id_compra`, `DCompra_EPedido_id_ped`) REFERENCES `dcompra` (`id_compra`, `EPedido_id_ped`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CProducto_MAlmacen1` FOREIGN KEY (`MAlmacen_id_alm`) REFERENCES `malmacen` (`id_alm`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CProducto_MTienda1` FOREIGN KEY (`MTienda_id_Tienda`) REFERENCES `mtienda` (`id_Tienda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cproducto`
--

LOCK TABLES `cproducto` WRITE;
/*!40000 ALTER TABLE `cproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `cproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcliente`
--

DROP TABLE IF EXISTS `dcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcliente` (
  `id_cli` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cli` varchar(45) NOT NULL,
  `apppat_cli` varchar(45) NOT NULL,
  `apmat_cli` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcliente`
--

LOCK TABLES `dcliente` WRITE;
/*!40000 ALTER TABLE `dcliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcompra`
--

DROP TABLE IF EXISTS `dcompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcompra` (
  `id_compra` int(11) NOT NULL,
  `fecha_comp` date NOT NULL,
  `EPedido_id_ped` int(11) NOT NULL,
  `MVentas_id_venta` int(11) NOT NULL,
  PRIMARY KEY (`id_compra`,`EPedido_id_ped`),
  KEY `fk_DCompra_EPedido1_idx` (`EPedido_id_ped`),
  KEY `fk_DCompra_MVentas1_idx` (`MVentas_id_venta`),
  CONSTRAINT `fk_DCompra_EPedido1` FOREIGN KEY (`EPedido_id_ped`) REFERENCES `epedido` (`id_ped`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DCompra_MVentas1` FOREIGN KEY (`MVentas_id_venta`) REFERENCES `mventas` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcompra`
--

LOCK TABLES `dcompra` WRITE;
/*!40000 ALTER TABLE `dcompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dpersonal`
--

DROP TABLE IF EXISTS `dpersonal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dpersonal` (
  `id_per` int(11) NOT NULL AUTO_INCREMENT,
  `nom_per` varchar(45) NOT NULL,
  `apppat_per` varchar(45) NOT NULL,
  `appmat_per` varchar(45) NOT NULL,
  `numemp_per` tinyint(4) NOT NULL,
  `edad_per` tinyint(4) NOT NULL,
  `sex_per` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_per`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dpersonal`
--

LOCK TABLES `dpersonal` WRITE;
/*!40000 ALTER TABLE `dpersonal` DISABLE KEYS */;
/*!40000 ALTER TABLE `dpersonal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `epedido`
--

DROP TABLE IF EXISTS `epedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `epedido` (
  `id_ped` int(11) NOT NULL AUTO_INCREMENT,
  `fech_ped` date NOT NULL,
  PRIMARY KEY (`id_ped`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `epedido`
--

LOCK TABLES `epedido` WRITE;
/*!40000 ALTER TABLE `epedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `epedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `malmacen`
--

DROP TABLE IF EXISTS `malmacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `malmacen` (
  `id_alm` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_alm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `malmacen`
--

LOCK TABLES `malmacen` WRITE;
/*!40000 ALTER TABLE `malmacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `malmacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcaja`
--

DROP TABLE IF EXISTS `mcaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mcaja` (
  `id_caja` int(11) NOT NULL AUTO_INCREMENT,
  `Empleado` varchar(45) DEFAULT NULL,
  `Estado` date DEFAULT NULL,
  `MTienda_id_Tienda` int(11) NOT NULL,
  PRIMARY KEY (`id_caja`),
  KEY `fk_MCaja_MTienda1_idx` (`MTienda_id_Tienda`),
  CONSTRAINT `fk_MCaja_MTienda1` FOREIGN KEY (`MTienda_id_Tienda`) REFERENCES `mtienda` (`id_Tienda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcaja`
--

LOCK TABLES `mcaja` WRITE;
/*!40000 ALTER TABLE `mcaja` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcaja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcliente`
--

DROP TABLE IF EXISTS `mcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mcliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `DCliente_id_cli` int(11) NOT NULL,
  `EPedido_id_ped` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente`,`EPedido_id_ped`),
  KEY `fk_MCliente_DCliente1_idx` (`DCliente_id_cli`),
  KEY `fk_MCliente_EPedido1_idx` (`EPedido_id_ped`),
  CONSTRAINT `fk_MCliente_DCliente1` FOREIGN KEY (`DCliente_id_cli`) REFERENCES `dcliente` (`id_cli`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_MCliente_EPedido1` FOREIGN KEY (`EPedido_id_ped`) REFERENCES `epedido` (`id_ped`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcliente`
--

LOCK TABLES `mcliente` WRITE;
/*!40000 ALTER TABLE `mcliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcontabilidad`
--

DROP TABLE IF EXISTS `mcontabilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mcontabilidad` (
  `id_cont` int(11) NOT NULL AUTO_INCREMENT,
  `ventastot_cont` float NOT NULL,
  `facturas_cont` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_cont`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcontabilidad`
--

LOCK TABLES `mcontabilidad` WRITE;
/*!40000 ALTER TABLE `mcontabilidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcontabilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpersonal`
--

DROP TABLE IF EXISTS `mpersonal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mpersonal` (
  `id_per` int(11) NOT NULL AUTO_INCREMENT,
  `DPersonal_id_per` int(11) NOT NULL,
  `MTienda_id_Tienda` int(11) NOT NULL,
  PRIMARY KEY (`id_per`),
  KEY `fk_MPersonal_DPersonal1_idx` (`DPersonal_id_per`),
  KEY `fk_MPersonal_MTienda1_idx` (`MTienda_id_Tienda`),
  CONSTRAINT `fk_MPersonal_DPersonal1` FOREIGN KEY (`DPersonal_id_per`) REFERENCES `dpersonal` (`id_per`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_MPersonal_MTienda1` FOREIGN KEY (`MTienda_id_Tienda`) REFERENCES `mtienda` (`id_Tienda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpersonal`
--

LOCK TABLES `mpersonal` WRITE;
/*!40000 ALTER TABLE `mpersonal` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpersonal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtienda`
--

DROP TABLE IF EXISTS `mtienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mtienda` (
  `id_Tienda` int(11) NOT NULL AUTO_INCREMENT,
  `razsoc_tien` varchar(45) NOT NULL,
  `MContabilidad_id_cont` int(11) NOT NULL,
  PRIMARY KEY (`id_Tienda`),
  KEY `fk_MTienda_MContabilidad1_idx` (`MContabilidad_id_cont`),
  CONSTRAINT `fk_MTienda_MContabilidad1` FOREIGN KEY (`MContabilidad_id_cont`) REFERENCES `mcontabilidad` (`id_cont`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtienda`
--

LOCK TABLES `mtienda` WRITE;
/*!40000 ALTER TABLE `mtienda` DISABLE KEYS */;
/*!40000 ALTER TABLE `mtienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mventas`
--

DROP TABLE IF EXISTS `mventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mventas` (
  `id_venta` int(11) NOT NULL,
  `total_ven` float NOT NULL,
  `fecha_ven` date NOT NULL,
  `MContabilidad_id_cont` int(11) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_MVentas_MContabilidad1_idx` (`MContabilidad_id_cont`),
  CONSTRAINT `fk_MVentas_MContabilidad1` FOREIGN KEY (`MContabilidad_id_cont`) REFERENCES `mcontabilidad` (`id_cont`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mventas`
--

LOCK TABLES `mventas` WRITE;
/*!40000 ALTER TABLE `mventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bd_uniculturas'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_agregar_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_cliente`(
in nombre varchar(45),
in paterno varchar(45),
in materno varchar(45)
)
BEGIN
insert into dcliente
(nom_cli, apppat_cli, apmat_cli) values
(nom_cli = nombre, apppat_cli= paterno, apmat_cli=materno);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_agregar_personal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_personal`(
in persona varchar(45),
in paterno varchar(45), 
in materno varchar(45), 
in numempleado tinyint, 
in edad tinyint,
in sexo tinyint
)
BEGIN
insert into dpersonal
(nom_per, apppat_per, appmat_per, numemp_per, edad_per, sex_per) values
(nom_per = persona, apppat_per = paterno, appmat_per = materno,
numemp_per = numempleado, edad_per=edad, sex_per=sexo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_agregar_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_producto`(
 in codigo tinyint, 
in marca varchar(45),
in cantidad float,
in compra int,
in pedido int,
in almacen int,
in tienda int
)
BEGIN
insert into cproducto
(sku_prod, marca_prod, cant_prod, dcompra_id_compra,
dcompra_epedido_id_ped, malmacen_id_alm, mtienda_id_tienda)
values (sku_prod = codigo, marca_prod = marca, cant_prod = cantidad,
dcompra_id_compra = compra, dcompra_epedido_id_ped = pedido,
malmacen_id_alm= almacen, mtienda_id_tienda= tienda);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_buscar_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_cliente`(
in id int
)
BEGIN
select * from dcliente
where id_cli = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_buscar_personal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_personal`(
in id int
)
BEGIN
select * from dpersonal
where id_per=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_buscar_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_producto`(
in id int
)
BEGIN
select * from cproducto
where id_producto = producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_consultar_pedidos_dia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_pedidos_dia`(
in fecha date
)
BEGIN
select fech_ped as fecha,
count(id_ped) as ventas_totales
from epedido 
where fech_ped=fecha
group by fech_ped; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_empleados_tienda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_empleados_tienda`(
in tienda varchar(45)
)
BEGIN
select * from dpersonal as d
inner join mpersonal as mp
on(d.id_per=mp.dpersonal_id_per)
inner join mtienda as mt
on(mp.mtienda_id_tienda=mt.id_tienda)
where razsoc_tien= tienda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-15  8:40:20
