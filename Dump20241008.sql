CREATE DATABASE  IF NOT EXISTS `CandyShop` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `CandyShop`;
-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: CandyShop
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `idcargo` int NOT NULL,
  `nomeCargo` varchar(45) NOT NULL,
  `salario_idsalario` int NOT NULL,
  PRIMARY KEY (`idcargo`),
  KEY `fk_cargo_salario1_idx` (`salario_idsalario`),
  CONSTRAINT `fk_cargo_salario1` FOREIGN KEY (`salario_idsalario`) REFERENCES `salario` (`idsalario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Gerente',2),(2,'Vendedor',1),(3,'Estoquista',1);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `pessoa_idpessoa` int NOT NULL,
  `dataCadastro` date NOT NULL,
  `status_idstatus` int NOT NULL,
  PRIMARY KEY (`pessoa_idpessoa`),
  KEY `fk_cliente_status1_idx` (`status_idstatus`),
  CONSTRAINT `fk_cliente_pessoa1` FOREIGN KEY (`pessoa_idpessoa`) REFERENCES `pessoa` (`idpessoa`),
  CONSTRAINT `fk_cliente_status1` FOREIGN KEY (`status_idstatus`) REFERENCES `status` (`idstatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'2024-01-10',1),(2,'2024-01-12',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comissao`
--

DROP TABLE IF EXISTS `comissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comissao` (
  `idcomissao` int NOT NULL,
  `porcentagemComissao` double NOT NULL,
  `dataComissao` date NOT NULL,
  PRIMARY KEY (`idcomissao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comissao`
--

LOCK TABLES `comissao` WRITE;
/*!40000 ALTER TABLE `comissao` DISABLE KEYS */;
INSERT INTO `comissao` VALUES (1,5,'2024-01-01'),(2,10,'2024-01-01');
/*!40000 ALTER TABLE `comissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `pessoa_idpessoa` int NOT NULL,
  `cargo_idcargo` int NOT NULL,
  `obs` varchar(45) DEFAULT NULL,
  `status_idstatus` int NOT NULL,
  `comissao_idcomissao` int NOT NULL,
  PRIMARY KEY (`pessoa_idpessoa`),
  KEY `fk_funcionario_cargo1_idx` (`cargo_idcargo`),
  KEY `fk_funcionario_status1_idx` (`status_idstatus`),
  KEY `fk_funcionario_comissao1_idx` (`comissao_idcomissao`),
  CONSTRAINT `fk_funcionario_cargo1` FOREIGN KEY (`cargo_idcargo`) REFERENCES `cargo` (`idcargo`),
  CONSTRAINT `fk_funcionario_comissao1` FOREIGN KEY (`comissao_idcomissao`) REFERENCES `comissao` (`idcomissao`),
  CONSTRAINT `fk_funcionario_pessoa1` FOREIGN KEY (`pessoa_idpessoa`) REFERENCES `pessoa` (`idpessoa`),
  CONSTRAINT `fk_funcionario_status1` FOREIGN KEY (`status_idstatus`) REFERENCES `status` (`idstatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,1,'Gerente de loja',1,1),(2,2,'Vendedor de doces',1,2);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL,
  `dataPedido` date NOT NULL,
  `cliente_pessoa_idpessoa` int NOT NULL,
  `funcionario_pessoa_idpessoa` int NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_pedido_cliente1_idx` (`cliente_pessoa_idpessoa`),
  KEY `fk_pedido_funcionario1_idx` (`funcionario_pessoa_idpessoa`),
  CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`cliente_pessoa_idpessoa`) REFERENCES `cliente` (`pessoa_idpessoa`),
  CONSTRAINT `fk_pedido_funcionario1` FOREIGN KEY (`funcionario_pessoa_idpessoa`) REFERENCES `funcionario` (`pessoa_idpessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2024-01-15',1,2),(2,'2024-01-16',2,2);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_has_produto`
--

DROP TABLE IF EXISTS `pedido_has_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_has_produto` (
  `pedido_idPedido` int NOT NULL,
  `produto_idProduto` int NOT NULL,
  `quantidadeProdutoPedido` int NOT NULL,
  `deconto_unitario` double NOT NULL,
  PRIMARY KEY (`pedido_idPedido`,`produto_idProduto`),
  KEY `fk_pedido_has_produto_produto1_idx` (`produto_idProduto`),
  KEY `fk_pedido_has_produto_pedido1_idx` (`pedido_idPedido`),
  CONSTRAINT `fk_pedido_has_produto_pedido1` FOREIGN KEY (`pedido_idPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `fk_pedido_has_produto_produto1` FOREIGN KEY (`produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_has_produto`
--

LOCK TABLES `pedido_has_produto` WRITE;
/*!40000 ALTER TABLE `pedido_has_produto` DISABLE KEYS */;
INSERT INTO `pedido_has_produto` VALUES (1,1,10,2.5),(1,2,5,1),(2,1,20,2.5),(2,3,15,3);
/*!40000 ALTER TABLE `pedido_has_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `idpessoa` int NOT NULL,
  `nome_pessoa` varchar(45) NOT NULL,
  PRIMARY KEY (`idpessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'João Silva'),(2,'Maria Oliveira'),(3,'Carlos Santos');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precoProduto`
--

DROP TABLE IF EXISTS `precoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precoProduto` (
  `produto_idProduto` int NOT NULL,
  `dataPreco` date NOT NULL,
  `precoProduto` double NOT NULL,
  PRIMARY KEY (`produto_idProduto`),
  CONSTRAINT `fk_precoProduto_produto1` FOREIGN KEY (`produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precoProduto`
--

LOCK TABLES `precoProduto` WRITE;
/*!40000 ALTER TABLE `precoProduto` DISABLE KEYS */;
INSERT INTO `precoProduto` VALUES (1,'2024-01-01',25),(2,'2024-01-01',1.5),(3,'2024-01-01',3);
/*!40000 ALTER TABLE `precoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL,
  `nomeProduto` varchar(45) NOT NULL,
  `quantidadeEstoque` int NOT NULL,
  `status_idstatus` int NOT NULL,
  `unidadeKG` int NOT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `fk_produto_status1_idx` (`status_idstatus`),
  CONSTRAINT `fk_produto_status1` FOREIGN KEY (`status_idstatus`) REFERENCES `status` (`idstatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Chocolate',100,1,1),(2,'Balas',200,1,1),(3,'Guloseimas',150,1,1);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salario`
--

DROP TABLE IF EXISTS `salario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salario` (
  `idsalario` int NOT NULL,
  `valorSalario` double NOT NULL,
  `dataSalario` date NOT NULL,
  PRIMARY KEY (`idsalario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salario`
--

LOCK TABLES `salario` WRITE;
/*!40000 ALTER TABLE `salario` DISABLE KEYS */;
INSERT INTO `salario` VALUES (1,1500,'2024-01-01'),(2,2000,'2024-01-01'),(3,2500,'2024-01-01');
/*!40000 ALTER TABLE `salario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `idstatus` int NOT NULL,
  `nomeStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idstatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Ativo'),(2,'Inativo'),(3,'Suspenso');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'CandyShop'
--

--
-- Dumping routines for database 'CandyShop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-08  8:57:46
