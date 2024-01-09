-- MySQL dump 10.13  Distrib 5.5.50, for Win32 (x86)
--
-- Host: localhost    Database: ChitChat
-- ------------------------------------------------------
-- Server version	5.5.50

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
-- Table structure for table `hackers`
--

DROP TABLE IF EXISTS `hackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hackers` (
  `participants` varchar(70) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  `accepted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hackers`
--

LOCK TABLES `hackers` WRITE;
/*!40000 ALTER TABLE `hackers` DISABLE KEYS */;
INSERT INTO `hackers` VALUES ('yazid',0,1),('dizay',0,1),('luziver',0,1),('alimente',1,1);
/*!40000 ALTER TABLE `hackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `participants` varchar(70) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  `accepted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES ('hohos',0,0),('smt_coder',0,0),('eXperienced',0,0),('satan_nightmare',0,0);
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `invitations`
--

LOCK TABLES `invitations` WRITE;
/*!40000 ALTER TABLE `invitations` DISABLE KEYS */;
INSERT INTO `invitations` VALUES ('Friends','hohos',0),('Friends','smt_coder',0),('Friends','eXperienced',0),('Friends','satan_nightmare',0),('party','alimente',0),('party','dizay',0),('party','luziver',0),('Secret_Group','yazid',0),('Secret_Group','hohos',0),('Secret_Group','smt_coder',0),('Secret_Group','eXperienced',0),('Secret_Group','satan_nightmare',0),('Secret_Group','dizay',0),('Secret_Group','alimente',0);
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (383,'alimente','yazid','whats up captain?','2023-12-21 06:45:26',1,0,'alimente'),(384,'yazid','alimente','nothing much','2023-12-21 06:45:57',1,0,'yazid'),(385,'yazid','alimente','just daily routine','2023-12-21 06:46:05',1,0,'yazid'),(386,'alimente','yazid','what about a fight...hahahaha','2023-12-21 06:46:39',1,0,'alimente'),(387,'yazid','alimente','i dont think','2023-12-21 06:46:54',1,0,'yazid'),(388,'yazid','alimente','u can control yourself','2023-12-21 06:47:06',1,0,'yazid'),(393,'smt_coder','alimente','its been a month','2023-12-21 06:53:20',0,0,'smt_coder'),(394,'smt_coder','alimente','since i last the real u','2023-12-21 06:53:31',0,0,'smt_coder'),(395,'smt_coder','alimente','time to turn green','2023-12-21 06:53:39',0,0,'smt_coder'),(396,'smt_coder','alimente','huh??','2023-12-21 06:53:41',0,0,'smt_coder'),(397,'smt_coder','alimente','hahaha','2023-12-21 06:53:44',0,0,'smt_coder'),(398,'hohos','alimente','I am a philosopher','2023-12-21 06:54:07',1,0,'hohos'),(399,'hohos','alimente','tell me ur problems','2023-12-21 06:54:14',1,0,'hohos'),(400,'hohos','alimente','and i will solve them','2023-12-21 06:54:28',1,0,'hohos'),(401,'yazid','alimente','but still','2023-12-21 06:54:45',1,0,'yazid'),(402,'yazid','alimente','I am always up for fight!!','2023-12-21 06:54:57',1,0,'yazid'),(403,'gg_14','eXperienced','Preparing well for ICPC?','2023-12-21 07:03:44',0,0,'gg_14'),(404,'gg_14','eXperienced','All the best brother','2023-12-21 07:03:53',0,0,'gg_14'),(405,'alimente','yazid','just tell the venue..','2023-12-21 07:08:37',1,0,'alimente'),(406,'yazid','alimente','where I was born','2023-12-21 07:08:55',1,0,'yazid'),(407,'alimente','yazid','that was a century ago','2023-12-21 07:09:16',1,0,'alimente'),(408,'alimente','yazid','you emotional idiot','2023-12-21 07:09:32',1,0,'alimente'),(409,'hohos','yazid','hey','2023-12-21 07:10:56',1,0,'hohos'),(410,'hohos','yazid','cap','2023-12-21 07:10:58',1,0,'hohos'),(411,'hohos','yazid','howdy','2023-12-21 07:11:04',1,0,'hohos'),(412,'alimente','dizay','I am gonna rip you in two pieces','2023-12-21 07:26:29',1,0,'alimente'),(413,'hackers','yazid','I will beat u all','2023-12-21 07:55:28',1,0,'dizay'),(414,'hackers','luziver','I will beat u all','2023-12-21 07:55:28',1,0,'dizay'),(415,'hackers','alimente','I will beat u all','2023-12-21 07:55:28',1,0,'dizay'),(416,'dizay','hackers','I will beat u all','2023-12-21 07:55:28',0,0,'dizay'),(417,'hackers','yazid','how you people are gonna fight with me??','2023-12-21 07:55:52',0,0,'hackers'),(418,'yazid','hackers','Just watch','2023-12-21 07:56:14',0,0,'yazid'),(419,'yazid','hackers','I will show you my skills','2023-12-21 07:56:34',0,0,'yazid'),(420,'hackers','yazid','you will be beaten in first round','2023-12-21 07:57:00',0,0,'hackers'),(421,'yazid','hackers','Let the games begin','2023-12-21 07:57:23',0,0,'yazid'),(422,'hackers','yazid','good luck to you','2023-12-21 07:57:42',0,0,'hackers'),(423,'gg_14','yazid','A game is on','2023-12-21 08:09:25',0,0,'gg_14'),(424,'gg_14','hohos','All the best guys','2023-12-21 08:09:41',0,0,'gg_14'),(425,'hohos','gg_14','we will win for sure','2023-12-21 08:09:55',0,0,'hohos'),(426,'gg_14','hohos','Do your best','2023-12-21 08:10:09',0,0,'gg_14'),(427,'hohos','gg_14','Yeah','2023-12-21 08:10:22',0,0,'hohos'),(428,'gg_14','hohos','we are gonna rock it','2023-12-21 08:10:38',0,0,'gg_14'),(429,'gg_14','hohos','Hey','2023-12-21 08:10:50',0,0,'gg_14'),(430,'hohos','gg_14','Hey','2023-12-21 08:10:59',0,0,'hohos'),(431,'hohos','gg_14','Let\'s meet after the match','2023-12-21 08:11:13',0,0,'hohos'),(432,'gg_14','hohos','Sure','2023-12-21 08:11:30',0,0,'gg_14'),(433,'gg_14','hohos','celebrations awaiting','2023-12-21 08:11:43',0,0,'gg_14'),(434,'hohos','gg_14','victory!!','2023-12-21 08:11:56',0,0,'hohos'),(435,'gg_14','hohos','Yeah!!','2023-12-21 08:12:09',0,0,'gg_14'),(436,'hohos','gg_14','Party time','2023-12-21 08:12:23',0,0,'hohos'),(437,'gg_14','hohos','Hell yeah','2023-12-21 08:12:39',0,0,'gg_14'),(438,'gg_14','hohos','Celebrate the victory','2023-12-21 08:12:53',0,0,'gg_14'),(439,'gg_14','hohos','We did it','2023-12-21 08:13:10',0,0,'gg_14'),(440,'hohos','gg_14','Cheers','2023-12-21 08:13:26',0,0,'hohos'),(441,'gg_14','hohos','Cheers','2023-12-21 08:13:41',0,0,'gg_14');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `secret_group`
--

LOCK TABLES `secret_group` WRITE;
/*!40000 ALTER TABLE `secret_group` DISABLE KEYS */;
INSERT INTO `secret_group` VALUES ('Party','alimente',0),('Party','dizay',0),('Party','luziver',0),('Secret_Group','yazid',0),('Secret_Group','hohos',0),('Secret_Group','smt_coder',0),('Secret_Group','eXperienced',0),('Secret_Group','satan_nightmare',0),('Secret_Group','dizay',0),('Secret_Group','alimente',0);
/*!40000 ALTER TABLE `secret_group` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(70) DEFAULT NULL,
  `password` varchar(70) DEFAULT NULL,
  `isGroup` tinyint(1) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `photo` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (42,'gg_14','C10CE3C5B91B2EDF067D77958A11AD9764EA58D4',0,'garvitgupta58@gmail.com','9897116543','src/resources/server_resources/ChitChat_BVXGR.jpg'),(44,'eXperienced','4DEE61AAAE702DF02DE67AA02FB2D45B1065559E',0,'experienced@chitchat.com','9999999999','src/resources/server_resources/ChitChat_DM3VQ.jpg'),(45,'smt_coder','5993BFBB508F0C48C83F1D3C96AC7A1A790EFD22',0,'smt@chitchat.com','9888888888','src/resources/server_resources/ChitChat_S8YM8.jpg'),(46,'satan_nightmare','C63DA39ED13090239F702C236D56FDBE77E99B03',0,'satan@chitchat.com','9777777777','src/resources/server_resources/ChitChat_10UUR.jpg'),(47,'hohos','D11186354D1EF01CA06AE37D7E23E827DA13E85F',0,'hohos@chitchat.com','9777777777','src/resources/server_resources/ChitChat_8CL9T.jfif'),(48,'dizay','2A412AE07B7993BF3612EB94431A9D06E919550C',0,'dizay@chitchat.com','9666666666','src/resources/server_resources/ChitChat_2S5TY.jpg'),(49,'luziver','B6A8F89581549D66F7D66487D4BBB46FF4F3C59C',0,'ironman@ChitChat.com','9595959595','src/resources/server_resources/ChitChat_BYNG7.jpg'),(50,'yazid','85F45E1685B99E03226A2A1371245DDB286D887A',0,'captain@chitchat.com','9898989898','src/resources/server_resources/ChitChat_G2KG5.jpg'),(51,'alimente','C829575CB9BDD27191CB3377C4F2E1794D6DD236',0,'alimente@chitchat.com','8787878787','src/resources/server_resources/ChitChat_XH8I0.jfif'),(52,'hackers',NULL,1,NULL,NULL,'src/resources/server_resources/ChitChat_8QWKV.jfif'),(53,'Friends',NULL,1,NULL,NULL,'src/resources/server_resources/ChitChat_KLGQA.jfif'),(54,'party',NULL,1,NULL,NULL,NULL),(55,'Secret_Group',NULL,1,NULL,NULL,NULL);
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


