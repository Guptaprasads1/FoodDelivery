-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: foodify
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (24);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `of_cart`
--

DROP TABLE IF EXISTS `of_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `of_cart` (
  `cart_id` int NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FK5ibwejjk3l6301b40jo4ssgmb` (`product_id`),
  KEY `FK3mpukwv02an7naev9pmv88q0v` (`user_id`),
  CONSTRAINT `FK3mpukwv02an7naev9pmv88q0v` FOREIGN KEY (`user_id`) REFERENCES `of_user` (`id`),
  CONSTRAINT `FK5ibwejjk3l6301b40jo4ssgmb` FOREIGN KEY (`product_id`) REFERENCES `of_food` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `of_cart`
--

LOCK TABLES `of_cart` WRITE;
/*!40000 ALTER TABLE `of_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `of_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `of_category`
--

DROP TABLE IF EXISTS `of_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `of_category` (
  `category_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `of_category`
--

LOCK TABLES `of_category` WRITE;
/*!40000 ALTER TABLE `of_category` DISABLE KEYS */;
INSERT INTO `of_category` VALUES (4,'Berger'),(5,'Snacks'),(17,'Pizza1');
/*!40000 ALTER TABLE `of_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `of_food`
--

DROP TABLE IF EXISTS `of_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `of_food` (
  `ID` bigint NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `category_id_idx` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `of_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `of_food`
--

LOCK TABLES `of_food` WRITE;
/*!40000 ALTER TABLE `of_food` DISABLE KEYS */;
INSERT INTO `of_food` VALUES (10,'Snacks',5,35,'chatpata','sn1.jpg'),(16,'Chicken Tikka Berger',4,299,'berger with 2 layers of chicken','burg7.jpg'),(18,'Cheese Pizza',17,199,'Extra Cheese Pizza','piz6.jpg');
/*!40000 ALTER TABLE `of_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `of_order`
--

DROP TABLE IF EXISTS `of_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `of_order` (
  `id` int NOT NULL,
  `quantity` int NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKeulk7onui9txkd64gn6rdw4h4` (`product_id`),
  KEY `FK48o5sssfb66btnro9bt2pc1o8` (`user_id`),
  CONSTRAINT `FK48o5sssfb66btnro9bt2pc1o8` FOREIGN KEY (`user_id`) REFERENCES `of_user` (`id`),
  CONSTRAINT `FKeulk7onui9txkd64gn6rdw4h4` FOREIGN KEY (`product_id`) REFERENCES `of_food` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `of_order`
--

LOCK TABLES `of_order` WRITE;
/*!40000 ALTER TABLE `of_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `of_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `of_role`
--

DROP TABLE IF EXISTS `of_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `of_role` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9p80ngymx1tucvwplmoql7tgi` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `of_role`
--

LOCK TABLES `of_role` WRITE;
/*!40000 ALTER TABLE `of_role` DISABLE KEYS */;
INSERT INTO `of_role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `of_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `of_user`
--

DROP TABLE IF EXISTS `of_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `of_user` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5oew7jdfp6g690ydm0imvoyg2` (`email`),
  UNIQUE KEY `UK5oew7jdfp6g690ydm0imvoyg2` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `of_user`
--

LOCK TABLES `of_user` WRITE;
/*!40000 ALTER TABLE `of_user` DISABLE KEYS */;
INSERT INTO `of_user` VALUES (1,'admin@gmail.com','Admin','Gupta','$2a$10$q9zTJZKMSInfnZWkTFaKfOmtnClK97h2jGgPCiCZuZg81rzYXO46C'),(11,'guptaprasads1@gmail.com','Gupta prasad','sabat',NULL),(12,'sabatarun.gita@gmail.com','Gupta','Sabat','$2a$10$N83h7FOiWDDETXESG9jMuuBG/bfNXr8l47492XYgepM3kQi.INRCy'),(13,'gps@gmail.com','Gupta','Sabat','$2a$10$FWJDQI4MDolXiU1aJz/7UOJR/k3FrGKNCHLePk5.wnthO9nf3ZkMW'),(14,'','','','$2a$10$.UAFaemWurmnJMrzoFxS8O82bFUxC17mylOxPGD3tco.koSs9eYka'),(15,'gpsa@gmail.com','Gupta','Sabat','$2a$10$GUcToVhTKxr3rbUkMqPNv.pur7gvmVckaLNBIC/4zlGyWeKOilxye'),(19,'shubhi@gmail.com','Shubhi','Johari','Shubhi123'),(21,'gag123@gmail.com','Gupta','Sabat','$2a$10$rztcW2DaBBss/G.elxebk.Itx2He6cqKdpOOCFYTWLBa3tx298cbC'),(23,'gps123@gmail.com','Gupta','Sabat','$2a$10$03xmfqN2lrtKg/DuZzNW9eOFn9hXeYVeCqt90XnGbHAWyfVViuSR.');
/*!40000 ALTER TABLE `of_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `of_userrole`
--

DROP TABLE IF EXISTS `of_userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `of_userrole` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  KEY `FKmvyambo314c3wsmfaoos1qe5p` (`role_id`),
  KEY `FKm0yyc4kfsgh4odj2rkxb6dmo1` (`user_id`),
  CONSTRAINT `FKm0yyc4kfsgh4odj2rkxb6dmo1` FOREIGN KEY (`user_id`) REFERENCES `of_user` (`id`),
  CONSTRAINT `FKmvyambo314c3wsmfaoos1qe5p` FOREIGN KEY (`role_id`) REFERENCES `of_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `of_userrole`
--

LOCK TABLES `of_userrole` WRITE;
/*!40000 ALTER TABLE `of_userrole` DISABLE KEYS */;
INSERT INTO `of_userrole` VALUES (1,1),(1,2),(11,2),(12,2),(13,2),(14,2),(15,2),(21,2),(23,2);
/*!40000 ALTER TABLE `of_userrole` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-02 11:04:52
