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
INSERT INTO `friends` VALUES ('hohos',0,0),('smt_coder',0,0),('eXperienced',0,0),('satan_nightmare',0,0),('gg_14',1,1);
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitations`
--

DROP TABLE IF EXISTS `invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitations` (
  `fromuser` varchar(70) DEFAULT NULL,
  `touser` varchar(70) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitations`
--

LOCK TABLES `invitations` WRITE;
/*!40000 ALTER TABLE `invitations` DISABLE KEYS */;
INSERT INTO `invitations` VALUES ('Friends','hohos',0),('Friends','smt_coder',0),('Friends','eXperienced',0),('Friends','satan_nightmare',0),('party','alimente',0),('party','dizay',0),('party','luziver',0),('Secret_Group','yazid',0),('Secret_Group','hohos',0),('Secret_Group','smt_coder',0),('Secret_Group','gg_14',0),('Secret_Group','eXperienced',0),('Secret_Group','satan_nightmare',0),('Secret_Group','dizay',0),('Secret_Group','alimente',0);
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `messagefrom` varchar(70) DEFAULT NULL,
  `messageto` varchar(70) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `sent` tinyint(1) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `actualsender` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=451 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (383,'alimente','yazid','whats up captain?','2017-12-21 06:45:26',1,0,'alimente'),(384,'yazid','alimente','nothing much','2017-12-21 06:45:57',1,0,'yazid'),(385,'yazid','alimente','just daily routine','2017-12-21 06:46:05',1,0,'yazid'),(386,'alimente','yazid','what about a fight...hahahaha','2017-12-21 06:46:39',1,0,'alimente'),(387,'yazid','alimente','i dont think','2017-12-21 06:46:54',1,0,'yazid'),(388,'yazid','alimente','u can control yourself','2017-12-21 06:47:06',1,0,'yazid'),(389,'gg_14','alimente','hey alimente!!','2017-12-21 06:52:36',0,0,'gg_14'),(390,'gg_14','alimente','having fun?','2017-12-21 06:52:43',0,0,'gg_14'),(391,'gg_14','alimente','in controlling yourself??','2017-12-21 06:52:52',0,0,'gg_14'),(392,'gg_14','alimente','lol lol lol','2017-12-21 06:53:02',0,0,'gg_14'),(393,'smt_coder','alimente','its been a month','2017-12-21 06:53:20',0,0,'smt_coder'),(394,'smt_coder','alimente','since i last the real u','2017-12-21 06:53:31',0,0,'smt_coder'),(395,'smt_coder','alimente','time to turn green','2017-12-21 06:53:39',0,0,'smt_coder'),(396,'smt_coder','alimente','huh??','2017-12-21 06:53:41',0,0,'smt_coder'),(397,'smt_coder','alimente','hahaha','2017-12-21 06:53:44',0,0,'smt_coder'),(398,'hohos','alimente','I am a philosopher','2017-12-21 06:54:07',1,0,'hohos'),(399,'hohos','alimente','tell me ur problems','2017-12-21 06:54:14',1,0,'hohos'),(400,'hohos','alimente','and i will solve them','2017-12-21 06:54:28',1,0,'hohos'),(401,'yazid','alimente','but still','2017-12-21 06:54:45',1,0,'yazid'),(402,'yazid','alimente','I am always up for fight!!','2017-12-21 06:54:57',1,0,'yazid'),(403,'gg_14','eXperienced','Preparing well for ICPC?','2017-12-21 07:03:44',0,0,'gg_14'),(404,'gg_14','eXperienced','All the best brother','2017-12-21 07:03:53',0,0,'gg_14'),(405,'alimente','yazid','just tell the venue..','2017-12-21 07:08:37',1,0,'alimente'),(406,'yazid','alimente','where I was born','2017-12-21 07:08:55',1,0,'yazid'),(407,'alimente','yazid','that was a century ago','2017-12-21 07:09:16',1,0,'alimente'),(408,'alimente','yazid','you emotional idiot','2017-12-21 07:09:32',1,0,'alimente'),(409,'hohos','yazid','hey','2017-12-21 07:10:56',1,0,'hohos'),(410,'hohos','yazid','cap','2017-12-21 07:10:58',1,0,'hohos'),(411,'hohos','yazid','howdy','2017-12-21 07:11:04',1,0,'hohos'),(412,'alimente','dizay','I am gonna rip you in two pieces','2017-12-21 07:26:29',1,0,'alimente'),(413,'hackers','yazid','I will beat u all','2017-12-21 07:55:28',1,0,'dizay'),(414,'hackers','luziver','I will beat u all','2017-12-21 07:55:28',1,0,'dizay'),(415,'hackers','alimente','I will beat u all','2017-12-21 07:55:28',1,0,'dizay'),(416,'dizay','hackers','I will beat u all','2017-12-21 07:55:28',0,0,'dizay'),(417,'hackers','yazid','how you people are gonna fight with me??','2017-12-21 07:56:03',1,0,'dizay'),(418,'hackers','luziver','how you people are gonna fight with me??','2017-12-21 07:56:03',1,0,'dizay'),(419,'hackers','alimente','how you people are gonna fight with me??','2017-12-21 07:56:03',1,0,'dizay'),(420,'dizay','hackers','how you people are gonna fight with me??','2017-12-21 07:56:03',0,0,'dizay'),(421,'hackers','yazid','like the old man say..','2017-12-21 07:56:57',1,0,'luziver'),(422,'hackers','dizay','like the old man say..','2017-12-21 07:56:57',1,0,'luziver'),(423,'hackers','alimente','like the old man say..','2017-12-21 07:56:57',1,0,'luziver'),(424,'luziver','hackers','like the old man say..','2017-12-21 07:56:57',0,0,'luziver'),(425,'hackers','yazid','TOGETHER','2017-12-21 07:57:05',1,0,'luziver'),(426,'hackers','dizay','TOGETHER','2017-12-21 07:57:05',1,0,'luziver'),(427,'hackers','alimente','TOGETHER','2017-12-21 07:57:05',1,0,'luziver'),(428,'luziver','hackers','TOGETHER','2017-12-21 07:57:05',0,0,'luziver'),(429,'hackers','yazid','Hell Yeah!! ','2017-12-21 07:57:30',1,0,'alimente'),(430,'hackers','dizay','Hell Yeah!! ','2017-12-21 07:57:30',1,0,'alimente'),(431,'hackers','luziver','Hell Yeah!! ','2017-12-21 07:57:30',1,0,'alimente'),(432,'alimente','hackers','Hell Yeah!! ','2017-12-21 07:57:30',0,0,'alimente'),(433,'hackers','yazid','src/resources/server_resources/ChitChat_5MA3J.jpg','2017-12-21 07:59:53',0,1,'luziver'),(434,'hackers','dizay','src/resources/server_resources/ChitChat_5MA3J.jpg','2017-12-21 07:59:53',0,1,'luziver'),(435,'hackers','alimente','src/resources/server_resources/ChitChat_5MA3J.jpg','2017-12-21 07:59:53',0,1,'luziver'),(436,'luziver','hackers','src/resources/server_resources/ChitChat_5MA3J.jpg','2017-12-21 07:59:53',0,1,'luziver'),(437,'hohos','yazid','Why are you not replying?','2017-12-21 08:21:22',0,0,'hohos'),(438,'hohos','yazid','I am waiting for the response...','2017-12-21 08:21:36',0,0,'hohos'),(439,'smt_coder','yazid','Hey cap','2017-12-21 08:21:54',0,0,'smt_coder'),(440,'smt_coder','yazid','try coding','2017-12-21 08:21:59',0,0,'smt_coder'),(441,'smt_coder','yazid','coding is the future','2017-12-21 08:22:07',0,0,'smt_coder'),(442,'gg_14','yazid','whats your strategy to beat dizay?','2017-12-21 08:22:28',0,0,'gg_14'),(443,'gg_14','yazid','If u want...I can help u in that..','2017-12-21 08:22:46',0,0,'gg_14'),(444,'luziver','yazid','hey cap','2017-12-21 08:23:25',0,0,'luziver'),(445,'luziver','yazid','sorry for what happened in civil war','2017-12-21 08:23:37',0,0,'luziver'),(446,'luziver','yazid','hope u understand','2017-12-21 08:23:53',0,0,'luziver'),(447,'hackers','dizay','u just wait and watch your end..dizay','2017-12-21 08:26:17',0,0,'yazid'),(448,'hackers','luziver','u just wait and watch your end..dizay','2017-12-21 08:26:17',1,0,'yazid'),(449,'hackers','alimente','u just wait and watch your end..dizay','2017-12-21 08:26:17',0,0,'yazid'),(450,'yazid','hackers','u just wait and watch your end..dizay','2017-12-21 08:26:17',0,0,'yazid');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party`
--

DROP TABLE IF EXISTS `party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party` (
  `participants` varchar(70) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  `accepted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party`
--

LOCK TABLES `party` WRITE;
/*!40000 ALTER TABLE `party` DISABLE KEYS */;
INSERT INTO `party` VALUES ('alimente',0,0),('dizay',0,0),('luziver',0,0),('yazid',1,1);
/*!40000 ALTER TABLE `party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secret_group`
--

DROP TABLE IF EXISTS `secret_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secret_group` (
  `participants` varchar(70) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  `accepted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secret_group`
--

LOCK TABLES `secret_group` WRITE;
/*!40000 ALTER TABLE `secret_group` DISABLE KEYS */;
INSERT INTO `secret_group` VALUES ('yazid',0,0),('hohos',0,0),('smt_coder',0,0),('gg_14',0,0),('eXperienced',0,0),('satan_nightmare',0,0),('dizay',0,0),('alimente',0,0),('luziver',1,1);
/*!40000 ALTER TABLE `secret_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

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

-- Dump completed on 2017-12-21  9:27:29
