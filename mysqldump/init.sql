-- MySQL dump 10.13  Distrib 5.6.21, for Win32 (x86)
--
-- Host: localhost    Database: flask
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `date_post` datetime NOT NULL,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'My First Post','2020-02-12 20:44:31','This is the content of my first post update',7),(2,'Second post','2020-02-12 20:45:52','I do love her',7),(3,'Third post','2020-02-12 20:47:07','content',7),(4,'About love','2020-02-13 11:31:51','Love love',6),(5,'dkiss','2020-02-13 16:05:54','post update',6),(6,'post title 0','2020-02-13 18:18:36','content post 0',6),(7,'post title 1','2020-02-13 18:18:36','content post 1',6),(8,'post title 2','2020-02-13 18:18:36','content post 2',6),(9,'post title 3','2020-02-13 18:18:36','content post 3',6),(10,'post title 4','2020-02-13 18:18:36','content post 4',6),(11,'post title 5','2020-02-13 18:18:36','content post 5',6),(12,'post title 6','2020-02-13 18:18:36','content post 6',6),(13,'post title 7','2020-02-13 18:18:36','content post 7',6),(14,'post title 8','2020-02-13 18:18:36','content post 8',6),(15,'post title 9','2020-02-13 18:18:36','content post 9',6),(16,'post title 10','2020-02-13 18:18:36','content post 10',6),(17,'post title 11','2020-02-13 18:18:36','content post 11',6),(18,'post title 12','2020-02-13 18:18:36','content post 12',6),(19,'post title 13','2020-02-13 18:18:36','content post 13',6),(20,'post title 14','2020-02-13 18:18:36','content post 14',6),(21,'post title 15','2020-02-13 18:18:36','content post 15',6),(22,'post title 16','2020-02-13 18:18:36','content post 16',6),(23,'post title 17','2020-02-13 18:18:36','content post 17',6),(24,'post title 18','2020-02-13 18:18:36','content post 18',6),(25,'post title 19','2020-02-13 18:18:36','content post 19',6),(26,'post title2 0','2020-02-13 18:20:06','content user 2 post 0',7),(27,'post title2 1','2020-02-13 18:20:06','content user 2 post 1',7),(28,'post title2 2','2020-02-13 18:20:06','content user 2 post 2',7),(29,'post title2 3','2020-02-13 18:20:06','content user 2 post 3',7),(30,'post title2 4','2020-02-13 18:20:06','content user 2 post 4',7),(31,'post title2 5','2020-02-13 18:20:06','content user 2 post 5',7),(32,'post title2 6','2020-02-13 18:20:06','content user 2 post 6',7),(33,'post title2 7','2020-02-13 18:20:06','content user 2 post 7',7),(34,'post title2 8','2020-02-13 18:20:06','content user 2 post 8',7),(35,'post title2 9','2020-02-13 18:20:06','content user 2 post 9',7),(36,'post title2 10','2020-02-13 18:20:06','content user 2 post 10',7),(37,'post title2 11','2020-02-13 18:20:06','content user 2 post 11',7),(38,'post title2 12','2020-02-13 18:20:06','content user 2 post 12',7),(39,'post title2 13','2020-02-13 18:20:06','content user 2 post 13',7),(40,'post title2 14','2020-02-13 18:20:06','content user 2 post 14',7),(41,'post title2 15','2020-02-13 18:20:06','content user 2 post 15',7),(42,'post title2 16','2020-02-13 18:20:06','content user 2 post 16',7),(43,'post title2 17','2020-02-13 18:20:06','content user 2 post 17',7),(44,'post title2 18','2020-02-13 18:20:06','content user 2 post 18',7),(45,'post title2 19','2020-02-13 18:20:06','content user 2 post 19',7),(46,'post title2 20','2020-02-13 18:20:06','content user 2 post 20',7),(47,'post title2 21','2020-02-13 18:20:06','content user 2 post 21',7),(48,'post title2 22','2020-02-13 18:20:06','content user 2 post 22',7),(49,'post title2 23','2020-02-13 18:20:06','content user 2 post 23',7),(50,'post title3 0','2020-02-13 18:21:16','content user 3 post 0',8),(51,'post title3 1','2020-02-13 18:21:16','content user 3 post 1',8),(52,'post title3 2','2020-02-13 18:21:16','content user 3 post 2',8),(53,'post title3 3','2020-02-13 18:21:16','content user 3 post 3',8),(54,'post title3 4','2020-02-13 18:21:16','content user 3 post 4',8),(55,'post title3 5','2020-02-13 18:21:16','content user 3 post 5',8),(56,'post title3 6','2020-02-13 18:21:16','content user 3 post 6',8),(57,'post title3 7','2020-02-13 18:21:16','content user 3 post 7',8),(58,'post title3 8','2020-02-13 18:21:16','content user 3 post 8',8),(59,'post title3 9','2020-02-13 18:21:16','content user 3 post 9',8),(60,'post title3 10','2020-02-13 18:21:16','content user 3 post 10',8),(61,'post title3 11','2020-02-13 18:21:16','content user 3 post 11',8),(62,'post title3 12','2020-02-13 18:21:16','content user 3 post 12',8),(63,'post title3 13','2020-02-13 18:21:16','content user 3 post 13',8),(64,'post title3 14','2020-02-13 18:21:16','content user 3 post 14',8),(65,'post title3 15','2020-02-13 18:21:16','content user 3 post 15',8),(66,'post title3 16','2020-02-13 18:21:16','content user 3 post 16',8),(67,'post title3 17','2020-02-13 18:21:16','content user 3 post 17',8),(68,'Bienvenu dans Flask','2020-02-15 11:30:59','This is my first post update',9);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `email` varchar(120) NOT NULL,
  `image_file` varchar(120) NOT NULL,
  `password` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,'flask','smilekafirongo@gmail.com','1943ad17686852e9.png','$2b$12$6uqPwyHRJ3P4E2q.4/Theehc6vF4fYhFCDoJomRiMOuMXhLLRikKO'),(7,'test','test@demo.com','9e35275e0c28475d.jpg','$2b$12$2kfRF6DeS9FrOMRklDqLcuY.F6A1JPejnDBdqyCtNo/sHEmAWrqmO'),(8,'skov','skov@chri.com','e9d22aab35f7476f.jpg','$2b$12$4tmdC5kRXvw/ZoAbh4t6J.uu3JpDYihf6jy.ONnaudPniXKDEsIbO'),(9,'smile kafirongo','benjkafirongo@gmail.com','b74deb2f5f2095b2.jpg','$2b$12$xaaD/HDkBjkVZ1JWq6/TQ.aHFbAYD3YlJNlCdJOWrJ3ikxL2MWBOK');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-24 19:51:43
