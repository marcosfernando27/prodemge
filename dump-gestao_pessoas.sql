-- MySQL dump 10.13  Distrib 8.3.0, for macos12.6 (arm64)
--
-- Host: localhost    Database: gestao_pessoas
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `enderecos`
--

DROP TABLE IF EXISTS `enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecos` (
  `id_endereco` int unsigned NOT NULL AUTO_INCREMENT,
  `cep` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logradouro` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complemento` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `historico` tinyint(1) DEFAULT NULL,
  `pessoa_id` int unsigned NOT NULL,
  `tipo_endereco_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `enderecos_pessoa_id_index` (`pessoa_id`),
  KEY `enderecos_tipo_endereco_id_index` (`tipo_endereco_id`),
  CONSTRAINT `enderecos_pessoa_id_foreign` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoas` (`id_pessoa`),
  CONSTRAINT `enderecos_tipo_endereco_id_foreign` FOREIGN KEY (`tipo_endereco_id`) REFERENCES `tipos_enderecos` (`id_tipo_endereco`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecos`
--

LOCK TABLES `enderecos` WRITE;
/*!40000 ALTER TABLE `enderecos` DISABLE KEYS */;
INSERT INTO `enderecos` VALUES (18,'15785000','Rua Antônio Carlos de Almeida','352','34234','Orestes Borges','Santa Clara d\'Oeste','SP',1,1,1,'2024-07-21 03:51:11','2024-07-21 05:08:14'),(19,'15785000','Rua Antônio Carlos de Almeida','352','34234','Orestes Borges','Santa Clara d\'Oeste','SP',1,2,1,'2024-07-21 03:51:23','2024-07-21 05:04:19'),(20,'15785000','Rua Antônio Carlos de Almeida','352','34234','Orestes Borges','Santa Clara d\'Oeste','SP',1,2,1,'2024-07-21 03:51:56','2024-07-21 05:04:19'),(21,'15785000','Rua Antônio Carlos de Almeida','3523234','34234','Orestes Borges','Santa Clara d\'Oeste','SP',1,1,1,'2024-07-21 03:52:02','2024-07-21 05:08:14'),(22,'15785000','Rua Antônio Carlos de Almeida','3523234','34234','Orestes Borges','Santa Clara d\'Oeste','SP',1,1,2,'2024-07-21 03:52:17','2024-07-21 05:08:14'),(23,'15785000','Rua Antônio Carlos de Almeida','352','34234','Orestes Borges','Santa Clara d\'Oeste','SP',1,2,2,'2024-07-21 03:52:28','2024-07-21 05:04:19'),(24,'949495','Rua Antônio Carlos de Almeida','3523234','34234','Orestes Borges','Santa Clara d\'Oeste','SP',1,1,1,'2024-07-21 03:52:51','2024-07-21 05:08:14'),(25,'949495','Rua Antônio Carlos de Almeida','3523234','34234','Orestes Borges','Santa Clara d\'Oeste','SP',1,1,1,'2024-07-21 03:53:42','2024-07-21 05:08:14'),(26,'949495','Rua Antônio Carlos de Almeida','3523234','34234','Orestes Borges','Santa Clara d\'Oeste','SP',1,1,1,'2024-07-21 03:53:58','2024-07-21 05:08:14'),(27,'949495','Rua Antônio Carlos de Almeida','3523234','34234','Orestes Borges','Santa Clara d\'Oeste','SP',1,1,1,'2024-07-21 03:54:34','2024-07-21 05:08:14'),(28,'949495','Rua Antônio Carlos de Almeida','3523234','34234','Orestes Borges','Santa Clara d\'Oeste','SP',1,1,1,'2024-07-21 03:55:23','2024-07-21 05:08:14'),(29,'15785000','Rua Antônio Carlos de Almeida','352','34234','Orestes Borges','Santa Clara d\'Oeste','SP',1,2,2,'2024-07-21 03:55:32','2024-07-21 05:04:19'),(30,'949495','Rua Antônio Carlos de Almeida','3523234','34234','Orestes Borges','Santa Clara d\'Oeste','SP',1,1,2,'2024-07-21 03:55:43','2024-07-21 05:08:14'),(31,'01001000','Praça da Sé','32','lado ímpar','Sé','São Paulo','SP',0,3,1,'2024-07-21 04:58:50','2024-07-21 04:58:50'),(32,'01001000','Praça da Sé','3523234','lado ímpar','Sé','São Paulo','SP',1,1,2,'2024-07-21 05:00:51','2024-07-21 05:08:14'),(33,'01001000','Praça da Sé','sem','lado ímpar','Sé','São Paulo','SP',1,1,2,'2024-07-21 05:01:23','2024-07-21 05:08:14'),(34,'15775000','Rua Antônio Carlos de Almeida','352','casa','Orestes Borges','Santa Fé do Sul','SP',0,2,2,'2024-07-21 05:04:19','2024-07-21 05:04:19'),(35,'01001000','Praça da Sé','sem','lado ímpar','Sé','São Paulo','SP',0,1,2,'2024-07-21 05:08:14','2024-07-21 05:08:14');
/*!40000 ALTER TABLE `enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2024_07_20_165836_create_pessoas_table',1),(6,'2024_07_20_165837_create_pessoas_table',2),(7,'2024_07_20_165838_create_pessoas_table',3),(8,'2024_07_20_211853_create_enderecos_table',4),(9,'2024_07_20_224657_create_tipos_enderecos_table',5),(10,'2024_07_20_165839_create_pessoas_table',6),(11,'2024_07_20_165840_create_pessoas_table',7),(12,'2024_07_20_165841_create_pessoas_table',8),(13,'2024_07_20_211859_create_enderecos_table',9),(14,'2024_07_20_211860_create_enderecos_table',10),(15,'2024_07_20_211861_create_enderecos_table',11);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoas` (
  `id_pessoa` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nome_social` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_pai` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_mae` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas`
--

LOCK TABLES `pessoas` WRITE;
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
INSERT INTO `pessoas` VALUES (1,'Marcos Fernando Schiavinatti','Marcos Fernando Schiavinatti','1796098049','Marcos Fernando Schiavinatti','Marcos Fernando Schiavinatti','1796098049','123123123123123','2024-07-21 02:07:21','2024-07-21 02:07:21'),(2,'Raquel Rodrigues de Oliveira','Raquel Rodrigues de Oliveira','54657657657','Marcos Fernando Schiavinatti','Marcos Fernando Schiavinatti','1796098049','marcosfernando7@gmail.com','2024-07-21 03:29:47','2024-07-21 03:29:47'),(3,'Maria Aparecida Marangão','Maria Aparecida Marangão','53465654675','Marcos Fernando Schiavinatti','Marcos Fernando Schiavinatti','1796098049','marcosfernando7@gmail.com','2024-07-21 04:48:39','2024-07-21 04:48:39');
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_enderecos`
--

DROP TABLE IF EXISTS `tipos_enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_enderecos` (
  `id_tipo_endereco` int unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_endereco`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_enderecos`
--

LOCK TABLES `tipos_enderecos` WRITE;
/*!40000 ALTER TABLE `tipos_enderecos` DISABLE KEYS */;
INSERT INTO `tipos_enderecos` VALUES (1,'Residencial',NULL,NULL),(2,'Comercial',NULL,NULL);
/*!40000 ALTER TABLE `tipos_enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gestao_pessoas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-20 23:29:39
