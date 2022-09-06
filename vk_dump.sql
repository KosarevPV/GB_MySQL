-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: vk
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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `admin_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `name` (`name`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'nibh enim,','iaculis enim, sit amet ornare lectus justo',1),(2,'aliquet magna,','elementum at, egestas a, scelerisque sed, sapien',1),(3,'vel arcu','iaculis enim, sit amet ornare lectus justo',1),(4,'pharetra nibh,','est ac mattis semper, dui lectus rutrum',2),(5,'bibendum ullamcorper,','suscipit, est ac facilisis facilisis, magna tellu',2),(6,'non, feugiat','aliquam, enim nec tempus scelerisque, lorem ipsum',6),(7,'non, egestas','ipsum non arcu. Vivamus sit amet risus',6),(8,'magna et,','eget mollis lectus pede et risus. Quisque',6),(9,'dolor elit,','ultricies ligula. Nullam enim. Sed nulla ante',6),(10,'tellus. Suspendisse','quam quis diam. Pellentesque habitant morbi tristique',5);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities_users`
--

DROP TABLE IF EXISTS `communities_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities_users` (
  `community_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`community_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `communities_users_ibfk_1` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `communities_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities_users`
--

LOCK TABLES `communities_users` WRITE;
/*!40000 ALTER TABLE `communities_users` DISABLE KEYS */;
INSERT INTO `communities_users` VALUES (1,2,'2022-09-05 23:53:40'),(1,3,'2022-09-05 23:53:40'),(1,4,'2022-09-05 23:53:40'),(1,5,'2022-09-05 23:53:40'),(1,9,'2022-09-05 23:53:40'),(2,7,'2022-09-05 23:53:40'),(2,8,'2022-09-05 23:53:40'),(2,9,'2022-09-05 23:53:40'),(6,1,'2022-09-05 23:53:40'),(6,2,'2022-09-05 23:53:40'),(6,3,'2022-09-05 23:53:40'),(6,4,'2022-09-05 23:53:40'),(9,1,'2022-09-05 23:53:40'),(9,2,'2022-09-05 23:53:40'),(10,1,'2022-09-05 23:53:40'),(10,2,'2022-09-05 23:53:40'),(10,3,'2022-09-05 23:53:40'),(10,6,'2022-09-05 23:53:40'),(10,8,'2022-09-05 23:53:40'),(10,9,'2022-09-05 23:53:40');
/*!40000 ALTER TABLE `communities_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_requests` (
  `from_user_id` bigint unsigned NOT NULL,
  `to_user_id` bigint unsigned NOT NULL,
  `accepted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`from_user_id`,`to_user_id`),
  KEY `fk_friend_requests_to_user_id` (`to_user_id`),
  CONSTRAINT `fk_friend_requests_from_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_friend_requests_to_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_chk_1` CHECK ((`from_user_id` <> `to_user_id`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,2,0),(1,3,0),(1,6,0),(1,7,0),(1,8,1),(2,4,0),(2,6,0),(2,8,0),(3,1,1),(3,2,0),(7,1,0),(7,5,0),(7,8,0),(7,9,1),(7,10,1);
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `file_name` varchar(255) NOT NULL COMMENT '/file/folder/img.png',
  `file_size` bigint unsigned DEFAULT NULL,
  `media_types_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_types_id` (`media_types_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_types_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,'eget',12,1,'2022-09-06 00:15:49'),(2,1,'Curabitur',112,1,'2022-09-06 00:15:49'),(3,2,'ediam',1232,4,'2022-09-06 00:15:49'),(4,2,'Donec',3452,4,'2022-09-06 00:15:49'),(5,1,'bibendum',36,5,'2022-09-06 00:15:49'),(6,6,'Nam',34,6,'2022-09-06 00:15:49'),(7,6,'turpis',56,7,'2022-09-06 00:15:49'),(8,9,'tristique',56,8,'2022-09-06 00:15:49'),(9,9,'scelerisque',11,10,'2022-09-06 00:15:49'),(10,10,'vel',545434,3,'2022-09-06 00:15:49');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (11,'css'),(10,'csv'),(9,'html'),(1,'javascript'),(7,'jpeg'),(2,'json'),(3,'pdf'),(8,'png'),(4,'sql'),(5,'xml'),(6,'zip');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint unsigned NOT NULL,
  `to_user_id` bigint unsigned NOT NULL,
  `txt` text NOT NULL,
  `is_delivered` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,2,'velit dui, semper',0,'2022-09-06 00:00:29','2022-09-06 00:00:29'),(2,1,3,'Aliquam adipiscing lobortis',0,'2022-09-06 00:00:29','2022-09-06 00:00:29'),(3,1,4,'Cum sociis natoque',0,'2022-09-06 00:00:29','2022-09-06 00:00:29'),(4,1,5,'Curabitur sed tortor',0,'2022-09-06 00:00:29','2022-09-06 00:00:29'),(5,2,1,'Donec est. Nunc',0,'2022-09-06 00:00:29','2022-09-06 00:00:29'),(6,2,1,'faucibus lectus',0,'2022-09-06 00:00:29','2022-09-06 00:00:29'),(7,2,9,'penatibus et magnis',0,'2022-09-06 00:00:29','2022-09-06 00:00:29'),(8,6,8,'malesuada vel, venenatis',0,'2022-09-06 00:00:29','2022-09-06 00:00:29'),(9,6,1,'pellentesque a, facilisis',0,'2022-09-06 00:00:29','2022-09-06 00:00:29'),(10,7,3,'semper, dui lectus',0,'2022-09-06 00:00:29','2022-09-06 00:00:29'),(11,8,6,'urna et arcu',0,'2022-09-06 00:00:29','2022-09-06 00:00:29'),(12,5,3,'sed, facilisis vitae,',0,'2022-09-06 00:00:29','2022-09-06 00:00:29'),(13,6,4,'aliquet nec, imperdiet',0,'2022-09-06 00:00:29','2022-09-06 00:00:29'),(14,9,5,'iaculis aliquet diam',0,'2022-09-06 00:00:29','2022-09-06 00:00:29'),(15,10,1,'Hello',0,'2022-09-06 00:00:29','2022-09-06 00:00:29');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` bigint unsigned NOT NULL,
  `gender` enum('f','m','x') NOT NULL,
  `birthday` date NOT NULL,
  `photo_id` bigint unsigned DEFAULT NULL,
  `city` varchar(130) DEFAULT NULL,
  `country` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'m','2002-09-05',1,'Massimino','Italy'),(2,'m','1992-02-05',2,'Calapan','Peru'),(3,'m','2002-06-15',3,'Opwijk','France'),(4,'f','2005-07-15',4,'Belmont','Brazil'),(5,'m','2001-08-25',5,'Daejeon','Brazil'),(6,'f','2002-01-25',6,'Daejeon','Brazil'),(7,'f','2003-03-15',7,'Tacloban','France'),(8,'m','2001-03-12',8,'Makati','France'),(9,'m','1999-02-06',9,'Massimino','Italy'),(10,'f','1999-03-05',10,'Zwickau','Italy');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(150) NOT NULL,
  `lastname` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` char(11) NOT NULL,
  `password_hash` char(65) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `passport` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Dane','Bean','vulputate.velit@icloud.couk','(29)4277423','1eddaae9848639d49383c1d4d519bf3b','2022-09-05 23:37:12','455859'),(2,'Vernon','Ball','natoque.penatibus@yahoo.couk@icloud.couk','(29)1234567','b01604c3c784bfa93fc64dcda9c1e2a0','2022-09-05 23:37:12','999424'),(3,'Devin','Ewing','nec.urna@aol.net','(29)7654321','2363e647b2f25e42f392f28a99c7bc66','2022-09-05 23:37:12','860927'),(4,'Astra','Mcintyre','eros.non@hotmail.ca','(29)4422556','1228bc78a68a83463e7a529d7a095466','2022-09-05 23:37:12','701723'),(5,'Leo','Harmon','lobortis@yahoo.net','(29)6785431','c9f23edeae0b08ab65ba4ba280efb80c','2022-09-05 23:37:12','165602'),(6,'Quinlan','Rhodes','ornare.in.faucibus@hotmail.edu','(29)9999444','de100529ed3ea7ade7d23262c32236db','2022-09-05 23:37:12','324395'),(7,'Maggie','Vang','vel.faucibus@outlook.com','(29)1231234','fd4d1ea362dccdb923bea915130a18ef','2022-09-05 23:37:12','141669'),(8,'Zeph','Compton','nim@outlook.couk','(29)6786786','873d8bc3bf0909a0e25b0ea9ee5a64ff','2022-09-05 23:37:12','118021'),(9,'Adrienne','Carroll','eros.nam@icloud.org','(29)9090423','89f831216b803f23ececb6cea038c644','2022-09-05 23:37:12','351833'),(10,'Astra','Ball','arcu.vestibulum@protonmail.org','(29)2131234','5af57ea0892641f24c731d1e4e27cee4','2022-09-05 23:37:12','993792');
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

-- Dump completed on 2022-09-06 21:10:05
