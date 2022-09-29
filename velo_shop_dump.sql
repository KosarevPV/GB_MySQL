-- Интернет-магазин велосипедов, где можно выбирать, приобретать и оставлять рецензии на товар.
--
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: velo_shop
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `bikes`
--

DROP TABLE IF EXISTS `bikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bikes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `gender` enum('f','m','ch') NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `created_at` year NOT NULL,
  `brand_id` bigint unsigned NOT NULL,
  `catigories_id` bigint unsigned NOT NULL,
  `frame_size_id` bigint unsigned NOT NULL,
  `color_id` bigint unsigned NOT NULL,
  `disc_size_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_bikes_brand_id` (`brand_id`),
  KEY `fk_bikes_catigories_id` (`catigories_id`),
  KEY `fk_bikes_frame_size_id` (`frame_size_id`),
  KEY `fk_bikes_colour_id` (`color_id`),
  KEY `fk_bikes_disc_size_id` (`disc_size_id`),
  CONSTRAINT `fk_bikes_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `fk_bikes_catigories_id` FOREIGN KEY (`catigories_id`) REFERENCES `catigories` (`id`),
  CONSTRAINT `fk_bikes_colour_id` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`),
  CONSTRAINT `fk_bikes_disc_size_id` FOREIGN KEY (`disc_size_id`) REFERENCES `disc_size` (`id`),
  CONSTRAINT `fk_bikes_frame_size_id` FOREIGN KEY (`frame_size_id`) REFERENCES `frame_size` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bikes`
--

LOCK TABLES `bikes` WRITE;
/*!40000 ALTER TABLE `bikes` DISABLE KEYS */;
INSERT INTO `bikes` VALUES (1,'Buran','m',1450.00,2021,2,1,2,3,1),(2,'Procaliber','m',6990.99,2021,3,1,3,2,1),(3,'X-Caliber','m',4659.20,2020,3,1,1,3,2);
/*!40000 ALTER TABLE `bikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `made_in` varchar(150) NOT NULL,
  `create_at` year NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Аист','Беларусь',1947),(2,'Форвард','Россия',1999),(3,'Trek','США',1976);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bike_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Принят','Выполнен','Отменен') NOT NULL,
  `pay_by` enum('Карта','Наличные') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_cart_bike_id` (`bike_id`),
  KEY `fk_cart_user_id` (`user_id`),
  CONSTRAINT `fk_cart_bike_id` FOREIGN KEY (`bike_id`) REFERENCES `bikes` (`id`),
  CONSTRAINT `fk_cart_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,1,'2022-09-29 19:38:20','Принят','Наличные'),(2,1,2,'2022-09-29 19:38:20','Выполнен','Наличные'),(3,1,3,'2022-09-29 19:38:20','Выполнен','Карта');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catigories`
--

DROP TABLE IF EXISTS `catigories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catigories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catigories`
--

LOCK TABLES `catigories` WRITE;
/*!40000 ALTER TABLE `catigories` DISABLE KEYS */;
INSERT INTO `catigories` VALUES (1,'горный','Предназначен для езды по пересеченной местности. Особенности: большое количество передач, широкие шины с рисунком протектора, улучшающим сцепление с грунтом, наличие амортизаторов, прочные рама и ободья. Любительский горный велосипед (ATB) является самым популярным классом, поскольку подходит для любых видов велопоездок.'),(2,'городской','Предназначен для передвижения по городу и в сельской местности, как правило, спокойной езды на работу, за покупками, прогулок и т.д. Особенности: широкое мягкое седло, вертикальная посадка, возможность переключения передач стоя, часто ножной тормоз, защита от грязи, корзина и багажник. Существует разновидность скоростных и легких городских велосипедов — коммьютер, предназначенный для поездок на большие расстояния, по конфигурации и свойствам близок к гибридным велосипедам.'),(3,'шоссейный','Предназначен для езды по асфальтированным дорогам. Особенности: тонкий и легкий корпус, гнутый нисходящий руль, узкие шины без выраженного рисунка протектора.');
/*!40000 ALTER TABLE `catigories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `ral` smallint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `ral_check` CHECK (regexp_like(`ral`,_utf8mb4'^[1-9][0-9]{3}$'))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'Лимонно-жёлтый',1012),(2,'Люминесцентный оранжевый',2005),(3,'Телемагента',4010);
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disc_size`
--

DROP TABLE IF EXISTS `disc_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disc_size` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `size_num` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disc_size`
--

LOCK TABLES `disc_size` WRITE;
/*!40000 ALTER TABLE `disc_size` DISABLE KEYS */;
INSERT INTO `disc_size` VALUES (1,29),(2,26),(3,20);
/*!40000 ALTER TABLE `disc_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frame_size`
--

DROP TABLE IF EXISTS `frame_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frame_size` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name_eu` varchar(5) NOT NULL,
  `name_ru` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frame_size`
--

LOCK TABLES `frame_size` WRITE;
/*!40000 ALTER TABLE `frame_size` DISABLE KEYS */;
INSERT INTO `frame_size` VALUES (1,'XS',14),(2,'M',17),(3,'L',20);
/*!40000 ALTER TABLE `frame_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bike_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `text_review` text NOT NULL,
  `stars` tinyint NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_reviews_bike_id` (`bike_id`),
  KEY `fk_reviews_user_id` (`user_id`),
  CONSTRAINT `fk_reviews_bike_id` FOREIGN KEY (`bike_id`) REFERENCES `bikes` (`id`),
  CONSTRAINT `fk_reviews_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `stars_check` CHECK (regexp_like(`stars`,_utf8mb4'^[1-5]$'))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,1,'Выглядит очень круто. На вид не уступает мериде и другим топовым великам.',5,'2022-09-29 19:32:17'),(2,1,2,'Из того что было в 2022 сезоне на белорусском рынке вполне неплохой вел.',4,'2022-09-29 19:32:17'),(3,1,3,'С советским аналогом по качеству не сравнится, только внешне похож.',2,'2022-09-29 19:32:17');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bike_id` bigint unsigned NOT NULL,
  `amount` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_storage_bike_id` (`bike_id`),
  CONSTRAINT `fk_storage_bike_id` FOREIGN KEY (`bike_id`) REFERENCES `bikes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
INSERT INTO `storage` VALUES (1,1,123),(2,2,22),(3,3,2);
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(145) NOT NULL,
  `lastname` varchar(145) NOT NULL,
  `email` varchar(145) NOT NULL,
  `phone` char(11) NOT NULL,
  `password_hash` char(65) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email_idx` (`email`),
  UNIQUE KEY `phone_idx` (`phone`),
  CONSTRAINT `phone_check` CHECK (regexp_like(`phone`,_utf8mb4'^[0-9]{11}$'))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Guadalupe','Nitzsche','greenfelder.antwan@example.org','89213456678','d6f684fe75bdff654841d18f34c9acd6d3b05233','2011-12-04 16:57:02'),(2,'Elmira','Bayer','xjacobs@example.org','89214507878','501a9b34edb153894128f6255ff3ef6bf0d3f4db','1990-01-20 18:48:26'),(3,'D\'angelo','Cruickshank','linwood.medhurst@example.org','89214567878','3273c607f8dfbc808adaa5493b7439ba08c3f43e','1994-09-04 15:21:06');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-29 21:19:11
