-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_20
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'quos',1),(2,'est',2),(3,'sunt',3),(4,'eligendi',4),(5,'sapiente',5),(6,'saepe',6),(7,'hic',7),(8,'deleniti',8),(9,'voluptatum',9),(10,'est',10),(11,'et',11),(12,'nihil',12),(13,'minima',13),(14,'aperiam',14),(15,'sed',15);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,18,'approved','1989-09-23 19:24:26','2000-03-23 04:37:25'),(2,17,'unfriended','2012-10-09 20:50:12','2009-07-23 19:42:23'),(3,11,'declined','2002-08-15 19:49:35','2007-01-25 10:43:28'),(4,19,'requested','2003-04-14 08:27:28','1984-04-15 15:07:32'),(5,15,'declined','2010-06-01 17:57:39','1995-02-05 07:08:31'),(6,16,'approved','2017-11-27 21:07:58','1991-06-30 14:02:23'),(7,12,'requested','2005-03-19 14:09:06','2000-07-13 14:39:26'),(8,20,'unfriended','1970-03-29 00:50:37','1991-05-16 13:14:55'),(9,13,'requested','1998-12-14 18:46:13','2005-12-19 17:56:56'),(10,14,'unfriended','2012-03-19 10:24:24','1988-04-10 07:44:48');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,1,'1990-04-21 11:19:44'),(2,2,2,'2021-08-02 13:31:42'),(3,3,3,'1977-05-06 03:30:28'),(4,4,4,'1975-11-26 10:12:53'),(5,5,5,'2020-06-20 07:03:36'),(6,6,6,'2011-11-06 23:59:16'),(7,7,7,'2010-04-03 00:06:17'),(8,8,8,'2009-10-30 06:22:04'),(9,9,9,'2013-02-02 18:15:48'),(10,10,10,'1981-09-19 11:03:41'),(11,11,11,'1978-04-05 11:55:12'),(12,12,12,'2016-12-04 20:05:40'),(13,13,13,'1997-06-29 01:11:52'),(14,14,14,'1992-10-04 15:07:08'),(15,15,15,'1974-02-13 00:57:04'),(16,16,16,'1988-06-22 13:05:18'),(17,17,17,'1992-05-18 17:54:16'),(18,18,18,'2002-06-24 04:44:57'),(19,19,19,'2007-07-12 01:25:06'),(20,20,20,'1986-02-05 19:52:56');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'Odit aut assumenda earum ea laudantium aliquam distinctio. In eum omnis maxime nobis doloremque possimus dolor. Fugiat enim ut nisi odio aut.','rem',6250,NULL,'1987-12-27 02:25:33','1971-07-19 08:45:50'),(2,2,2,'Exercitationem harum rerum perferendis sit perspiciatis aut iusto. Voluptas magni occaecati autem quisquam ullam fugiat quis modi. Veniam quia eligendi occaecati temporibus quis.','ea',2481,NULL,'2001-09-14 05:24:54','2009-06-15 03:12:59'),(3,3,3,'Odio quis illum aspernatur. Aliquam mollitia earum ratione deleniti incidunt eius. Assumenda quibusdam dolor deserunt laborum. Sit suscipit commodi corporis placeat ut dolor voluptatem. Voluptas id ullam quis assumenda maiores.','accusantium',2,NULL,'1990-05-17 17:59:04','2014-09-01 04:15:21'),(4,4,4,'Rerum provident labore suscipit rerum accusantium. Deleniti fugiat sunt vel maxime minima minima iusto. Voluptatem consequuntur molestiae libero cum.','blanditiis',2640928,NULL,'2000-09-30 03:20:13','2006-02-22 05:35:03'),(5,5,5,'Sit rerum mollitia velit quia totam. Ex fugiat sequi nostrum voluptate voluptas. Sit error mollitia laboriosam possimus. Voluptas similique id ex sunt delectus. Vero natus sequi quaerat omnis doloribus iusto quisquam.','quis',5309814,NULL,'2018-01-23 08:46:48','2004-10-02 04:46:27'),(6,6,6,'Ut maxime hic id natus. Non quas labore quia voluptatem nemo voluptas ab. Ut molestiae quia voluptatum ipsam.','qui',863643561,NULL,'1998-02-04 09:30:32','1976-09-07 01:44:25'),(7,7,7,'Omnis praesentium beatae repellat. Repellendus est ab aut nam consectetur autem dolores. Et ut dolorum enim quis aperiam.','rem',7635282,NULL,'1978-05-27 20:01:43','2010-05-14 00:19:42'),(8,8,8,'Non temporibus magni natus dolorem culpa. Occaecati nobis distinctio consequatur molestias quisquam.','officiis',3149,NULL,'1983-06-24 08:15:07','2010-08-15 06:21:14'),(9,9,9,'Porro enim optio et velit atque perferendis iste. Quam iste quam quod qui suscipit nisi dignissimos. Quia voluptatibus non eveniet enim.','ea',8719,NULL,'1972-08-30 04:08:44','2000-07-18 00:27:10'),(10,10,10,'Ipsam repellat ullam sequi quod. Enim pariatur id et. Qui ipsam vitae animi quisquam modi.','consequatur',350261293,NULL,'1998-02-06 12:51:42','1987-04-29 15:27:17'),(11,11,11,'Debitis fugiat quis neque sed. Quidem odit cumque voluptate quisquam ipsa cupiditate. Sed impedit et laborum consectetur repellendus. Sed sit neque itaque autem officiis perspiciatis.','ut',73,NULL,'1989-02-09 15:25:57','1999-06-03 16:19:56'),(12,12,12,'Et quaerat reiciendis optio eos. Ex accusamus ipsa qui incidunt. Veniam velit et maiores quis quasi.','officiis',44,NULL,'1983-12-05 10:29:01','2010-09-26 02:59:42'),(13,13,13,'Unde est quas vel quasi. Dolor voluptatem nesciunt libero architecto. Nulla quo blanditiis perspiciatis qui quos aperiam.','odit',9791,NULL,'2016-10-09 01:45:22','2017-08-29 07:56:11'),(14,14,14,'A ut consequatur molestiae ad hic excepturi cum. Dolore velit quibusdam reprehenderit dolor impedit in soluta. Sit nostrum rem id quo adipisci rerum molestias. Mollitia pariatur cumque sit tempore. Distinctio est molestiae dolore.','fuga',163802454,NULL,'2020-03-30 12:05:12','1996-12-30 11:15:04'),(15,15,15,'Non et est aliquid et sed voluptas eos. Eaque fugit est dolores ut nisi. Eos non quia non ratione saepe repudiandae incidunt.','excepturi',767021,NULL,'2004-08-08 09:06:15','2013-10-07 15:32:34'),(16,16,16,'Velit eius quaerat et vel corporis accusamus. Esse hic incidunt maxime consequatur. Placeat error impedit laudantium. Eveniet voluptatibus accusamus blanditiis incidunt eum.','corporis',0,NULL,'2008-01-22 07:05:04','2013-10-25 12:02:35'),(17,17,17,'Blanditiis aliquam officiis quia cumque aliquam ab exercitationem. Et nihil cumque necessitatibus vel ea. Voluptatem illum omnis consectetur iusto ipsam harum. Et libero maxime cupiditate quis.','excepturi',148,NULL,'1977-07-08 06:01:18','2011-04-09 18:01:54'),(18,18,18,'Omnis dolorum qui qui non delectus. Distinctio nesciunt nisi assumenda tempore. Sunt a optio ipsum tempore. Ut architecto consequatur explicabo.','est',318,NULL,'1993-06-15 09:08:12','2010-02-10 06:05:41'),(19,19,19,'Sit alias est eius molestiae. Labore quos quisquam qui maiores. Deleniti nulla animi voluptates est. Distinctio facilis aut maiores incidunt recusandae.','similique',3597562,NULL,'2000-05-12 04:18:03','1971-10-11 13:29:42'),(20,20,20,'Minima illum omnis quis quaerat aut. Velit in et dolore officiis aliquam eos. Repellendus cum repudiandae voluptatem est temporibus omnis at.','deserunt',0,NULL,'1980-08-12 19:55:52','1988-05-03 01:13:14');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'quos','2000-05-11 14:13:44','2002-05-15 17:14:22'),(2,'temporibus','2007-10-02 17:33:55','2015-12-07 15:31:14'),(3,'tenetur','1994-04-18 21:08:52','2012-06-20 09:53:49'),(4,'facilis','1986-10-27 09:13:16','1997-05-26 02:17:21'),(5,'et','2015-08-24 21:13:22','2009-08-01 22:49:34'),(6,'et','1980-08-26 05:11:25','2018-12-16 19:32:03'),(7,'amet','2005-07-27 19:25:40','1996-07-02 10:19:54'),(8,'modi','1981-03-20 05:10:09','1999-02-24 05:15:35'),(9,'pariatur','1970-02-20 19:30:29','1977-04-16 08:24:05'),(10,'autem','2010-10-20 01:44:49','1983-01-28 16:40:26'),(11,'molestiae','1983-04-17 04:01:24','1974-07-20 12:42:56'),(12,'nostrum','2021-10-31 12:55:25','2001-07-13 09:47:28'),(13,'quia','1992-01-01 17:48:11','2011-11-26 16:42:44'),(14,'laborum','2006-11-20 18:03:55','1989-10-30 10:33:23'),(15,'consequatur','1979-06-04 10:11:10','1976-08-03 11:32:02'),(16,'nobis','2006-01-04 09:29:25','1983-09-06 19:28:10'),(17,'vel','1972-04-24 17:08:19','2003-09-02 21:08:02'),(18,'consectetur','1974-03-03 07:25:34','1982-01-18 11:36:56'),(19,'similique','1990-04-15 02:47:59','1984-08-08 21:52:58'),(20,'eos','1991-12-09 13:03:44','1988-04-12 16:58:28');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,4,16,'Sit eius dolorum similique molestiae. Quasi iure rerum error non. Molestiae nulla dignissimos quae nobis itaque quia tempore commodi. Nostrum architecto soluta et. Aliquid perspiciatis sed omnis consectetur et quod.','2010-08-21 01:13:39'),(2,7,14,'Quo dolore explicabo aspernatur ipsum amet. Porro et error id est. Sed repellat facilis eos id laborum ut.','1993-10-25 07:19:17'),(3,8,18,'Non qui omnis reiciendis voluptatem debitis incidunt. Ea temporibus odio officiis nesciunt modi corporis eveniet. Eligendi molestias ut ut.','1998-11-05 10:32:30'),(4,7,18,'Placeat ratione autem impedit distinctio in et quisquam. Voluptas nostrum sed aut ut. Et voluptas laboriosam debitis voluptatem. Quam praesentium est ea tempora quo voluptatum.','1976-04-20 11:41:56'),(5,4,16,'Inventore deserunt suscipit et qui odit. Soluta vitae et velit animi. Ea placeat nisi eum quasi impedit soluta iste.','1972-11-16 20:34:27'),(6,9,14,'Et modi magni dolorem id et modi dicta. Aut voluptatem in est enim dolor et voluptatem. Est ea molestias id nulla natus adipisci quo velit.','1987-08-26 23:26:29'),(7,4,20,'Velit architecto qui sunt sunt rerum. Magni dolores quaerat occaecati doloremque aut ipsam aliquid. Dolorem placeat sunt voluptas eligendi facilis velit fuga. Nulla et voluptatem officiis qui dolores molestiae.','2000-09-05 13:36:58'),(8,1,17,'Est non similique dicta consequatur dolor illum quo. Ut non aut aut ut. Aut voluptatem odit in nostrum occaecati vitae deleniti.','2003-08-17 11:00:38'),(9,7,18,'Ut sit cupiditate ut. Iste suscipit et ullam sint enim unde ipsa. Explicabo atque repellat sapiente tempora dolorem molestiae reprehenderit.','2002-02-22 22:52:58'),(10,8,18,'Distinctio tenetur enim velit. Quis autem perferendis voluptas qui aut sed. Tempora enim ducimus id sint quia est est. Quia optio molestias repudiandae deserunt cumque tempore.','1994-12-22 08:42:13'),(11,7,11,'Harum magni et est ducimus dolores nemo molestiae. Aut voluptate delectus quia omnis fugiat. Ad et voluptatem nihil sunt occaecati dolores omnis.','1999-12-25 05:21:25'),(12,3,14,'Qui aut id nulla at incidunt. Qui corrupti at tenetur aut asperiores. Explicabo alias error distinctio et cum. Sunt laudantium nam ratione ad.','1977-09-06 19:41:02'),(13,3,10,'Voluptatem iusto autem doloribus quam nemo doloribus. A nemo aut eos laboriosam.','2006-11-25 15:23:58'),(14,2,20,'Cum qui fugiat explicabo quam dignissimos dolor est. Enim debitis consequatur qui dolore. Quas tenetur deserunt non quia quod voluptates similique quod. Nemo dolor voluptatum quidem deserunt ut.','2017-12-25 05:29:36'),(15,4,17,'Officia assumenda amet repellat id ad consequatur vero quia. Et aut harum consequatur veniam et sit. Qui voluptates voluptates rem saepe at eligendi culpa. Unde quod quae unde sunt laboriosam.','2004-09-27 21:37:38'),(16,3,20,'Blanditiis distinctio sint inventore esse. Voluptas necessitatibus possimus est. Reiciendis sunt at ea voluptas delectus recusandae id. Quibusdam eos rerum beatae sed.','2015-01-18 10:39:47'),(17,3,12,'Est aspernatur rerum repudiandae nemo voluptatem. Placeat a est molestias itaque sint molestiae. Qui ut aut velit sed.','1975-12-10 17:47:36'),(18,8,16,'Sequi odio et alias suscipit ullam est eligendi. Dolores distinctio sunt omnis dolorem. Et cupiditate magnam quidem error voluptas sunt cupiditate. Consequatur amet aut quia nisi quia sint. Sit est laudantium eveniet et labore amet unde.','2011-09-05 15:32:03'),(19,2,13,'Optio aut pariatur non cupiditate autem ipsum dolorem dolor. Ullam quia occaecati et doloremque veniam provident. Esse quia eum vel sed.','1980-04-04 08:16:27'),(20,8,13,'Aut eligendi sed corporis eveniet. Est et nemo quaerat maxime quasi aut aperiam. Maiores molestias qui dolorem sunt magnam saepe ex magnam.','2009-06-16 20:43:11');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'aut',1),(2,'amet',2),(3,'nihil',3),(4,'debitis',4),(5,'voluptatum',5),(6,'quia',6),(7,'velit',7),(8,'molestias',8),(9,'qui',9),(10,'ut',10),(11,'in',11),(12,'non',12),(13,'facilis',13),(14,'tenetur',14),(15,'fugiat',15),(16,'consequatur',16),(17,'laudantium',17),(18,'incidunt',18),(19,'nulla',19),(20,'numquam',20);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned DEFAULT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'f','1998-11-24',1,'1979-04-03 12:40:40','North Violetberg'),(2,'f','1987-08-07',2,'1993-09-03 03:25:17','Greentown'),(3,'m','1982-11-03',3,'2000-06-22 08:14:32','Funkville'),(4,'m','1981-11-22',4,'2004-12-23 05:10:44','East Budbury'),(5,'f','1985-05-02',5,'2022-03-13 23:09:34','Wiegandview'),(6,'f','1994-04-07',6,'2020-08-11 08:09:55','Eldastad'),(7,'m','2008-02-11',7,'2017-10-08 00:37:03','Watersfurt'),(8,'f','1981-11-01',8,'1985-04-30 03:19:46','South Brionnaburgh'),(9,'m','2002-08-25',9,'2017-12-27 15:55:04','Cierrahaven'),(10,'f','1994-03-19',10,'2016-01-30 22:12:48','Powlowskistad'),(11,'m','2007-09-06',11,'1984-03-10 02:48:51','New Maverick'),(12,'m','2014-05-29',12,'2020-04-23 05:42:37','Sauerbury'),(13,'f','1971-10-01',13,'1990-04-25 03:54:46','East Destin'),(14,'f','2020-07-14',14,'1993-01-23 23:57:00','Johnsonstad'),(15,'m','2006-06-06',15,'1973-05-21 15:41:11','Simonisfort'),(16,'m','1980-09-09',16,'1997-03-15 02:13:21','South Giles'),(17,'m','2005-12-19',17,'1999-07-02 15:35:31','Stantonchester'),(18,'m','2007-07-15',18,'1985-08-10 09:09:53','Coltontown'),(19,'f','1988-03-27',19,'2014-10-12 18:04:00','Port Maximillia'),(20,'m','2001-09-04',20,'1996-02-06 08:52:54','Terrellstad');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамиль',
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='юзеры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Nya','Keeling','hamill.sarina@example.com','bb98f242d9eb36dca128cdca174925bc1b08d2a9',89928821937),(2,'Vivianne','Runte','alex57@example.com','bd8a23b9cd1a43f42e47854751634b87846e56ab',89576078213),(3,'Oma','Cummings','waldo06@example.com','535e0036fac734c266c3c98e02177994ef5dbfa3',89337472441),(4,'Nils','Bailey','jed.o\'reilly@example.net','a1216c8608cac67074282c2a0a3a0e26c12666da',89129306054),(5,'Hilbert','Kovacek','garret.crona@example.com','2c730b2cf7ed46cf809c784c152e860ce0d273f0',89486591727),(6,'Loyce','Pfannerstill','hunter05@example.net','867103ea6083c03049ab958892258b7332ce8492',89279305594),(7,'Curt','Beer','gcrona@example.com','2f9905ea903e44ce795cb5cab03ffc6281903d1a',89014573310),(8,'Eladio','Olson','rzemlak@example.com','9aa7bfc6e4c842a54003ae08cd54057c00eede55',89349015658),(9,'Isabell','Marvin','fadel.christa@example.com','e14969a4dc3d0b6e7263bd9e9b69f041b039c425',89181388853),(10,'Alfreda','Haag','hanna79@example.net','3c8620072a193de953c93593a74a9522dbde6bc9',89651476869),(11,'Paul','Hauck','olga.beahan@example.org','d0d258b912b14f444576a643b149306344b88468',89782798376),(12,'Daija','Brekke','jjast@example.com','17bec5d7e66d83d9a34f8c00f756770c6004f7ac',89032251215),(13,'Christ','Dooley','rosario.collier@example.net','654b6080e29e34a5c282805fc50903cdf3cb4a31',89230431615),(14,'Bill','Mueller','afton39@example.org','cadaa9d17e397bc8824876f442b44bf377e9390e',89661976277),(15,'Dario','Stokes','ajones@example.org','a964a8b2c432835887eb2510b31ae8aa3ae6e66e',89295126270),(16,'Amelie','Greenholt','hermann.kitty@example.net','5bf5434a291c0c7b61754af4d4656bd6e0cd7de9',89709325701),(17,'Jadon','Hickle','o\'connell.maxime@example.com','cfa15616e6691020c5b6e95572f4ffe33194df08',89522140129),(18,'River','Dooley','kassulke.tomasa@example.com','e1925027caaad9fffd89302462579a3611723847',89705980272),(19,'Marjory','Herzog','lexi.larson@example.org','f8814b4cffdd60c82459dbc9a4ec06d68af9c73a',89554792899),(20,'Peggie','Auer','keebler.hollie@example.com','6fc02d4a763c60193a5d767cd891c0d2c6f37042',89893140832);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-09 15:25:18

