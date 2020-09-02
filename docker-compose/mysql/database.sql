-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: production_afmak
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Table structure for table `admin_languages`
--

DROP TABLE IF EXISTS `admin_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_languages` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_languages`
--

LOCK TABLES `admin_languages` WRITE;
/*!40000 ALTER TABLE `admin_languages` DISABLE KEYS */;
INSERT INTO `admin_languages` VALUES (1,1,'English','en.json','en',0),(2,0,'RTL English','1584887310NzfWDhO8.json','1584887310NzfWDhO8',1);
/*!40000 ALTER TABLE `admin_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_conversations`
--

DROP TABLE IF EXISTS `admin_user_conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user_conversations` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('Ticket','Dispute') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_conversations`
--

LOCK TABLES `admin_user_conversations` WRITE;
/*!40000 ALTER TABLE `admin_user_conversations` DISABLE KEYS */;
INSERT INTO `admin_user_conversations` VALUES (1,'Hello',33,'the registration number \nis a request for the certicficate of registration of your companys number \nTin number','2020-06-05 23:19:13','2020-06-05 23:19:13',NULL,NULL),(2,'Hello',65,'Elvis from Afmak.com \n\n         We have noticed that the prices of your honey are way too high, we working behind the scene to correct the problem \n\n\nThanks \nsupport@afmak.com','2020-06-29 22:23:20','2020-06-29 22:23:20',NULL,NULL);
/*!40000 ALTER TABLE `admin_user_conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_messages`
--

DROP TABLE IF EXISTS `admin_user_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user_messages` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_messages`
--

LOCK TABLES `admin_user_messages` WRITE;
/*!40000 ALTER TABLE `admin_user_messages` DISABLE KEYS */;
INSERT INTO `admin_user_messages` VALUES (1,1,'the registration number \nis a request for the certicficate of registration of your companys number \nTin number',NULL,'2020-06-05 23:19:13','2020-06-05 23:19:13'),(2,2,'Elvis from Afmak.com \n\n         We have noticed that the prices of your honey are way too high, we working behind the scene to correct the problem \n\n\nThanks \nsupport@afmak.com',NULL,'2020-06-29 22:23:20','2020-06-29 22:23:20');
/*!40000 ALTER TABLE `admin_user_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(191) NOT NULL DEFAULT '0',
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_name` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Admin','me@shawndreck.com','.',0,'1556780563user.png','$2y$10$2YKbyT2zOSOEPZztA4Tp5eXi6QMv5M.aC9T9NPQCtx9B2DiWDxTyq',1,'ZwmQmx0xd1Qz0gzprJfHusIDbwPBlGTOvhhjDqMVhvvG83P6hN5jSuP2Yc7z','2018-02-28 23:27:08','2020-06-15 17:54:25','Afmak'),(8,'Elvis','elviskalitsi@gmail.com','+233208266322',16,'1588325688T010PUE1E3H-U010WQE327P-32d5c451e12f-512','$2y$10$FPBJ7LrJjZFQXhd/EXytRuvA.BoSOoM9kFpFaQih3e5sgieUomtPy',1,'FmxdpbkfsM3ooRkAvDuyjI3pkGS8eDI01ReacOGKKGMZWHROLateodivK9wv','2020-05-01 09:34:48','2020-05-28 07:36:23',NULL);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_options`
--

DROP TABLE IF EXISTS `attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_options`
--

LOCK TABLES `attribute_options` WRITE;
/*!40000 ALTER TABLE `attribute_options` DISABLE KEYS */;
INSERT INTO `attribute_options` VALUES (1,1,'Clothes','2020-06-04 04:14:47','2020-06-04 04:14:47'),(2,2,'toys','2020-06-04 04:15:34','2020-06-04 04:15:34');
/*!40000 ALTER TABLE `attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attributable_id` int(11) DEFAULT NULL,
  `attributable_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `input_name` varchar(255) DEFAULT NULL,
  `price_status` int(3) NOT NULL DEFAULT '1' COMMENT '0 - hide, 1- show	',
  `details_status` int(3) NOT NULL DEFAULT '1' COMMENT '0 - hide, 1- show	',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,9,'App\\Models\\Subcategory','dress','dress',1,1,'2020-06-04 04:14:47','2020-06-04 04:14:47'),(2,8,'App\\Models\\Subcategory','Toys','toys',1,1,'2020-06-04 04:15:34','2020-06-04 04:15:34');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Large','TopSmall','BottomSmall') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (9,'1594302937Thu_9_07_2020_13_52_41.png','https://afmak.com/user/login','Large'),(13,'1592675966USEFORBANNER.png',NULL,'TopSmall'),(14,'159267630320200620_172912-1.png','https://afmak.com/user/login','TopSmall');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_categories` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_categories`
--

LOCK TABLES `blog_categories` WRITE;
/*!40000 ALTER TABLE `blog_categories` DISABLE KEYS */;
INSERT INTO `blog_categories` VALUES (1,'Business','Know-what-to-do'),(2,'Start up  Businesses','start-ups'),(3,'Made in Africa','African-products');
/*!40000 ALTER TABLE `blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(191) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `meta_tag` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `tags` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (2,1,'Why Sell Online? The Importance of eCommerce in Your Sales Strategy','<div class=\"post-header\" style=\"font-family: Sahitya, sans-serif; position: relative; margin-bottom: 15px; color: rgb(115, 116, 117); background-color: rgb(253, 253, 253);\"><h2 class=\"post-title\" style=\"font-family: inherit; line-height: 1.1; color: rgb(35, 35, 35); margin-bottom: 10px; font-size: 22px;\">Why Sell Online? The Importance of eCommerce in Your Sales Strategy</h2></div><div class=\"post-body\" style=\"font-family: Sahitya, sans-serif; color: rgb(115, 116, 117); background-color: rgb(253, 253, 253);\"><div class=\"post-excerpt\" style=\"font-size: 15px; line-height: 24px; text-align: justify;\"><p style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\">ou don\'t have to run your entire business over the internet to benefit from online business opportunities. Small businesses might only need an email address to communicate with their clients, customers and suppliers electronically. Other businesses might use their website to conduct their entire business online.</p><p style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"></p><h1 id=\"page_title\" xss=\"removed\" style=\"font-family: inherit; margin: 20px 0px 10px; font-size: 36px; line-height: 1.1; color: rgb(52, 61, 70);\">Benefits of doing business online</h1><div id=\"content_div_8581\" xss=\"removed\"><p xss=\"removed\" style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\">You don\'t have to run your entire business over the internet to benefit from online business opportunities. Small businesses might only need an email address to communicate with their clients, customers and suppliers electronically. Other businesses might use their website to conduct their entire business online.</p><p xss=\"removed\" style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\">The many benefits of online business include:</p><ul xss=\"removed\" style=\"margin-bottom: 20px; padding-left: 0px; list-style: none;\"><li xss=\"removed\">global access, 24 hours a day, 7 days a week</li><li xss=\"removed\">improved client service through greater flexibility</li><li xss=\"removed\">cost savings</li><li xss=\"removed\">faster delivery of products</li><li xss=\"removed\">increased professionalism</li><li xss=\"removed\">less paper waste</li><li xss=\"removed\">opportunities to manage your business from anywhere in the world.</li></ul><p xss=\"removed\" style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\">Customers may prefer to visit your website to find out about your products and services, instead of visiting you in person. They will also expect to see your website address and your email on business cards and other promotional materials.</p><h2 xss=\"removed\" style=\"font-family: inherit; line-height: 1.1; color: rgb(52, 61, 70); margin-top: 20px; margin-bottom: 10px; font-size: 30px;\">Online business opportunities</h2><p xss=\"removed\" style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\">How you manage your business online will depend on the products or services you offer. You may be able to use the internet to:</p><ul xss=\"removed\" style=\"margin-bottom: 20px; padding-left: 0px; list-style: none;\"><li xss=\"removed\">run an online shop</li><li xss=\"removed\">manage your suppliers</li><li xss=\"removed\">communicate with your customers, and get their feedback on your business</li><li xss=\"removed\">offer services online</li><li xss=\"removed\">allow customers to make reservations or appointments online</li><li xss=\"removed\">manage your finances, such as online banking, tax and employee pay</li><li xss=\"removed\">research competitors.</li></ul><h2 xss=\"removed\" style=\"font-family: inherit; line-height: 1.1; color: rgb(52, 61, 70); margin-top: 20px; margin-bottom: 10px; font-size: 30px;\">Future opportunities</h2><p xss=\"removed\" style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\">Keep in mind that your business, as well as the variety of online tools available, is constantly changing and evolving. While you might not plan to have a website immediately when you start operating, it\'s still a good idea to think about whether you will need one at a later date and what you will use it for.</p><p xss=\"removed\" style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\">When you are planning the online aspects of your business, you should:</p><ul xss=\"removed\" style=\"margin-bottom: 20px; padding-left: 0px; list-style: none;\"><li xss=\"removed\">research your competitors and other businesses that use online tools</li><li xss=\"removed\">decide what aspects of online business will benefit your business</li><li xss=\"removed\">review your budget to work out what you can afford</li><li xss=\"removed\">familiarise yourself with any laws and regulations that will apply to your online business activities</li><li xss=\"removed\">consider your requirements, including what software you need and what types of computer equipment you need to run it</li><li xss=\"removed\">plan for risks, such as computer viruses, scams, data theft and loss of or damage to hardware</li><li xss=\"removed\">think about what training you or your staff might need</li><li xss=\"removed\">be realistic about the time and budget you will need to manage the online aspects of your business</li></ul></div><p style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\"></p></div></div><div class=\"post-body social_share\" style=\"font-family: Sahitya, sans-serif; color: rgb(115, 116, 117); background-color: rgb(253, 253, 253);\"><div id=\"share\"><a href=\"http://www.facebook.com/share.php?u=https%3A%2F%2Fafmakprime.com%2Fhome%2Fblog_detail%2F34%2FWhy-Sell-Online-The-Importance-of-eCommerce-in-Your-Sales-Strategy\" title=\"Share this page on facebook\" class=\"pop share-square share-square-facebook\" style=\"background-image: url(&quot;images/social-icons.png&quot;); background-position: -384px -44px; background-size: initial; background-repeat: no-repeat; background-attachment: scroll; background-origin: initial; background-clip: initial; color: rgb(35, 35, 35); transition: all 0.2s ease-in-out 0s; display: inline-block; height: 32px; line-height: 0; margin: 2px; width: 32px; outline-style: initial !important; outline-width: 0px !important;\"></a><a href=\"https://plusone.google.com/_/+1/confirm?hl=en&amp;url=https%3A%2F%2Fafmakprime.com%2Fhome%2Fblog_detail%2F34%2FWhy-Sell-Online-The-Importance-of-eCommerce-in-Your-Sales-Strategy\" title=\"Share this page on googleplus\" class=\"pop share-square share-square-googleplus\" style=\"background-image: url(&quot;images/social-icons.png&quot;); background-position: -288px -44px; background-size: initial; background-repeat: no-repeat; background-attachment: scroll; background-origin: initial; background-clip: initial; color: rgb(35, 35, 35); transition: all 0.2s ease-in-out 0s; display: inline-block; height: 32px; line-height: 0; margin: 2px; width: 32px; outline-style: initial !important; outline-width: 0px !important;\"></a><a href=\"https://twitter.com/share?url=https%3A%2F%2Fafmakprime.com%2Fhome%2Fblog_detail%2F34%2FWhy-Sell-Online-The-Importance-of-eCommerce-in-Your-Sales-Strategy&amp;text=Blog%20%7C%7C%20AfmakPrimeNetwork\" title=\"Share this page on twitter\" class=\"pop share-square share-square-twitter\" style=\"background-image: url(&quot;images/social-icons.png&quot;); background-position: -64px -44px; background-size: initial; background-repeat: no-repeat; background-attachment: scroll; background-origin: initial; background-clip: initial; color: rgb(35, 35, 35); transition: all 0.2s ease-in-out 0s; display: inline-block; height: 32px; line-height: 0; margin: 2px; width: 32px; outline-style: initial !important; outline-width: 0px !important;\"></a><a href=\"http://www.linkedin.com/shareArticle?mini=true&amp;url=https%3A%2F%2Fafmakprime.com%2Fhome%2Fblog_detail%2F34%2FWhy-Sell-Online-The-Importance-of-eCommerce-in-Your-Sales-Strategy&amp;title=Blog%20%7C%7C%20AfmakPrimeNetwork&amp;summary=Telling%20the%20African%20story%20our%20own%20way...&amp;source=in1.com\" title=\"Share this page on linkedin\" class=\"pop share-square share-square-linkedin\" style=\"background-image: url(&quot;images/social-icons.png&quot;); background-position: -224px -44px; background-size: initial; background-repeat: no-repeat; background-attachment: scroll; background-origin: initial; background-clip: initial; color: rgb(35, 35, 35); transition: all 0.2s ease-in-out 0s; display: inline-block; height: 32px; line-height: 0; margin: 2px; width: 32px; outline-style: initial !important; outline-width: 0px !important;\"></a></div></div>','1591100298e-commerce-companies-1.jpg','https://afmakprime.com/home/blog_detail/34/Why-Sell-Online-The-Importance-of-eCommerce-in-Your-Sales-Strategy',103,1,NULL,NULL,'Online business opportunities,Benefits of doing business online','2020-06-02 04:18:18'),(3,1,'How Entrepreneurs Respond When A New Industry Emerges','<p style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(115, 116, 117); font-size: 15px; text-align: justify; background-color: rgb(253, 253, 253);\">When I lived in Zimbabwe, I became friendly with a white family that owned a well established motor vehicle distribution business, that had show rooms nationally at the time.</p><p style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(115, 116, 117); font-size: 15px; text-align: justify; background-color: rgb(253, 253, 253);\"></p><p style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(115, 116, 117); font-size: 15px; text-align: justify; background-color: rgb(253, 253, 253);\">How Entrepreneurs Respond When A New Industry Emerges:</p><p style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(115, 116, 117); font-size: 15px; text-align: justify; background-color: rgb(253, 253, 253);\">When I lived in Zimbabwe, I became friendly with a white family that owned a well established motor vehicle distribution business, that had show rooms nationally at the time.</p><p style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(115, 116, 117); font-size: 15px; text-align: justify; background-color: rgb(253, 253, 253);\">One day I asked them how their business started:</p><p style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(115, 116, 117); font-size: 15px; text-align: justify; background-color: rgb(253, 253, 253);\">“Our great grand father came to this country when he was a young man, in the 1920’s. He travelled one day to South Africa, and saw cars for the first time. He immediately realized a new industry was being born. So he gave up farming, and started to train as a motor mechanic. When the wealthy guys started buying cars, he offered to repair and maintain them. He soon became one of the richest people in the country at the time.”</p><p style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(115, 116, 117); font-size: 15px; text-align: justify; background-color: rgb(253, 253, 253);\">This is the story of entrepreneurs, the world over. They see something, and they immediately take action. Remember Jack Ma’s first visit to America, when he was an English language teacher?<br></p><p style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(115, 116, 117); font-size: 15px; text-align: justify; background-color: rgb(253, 253, 253);\">He saw the Internet for the first time. What did he DO? He rushed back home and set up Alibaba! He did not say to himself “but the Chinese have no computers, and they are too poor. Or data is expensive!” People who talk like that will never, ever start anything, because they are already building barriers to themselves,beginning in their own minds.<br></p><p style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(115, 116, 117); font-size: 15px; text-align: justify; background-color: rgb(253, 253, 253);\">Every barrier begins in the mind-set!<br></p><p style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(115, 116, 117); font-size: 15px; text-align: justify; background-color: rgb(253, 253, 253);\">Don’t be like them. “I learn to do”!</p><p style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(115, 116, 117); font-size: 15px; text-align: justify; background-color: rgb(253, 253, 253);\">By: Strive Masiyiwa, Zimbabwean Billionaire<br></p>','1591267991web-store New.jpg','https://afmakprime.com/home/blog_detail/35/How-Entrepreneurs-Respond-When-A-New-Industry-Emerges',88,1,NULL,NULL,'A New Industry Emerges','2020-06-02 04:36:05'),(4,1,'Using social media to market your business','<h1 id=\"page_title\" xss=\"removed\" style=\"font-family: Sahitya, sans-serif; margin: 20px 0px 10px; font-size: 36px; line-height: 1.1; color: rgb(52, 61, 70); text-align: justify; background-color: rgb(253, 253, 253);\">Using social media to market your business: the basics</h1><div id=\"content_div_6551\" xss=\"removed\" style=\"font-family: Sahitya, sans-serif; color: rgb(115, 116, 117); font-size: 15px; text-align: justify; background-color: rgb(253, 253, 253);\"><p xss=\"removed\" style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\">Social media are internet services that let you interact with others and share and create content through online communities.</p><p xss=\"removed\" style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\">Social media present great marketing opportunities for businesses of all sizes. You can use social media to:</p><ul xss=\"removed\" style=\"margin-bottom: 20px; padding-left: 0px; list-style: none;\"><li xss=\"removed\">promote the name of your brand and business</li><li xss=\"removed\">tell customers about your goods and services</li><li xss=\"removed\">find out what customers think of your business</li><li xss=\"removed\">attract new customers</li><li xss=\"removed\">build stronger relationships with existing customers.</li></ul><h2 xss=\"removed\" style=\"font-family: inherit; line-height: 1.1; color: rgb(52, 61, 70); margin-top: 20px; margin-bottom: 10px; font-size: 30px;\">Advantages of using social media</h2><p xss=\"removed\" style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\">Social media marketing has many advantages:</p><ul xss=\"removed\" style=\"margin-bottom: 20px; padding-left: 0px; list-style: none;\"><li xss=\"removed\"><span xss=\"removed\" style=\"font-weight: 700;\">broad reach</span>&nbsp;- social media can reach millions of people all around the world</li><li xss=\"removed\"><span xss=\"removed\" style=\"font-weight: 700;\">ability to target</span>&nbsp;particular groups - many forms of social media (e.g. Facebook, Twitter, Instagram) allow businesses to target specific groups, often in particular locations</li><li xss=\"removed\"><span xss=\"removed\" style=\"font-weight: 700;\">free or low-cost</span>&nbsp;- many forms of social media are free for business, and paid options are usually low-cost</li><li xss=\"removed\"><span xss=\"removed\" style=\"font-weight: 700;\">personal</span>&nbsp;- social media allow you to communicate on a personal basis with individual customers and groups</li><li xss=\"removed\"><span xss=\"removed\" style=\"font-weight: 700;\">fast</span>&nbsp;- you can quickly distribute information to many people</li><li xss=\"removed\"><span xss=\"removed\" style=\"font-weight: 700;\">easy</span>&nbsp;- you don\'t need high-level skills or computer equipment to participate in social media. The average person with a standard computer should have no difficulty.</li></ul><h2 xss=\"removed\" style=\"font-family: inherit; line-height: 1.1; color: rgb(52, 61, 70); margin-top: 20px; margin-bottom: 10px; font-size: 30px;\">Risks of using social media</h2><p xss=\"removed\" style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\">Of course, marketing through social media also has its risks. These include:</p><ul xss=\"removed\" style=\"margin-bottom: 20px; padding-left: 0px; list-style: none;\"><li xss=\"removed\"><span xss=\"removed\" style=\"font-weight: 700;\">wasted time and money</span>&nbsp;for little or no tangible return</li><li xss=\"removed\"><span xss=\"removed\" style=\"font-weight: 700;\">the rapid spread of the wrong kind of information</span>&nbsp;about your business (e.g. incorrect information accidentally posted by you, negative reviews posted by others)</li><li xss=\"removed\"><span xss=\"removed\" style=\"font-weight: 700;\">legal problems</span>&nbsp;if you don\'t follow&nbsp;<a href=\"https://www.oaic.gov.au/privacy/the-privacy-act/\" xss=\"removed\" style=\"color: rgb(35, 35, 35); transition: all 0.2s ease-in-out 0s; outline-style: initial !important; outline-width: 0px !important;\">privacy legislation</a>&nbsp;and&nbsp;<a href=\"https://www.business.gov.au/Marketing/Marketing-and-advertising/Business-marketing\" xss=\"removed\" style=\"color: rgb(35, 35, 35); transition: all 0.2s ease-in-out 0s; outline-style: initial !important; outline-width: 0px !important;\">the laws regarding spam, copyright and other online issues</a>.</li></ul><p xss=\"removed\" style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\">It\'s important to be aware of these risks and to have strategies in place to avoid them if you decide to get involved in social media marketing.</p><h2 xss=\"removed\" style=\"font-family: inherit; line-height: 1.1; color: rgb(52, 61, 70); margin-top: 20px; margin-bottom: 10px; font-size: 30px;\">Key social media services</h2><p xss=\"removed\" style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\">Different types of social media are good for different marketing activities. The key social media services are:</p><ul xss=\"removed\" style=\"margin-bottom: 20px; padding-left: 0px; list-style: none;\"><li xss=\"removed\"><a href=\"https://www.business.qld.gov.au/running-business/marketing-sales/marketing-promotion/online-marketing/facebook\" xss=\"removed\" style=\"color: rgb(35, 35, 35); transition: all 0.2s ease-in-out 0s; outline-style: initial !important; outline-width: 0px !important;\"><span xss=\"removed\" style=\"font-weight: 700;\">Facebook</span></a>&nbsp;- a social networking site that allows you to have conversations with customers, post photos and videos, promote special offers, and more</li><li xss=\"removed\"><a href=\"https://www.business.qld.gov.au/running-business/marketing-sales/marketing-promotion/online-marketing/twitter\" xss=\"removed\" style=\"color: rgb(35, 35, 35); transition: all 0.2s ease-in-out 0s; outline-style: initial !important; outline-width: 0px !important;\"><span xss=\"removed\" style=\"font-weight: 700;\">Twitter</span></a>&nbsp;- a \'micro-blogging\' service that allows you to send and receive short messages from customers and potential customers</li><li xss=\"removed\"><a href=\"https://www.business.qld.gov.au/running-business/marketing-sales/marketing-promotion/online-marketing/youtube\" xss=\"removed\" style=\"color: rgb(35, 35, 35); transition: all 0.2s ease-in-out 0s; outline-style: initial !important; outline-width: 0px !important;\"><span xss=\"removed\" style=\"font-weight: 700;\">YouTube</span></a>&nbsp;- an online video-hosting service that lets people share their videos</li><li xss=\"removed\"><a href=\"https://www.business.qld.gov.au/running-business/marketing-sales/marketing-promotion/online-marketing/blog\" xss=\"removed\" style=\"color: rgb(35, 35, 35); transition: all 0.2s ease-in-out 0s; outline-style: initial !important; outline-width: 0px !important;\"><span xss=\"removed\" style=\"font-weight: 700;\">blogs</span></a>&nbsp;- internet sites that contain a series of entries or \'posts\' about topics of interest to the author, much like an online \'diary\'</li><li xss=\"removed\"><a href=\"https://www.business.qld.gov.au/running-business/marketing-sales/marketing-promotion/online-marketing/coupon-websites\" xss=\"removed\" style=\"color: rgb(35, 35, 35); transition: all 0.2s ease-in-out 0s; outline-style: initial !important; outline-width: 0px !important;\"><span xss=\"removed\" style=\"font-weight: 700;\">coupon sites</span></a>&nbsp;- websites that offer discount coupons for goods, services and events</li><li xss=\"removed\"><a href=\"https://www.business.qld.gov.au/running-business/marketing-sales/marketing-promotion/online-marketing/photo-sharing\" xss=\"removed\" style=\"color: rgb(35, 35, 35); transition: all 0.2s ease-in-out 0s; outline-style: initial !important; outline-width: 0px !important;\"><span xss=\"removed\" style=\"font-weight: 700;\">online photo-sharing services</span></a>&nbsp;- websites that allow users to store, organise and share their photo collections</li><li xss=\"removed\"><a href=\"https://www.business.qld.gov.au/running-business/marketing-sales/marketing-promotion/online-marketing/location-based\" xss=\"removed\" style=\"color: rgb(35, 35, 35); transition: all 0.2s ease-in-out 0s; outline-style: initial !important; outline-width: 0px !important;\"><span xss=\"removed\" style=\"font-weight: 700;\">location-based marketing</span>&nbsp;<span xss=\"removed\" style=\"font-weight: 700;\">sites</span></a>&nbsp;- websites that deliver targeted marketing messages to customers in particular locations, through mobile devices such as smartphones and tablets</li><li xss=\"removed\"><a href=\"https://www.business.qld.gov.au/running-business/consumer-laws/customer-service/managing-customer-reviews\" xss=\"removed\" style=\"color: rgb(35, 35, 35); transition: all 0.2s ease-in-out 0s; outline-style: initial !important; outline-width: 0px !important;\"><span xss=\"removed\" style=\"font-weight: 700;\">customer review sites</span></a>&nbsp;- websites that feature customer reviews of goods and services.</li></ul><p xss=\"removed\" style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\">Many businesses are also using online technology to support their marketing efforts. This includes:</p><ul xss=\"removed\" style=\"margin-bottom: 20px; padding-left: 0px; list-style: none;\"><li xss=\"removed\"><a href=\"https://www.business.qld.gov.au/running-business/marketing-sales/marketing-promotion/online-marketing/using-mobile-apps\" xss=\"removed\" style=\"color: rgb(35, 35, 35); transition: all 0.2s ease-in-out 0s; outline-style: initial !important; outline-width: 0px !important;\">developing applications for mobile devices</a></li><li xss=\"removed\"><a href=\"https://www.business.qld.gov.au/running-business/marketing-sales/marketing-promotion/online-marketing/optimising-mobile\" xss=\"removed\" style=\"color: rgb(35, 35, 35); transition: all 0.2s ease-in-out 0s; outline-style: initial !important; outline-width: 0px !important;\">modifying websites to make sure that they work properly on mobile devices</a></li><li xss=\"removed\"><a href=\"https://www.business.qld.gov.au/running-business/finances-cash-flow/taking-online-payments\" xss=\"removed\" style=\"color: rgb(35, 35, 35); transition: all 0.2s ease-in-out 0s; outline-style: initial !important; outline-width: 0px !important;\">giving customers the option of paying online</a>.</li></ul><h2 xss=\"removed\" style=\"font-family: inherit; line-height: 1.1; color: rgb(52, 61, 70); margin-top: 20px; margin-bottom: 10px; font-size: 30px;\">Getting started with social media</h2><p xss=\"removed\" style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\">If you aren\'t already familiar with social media, the terminology and the range of different services can seem daunting at first.</p><p xss=\"removed\" style=\"font-family: Sahitya, sans-serif; margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\">But it\'s worth learning more. Most social media services are affordable and easy to use, and they can put your business in touch with customers like never before.</p><h2 xss=\"removed\" style=\"font-family: inherit; line-height: 1.1; color: rgb(52, 61, 70); margin-top: 20px; margin-bottom: 10px; font-size: 30px;\">Also consider...</h2><ul xss=\"removed\" style=\"margin-bottom: 20px; padding-left: 0px; list-style: none;\"><li xss=\"removed\">Find out about&nbsp;<a href=\"https://www.business.qld.gov.au/starting-business/internet-start-ups/online-basics\" xss=\"removed\" style=\"color: rgb(35, 35, 35); transition: all 0.2s ease-in-out 0s; outline-style: initial !important; outline-width: 0px !important;\">doing business online</a>.</li><li xss=\"removed\">Find out how to create a&nbsp;<a href=\"https://www.business.qld.gov.au/running-business/it/digital-strategy\" xss=\"removed\" style=\"color: rgb(35, 35, 35); transition: all 0.2s ease-in-out 0s; outline-style: initial !important; outline-width: 0px !important;\">digital strategy for your business</a>.</li><li xss=\"removed\">Find out how privacy relates to&nbsp;<span xss=\"removed\">social media and other technologies</span></li></ul></div>','159110183008da8dcba3e7588bc9278d292c50a3be-round-web-contact-icons-set.jpg','https://afmakprime.com/home/blog_detail/36/Using-social-media-to-market-your-business',93,1,NULL,NULL,'Using social media to market your business','2020-06-02 04:43:50');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (25,'Baby & Kids','Babies',1,'1591219366FB_IMG_1443532175660.jpg',1,'1592035314953da229ba933d478fcd21fd532ba174.jpg'),(26,'Innovation','Innovations',1,'1591219413FB_IMG_1443635785608.jpg',1,'1591219251FB_IMG_1443553835394.jpg'),(27,'Arts and Crafts','Arts',1,'1591219167IMG-20151028-WA0009.jpg',1,'1591219167IMG-20151028-WA0009.jpg'),(28,'Toys','Toys',1,'159203543891af2f5d9a5b3455422bda0c298a90f3.jpg',1,'15920349331_FCc1L_hydigSH9dMQVxEew.jpeg'),(30,'Food','Dishes',1,'1591219054FB_IMG_1443495915333.jpg',1,'1592034770IMG_20200613_075102_977.jpg'),(31,'Raw materials','Supplies',1,'158889191943526794_303.jpg',1,'158889195543526794_303.jpg'),(32,'Media Files','Digital-Media-category',1,'1588891817customer_product_22_1_thumb.jpg',1,'1588891817customer_product_22_1_thumb.jpg'),(33,'Life Style Fashion','Fashion',1,'1591218866download.jfif',1,'1591218866download.jfif'),(34,'Services','Services',1,'1591218824support_section_2.jpg',1,'1591218824support_section_2.jpg'),(35,'Farm','Farm',1,'1591218755home-img.jpg',1,'1591218755home-img.jpg'),(36,'Free Samples','free-samples',1,'159479335520200708_204142.jpg',0,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `childcategories`
--

DROP TABLE IF EXISTS `childcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `childcategories` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `subcategory_id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `childcategories`
--

LOCK TABLES `childcategories` WRITE;
/*!40000 ALTER TABLE `childcategories` DISABLE KEYS */;
INSERT INTO `childcategories` VALUES (1,9,'0 - 3 months','infants',1),(2,9,'3 - 6 months','baby',1),(3,9,'6 - 9 months','6-months',1),(4,9,'9 - 12 months','9-months',1),(5,9,'12 - 18 months','12-months',1),(6,9,'18 + months','kid',1),(7,41,'Fashion for Men','Men',1),(8,41,'Fashion for Women','Women',1),(9,41,'Fashion for Kids','kids',1),(10,10,'Wood Works','wooden',1),(11,10,'Crafts in Metal','metals',1),(12,10,'Crafts in Plastics','plastics',1),(13,10,'Rew Materials','materials',1);
/*!40000 ALTER TABLE `childcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) unsigned NOT NULL,
  `product_id` int(191) unsigned NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversations` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(191) NOT NULL,
  `recieved_user` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` VALUES (1,'Errors after completing sell now',32,32,'i cant seem to get across the packages and sell items','2020-06-05 23:27:09','2020-06-05 23:27:09'),(2,'Hello',29,29,'i want one \nselorm here testing the system','2020-06-20 10:55:06','2020-06-20 10:55:06');
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counters`
--

DROP TABLE IF EXISTS `counters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('referral','browser') NOT NULL DEFAULT 'referral',
  `referral` varchar(255) DEFAULT NULL,
  `total_count` int(11) NOT NULL DEFAULT '0',
  `todays_count` int(11) NOT NULL DEFAULT '0',
  `today` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counters`
--

LOCK TABLES `counters` WRITE;
/*!40000 ALTER TABLE `counters` DISABLE KEYS */;
INSERT INTO `counters` VALUES (1,'referral','www.facebook.com',7,0,NULL),(2,'referral','geniusocean.com',2,0,NULL),(3,'browser','Windows 10',1481,0,NULL),(4,'browser','Linux',410,0,NULL),(5,'browser','Unknown OS Platform',63603,0,NULL),(6,'browser','Windows 7',804,0,NULL),(7,'referral','yandex.ru',15,0,NULL),(8,'browser','Windows 8.1',561,0,NULL),(9,'referral','www.google.com',37,0,NULL),(10,'browser','Android',920,0,NULL),(11,'browser','Mac OS X',625,0,NULL),(12,'referral','l.facebook.com',2,0,NULL),(13,'referral','codecanyon.net',6,0,NULL),(14,'browser','Windows XP',23,0,NULL),(15,'browser','Windows 8',4,0,NULL),(16,'browser','iPad',5,0,NULL),(17,'browser','Ubuntu',34,0,NULL),(18,'browser','iPhone',149,0,NULL),(19,'referral','localhost',19,0,NULL),(20,'referral',NULL,2,0,NULL),(21,'browser','Windows Vista',4,0,NULL),(22,'referral','www.bing.com',3,0,NULL),(23,'referral','anti-crisis-seo.com',70,0,NULL),(24,'referral','www.estdj.com',1,0,NULL),(25,'referral','AFMAK.COM',11,0,NULL),(26,'referral','google.com',1,0,NULL),(27,'referral','lm.facebook.com',1,0,NULL),(28,'referral','m.facebook.com',3,0,NULL),(29,'browser','Windows 2000',1,0,NULL),(30,'referral','t.co',23,0,NULL),(31,'referral','afmakprime.com',6,0,NULL),(32,'referral','www.sogou.com',7,0,NULL),(33,'referral','l.wl.co',3,0,NULL),(34,'referral','com.google.android.googlequicksearchbox',3,0,NULL),(35,'referral','afmak.test',2,0,NULL),(36,'referral','org.telegram.messenger',4,0,NULL),(37,'referral','www.vguss.com',2,0,NULL),(38,'referral','ir.ilmili.telegraph',1,0,NULL),(39,'referral','l.instagram.com',1,0,NULL),(40,'referral','com.google.android.gm',1,0,NULL),(41,'referral','www.swrh.net',1,0,NULL),(42,'referral','www.google.co.uk',1,0,NULL),(43,'referral','www.selectcontractsltd.com',2,0,NULL);
/*!40000 ALTER TABLE `counters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AF','Afghanistan'),(2,'AL','Albania'),(3,'DZ','Algeria'),(4,'DS','American Samoa'),(5,'AD','Andorra'),(6,'AO','Angola'),(7,'AI','Anguilla'),(8,'AQ','Antarctica'),(9,'AG','Antigua and Barbuda'),(10,'AR','Argentina'),(11,'AM','Armenia'),(12,'AW','Aruba'),(13,'AU','Australia'),(14,'AT','Austria'),(15,'AZ','Azerbaijan'),(16,'BS','Bahamas'),(17,'BH','Bahrain'),(18,'BD','Bangladesh'),(19,'BB','Barbados'),(20,'BY','Belarus'),(21,'BE','Belgium'),(22,'BZ','Belize'),(23,'BJ','Benin'),(24,'BM','Bermuda'),(25,'BT','Bhutan'),(26,'BO','Bolivia'),(27,'BA','Bosnia and Herzegovina'),(28,'BW','Botswana'),(29,'BV','Bouvet Island'),(30,'BR','Brazil'),(31,'IO','British Indian Ocean Territory'),(32,'BN','Brunei Darussalam'),(33,'BG','Bulgaria'),(34,'BF','Burkina Faso'),(35,'BI','Burundi'),(36,'KH','Cambodia'),(37,'CM','Cameroon'),(38,'CA','Canada'),(39,'CV','Cape Verde'),(40,'KY','Cayman Islands'),(41,'CF','Central African Republic'),(42,'TD','Chad'),(43,'CL','Chile'),(44,'CN','China'),(45,'CX','Christmas Island'),(46,'CC','Cocos (Keeling) Islands'),(47,'CO','Colombia'),(48,'KM','Comoros'),(49,'CD','Democratic Republic of the Congo'),(50,'CG','Republic of Congo'),(51,'CK','Cook Islands'),(52,'CR','Costa Rica'),(53,'HR','Croatia (Hrvatska)'),(54,'CU','Cuba'),(55,'CY','Cyprus'),(56,'CZ','Czech Republic'),(57,'DK','Denmark'),(58,'DJ','Djibouti'),(59,'DM','Dominica'),(60,'DO','Dominican Republic'),(61,'TP','East Timor'),(62,'EC','Ecuador'),(63,'EG','Egypt'),(64,'SV','El Salvador'),(65,'GQ','Equatorial Guinea'),(66,'ER','Eritrea'),(67,'EE','Estonia'),(68,'ET','Ethiopia'),(69,'FK','Falkland Islands (Malvinas)'),(70,'FO','Faroe Islands'),(71,'FJ','Fiji'),(72,'FI','Finland'),(73,'FR','France'),(74,'FX','France, Metropolitan'),(75,'GF','French Guiana'),(76,'PF','French Polynesia'),(77,'TF','French Southern Territories'),(78,'GA','Gabon'),(79,'GM','Gambia'),(80,'GE','Georgia'),(81,'DE','Germany'),(82,'GH','Ghana'),(83,'GI','Gibraltar'),(84,'GK','Guernsey'),(85,'GR','Greece'),(86,'GL','Greenland'),(87,'GD','Grenada'),(88,'GP','Guadeloupe'),(89,'GU','Guam'),(90,'GT','Guatemala'),(91,'GN','Guinea'),(92,'GW','Guinea-Bissau'),(93,'GY','Guyana'),(94,'HT','Haiti'),(95,'HM','Heard and Mc Donald Islands'),(96,'HN','Honduras'),(97,'HK','Hong Kong'),(98,'HU','Hungary'),(99,'IS','Iceland'),(100,'IN','India'),(101,'IM','Isle of Man'),(102,'ID','Indonesia'),(103,'IR','Iran (Islamic Republic of)'),(104,'IQ','Iraq'),(105,'IE','Ireland'),(106,'IL','Israel'),(107,'IT','Italy'),(108,'CI','Ivory Coast'),(109,'JE','Jersey'),(110,'JM','Jamaica'),(111,'JP','Japan'),(112,'JO','Jordan'),(113,'KZ','Kazakhstan'),(114,'KE','Kenya'),(115,'KI','Kiribati'),(116,'KP','Korea, Democratic People\'s Republic of'),(117,'KR','Korea, Republic of'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Lao People\'s Democratic Republic'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libyan Arab Jamahiriya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macau'),(131,'MK','North Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'TY','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia, Federated States of'),(145,'MD','Moldova, Republic of'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'MP','Northern Mariana Islands'),(166,'NO','Norway'),(167,'OM','Oman'),(168,'PK','Pakistan'),(169,'PW','Palau'),(170,'PS','Palestine'),(171,'PA','Panama'),(172,'PG','Papua New Guinea'),(173,'PY','Paraguay'),(174,'PE','Peru'),(175,'PH','Philippines'),(176,'PN','Pitcairn'),(177,'PL','Poland'),(178,'PT','Portugal'),(179,'PR','Puerto Rico'),(180,'QA','Qatar'),(181,'RE','Reunion'),(182,'RO','Romania'),(183,'RU','Russian Federation'),(184,'RW','Rwanda'),(185,'KN','Saint Kitts and Nevis'),(186,'LC','Saint Lucia'),(187,'VC','Saint Vincent and the Grenadines'),(188,'WS','Samoa'),(189,'SM','San Marino'),(190,'ST','Sao Tome and Principe'),(191,'SA','Saudi Arabia'),(192,'SN','Senegal'),(193,'RS','Serbia'),(194,'SC','Seychelles'),(195,'SL','Sierra Leone'),(196,'SG','Singapore'),(197,'SK','Slovakia'),(198,'SI','Slovenia'),(199,'SB','Solomon Islands'),(200,'SO','Somalia'),(201,'ZA','South Africa'),(202,'GS','South Georgia South Sandwich Islands'),(203,'SS','South Sudan'),(204,'ES','Spain'),(205,'LK','Sri Lanka'),(206,'SH','St. Helena'),(207,'PM','St. Pierre and Miquelon'),(208,'SD','Sudan'),(209,'SR','Suriname'),(210,'SJ','Svalbard and Jan Mayen Islands'),(211,'SZ','Swaziland'),(212,'SE','Sweden'),(213,'CH','Switzerland'),(214,'SY','Syrian Arab Republic'),(215,'TW','Taiwan'),(216,'TJ','Tajikistan'),(217,'TZ','Tanzania, United Republic of'),(218,'TH','Thailand'),(219,'TG','Togo'),(220,'TK','Tokelau'),(221,'TO','Tonga'),(222,'TT','Trinidad and Tobago'),(223,'TN','Tunisia'),(224,'TR','Turkey'),(225,'TM','Turkmenistan'),(226,'TC','Turks and Caicos Islands'),(227,'TV','Tuvalu'),(228,'UG','Uganda'),(229,'UA','Ukraine'),(230,'AE','United Arab Emirates'),(231,'GB','United Kingdom'),(232,'US','United States'),(233,'UM','United States minor outlying islands'),(234,'UY','Uruguay'),(235,'UZ','Uzbekistan'),(236,'VU','Vanuatu'),(237,'VA','Vatican City State'),(238,'VE','Venezuela'),(239,'VN','Vietnam'),(240,'VG','Virgin Islands (British)'),(241,'VI','Virgin Islands (U.S.)'),(242,'WF','Wallis and Futuna Islands'),(243,'EH','Western Sahara'),(244,'YE','Yemen'),(245,'ZM','Zambia'),(246,'ZW','Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `price` double NOT NULL,
  `times` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used` int(191) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` VALUES (1,'Forbuytest',0,90,NULL,0,1,'2020-06-01','2020-06-06');
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'USD','$',1,0),(10,'Cedis','GH¢',5.8,1);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_subject` mediumtext COLLATE utf8_unicode_ci,
  `email_body` longtext COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES (1,'new_order','Your Order Placed Successfully','<p>Hello {customer_name},<br>Your Order Number is {order_number}<br>Your order has been placed successfully</p>',1),(2,'new_registration','Welcome To Royal Commerce','<p>Hello {customer_name},<br>You have successfully registered to {website_title}, We wish you will have a wonderful experience using our service.</p><p>Thank You<br></p>',1),(3,'vendor_accept','Your Vendor Account Activated','<p>Hello {customer_name},<br>Your Vendor Account Activated Successfully. Please Login to your account and build your own shop.</p><p>Thank You<br></p>',1),(4,'subscription_warning','Your subscrption plan will end after five days','<p>Hello {customer_name},<br>Your subscription plan duration will end after five days. Please renew your plan otherwise all of your products will be deactivated.</p><p>Thank You<br></p>',1),(5,'vendor_verification','Request for verification.','<p>Hello {customer_name},<br>You are requested verify your account. Please send us photo of your passport.</p><p>Thank You<br></p>',1);
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faqs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'Afmak eCommerce','<div>Hello&nbsp;</div><div><br></div><div>Please allow us to introduce you to our business project called Afmak.com. It is an innovative e-commerce website written by web solutions Ltd. It specialises in assisting indigenous African companies to make their products and services accessible online with the requisite world class branding and packaging.</div><div><br></div><div>Afmak.com is a user friendly platform that allows vendors to put their products and services online easily and gives them access to a web page dedicated to their business. It also allows vendors to link their social media accounts to their Afmak.com webpage.</div><div><br></div><div>An advertisement on Afmak.com is affordable and guaranteed to reach thousands of visitors to the site.</div><div><br></div><div>Customers will also find it easy to buy and pay for products and services online easily and without hassle.</div><div><br></div><div>We invite you as a vendor, advertiser or customer to join Afmak and let us work together to promote Africa to the world.</div><div><br></div><div><br></div><div>Afmak four main core areas of concern are, the Manufacturing sector, indigenously made African products and services, small scale businesses and finally agricultural sector</div><div><br></div><div><br></div><div>This is officially our main point of focus</div><div><br></div><div><br></div><div>The project Afamk has a singular opportunity to employ millions of Ghanaian youth in a meaningful employment sectors as affiliated marketing agents, delivery department across the country, Administrative personals and many many offices&nbsp;</div><div><br></div><div><br></div><div>For any&nbsp; other further information&nbsp;</div><div><br></div><div>Contact us&nbsp; on our whatsapp number: +233 208 266 322</div>',0),(2,'How to Sell on Afmak','<div><br></div>&nbsp;To start you create an account as a user&nbsp;<a href=\"https://afmak.com/user/login\">https://afmak.com/user/login</a>&nbsp;<div>&nbsp;To sell on the Site, you Click on the Sell button at the top right corner of the&nbsp;</div><div>Afmak website&nbsp;</div><div><br></div><div>you will get this pop up&nbsp;</div><div>make sure to fill the forms correctly&nbsp;</div><div><br></div><div>&nbsp;&nbsp;<input type=\"text\" class=\"User Name\" name=\"name\" placeholder=\"Full Name\" required=\"\" style=\"margin-bottom: 0px; font-size: 14px; width: 338px; height: 50px; background: rgb(243, 248, 252); padding: 0px 30px 0px 45px; border-width: 1px; border-style: solid; border-color: rgba(0, 0, 0, 0.1);\"></div><div class=\"col-lg-6\" style=\"width: 368px; color: rgb(51, 51, 51); font-size: 16px;\"><div class=\"form-input\" style=\"position: relative; margin-bottom: 15px;\"><span class=\"icofont-user-alt-5\" style=\"position: absolute; top: 25px; transform: translateY(-50%); left: 15px; color: rgb(242, 34, 6);\"></span></div></div><div class=\"col-lg-6\" style=\"width: 368px; color: rgb(51, 51, 51); font-size: 16px;\"><div class=\"form-input\" style=\"position: relative; margin-bottom: 15px;\"><input type=\"email\" class=\"User Name\" name=\"email\" placeholder=\"Email Address\" required=\"\" style=\"margin-bottom: 0px; font-size: 14px; width: 338px; height: 50px; background: rgb(243, 248, 252); padding: 0px 30px 0px 45px; border-width: 1px; border-style: solid; border-color: rgba(0, 0, 0, 0.1);\"><span class=\"icofont-email\" style=\"position: absolute; top: 25px; transform: translateY(-50%); left: 15px; color: rgb(242, 34, 6);\"></span></div></div><div class=\"col-lg-6\" style=\"width: 368px; color: rgb(51, 51, 51); font-size: 16px;\"><div class=\"form-input\" style=\"position: relative; margin-bottom: 15px;\"><input type=\"text\" class=\"User Name\" name=\"phone\" placeholder=\"Phone Number\" required=\"\" style=\"margin-bottom: 0px; font-size: 14px; width: 338px; height: 50px; background: rgb(243, 248, 252); padding: 0px 30px 0px 45px; border-width: 1px; border-style: solid; border-color: rgba(0, 0, 0, 0.1);\"><span class=\"icofont-phone\" style=\"position: absolute; top: 25px; transform: translateY(-50%); left: 15px; color: rgb(242, 34, 6);\"></span></div></div><div class=\"col-lg-6\" style=\"width: 368px; color: rgb(51, 51, 51); font-size: 16px;\"><div class=\"form-input\" style=\"position: relative; margin-bottom: 15px;\"><input type=\"text\" class=\"User Name\" name=\"address\" placeholder=\"Address\" required=\"\" style=\"margin-bottom: 0px; font-size: 14px; width: 338px; height: 50px; background: rgb(243, 248, 252); padding: 0px 30px 0px 45px; border-width: 1px; border-style: solid; border-color: rgba(0, 0, 0, 0.1);\"><span class=\"icofont-location-pin\" style=\"position: absolute; top: 25px; transform: translateY(-50%); left: 15px; color: rgb(242, 34, 6);\"></span></div></div><div class=\"col-lg-6\" style=\"width: 368px; color: rgb(51, 51, 51); font-size: 16px;\"><div class=\"form-input\" style=\"position: relative; margin-bottom: 15px;\"><input type=\"text\" class=\"User Name\" name=\"shop_name\" placeholder=\"Shop Name\" required=\"\" style=\"margin-bottom: 0px; font-size: 14px; width: 338px; height: 50px; background: rgb(243, 248, 252); padding: 0px 30px 0px 45px; border-width: 1px; border-style: solid; border-color: rgba(0, 0, 0, 0.1);\"><span class=\"icofont-cart-alt\" style=\"position: absolute; top: 25px; transform: translateY(-50%); left: 15px; color: rgb(242, 34, 6);\"></span></div></div><div class=\"col-lg-6\" style=\"width: 368px; color: rgb(51, 51, 51); font-size: 16px;\"><div class=\"form-input\" style=\"position: relative; margin-bottom: 15px;\"><input type=\"text\" class=\"User Name\" name=\"owner_name\" placeholder=\"Owner Name\" required=\"\" style=\"margin-bottom: 0px; font-size: 14px; width: 338px; height: 50px; background: rgb(243, 248, 252); padding: 0px 30px 0px 45px; border-width: 1px; border-style: solid; border-color: rgba(0, 0, 0, 0.1);\"><span class=\"icofont-cart\" style=\"position: absolute; top: 25px; transform: translateY(-50%); left: 15px; color: rgb(242, 34, 6);\"></span></div></div><div class=\"col-lg-6\" style=\"width: 368px; color: rgb(51, 51, 51); font-size: 16px;\"><div class=\"form-input\" style=\"position: relative; margin-bottom: 15px;\"><input type=\"text\" class=\"User Name\" name=\"shop_number\" placeholder=\"Shop Number\" required=\"\" style=\"margin-bottom: 0px; font-size: 14px; width: 338px; height: 50px; background: rgb(243, 248, 252); padding: 0px 30px 0px 45px; border-width: 1px; border-style: solid; border-color: rgba(0, 0, 0, 0.1);\"><span class=\"icofont-shopping-cart\" style=\"position: absolute; top: 25px; transform: translateY(-50%); left: 15px; color: rgb(242, 34, 6);\"></span></div></div><div class=\"col-lg-6\" style=\"width: 368px; color: rgb(51, 51, 51); font-size: 16px;\"><div class=\"form-input\" style=\"position: relative; margin-bottom: 15px;\"><input type=\"text\" class=\"User Name\" name=\"shop_address\" placeholder=\"Shop Address\" required=\"\" style=\"margin-bottom: 0px; font-size: 14px; width: 338px; height: 50px; background: rgb(243, 248, 252); padding: 0px 30px 0px 45px; border-width: 1px; border-style: solid; border-color: rgba(0, 0, 0, 0.1);\"><span class=\"icofont-opencart\" style=\"position: absolute; top: 25px; transform: translateY(-50%); left: 15px; color: rgb(242, 34, 6);\"></span></div></div><div class=\"col-lg-6\" style=\"width: 368px; color: rgb(51, 51, 51); font-size: 16px;\"><div class=\"form-input\" style=\"position: relative; margin-bottom: 15px;\"><input type=\"text\" class=\"User Name\" name=\"reg_number\" placeholder=\"Registration Number\" required=\"\" style=\"margin-bottom: 0px; font-size: 14px; width: 338px; height: 50px; background: rgb(243, 248, 252); padding: 0px 30px 0px 45px; border-width: 1px; border-style: solid; border-color: rgba(0, 0, 0, 0.1);\"><span class=\"icofont-ui-cart\" style=\"position: absolute; top: 25px; transform: translateY(-50%); left: 15px; color: rgb(242, 34, 6);\"></span></div></div><div class=\"col-lg-6\" style=\"width: 368px; color: rgb(51, 51, 51); font-size: 16px;\"><div class=\"form-input\" style=\"position: relative; margin-bottom: 15px;\"><input type=\"text\" class=\"User Name\" name=\"shop_message\" placeholder=\"Message\" required=\"\" style=\"margin-bottom: 0px; font-size: 14px; width: 338px; height: 50px; background: rgb(243, 248, 252); padding: 0px 30px 0px 45px; border-width: 1px; border-style: solid; border-color: rgba(0, 0, 0, 0.1);\"><span class=\"icofont-envelope\" style=\"position: absolute; top: 25px; transform: translateY(-50%); left: 15px; color: rgb(242, 34, 6);\"></span></div></div><div class=\"col-lg-6\" style=\"width: 368px; color: rgb(51, 51, 51); font-size: 16px;\"><div class=\"form-input\" style=\"position: relative; margin-bottom: 15px;\"><input type=\"password\" class=\"Password\" name=\"password\" placeholder=\"Password\" required=\"\" style=\"margin-bottom: 0px; font-size: 14px; width: 338px; height: 50px; background: rgb(243, 248, 252); padding: 0px 30px 0px 45px; border-width: 1px; border-style: solid; border-color: rgba(0, 0, 0, 0.1);\"><span class=\"icofont-ui-password\" style=\"position: absolute; top: 25px; transform: translateY(-50%); left: 15px; color: rgb(242, 34, 6);\"></span></div></div><div class=\"col-lg-6\" style=\"width: 368px; color: rgb(51, 51, 51); font-size: 16px;\"><div class=\"form-input\" style=\"position: relative; margin-bottom: 15px;\"><input type=\"password\" class=\"Password\" name=\"password_confirmation\" placeholder=\"Confirm Password\" required=\"\" style=\"margin-bottom: 0px; font-size: 14px; width: 338px; height: 50px; background: rgb(243, 248, 252); padding: 0px 30px 0px 45px; border-width: 1px; border-style: solid; border-color: rgba(0, 0, 0, 0.1);\"><span class=\"icofont-ui-password\" style=\"position: absolute; top: 25px; transform: translateY(-50%); left: 15px; color: rgb(242, 34, 6);\"></span></div></div><button type=\"submit\" class=\"submit-btn\" style=\"margin-top: 20px; text-transform: uppercase; width: 736px; height: 50px; background: rgb(20, 50, 80); border-width: 0px; border-style: initial; border-color: initial; color: rgb(255, 255, 255); font-weight: 700; transition: all 0.3s ease-in 0s;\">REGISTER</button>',0),(4,'Sign up with Facebook','<nav class=\"comment-log-reg-tabmenu core-nav\" style=\"position: relative; color: rgb(51, 51, 51); font-size: 16px;\"><div class=\"full-container\" style=\"padding: 0px !important;\"><div class=\"nav nav-tabs\" id=\"nav-tab\" role=\"tablist\" style=\"padding-top: 0px; padding-right: 0px; padding-bottom: 0px; margin-top: 0px; margin-right: 0px; margin-left: 0px; border: 0px;\"><a class=\"nav-item nav-link login active\" id=\"nav-log-tab\" data-toggle=\"tab\" href=\"https://afmak.com/user/login#nav-log\" role=\"tab\" aria-controls=\"nav-log\" aria-selected=\"true\" style=\"color: rgb(255, 255, 255); background: rgb(242, 34, 6); padding: 10px 0px; margin: 0px; border-width: 0px; border-style: initial; border-color: initial; border-radius: 0px; width: 270px; text-align: center;\">Login</a><a class=\"nav-item nav-link\" id=\"nav-reg-tab\" data-toggle=\"tab\" href=\"https://afmak.com/user/login#nav-reg\" role=\"tab\" aria-controls=\"nav-reg\" aria-selected=\"false\" style=\"color: rgb(255, 255, 255); background: rgb(20, 50, 80); padding: 10px 0px; margin: 0px; border-width: 0px; border-style: initial; border-color: initial; border-radius: 0px; width: 270px; text-align: center;\">Register</a></div></div></nav><div class=\"tab-content\" id=\"nav-tabContent\" style=\"color: rgb(51, 51, 51); font-size: 16px;\"><div class=\"tab-pane fade show active\" id=\"nav-log\" role=\"tabpanel\" aria-labelledby=\"nav-log-tab\"><div class=\"login-area\" style=\"padding: 30px 30px 39px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; box-shadow: rgba(0, 0, 0, 0.1) 0px 5px 20px;\"><div class=\"header-area\" style=\"text-align: center; margin-bottom: 40px;\"><h4 class=\"title\" style=\"font-weight: 700; line-height: 40px; font-size: 30px; color: rgb(242, 34, 6); text-transform: uppercase;\">LOGIN NOW</h4></div><div class=\"login-form signin-form\"><form class=\"mloginform\" action=\"https://afmak.com/user/login\" method=\"POST\"><div class=\"form-input\" style=\"position: relative; margin-bottom: 15px;\"><input type=\"email\" name=\"email\" placeholder=\"Type Email Address\" required=\"\" style=\"margin-bottom: 0px; font-size: 14px; width: 480px; height: 50px; background: rgb(243, 248, 252); padding: 0px 30px 0px 45px; border-width: 1px; border-style: solid; border-color: rgba(0, 0, 0, 0.1);\"><span class=\"icofont-user-alt-5\" style=\"position: absolute; top: 25px; transform: translateY(-50%); left: 15px; color: rgb(242, 34, 6);\"></span></div><div class=\"form-input\" style=\"position: relative; margin-bottom: 15px;\"><input type=\"password\" class=\"Password\" name=\"password\" placeholder=\"Type Password\" required=\"\" style=\"margin-bottom: 0px; font-size: 14px; width: 480px; height: 50px; background: rgb(243, 248, 252); padding: 0px 30px 0px 45px; border-width: 1px; border-style: solid; border-color: rgba(0, 0, 0, 0.1);\"><span class=\"icofont-ui-password\" style=\"position: absolute; top: 25px; transform: translateY(-50%); left: 15px; color: rgb(242, 34, 6);\"></span></div><div class=\"form-forgot-pass\" style=\"display: flex; -webkit-box-pack: justify; justify-content: space-between; font-size: 14px;\"><div class=\"left\"><label for=\"mrp\" style=\"display: block; cursor: pointer; margin-top: 4px;\">Remember Password</label></div><div class=\"right\"><a href=\"https://afmak.com/user/forgot\">Forgot Password?</a></div></div><button type=\"submit\" class=\"submit-btn\" style=\"margin-top: 20px; text-transform: uppercase; width: 480px; height: 50px; background: rgb(242, 34, 6); border-width: 0px; border-style: initial; border-color: initial; color: rgb(255, 255, 255); font-weight: 700; transition: all 0.3s ease-in 0s;\">LOGIN</button><div class=\"social-area\" style=\"text-align: center; padding-top: 26px;\"><h3 class=\"title\" style=\"font-weight: 600; line-height: 1.08333; font-size: 20px; color: rgb(242, 34, 6); display: inline-block; position: relative; text-transform: uppercase;\">OR</h3><p class=\"text\" style=\"margin-bottom: 1rem; font-size: 20px; color: rgb(20, 50, 80);\">Sign In with social media</p><ul class=\"social-links\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;\"><li style=\"list-style: none; display: inline-block;\"><a href=\"https://afmak.com/auth/facebook\"><span class=\"fab fa-facebook-f\" style=\"padding: 0px 2px; line-height: 50px; width: 50px; height: 50px; border-radius: 50%; color: rgb(255, 255, 255); margin: 0px 5px; box-shadow: rgba(0, 0, 0, 0.15) 0px 5px 10px; background: rgb(0, 105, 247);\"></span></a></li></ul></div></form></div></div></div></div>',0),(5,'Add Product','<img src=\"https://i.imgur.com/1RXtbhq.png\" width=\"498\"><div><br></div><div>&nbsp; You get to choose the right one for your products&nbsp;</div>',0),(6,'To Add Physical Product','<img src=\"https://i.imgur.com/FU9NRf5.png\" width=\"498\"><div><br></div><div><img src=\"https://i.imgur.com/SocAScA.png\" width=\"498\"><br></div><div><br></div><div><img src=\"https://i.imgur.com/41sg6CV.png\" width=\"498\"><br></div>',0),(7,'To Add License Product','<div class=\"mr-breadcrumb\"><div class=\"row\"><div class=\"col-lg-12\" style=\"width: 1039px;\"><div><img src=\"https://i.imgur.com/qkjFAj2.png\" width=\"498\"><br></div><div><img src=\"https://i.imgur.com/RHTjgL3.png\" width=\"498\"><br></div><div><img src=\"https://i.imgur.com/CGUztaD.png\" width=\"498\"><br></div></div></div></div>',0),(8,'To Add Digital Product','<div class=\"mr-breadcrumb\"><div class=\"row\"><div class=\"col-lg-12\" style=\"width: 1039px;\"><h4 class=\"heading\" style=\"width: 1009px;\"><img src=\"https://i.imgur.com/59FnUYy.png\" width=\"498\"><br></h4><div><img src=\"https://i.imgur.com/DMHlBKB.png\" width=\"498\"><img src=\"https://i.imgur.com/WYAloXi.png\" width=\"498\"><br></div></div></div></div>',0);
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_sellers`
--

DROP TABLE IF EXISTS `favorite_sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite_sellers` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL,
  `vendor_id` int(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_sellers`
--

LOCK TABLES `favorite_sellers` WRITE;
/*!40000 ALTER TABLE `favorite_sellers` DISABLE KEYS */;
INSERT INTO `favorite_sellers` VALUES (1,22,13);
/*!40000 ALTER TABLE `favorite_sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galleries` (
  `id` int(191) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(191) unsigned NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (6,93,'156801646314-min.jpg'),(7,93,'156801646315-min.jpg'),(8,93,'156801646316-min.jpg'),(22,129,'15680254328Ei8T0MB.jpg'),(23,129,'1568025432wRmpve8d.jpg'),(24,129,'1568025432kkRYzLsF.jpg'),(25,129,'1568025432zxQBe6Gk.jpg'),(26,128,'1568025537sJbDPnFk.jpg'),(27,128,'1568025537NBmHxJOz.jpg'),(28,128,'1568025537hxqeFbS8.jpg'),(29,128,'1568025538zK3tJpmL.jpg'),(34,126,'1568025693kKLReNYO.jpg'),(35,126,'1568025694Iv3pkz1q.jpg'),(36,126,'1568025694T8HhdLVS.jpg'),(37,126,'1568025695vTdg7ndt.jpg'),(38,125,'15680257894Waz2tuN.jpg'),(39,125,'1568025789vd0P4TBv.jpg'),(40,125,'15680257899bih5sGh.jpg'),(41,125,'156802578924sLIgzl.jpg'),(42,124,'1568025825cC2Pmuit.jpg'),(43,124,'1568025825EACzLFld.jpg'),(44,124,'1568025825MfCyCqtD.jpg'),(45,124,'15680258252yabMeAz.jpg'),(46,123,'15680258512fKQla5g.jpg'),(47,123,'1568025851pIjl0mWp.jpg'),(48,123,'1568025851tQw7JXXG.jpg'),(49,123,'1568025851ewjtSDkZ.jpg'),(50,96,'1568025891wWAAbOjc.jpg'),(51,96,'1568025891fyMNeXRy.jpg'),(52,96,'1568025891OdV64Tw1.jpg'),(53,96,'1568025891xQF7Zufe.jpg'),(62,101,'1568026331Y6UMgMcI.jpg'),(63,101,'1568026331xZbT4OWG.jpg'),(64,101,'1568026331y7eIFJXZ.jpg'),(65,101,'1568026331i2wH8RI0.jpg'),(66,100,'1568026374xCTjQYZ8.jpg'),(67,100,'1568026374DzmvqA9d.jpg'),(68,100,'1568026374OEH73u5X.jpg'),(69,100,'1568026374vZhqRv8c.jpg'),(70,99,'15680264120LdBSU1v.jpg'),(71,99,'1568026412eMjsI940.jpg'),(72,99,'1568026412GFjvHiZv.jpg'),(73,99,'15680264122fwGi20d.jpg'),(78,97,'1568026469hSlmBpzE.jpg'),(79,97,'15680264697AI8LicQ.jpg'),(80,97,'15680264691xyFt5Y6.jpg'),(81,97,'1568026469dC3hrMz0.jpg'),(86,109,'1568026737EBGSE78G.jpg'),(87,109,'1568026737B8hO1RRr.jpg'),(88,109,'1568026737tf0rwVoz.jpg'),(89,109,'1568026737GGIPSqYo.jpg'),(95,107,'1568026797FFNrNPxK.jpg'),(96,107,'1568026797UwY9ZLfQ.jpg'),(97,107,'1568026797Kl6eZLx5.jpg'),(98,107,'1568026797h3R48VaO.jpg'),(99,107,'15680267989kXwH40I.jpg'),(100,106,'1568026836ErM5FJxg.jpg'),(101,106,'1568026836VLrxIk0u.jpg'),(102,106,'1568026836lgLuMV6p.jpg'),(103,106,'1568026836JBUTQX8v.jpg'),(104,105,'1568026861YorsLvUa.jpg'),(105,105,'1568026861PikoX1Qb.jpg'),(106,105,'1568026861SBJqjw66.jpg'),(107,105,'1568026861WYh54Arp.jpg'),(108,104,'1568026885rmo0LDoo.jpg'),(109,104,'15680268851m939o7O.jpg'),(110,104,'1568026885fVXYCGKu.jpg'),(111,104,'1568026885GDRL3thY.jpg'),(112,103,'1568026903LbVQUxIr.jpg'),(113,103,'1568026914IpRVYDV4.jpg'),(114,103,'15680269141gKO8x5X.jpg'),(115,103,'1568026914Q938xXM2.jpg'),(116,93,'1568026950y7ihS4wE.jpg'),(129,121,'1568027539SQqUc8Bu.jpg'),(130,121,'1568027539Zs5OTzjq.jpg'),(131,121,'1568027539C45VRZq1.jpg'),(132,121,'15680275398ovCzFnJ.jpg'),(133,120,'1568027565bJgX744G.jpg'),(134,120,'1568027565j0RPFUgX.jpg'),(135,120,'1568027565QGi6Lhyo.jpg'),(136,120,'15680275658MAY3VKp.jpg'),(137,119,'1568027610p9R6ivC6.jpg'),(138,119,'1568027610t2Aq7E5D.jpg'),(139,119,'1568027611ikz4n0fx.jpg'),(140,119,'15680276117BLgrCub.jpg'),(141,118,'156802763634t0c8tG.jpg'),(142,118,'1568027636fuJplSf3.jpg'),(143,118,'1568027636MXcgCQHU.jpg'),(144,118,'1568027636lfexGTpt.jpg'),(145,117,'1568027665rFHWlsAJ.jpg'),(146,117,'15680276655LPktA9k.jpg'),(147,117,'1568027665vcNWWq3u.jpg'),(148,117,'1568027665gQnqKhCw.jpg'),(149,116,'1568027692FPQpwtWN.jpg'),(150,116,'1568027692zBaGjOIC.jpg'),(151,116,'1568027692UXpDx63F.jpg'),(152,116,'1568027692KdIWbIGK.jpg'),(153,95,'1568027743xS8gHocM.jpg'),(154,95,'1568027743aVUOljdD.jpg'),(155,95,'156802774327OOA1Zj.jpg'),(156,95,'1568027743kGBx6mxa.jpg'),(172,130,'1568029084hQT5ZO0j.jpg'),(173,130,'1568029084ncGXxQzN.jpg'),(174,130,'1568029084b0OonKFy.jpg'),(175,130,'15680290857TD4iOWP.jpg'),(180,114,'1568029158brS7xQCe.jpg'),(181,114,'1568029158QlC0tg5a.jpg'),(182,114,'1568029158RrN4AEtQ.jpg'),(187,112,'1568029210JSAwjRPr.jpg'),(188,112,'1568029210EiVUkcK6.jpg'),(189,112,'1568029210fJSo5hya.jpg'),(190,112,'15680292101vCcGfq8.jpg'),(191,111,'1568029272lB0JETcn.jpg'),(192,111,'1568029272wF3ldKgv.jpg'),(193,111,'1568029272NI33ExCu.jpg'),(194,111,'15680292724TXrpokz.jpg'),(197,134,'15693932021.jpg'),(198,134,'15693932022.jpg'),(199,135,'15698200931.jpg'),(217,159,'1570085246audi-automobile-car-909907.jpg'),(218,159,'1570085246automobile-automotive-car-112460.jpg'),(219,160,'1570085654asphalt-auto-automobile-575386.jpg'),(220,160,'1570085654asphalt-auto-automobile-831475.jpg'),(221,161,'1570086479audi-automobile-car-909907.jpg'),(222,162,'1570255905asphalt-auto-automobile-831475.jpg'),(223,162,'1570255905audi-automobile-car-909907.jpg'),(224,167,'1570874976asphalt-auto-automobile-831475.jpg'),(225,167,'1570874976audi-automobile-car-909907.jpg'),(226,167,'1570874976automobile-automotive-car-112460.jpg'),(227,168,'1570875445automobile-automotive-car-112460.jpg'),(228,168,'1570875445automobile-automotive-car-358070.jpg'),(229,1,'1591006172fuZ1kqyl.jpg'),(230,2,'1591011212garri16.jpeg'),(231,2,'1591011212plastic-rice-bag-500x500.jpg'),(232,5,'1591269906IMG_20200604_111808_255.jpg'),(233,5,'1591269906IMG_20200604_111758_711.jpg'),(234,5,'1591269906IMG_20200604_111756_322.jpg'),(235,5,'1591269906IMG_20200604_111754_047.jpg'),(236,5,'1591269906IMG_20200604_111712_123.jpg'),(237,5,'1591269906IMG_20200603_183355_575.jpg'),(238,6,'1591863622IMG-20151028-WA0005.jpg'),(239,6,'1591863622IMG-20151028-WA0006.jpg'),(240,6,'1591863622IMG-20151028-WA0007.jpg'),(241,6,'1591863622IMG-20151028-WA0008.jpg'),(242,6,'1591863622IMG-20151028-WA0010.jpg'),(243,6,'1591863622IMG-20151028-WA0011.jpg'),(244,6,'1591863622IMG-20151028-WA0012.jpg'),(245,13,'1592660080SK6sI0BT.jpg'),(246,13,'1592660886Q7GVro0k.jpg'),(247,13,'15926608864NrLsFxP.jpg'),(248,13,'1592660887LFiIh6sw.jpg'),(249,14,'1592661576IMG-20200426-WA0018.webp'),(250,14,'1592661576IMG-20200426-WA0023.webp'),(251,14,'1592661576IMG-20200427-WA0001.webp'),(252,14,'1592661576product_249_1.jpg'),(253,11,'1592678434fC9lDwYG.jpg'),(254,11,'1592678434WxYIBZP2.jpg'),(255,11,'1592678435I4TERlQm.jpg'),(257,15,'1592678980IMG_20200620_181742.jpg'),(258,15,'1592678980IMG_20200620_181750.jpg'),(260,21,'1592918574oQVv6b54.jpg'),(261,21,'1592918588CmY4kiB7.jpg'),(262,21,'15929186050Pm9ER41.jpg'),(263,22,'1593023753N6jOHuUV.jpg'),(264,22,'1593023754E2psYo4B.jpg'),(265,22,'1593023754b4Nrldlq.jpg'),(266,24,'159302591421e8f4cb151548106a8ab1ccf2f21ecb.jpg'),(267,24,'1593025914cane-handles-493487.jpg'),(268,24,'1593025914D-Shape-Handmade-Straw-Material-Cane-Bag-Handle-Wholesale-DIY-Handbag-Accessory-Bag-Hanger-Purse-Frame.jpg'),(269,24,'1593025914HTB1A6rrCXOWBuNjy0Fiq6xFxVXam.jpg'),(270,24,'1593025914HTB1diygkXkoBKNjSZFkq6z4tFXah.jpg'),(271,24,'1593025914HTB198zDCh1YBuNjy1zcq6zNcXXaH.jpg'),(272,24,'1593025914IMG_5441_1024x1024.jpg'),(273,28,'1593344869IMG_20200628_102913.jpg'),(274,28,'1593344869IMG_20200628_102949.jpg'),(275,28,'1593344869IMG_20200628_103800.jpg'),(276,28,'1593344870IMG_20200628_104018.jpg'),(277,28,'1593344870IMG_20200628_104040.jpg'),(278,28,'1593344871IMG_20200628_104047.jpg'),(279,29,'1593437725IMG-20200629-WA0003.jpg'),(280,29,'1593437726IMG-20200629-WA0004.jpg'),(281,29,'1593437726IMG-20200629-WA0005.jpg'),(282,31,'1593523952rd9EbA8P.jpg'),(283,31,'1593523952ySEUmr8o.jpg'),(284,31,'1593523952ELPoJTpJ.jpg'),(285,31,'1593523952RH33gHVw.jpg');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generalsettings`
--

DROP TABLE IF EXISTS `generalsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generalsettings` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_email` text COLLATE utf8mb4_unicode_ci,
  `header_phone` text COLLATE utf8mb4_unicode_ci,
  `footer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `copyright` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `colors` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loader` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_loader` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_talkto` tinyint(1) NOT NULL DEFAULT '1',
  `talkto` text COLLATE utf8mb4_unicode_ci,
  `is_language` tinyint(1) NOT NULL DEFAULT '1',
  `is_loader` tinyint(1) NOT NULL DEFAULT '1',
  `map_key` text COLLATE utf8mb4_unicode_ci,
  `is_disqus` tinyint(1) NOT NULL DEFAULT '0',
  `disqus` longtext COLLATE utf8mb4_unicode_ci,
  `is_contact` tinyint(1) NOT NULL DEFAULT '0',
  `is_faq` tinyint(1) NOT NULL DEFAULT '0',
  `guest_checkout` tinyint(1) NOT NULL DEFAULT '0',
  `stripe_check` tinyint(1) NOT NULL DEFAULT '0',
  `cod_check` tinyint(1) NOT NULL DEFAULT '0',
  `stripe_key` text COLLATE utf8mb4_unicode_ci,
  `stripe_secret` text COLLATE utf8mb4_unicode_ci,
  `currency_format` tinyint(1) NOT NULL DEFAULT '0',
  `withdraw_fee` double NOT NULL DEFAULT '0',
  `withdraw_charge` double NOT NULL DEFAULT '0',
  `tax` double NOT NULL DEFAULT '0',
  `shipping_cost` double NOT NULL DEFAULT '0',
  `smtp_host` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_pass` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_smtp` tinyint(1) NOT NULL DEFAULT '0',
  `is_comment` tinyint(1) NOT NULL DEFAULT '1',
  `is_currency` tinyint(1) NOT NULL DEFAULT '1',
  `add_cart` text COLLATE utf8mb4_unicode_ci,
  `out_stock` text COLLATE utf8mb4_unicode_ci,
  `add_wish` text COLLATE utf8mb4_unicode_ci,
  `already_wish` text COLLATE utf8mb4_unicode_ci,
  `wish_remove` text COLLATE utf8mb4_unicode_ci,
  `add_compare` text COLLATE utf8mb4_unicode_ci,
  `already_compare` text COLLATE utf8mb4_unicode_ci,
  `compare_remove` text COLLATE utf8mb4_unicode_ci,
  `color_change` text COLLATE utf8mb4_unicode_ci,
  `coupon_found` text COLLATE utf8mb4_unicode_ci,
  `no_coupon` text COLLATE utf8mb4_unicode_ci,
  `already_coupon` text COLLATE utf8mb4_unicode_ci,
  `order_title` text COLLATE utf8mb4_unicode_ci,
  `order_text` text COLLATE utf8mb4_unicode_ci,
  `is_affilate` tinyint(1) NOT NULL DEFAULT '1',
  `affilate_charge` int(100) NOT NULL DEFAULT '0',
  `affilate_banner` text COLLATE utf8mb4_unicode_ci,
  `already_cart` text COLLATE utf8mb4_unicode_ci,
  `fixed_commission` double NOT NULL DEFAULT '0',
  `percentage_commission` double NOT NULL DEFAULT '0',
  `multiple_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `multiple_packaging` tinyint(4) NOT NULL DEFAULT '0',
  `vendor_ship_info` tinyint(1) NOT NULL DEFAULT '0',
  `reg_vendor` tinyint(1) NOT NULL DEFAULT '0',
  `cod_text` text COLLATE utf8mb4_unicode_ci,
  `paypal_text` text COLLATE utf8mb4_unicode_ci,
  `stripe_text` text COLLATE utf8mb4_unicode_ci,
  `header_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin_loader` tinyint(1) NOT NULL DEFAULT '0',
  `menu_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_hover_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_home` tinyint(1) NOT NULL DEFAULT '0',
  `is_verification_email` tinyint(1) NOT NULL DEFAULT '0',
  `instamojo_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instamojo_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instamojo_text` text COLLATE utf8mb4_unicode_ci,
  `is_instamojo` tinyint(1) NOT NULL DEFAULT '0',
  `instamojo_sandbox` tinyint(1) NOT NULL DEFAULT '0',
  `is_paystack` tinyint(1) NOT NULL DEFAULT '0',
  `paystack_key` text COLLATE utf8mb4_unicode_ci,
  `paystack_email` text COLLATE utf8mb4_unicode_ci,
  `paystack_text` text COLLATE utf8mb4_unicode_ci,
  `wholesell` int(191) NOT NULL DEFAULT '0',
  `is_capcha` tinyint(1) NOT NULL DEFAULT '0',
  `error_banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_popup` tinyint(1) NOT NULL DEFAULT '0',
  `popup_title` text COLLATE utf8mb4_unicode_ci,
  `popup_text` text COLLATE utf8mb4_unicode_ci,
  `popup_background` text COLLATE utf8mb4_unicode_ci,
  `invoice_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_secure` tinyint(1) NOT NULL DEFAULT '0',
  `is_report` tinyint(1) NOT NULL,
  `paypal_check` tinyint(1) DEFAULT '0',
  `paypal_business` text COLLATE utf8mb4_unicode_ci,
  `footer_logo` text COLLATE utf8mb4_unicode_ci,
  `email_encryption` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paytm_merchant` text COLLATE utf8mb4_unicode_ci,
  `paytm_secret` text COLLATE utf8mb4_unicode_ci,
  `paytm_website` text COLLATE utf8mb4_unicode_ci,
  `paytm_industry` text COLLATE utf8mb4_unicode_ci,
  `is_paytm` int(11) NOT NULL DEFAULT '1',
  `paytm_text` text COLLATE utf8mb4_unicode_ci,
  `paytm_mode` enum('sandbox','live') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_molly` tinyint(1) NOT NULL DEFAULT '0',
  `molly_key` text COLLATE utf8mb4_unicode_ci,
  `molly_text` text COLLATE utf8mb4_unicode_ci,
  `is_razorpay` int(11) NOT NULL DEFAULT '1',
  `razorpay_key` text COLLATE utf8mb4_unicode_ci,
  `razorpay_secret` text COLLATE utf8mb4_unicode_ci,
  `razorpay_text` text COLLATE utf8mb4_unicode_ci,
  `is_the_teller` tinyint(1) NOT NULL DEFAULT '1',
  `the_teller_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'TheTeller',
  `show_stock` tinyint(1) NOT NULL DEFAULT '0',
  `is_maintain` tinyint(1) NOT NULL DEFAULT '0',
  `maintain_text` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generalsettings`
--

LOCK TABLES `generalsettings` WRITE;
/*!40000 ALTER TABLE `generalsettings` DISABLE KEYS */;
INSERT INTO `generalsettings` VALUES (1,'1593948686Sun_5_07_2020_11_26_52-1.png','159405187620200613_105352.png','Afmak.com | promoting African products and services worldwide','smtp','0123 456789','Promoting African businesses, products and services  \r\nBringing Africa to you, wherever you are.','COPYRIGHT © 2020. All Rights Reserved','#f28608','','',1,'<!--Start of Tawk.to Script-->\r\n<script type=\"text/javascript\">\r\n    var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();\r\n    (function () {\r\n        var s1 = document.createElement(\"script\"), s0 = document.getElementsByTagName(\"script\")[0];\r\n        s1.async = true;\r\n        s1.src = \'https://embed.tawk.to/5d9f084afbec0f2fe3b90d3a/default\';\r\n        s1.charset = \'UTF-8\';\r\n        s1.setAttribute(\'crossorigin\', \'*\');\r\n        s0.parentNode.insertBefore(s1, s0);\r\n    })();\r\n</script>\r\n<!--End of Tawk.to Script-->',1,0,'AIzaSyB1GpE4qeoJ__70UZxvX9CTMUTZRZNHcu8',0,'<div id=\"disqus_thread\">         \r\n    <script>\r\n    /**\r\n    *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.\r\n    *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/\r\n    /*\r\n    var disqus_config = function () {\r\n    this.page.url = PAGE_URL;  // Replace PAGE_URL with your page\'s canonical URL variable\r\n    this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page\'s unique identifier variable\r\n    };\r\n    */\r\n    (function() { // DON\'T EDIT BELOW THIS LINE\r\n    var d = document, s = d.createElement(\'script\');\r\n    s.src = \'https://junnun.disqus.com/embed.js\';\r\n    s.setAttribute(\'data-timestamp\', +new Date());\r\n    (d.head || d.body).appendChild(s);\r\n    })();\r\n    </script>\r\n    <noscript>Please enable JavaScript to view the <a href=\"https://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>\r\n    </div>',1,1,1,0,0,'pk_test_UnU1Coi1p5qFGwtpjZMRMgJM','sk_test_QQcg3vGsKRPlW6T3dXcNJsor',0,5,5,0,5,'smtp.zoho.com','465','app@afmak.com','aC$czC2%@4ad5P$8beMzq%Xz0axb7!SD','app@afmak.com','Afmak MarketPlace',1,1,1,'Successfully Added To Cart','Out Of Stock','Add To Wishlist','Already Added To Wishlist','Successfully Removed From The Wishlist','Successfully Added To Compare','Already Added To Compare','Successfully Removed From The Compare','Successfully Changed The Color','Coupon Found','No Coupon Found','Coupon Already Applied','THANK YOU FOR YOUR PURCHASE.','We\'ll email you an order confirmation with details and tracking info.',1,5,'159248272720200616_055317.png','Already Added To Cart',0,5,1,0,1,1,'Pay with cash upon delivery.','Pay via your PayPal account.','Pay via your Credit Card.','#ffffff','#03051c','#0a0a0a',0,'#ff5500','#02020c',0,1,'test_172371aa837ae5cad6047dc3052','test_4ac5a785e25fc596b67dbc5c267','Pay via your Instamojo account.',0,1,0,'pk_test_162a56d42131cbb01932ed0d2c48f9cb99d8e8e2','junnuns@gmail.com','Pay via your Paystack account.',6,0,'1566878455404.png',0,'NEWSLETTER','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Expedita porro ipsa nulla, alias, ab minus.','1588882762fkj.PNG','1593948702Sun_5_07_2020_11_26_52-1.png','1567655174profile.jpg','#e6bb23',1,1,0,'shaon143-facilitator-1@gmail.com','159250258320200613_105352.png','ssl','tkogux49985047638244','LhNGUUKE9xCQ9xY8','WEBSTAGING','Retail',0,'Pay via your Paytm account.','sandbox',0,'test_5HcWVs9qc5pzy36H9Tu9mwAyats33J','Pay with Molly Payment.',0,'rzp_test_xDH74d48cwl8DF','cr0H1BiQ20hVzhpHfHuNbGri','Pay via your Razorpay account.',1,'TheTeller',1,0,'<div style=\"text-align: center;\"><font size=\"5\"><br></font></div><h1 style=\"text-align: center;\"><font size=\"6\">UNDER MAINTENANCE</font></h1><div><font size=\"6\"><br></font></div><div style=\"text-align: center; \"><font size=\"6\">We are cooking something great! Check back again, soon</font></div>');
/*!40000 ALTER TABLE `generalsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,1,'English','1579926860LzpDa1Y7.json'),(2,0,'RTL English','1579927527QjLMUGyj.json');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(191) DEFAULT NULL,
  `recieved_user` int(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,'i cant seem to get across the packages and sell items',32,NULL,'2020-06-05 23:27:09','2020-06-05 23:27:09'),(2,2,'i want one \nselorm here testing the system',29,NULL,'2020-06-20 10:55:06','2020-06-20 10:55:06');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2020_05_01_041358_create_admin_languages_table',0),(2,'2020_05_01_041358_create_admin_user_conversations_table',0),(3,'2020_05_01_041358_create_admin_user_messages_table',0),(4,'2020_05_01_041358_create_admins_table',0),(5,'2020_05_01_041358_create_attribute_options_table',0),(6,'2020_05_01_041358_create_attributes_table',0),(7,'2020_05_01_041358_create_banners_table',0),(8,'2020_05_01_041358_create_blog_categories_table',0),(9,'2020_05_01_041358_create_blogs_table',0),(10,'2020_05_01_041358_create_categories_table',0),(11,'2020_05_01_041358_create_childcategories_table',0),(12,'2020_05_01_041358_create_comments_table',0),(13,'2020_05_01_041358_create_conversations_table',0),(14,'2020_05_01_041358_create_counters_table',0),(15,'2020_05_01_041358_create_countries_table',0),(16,'2020_05_01_041358_create_coupons_table',0),(17,'2020_05_01_041358_create_currencies_table',0),(18,'2020_05_01_041358_create_email_templates_table',0),(19,'2020_05_01_041358_create_faqs_table',0),(20,'2020_05_01_041358_create_favorite_sellers_table',0),(21,'2020_05_01_041358_create_galleries_table',0),(22,'2020_05_01_041358_create_generalsettings_table',0),(23,'2020_05_01_041358_create_languages_table',0),(24,'2020_05_01_041358_create_messages_table',0),(25,'2020_05_01_041358_create_notifications_table',0),(26,'2020_05_01_041358_create_order_tracks_table',0),(27,'2020_05_01_041358_create_orders_table',0),(28,'2020_05_01_041358_create_packages_table',0),(29,'2020_05_01_041358_create_pages_table',0),(30,'2020_05_01_041358_create_pagesettings_table',0),(31,'2020_05_01_041358_create_partners_table',0),(32,'2020_05_01_041358_create_payment_gateways_table',0),(33,'2020_05_01_041358_create_pickups_table',0),(34,'2020_05_01_041358_create_product_clicks_table',0),(35,'2020_05_01_041358_create_products_table',0),(36,'2020_05_01_041358_create_ratings_table',0),(37,'2020_05_01_041358_create_replies_table',0),(38,'2020_05_01_041358_create_reports_table',0),(39,'2020_05_01_041358_create_reviews_table',0),(40,'2020_05_01_041358_create_roles_table',0),(41,'2020_05_01_041358_create_seotools_table',0),(42,'2020_05_01_041358_create_services_table',0),(43,'2020_05_01_041358_create_shippings_table',0),(44,'2020_05_01_041358_create_sliders_table',0),(45,'2020_05_01_041358_create_social_providers_table',0),(46,'2020_05_01_041358_create_socialsettings_table',0),(47,'2020_05_01_041358_create_subcategories_table',0),(48,'2020_05_01_041358_create_subscribers_table',0),(49,'2020_05_01_041358_create_subscriptions_table',0),(50,'2020_05_01_041358_create_user_notifications_table',0),(51,'2020_05_01_041358_create_user_subscriptions_table',0),(52,'2020_05_01_041358_create_users_table',0),(53,'2020_05_01_041358_create_vendor_orders_table',0),(54,'2020_05_01_041358_create_verifications_table',0),(55,'2020_05_01_041358_create_wishlists_table',0),(56,'2020_05_01_041358_create_withdraws_table',0),(58,'2020_05_05_150608_create_payment_logs_table',2),(59,'2014_10_12_100000_create_password_resets_table',3),(60,'2020_06_08_033728_add_is_teller_column_to_generalsettings_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `order_id` int(191) unsigned DEFAULT NULL,
  `user_id` int(191) DEFAULT NULL,
  `vendor_id` int(191) DEFAULT NULL,
  `product_id` int(191) DEFAULT NULL,
  `conversation_id` int(191) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,NULL,31,NULL,NULL,NULL,1,'2020-05-08 07:24:56','2020-05-28 10:17:20'),(2,NULL,32,NULL,NULL,NULL,1,'2020-06-01 01:32:51','2020-06-02 02:49:39'),(3,NULL,NULL,NULL,1,NULL,1,'2020-06-01 19:13:41','2020-06-02 04:51:36'),(4,NULL,33,NULL,NULL,NULL,1,'2020-06-04 03:10:04','2020-06-05 23:09:58'),(5,NULL,33,NULL,NULL,NULL,1,'2020-06-04 03:10:04','2020-06-05 23:09:58'),(6,NULL,33,NULL,NULL,NULL,1,'2020-06-04 03:10:04','2020-06-05 23:09:58'),(7,NULL,39,NULL,NULL,NULL,1,'2020-06-15 14:15:18','2020-06-16 12:37:27'),(8,NULL,40,NULL,NULL,NULL,1,'2020-06-21 22:55:49','2020-06-22 08:12:04'),(9,NULL,41,NULL,NULL,NULL,1,'2020-06-22 01:04:39','2020-06-22 08:12:04'),(10,NULL,42,NULL,NULL,NULL,1,'2020-06-22 04:44:50','2020-06-22 08:12:04'),(11,NULL,42,NULL,NULL,NULL,1,'2020-06-22 04:44:56','2020-06-22 08:12:04'),(12,NULL,47,NULL,NULL,NULL,1,'2020-06-23 11:45:35','2020-06-23 21:50:35'),(13,NULL,47,NULL,NULL,NULL,1,'2020-06-23 11:45:39','2020-06-23 21:50:35'),(14,NULL,49,NULL,NULL,NULL,1,'2020-06-25 10:17:29','2020-06-25 14:31:31'),(15,NULL,49,NULL,NULL,NULL,1,'2020-06-25 10:17:39','2020-06-25 14:31:31'),(16,NULL,57,NULL,NULL,NULL,1,'2020-06-25 11:03:39','2020-06-25 14:31:31'),(17,NULL,57,NULL,NULL,NULL,1,'2020-06-25 11:03:47','2020-06-25 14:31:31'),(18,NULL,60,NULL,NULL,NULL,1,'2020-06-27 02:07:25','2020-06-27 02:48:21'),(19,NULL,60,NULL,NULL,NULL,1,'2020-06-27 02:07:39','2020-06-27 02:48:21'),(20,NULL,61,NULL,NULL,NULL,1,'2020-06-27 03:28:39','2020-06-27 05:59:43'),(21,NULL,61,NULL,NULL,NULL,1,'2020-06-27 03:28:46','2020-06-27 05:59:43'),(22,NULL,63,NULL,NULL,NULL,1,'2020-06-27 23:10:31','2020-06-28 00:32:15'),(23,NULL,63,NULL,NULL,NULL,1,'2020-06-27 23:10:37','2020-06-28 00:32:15'),(24,NULL,64,NULL,NULL,NULL,1,'2020-06-28 02:02:41','2020-06-28 03:56:26'),(25,NULL,64,NULL,NULL,NULL,1,'2020-06-28 02:03:20','2020-06-28 03:56:26'),(26,NULL,64,NULL,NULL,NULL,1,'2020-06-28 02:03:20','2020-06-28 03:56:26'),(27,NULL,64,NULL,NULL,NULL,1,'2020-06-28 03:37:58','2020-06-28 03:56:26'),(28,NULL,64,NULL,NULL,NULL,1,'2020-06-28 03:44:41','2020-06-28 03:56:26'),(29,NULL,62,NULL,NULL,NULL,1,'2020-06-28 05:02:31','2020-06-28 05:39:40'),(30,NULL,64,NULL,NULL,NULL,1,'2020-06-28 09:55:57','2020-06-29 05:04:34'),(31,NULL,65,NULL,NULL,NULL,1,'2020-06-28 17:28:22','2020-06-29 05:04:34'),(32,NULL,65,NULL,NULL,NULL,1,'2020-06-28 17:28:30','2020-06-29 05:04:34'),(33,NULL,62,NULL,NULL,NULL,1,'2020-06-29 00:26:29','2020-06-29 05:04:34'),(34,NULL,64,NULL,NULL,NULL,1,'2020-06-29 13:48:17','2020-06-30 05:50:10'),(35,NULL,64,NULL,NULL,NULL,1,'2020-06-29 13:49:23','2020-06-30 05:50:10'),(36,NULL,64,NULL,NULL,NULL,1,'2020-06-29 15:34:39','2020-06-30 05:50:10'),(37,NULL,64,NULL,NULL,NULL,1,'2020-06-29 15:35:54','2020-06-30 05:50:10'),(38,NULL,66,NULL,NULL,NULL,1,'2020-06-30 05:47:29','2020-06-30 05:50:10'),(39,NULL,66,NULL,NULL,NULL,1,'2020-06-30 05:47:35','2020-06-30 05:50:10'),(40,NULL,67,NULL,NULL,NULL,1,'2020-06-30 05:50:34','2020-06-30 05:50:55'),(41,NULL,67,NULL,NULL,NULL,1,'2020-06-30 05:50:41','2020-06-30 05:50:55'),(42,NULL,68,NULL,NULL,NULL,1,'2020-06-30 19:57:27','2020-07-05 03:04:07'),(43,NULL,68,NULL,NULL,NULL,1,'2020-06-30 19:57:42','2020-07-05 03:04:07'),(44,NULL,69,NULL,NULL,NULL,1,'2020-07-02 02:34:40','2020-07-05 03:04:07'),(45,NULL,69,NULL,NULL,NULL,1,'2020-07-02 02:34:45','2020-07-05 03:04:07'),(46,NULL,64,NULL,NULL,NULL,1,'2020-07-02 06:44:50','2020-07-05 03:04:07'),(47,NULL,64,NULL,NULL,NULL,1,'2020-07-02 06:46:00','2020-07-05 03:04:07'),(48,NULL,69,NULL,NULL,NULL,1,'2020-07-02 08:25:00','2020-07-05 03:04:07'),(49,NULL,NULL,NULL,28,NULL,1,'2020-07-02 08:56:45','2020-07-05 03:03:48'),(50,NULL,NULL,NULL,28,NULL,1,'2020-07-02 09:18:40','2020-07-05 03:03:48'),(51,NULL,NULL,NULL,21,NULL,1,'2020-07-02 09:51:46','2020-07-05 03:03:48'),(52,NULL,NULL,NULL,21,NULL,1,'2020-07-02 10:04:47','2020-07-05 03:03:48'),(53,NULL,NULL,NULL,21,NULL,1,'2020-07-02 10:17:27','2020-07-05 03:03:48'),(54,6,NULL,NULL,NULL,NULL,1,'2020-07-02 10:18:25','2020-07-05 03:02:08'),(55,NULL,46,NULL,NULL,NULL,1,'2020-07-05 17:55:30','2020-07-06 08:21:03'),(56,NULL,46,NULL,NULL,NULL,1,'2020-07-05 17:55:35','2020-07-06 08:21:03'),(57,NULL,70,NULL,NULL,NULL,1,'2020-07-13 04:58:29','2020-07-13 05:43:24'),(58,NULL,71,NULL,NULL,NULL,1,'2020-07-14 14:05:20','2020-07-15 07:51:32');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_tracks`
--

DROP TABLE IF EXISTS `order_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_tracks` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `order_id` int(191) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_tracks`
--

LOCK TABLES `order_tracks` WRITE;
/*!40000 ALTER TABLE `order_tracks` DISABLE KEYS */;
INSERT INTO `order_tracks` VALUES (1,1,'Pending','You have successfully placed your order.','2020-06-01 19:13:40','2020-06-01 19:13:40'),(2,2,'Pending','You have successfully placed your order.','2020-07-02 08:56:45','2020-07-02 08:56:45'),(3,3,'Pending','You have successfully placed your order.','2020-07-02 09:18:40','2020-07-02 09:18:40'),(4,4,'Pending','You have successfully placed your order.','2020-07-02 09:51:46','2020-07-02 09:51:46'),(5,5,'Pending','You have successfully placed your order.','2020-07-02 10:04:47','2020-07-02 10:04:47'),(6,6,'Pending','You have successfully placed your order.','2020-07-02 10:17:27','2020-07-02 10:17:27'),(7,7,'Pending','You have successfully placed your order.','2020-07-14 05:44:52','2020-07-14 05:44:52');
/*!40000 ALTER TABLE `order_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) DEFAULT NULL,
  `cart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalQty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_amount` float NOT NULL,
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `customer_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `customer_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_zip` varchar(255) DEFAULT NULL,
  `shipping_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `affilate_user` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affilate_charge` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_value` double NOT NULL,
  `shipping_cost` double NOT NULL,
  `packing_cost` double NOT NULL DEFAULT '0',
  `tax` int(191) NOT NULL,
  `dp` tinyint(1) NOT NULL DEFAULT '0',
  `pay_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `vendor_shipping_id` int(191) NOT NULL DEFAULT '0',
  `vendor_packing_id` int(191) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,31,'BZh91AY&SYÔC\0²_@\0ø;ö¿ïÿúP<b0\0¡@\0@\0\0\0\0J\0¢ 0\0OHÐ¢¦LjdÓCLÓ#@0\Z\0\0\Z\0\0\0\0D2bôzP44òdL8@^Áý;£Cï©Úuõèn\Z(êB}E¥êpsZã¼Á0S\n4#o­LrrT´!xåLÌ¶*j©SnAÂÍèOQÃar´¼È-2î@¼ ±È<Ésó Òi!!vöÂ&ÔÝØ,4\"`ÓCJ¬´QÀÁw	D\\VvÿK¨\r±7JÊ³ða\0É&	´\rQ0&². ª[I^áqj0<!ÊZhC9w}(0ª0³,@XÀ¡BB D»ÕY JÂ»âÅ(a@Â8ÄPá±ÆDcR¢)¡°÷Ã0)okSa)ÉPîás\"VB\"Á!dt´ª));Dû¢	Å;WD\ZB¤4Ìâ\n³uÃ\r8¦±.Åg\\È\n(¶.g(î »PÌQNÔ1`;täÉ¯8dÆ5fÜ±5llÛÁs4ÆUI-G,)J/ióâh1s5H±¦ 8øÏ!°ì ä¿Ãâ<^Íd}às©\'·ÍF¨0m*Ú3=Iúñ?ò]¦ Þxgóè{)Ôx/\nR6Ó!ÐÓp\Z\rë¯B¹3Ë)ÜÀÈ©|£Ö`;+0hlZ¬\Z¦s24+prPÍaU¡Í¹ ÉnßÎÛú§l*Le	6*\r»\n¿Sëø=Mfó2LÌR%!Á´!,v,Ô3`ð|èe®y«×ÀþþÃ_#¸Í®=øºì }$HÜ±b£9\nCã³ë]çÁÞBm$8!D ïW3¡ÛÙR\\EºFÓ´¹fA\"Jmc©dLgÁ#pKR#¨³jkl|yøaXæ)P$ÖUÊÇÒwÇïH¤¦qýáÅ	vk$³,@PôT»E1À²[FsE·3´êFHi¨`tûìXTi<F°òÛ4:Ê%£}ìr# Ól¡4JmfsØ:âl6Ï\\!F#)\nR#FBÒ±¼\rxñïz9vü×-ºÖÌ\"¯lbA,ÌHÄÒJ9,4í3aÜ!Q|ÊÔÔB°I\"^È1nÜæi¬^é¤bh c *bc.1BeÕÂË!õ¢Â¨Å¯cÁ/vÖ3Ï¡Z¦¦¢Ë#/qñÞAÜ1@I\\ø4A¸a;z¿â5öÿ*:ÐC¡\Z\nÇþ.äp¡!!¨','TheTeller','shipto',NULL,'1',3.45,'151180722316',NULL,'o0Ar1591067620','Pending','me@shawndreck.com','Max Shawndreck','Ghana','1234567890','Accra','Accra','233',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending','2020-06-01 19:13:40','2020-06-01 19:13:40',NULL,NULL,'GH¢',5.8,0,0,0,0,NULL,0,0),(2,31,'BZh91AY&SYOXZ¾\0_@\0Pø;/üT¿ÿÿú`ÿ}\0\nkRT)¨ePÄ`¨Ó	 ¦L Ó@Ó\0		\0L\0Ãb`00\0	\0sLL\0&\0&\00\0I$h4Ñ£#M\ZCLÑi£ T Rb=\Z(Ú§¤=@,tïxBGàúbEe´`ñ¸/ÆÎ&ç@ïb¿w\rH\\Y§üJîzë)ØÊÒvL4¥Kº~\n,àÕ4v6if¦ï3\'²³ûPå¦.b]õ6v;bq3;OS#\'k¢ÆZ-·O:¦ÆõÏ±íýÏ£vSÞÚ#¤rÒCÜ÷-&ðeg¹D*I¢¢Mâ¤Ò¢(ZL°Ãf#*5O|øYâGZY0ÂÂé¹hZN²§²åñe8SJR¥(¥H¥4ºí;Ùd¤Êb¨Ô%)\nP¤²ÌºV\ZaÔQáÙ¨Ä6TI²ËÆì9²Í£=Å2Ó2RÚ]uÛ4»Ëä.¤lÙ³1MeÌbT%Lë*S¶oO\'I´_ã`âÚ!cÆÑFFM44Ù¹¹¦M¥å¦fÓRéÛ/,1c¬°ÙbJl³NZÝëÌ·7L²]µ)¦[¦RÉÍ0]uÆ\ZlË$ÓqC¦VeÓdÓLN)\'z¡à¤67(@Da¸¢#éQb¥\nT^Y¥LÙrBCA¤-J\Z)@¥Ââhª(39¦èf2ÚHs Ýö!IQG{+0®Y`Ë3êiy¾gM:YËW]³nZ:^q$é²Ó£¥Õ®¹ËK©MÚ9oª4Ñ²¼rßî®\\9m:aÓ¦ÍN]Q¹Ãwn2ÝgÃe¦°T2\'q-s\0 &RL`k´\"*aÛ\'ëpêz3ó÷×ÔÉ³ä²ÇRd@!Â^Qº ÒÜù½ÇÞ\\g0×È(Ü!Òg¬Àr½¯Qö{;ëõ(Êè\Zhäs\'a¸lð/\0n0ÀÇ?t0 ÈÄü5Þìi\nzÖÉ´âvNGäÌõ£Myþ\\¬R îFíÓ½îºiæw..â]eM\'¸êrQsó,Ê|%yÞÙM©Î5%ÙR¦ÄÃI´÷óO	ÌÉIS^X³)ÄXÈÐ¸ØìlÞÆÌÊÇyB<jy»d»f÷?Ô¨²y)=/ËÓ7SNÓû¿óKÔÔÄÚ}îg)åJx½Äî6Ç =^rìë1:P(CØÈn Ør·\ZÎYÎó8ÚqòñG.2Ù?IyçK»Q?¦y<ÍóÆ^;ËÊC}[Ôò\ZXpkòÍÔ4LM2,^SõK½,ÏÓIÂffX¼½ÚPÄº]iÌ*wÌGc2Ã)Ù´9NùCã:N÷:zÌ**lÈÞ{t»ëN\ZRTÜùJNfbCqÐàF¯© \rd?®AXùNÆ]4*O0ñRSÉ<%6u<&Ì;Ö#í¡Ì©¢ëqÌT²Y={ÀÓL3S{¤ÈsEç!\"Eá\n:=ã$hH1H##( ¬X1D³¼áxÍ³Ô÷®<é<¤øM¥9(^]¼F&%O}§2{*ZOK)Áì®WnáÄTS¶-(¢É©ÌæïZÌÌMÓq±ÔüÖyCS)´:R}¡µ&ÎÒÝËmÖ:@¤nÇBp¶=pîrÊÑ/Â¡i§2¥¥&OÒQí?[Ä £ÍÌìD((?âîH§\n	ëWÀ','TheTeller','shipto','Nearest Filling Station','2',8.93,'545897062917',NULL,'W75S1593709005','Pending','me@shawndreck.com','Max Shawndreck','Ghana','1234567890','Acccra','Accra','233',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending','2020-07-02 08:56:45','2020-07-02 08:56:45',NULL,NULL,'GH¢',5.8,0,0,0,0,NULL,0,0),(3,31,'BZh91AY&SY²G\0¢ß@\0Pø+ü¿ÿÿúPÝhÁ´\r2Ý%i¦ÅS\ZOSj\0h\0\r\0\0ÒiMM¤\Z\0\04\0\Z\0RP¨£Ê4\0hÌ\0\0\0\0\0\0\0\0B\Z¤É&# z5\Zc)¦§Ôì¿aýÁø÷Ê4:50(Tdµà1Ðìé$$1ñzé®ÚSïÒÃ\rtrbQyá2¶ª}¿\ZÆoÖT×°ØW¦g:LõVÅwÞ$ApåÞùÍZnbÊa;÷âjÕà@ÖK®Pi¡ÓkQU÷´1@Å@±»ÝÂÖ:V¶&ë3Zè2FQh¢+éjbÊúª¥¢Uýl£\\òT0cn£)Ä;\"ª¥ÍI¬\n	LÊÁ$¡[D^dqÁÈ$Æ,Ê,ÁÈ@éRsUc\rI­ñ¬f³L©1qlÆ*Â\'SxÉâ \'T,d&Ø9Dµ­cl©W¾ièºB4Hi%Ï8Udèá©£¢bîCXÊH3¦cjp\\(¶n.3o(õA^99Èc\\Úv*J i5FMDbõx6{r&vIµ(=B)b=Ï;¨DDVÁ5*Õ\ZuH¶²kEÒ,(&®c¼ß53t\0æóy+û#Ð7îÙ\rXó8çS*Å¿\0á\'èørÏÈcÔ}Ç7omJO¦ê{ýÿ\'àØpRFRøT¢p5¦Þ@d&m£*LêgP  Ä`T>-9#Ý`x@6Äf0ª¦³2Û620Ë,ÌFn<}Ã\'wwãÊÆKIlUw¬®}ÏøØo2*4Ì$ÈàÂu#=$G´{mO®Å{«°&öàxýF Ñ®=¸;f~NiB¥ÀLC  |ý#Å×yóÀ\rÛêD&!Ã¦CPðö\\¦ß&ó´ÄA$ª57­ÑAdÂsBÿ+A³w3mÆn¦_1-IZÕaPµQ<\"xÔeV\n$¼(J(FfQPa@¢]À°]CôÉfÀKötºÐ©£ì³j\nTÒ*7MòÑÎZg4~dh4Û*Aî5TÊÉU­aÐÚ5cE¸wÔn/N¨C^Æ,VÉä2 i\\ía·0ØwºÜ95î¹-aÈ{Â!òÆ$ÌÄJa\r*ÒKÚiSM\\¾$¢ÛÒÐV^¢ö6.&JIià²\r%$¬be{*3\"¢eI\n(áF£è+!ksú?i(-²ò¥lÏYZÎÕÐ!**(ºæäOùo8¬Ý\Z È¹V¢óOiß¢ îîïBl(rø»)Â<È','TheTeller','shipto','Nearest Filling Station','1',7.72,'041781904492',NULL,'t7bb1593710320','Pending','me@shawndreck.com','Max Shawndreck','Ghana','123456789','accra','accra','233',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending','2020-07-02 09:18:40','2020-07-02 09:18:40',NULL,NULL,'GH¢',5.8,0,0,0,0,NULL,0,0),(4,32,'BZh91AY&SYiR\0Á_@\0Pø+ô¿ïÿúP»Ý\0LL SBQ Aêz\0\0\0h(j©þ¨z\0\0\0¥¡ÐiFPÓ&\0\0\0\0\0Dhi¤ÚR3I É¦AèÔÀS@Söo¿Àí>~¿¤hkØ<f½zE-}#æ;»IÐdýfÊÙbíË\n¹ôR4¯t\'\ZnéQ¯e?Wº¦XspÕÈ¹Þn¨ê50ÌÌµ.\\ê\n¹]»\0vDA¨Éb\nI¤x¼|ae$HÒè0W®ÕbqbMØ Ù`8Å²Ì¶@×\0k\0ÓÛwÄâÖ¬$4 ¤Â4\rVÐ²Ò	´ª¢äÜ\n©¿°7HPh½íiB-	iÿn45cN>æÒ\r¤n(±2$$3$©@3J¸Ì]9ÙpyVR`Ââ)-+xt²<ÝÑRÌÌyødy:ÀÉ){¹I	\Z<ÑôOq8Ð )MÀ.©Â¬Ã$¤ÑÃe£MàÅRA0C (ZP¢Ôj·w[¸£ävdDê ý»x!ÈsRìLU.3cªPLÞÆLØÌÛ%;)T¤\"¨ÉL4LÁ¬bæfV3ÎØZÛ(½ÚA%Åöò<\rç3qrÅÏ%èýåÚy¼~óRÉ_£6¢TØÅ|F¢Ç²~£<øG{(8GÄùþçÜÚ\ZJÄvKÝE³QÑ·KA¯ó>EÐ¹úm°ÖÒæ¦Ó,Á£Îôf<,Ø46. Æ}Si} #\"aº¦c8±ÉáÝmä¸Q-Þ{¬sÌÜp4(i\nIÁêBYæI`æ=&E|!RÄUB\nNiÖQF¼¥5a¸|%<t\Z¶faÞ(w¬Xï]èt@6¬(c:,Æñ=|îO!pë2 ç¨I*Íi+°ÏBNÀÈ]«Ù¿ê«7æuåàz¸axN!8ÍnÀ¬bNÕ{¨e,I1X09fòV¥È\n\nKÖ5Íu>æ«¯µíFi ÈáRHÅF\rD¨K®Ë\'®8Ã}FN4Û(àkö5º)£hx#3ÔºÇ}N³·Âïih2¡L!l$æ4²;H ë29léá~w²Û\"#àÜ\"®xÄY%\"WiVrX$iÐß<Ç·oÕ®	r.eîm!fpR ¢!wïS¦ò9³dFåsCIî6¬Ã%°t,Ráj×¹,ú~¼6hx®!	YYFGq?ñì=Ä+ o¹¥ÄØfHÖ)z·ígYø:{PÇ ±ðrE8PiR','TheTeller','shipto','Nearest Filling Station','1',1.72,'409560941572',NULL,'hHhL1593712306','Pending','elviskalitsi@gmail.com','Elvis Selorm Kalitsi','Ghana','0266122157','J11 Vra Akuse','Accra','00233',NULL,'Ghana',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending','2020-07-02 09:51:46','2020-07-02 09:51:46',NULL,NULL,'GH¢',5.8,0,0,0,0,NULL,0,0),(5,32,'BZh91AY&SYiR\0Á_@\0Pø+ô¿ïÿúP»Ý\0LL SBQ Aêz\0\0\0h(j©þ¨z\0\0\0¥¡ÐiFPÓ&\0\0\0\0\0Dhi¤ÚR3I É¦AèÔÀS@Söo¿Àí>~¿¤hkØ<f½zE-}#æ;»IÐdýfÊÙbíË\n¹ôR4¯t\'\ZnéQ¯e?Wº¦XspÕÈ¹Þn¨ê50ÌÌµ.\\ê\n¹]»\0vDA¨Éb\nI¤x¼|ae$HÒè0W®ÕbqbMØ Ù`8Å²Ì¶@×\0k\0ÓÛwÄâÖ¬$4 ¤Â4\rVÐ²Ò	´ª¢äÜ\n©¿°7HPh½íiB-	iÿn45cN>æÒ\r¤n(±2$$3$©@3J¸Ì]9ÙpyVR`Ââ)-+xt²<ÝÑRÌÌyødy:ÀÉ){¹I	\Z<ÑôOq8Ð )MÀ.©Â¬Ã$¤ÑÃe£MàÅRA0C (ZP¢Ôj·w[¸£ävdDê ý»x!ÈsRìLU.3cªPLÞÆLØÌÛ%;)T¤\"¨ÉL4LÁ¬bæfV3ÎØZÛ(½ÚA%Åöò<\rç3qrÅÏ%èýåÚy¼~óRÉ_£6¢TØÅ|F¢Ç²~£<øG{(8GÄùþçÜÚ\ZJÄvKÝE³QÑ·KA¯ó>EÐ¹úm°ÖÒæ¦Ó,Á£Îôf<,Ø46. Æ}Si} #\"aº¦c8±ÉáÝmä¸Q-Þ{¬sÌÜp4(i\nIÁêBYæI`æ=&E|!RÄUB\nNiÖQF¼¥5a¸|%<t\Z¶faÞ(w¬Xï]èt@6¬(c:,Æñ=|îO!pë2 ç¨I*Íi+°ÏBNÀÈ]«Ù¿ê«7æuåàz¸axN!8ÍnÀ¬bNÕ{¨e,I1X09fòV¥È\n\nKÖ5Íu>æ«¯µíFi ÈáRHÅF\rD¨K®Ë\'®8Ã}FN4Û(àkö5º)£hx#3ÔºÇ}N³·Âïih2¡L!l$æ4²;H ë29léá~w²Û\"#àÜ\"®xÄY%\"WiVrX$iÐß<Ç·oÕ®	r.eîm!fpR ¢!wïS¦ò9³dFåsCIî6¬Ã%°t,Ráj×¹,ú~¼6hx®!	YYFGq?ñì=Ä+ o¹¥ÄØfHÖ)z·ígYø:{PÇ ±ðrE8PiR','TheTeller','shipto','Nearest Filling Station','1',1.72,'270378896253',NULL,'9M4H1593713087','Pending','elviskalitsi@gmail.com','Elvis Selorm Kalitsi','Ghana','0266122157','J11 Vra Akuse','Accra','00233',NULL,'Ghana',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending','2020-07-02 10:04:47','2020-07-02 10:04:47',NULL,NULL,'GH¢',5.8,0,0,0,0,NULL,0,0),(6,32,'BZh91AY&SYiR\0Á_@\0Pø+ô¿ïÿúP»Ý\0LL SBQ Aêz\0\0\0h(j©þ¨z\0\0\0¥¡ÐiFPÓ&\0\0\0\0\0Dhi¤ÚR3I É¦AèÔÀS@Söo¿Àí>~¿¤hkØ<f½zE-}#æ;»IÐdýfÊÙbíË\n¹ôR4¯t\'\ZnéQ¯e?Wº¦XspÕÈ¹Þn¨ê50ÌÌµ.\\ê\n¹]»\0vDA¨Éb\nI¤x¼|ae$HÒè0W®ÕbqbMØ Ù`8Å²Ì¶@×\0k\0ÓÛwÄâÖ¬$4 ¤Â4\rVÐ²Ò	´ª¢äÜ\n©¿°7HPh½íiB-	iÿn45cN>æÒ\r¤n(±2$$3$©@3J¸Ì]9ÙpyVR`Ââ)-+xt²<ÝÑRÌÌyødy:ÀÉ){¹I	\Z<ÑôOq8Ð )MÀ.©Â¬Ã$¤ÑÃe£MàÅRA0C (ZP¢Ôj·w[¸£ävdDê ý»x!ÈsRìLU.3cªPLÞÆLØÌÛ%;)T¤\"¨ÉL4LÁ¬bæfV3ÎØZÛ(½ÚA%Åöò<\rç3qrÅÏ%èýåÚy¼~óRÉ_£6¢TØÅ|F¢Ç²~£<øG{(8GÄùþçÜÚ\ZJÄvKÝE³QÑ·KA¯ó>EÐ¹úm°ÖÒæ¦Ó,Á£Îôf<,Ø46. Æ}Si} #\"aº¦c8±ÉáÝmä¸Q-Þ{¬sÌÜp4(i\nIÁêBYæI`æ=&E|!RÄUB\nNiÖQF¼¥5a¸|%<t\Z¶faÞ(w¬Xï]èt@6¬(c:,Æñ=|îO!pë2 ç¨I*Íi+°ÏBNÀÈ]«Ù¿ê«7æuåàz¸axN!8ÍnÀ¬bNÕ{¨e,I1X09fòV¥È\n\nKÖ5Íu>æ«¯µíFi ÈáRHÅF\rD¨K®Ë\'®8Ã}FN4Û(àkö5º)£hx#3ÔºÇ}N³·Âïih2¡L!l$æ4²;H ë29léá~w²Û\"#àÜ\"®xÄY%\"WiVrX$iÐß<Ç·oÕ®	r.eîm!fpR ¢!wïS¦ò9³dFåsCIî6¬Ã%°t,Ráj×¹,ú~¼6hx®!	YYFGq?ñì=Ä+ o¹¥ÄØfHÖ)z·ígYø:{PÇ ±ðrE8PiR','TheTeller','shipto','Nearest Filling Station','1',1.72,'861264800628',NULL,'niQB1593713847','Pending','elviskalitsi@gmail.com','Elvis Selorm Kalitsi','Ghana','0266122157','J11 Vra Akuse','Accra','00233',NULL,'Ghana',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending','2020-07-02 10:17:27','2020-07-02 10:17:27',NULL,NULL,'GH¢',5.8,0,0,0,0,NULL,0,0),(7,NULL,'BZh91AY&SYSÁ	>\0¹ß@\0Pø+Ïô¿ïÿúPáÑ]Õ3Zs52Hòª{RzS#Ôõ\Z=M£Q Jj`\r\r\0#C!¦\Z\0B4PÐ4h§i¡¦¦\Zh`\0\0\0\0\0\0\0DÈLÈ	êi \Z\04pH$vr7	&òÃÃÂ¤!Óuc¤T¡ÌB×Ýð·Î|¡±»­\ZäßS	çaµ2aùFÕI·97n7ç¿cBç^\ní+±\00HsÀ=Å@ºKD	\nzÂ)Tup1! ¨iÁ 25` \Zy@¯UV`Ð`@Q³UçPhÞ`LCF½¶hèî Ñ¤ª*lÉX{BT$iWj°ª©TþCDÚªÚ*fkC`ªîboÀØ ùÈ  ÞX¢\\.HdsÒØ6xex®\nË2ÖL=ª	hl4]C&Ã»UÌYí$bV÷£*ÊÞ´¹$/ábÚÀmÆ}\'\n³N\Z4aCC\"Ö$¤²²`@P´¡E¾r|8¸BBÊ¥ï3AÁj-GÀºCZØÀÆé2°(lr¥\\­^âI¹FD`²d¤\'6¨Ñyõ­]lB3FµmÑkÝ!£G L^=§ÀÀê$~KMÈKüß2Ód¬Þ|M;æ¼óäu¹³îGD	3Uã5ÎF0â1aæ9VSqÜwï=\n(µmÄ¨Ò4t ¥Pe¼t­\"n­	v06.dØÆA£ác¢2=°i°7\n<å÷n²ÜdÀÎGü@@CóýÞö«áïÅéÊB$%cE5cØo=F¥¨¤K#<4F÷ç\ZæÕ\"¸Fðòé8yºÈ\ZÙe\\|ã,y`Àià*wQkà½è6\r¼ô;ÐÆ#¨ÉAè\ZgSÙì¹>\"ç\'3´Á]ITÖ¹ÒÚ\"~ä¡<P¼N¶rî4·ù3ßâytÂñæ)\"àK[\\T^È\'UÌÛ²Â¢$ÒR¨3+bäÉzÅ#eq|MámØPÓ4°`ðô!Ô®ÉNÁÝ¸>z$ç1Fä{ÌdÌÄ>i$¢Êð©©¬²¦1ÁÐÆÆKxäÝFÒ£Ö2VGèw,5_×õ·KlCâ$W²1 f%\"SiVrX$iÔoÇ³âÄ×Þ_ ëw¹¸ J2Q»¸A¨yw87ÄßÐÆHÔÞ c .jk<âÅX\rÃèE|õ`³cn¢Ú^{V@éEE=$>£éØ@#¨ÏyCèÑã$\rbÈg¸·Ònó£ý6íÜAcÿrE8PSÁ	>','TheTeller','pickup','Nearest Filling Station','1',21.55,'080687020414',NULL,'hyNq1594734292','Pending','ev@gmail.com','Evlyn','Ghana','Anku','roman hil','Takoradi','233',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pending','2020-07-14 05:44:52','2020-07-14 05:44:52',NULL,NULL,'GH¢',5.8,0,0,0,0,NULL,0,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packages` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL DEFAULT '0',
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subtitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,0,'Default Packaging','Default packaging by store',0),(2,0,'Gift Packaging','Exclusive Gift packaging',15);
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `header` tinyint(1) NOT NULL DEFAULT '0',
  `footer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'About Us','about','<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\">&nbsp;</div><img src=\"https://i.imgur.com/SiJu5y1.jpg\" width=\"498\"><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\">Hello&nbsp;</div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\"><br></div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\">Please allow us to introduce you to our business project called Afmak.com. It is an innovative e-commerce website written by web solutions Ltd. It specialises in assisting indigenous African companies to make their products and services accessible online with the requisite world class branding and packaging.</div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\"><br></div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\">Afmak.com is a user friendly platform that allows vendors to put their products and services online easily and gives them access to a web page dedicated to their business. It also allows vendors to link their social media accounts to their Afmak.com webpage.</div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\"><br></div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\">An advertisement on Afmak.com is affordable and guaranteed to reach thousands of visitors to the site.</div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\"><br></div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\"><img src=\"https://i.imgur.com/IiSQfnz.jpg\" width=\"498\"><br></div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\"><br></div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\">Customers will also find it easy to buy and pay for products and services online easily and without hassle.</div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\"><br></div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\">We invite you as a vendor, advertiser or customer to join Afmak and let us work together to promote Africa to the world.</div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\"><br></div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\"><br></div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\">Afmak four main core areas of concern are, the Manufacturing sector, indigenously made African products and services, small scale businesses and finally agricultural sector</div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\"><br></div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\"><br></div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\">This is officially our main point of focus</div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\"><br></div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\"><br></div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\">The project Afamk has a singular opportunity to employ millions of Ghanaian youth in a meaningful employment sectors as affiliated marketing agents, delivery department across the country, Administrative personals and many many offices&nbsp;</div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\"><br></div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\"><br></div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\">For any&nbsp; other further information&nbsp;</div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\"><br></div><div style=\"color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px;\">Contact us&nbsp; on our whatsapp number: +233 208 266 322</div></h2></div>','Made in africa,Indigenous products,Africa,Start up businesses,African supplies','Promoting made in Africa products and services to the world',0,1),(2,'Privacy & Policy','privacy','<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2 style=\"text-align: center;\"><b>PRIVACY POLICY</b></h2><h2>\r\n<p>Effective date: 2020-05-28</p>\r\n<p>1. <b>Introduction</b></p>\r\n<p>Welcome to <b> Web Solutions Ltd.</b>.</p>\r\n<p><b>Web Solutions Ltd.</b> (“us”, “we”, or “our”) operates <b>afmak.com</b> (hereinafter referred to as <b>“Service”</b>).</p>\r\n<p>Our Privacy Policy governs your visit to <b>afmak.com</b>, and explains how we collect, safeguard and disclose information that results from your use of our Service.</p>\r\n<p>We use your data to provide and improve Service. By using Service, you agree to the collection and use of information in accordance with this policy. Unless otherwise defined in this Privacy Policy, the terms used in this Privacy Policy have the same meanings as in our Terms and Conditions.</p>\r\n<p>Our Terms and Conditions (<b>“Terms”</b>) govern all use of our Service and together with the Privacy Policy constitutes your agreement with us (<b>“agreement”</b>).</p>\r\n<p>2. <b>Definitions</b></p>\r\n<p><b>SERVICE</b> means the afmak.com website operated by Web Solutions Ltd..</p>\r\n<p><b>PERSONAL DATA</b> means data about a living individual who can be identified from those data (or from those and other information either in our possession or likely to come into our possession).</p>\r\n<p><b>USAGE DATA</b> is data collected automatically either generated by the use of Service or from Service infrastructure itself (for example, the duration of a page visit).</p>\r\n<p><b>COOKIES</b> are small files stored on your device (computer or mobile device).</p>\r\n<p><b>DATA CONTROLLER</b> means a natural or legal person who (either alone or jointly or in common with other persons) determines the purposes for which and the manner in which any personal data are, or are to be, processed. For the purpose of this Privacy Policy, we are a Data Controller of your data.</p>\r\n<p><b>DATA PROCESSORS (OR SERVICE PROVIDERS)</b> means any natural or legal person who processes the data on behalf of the Data Controller. We may use the services of various Service Providers in order to process your data more effectively.</p> <p><b>DATA SUBJECT</b> is any living individual who is the subject of Personal Data.</p>\r\n<p><b>THE USER</b> is the individual using our Service. The User corresponds to the Data Subject, who is the subject of Personal Data.</p>\r\n<p>3. <b>Information Collection and Use</b></p>\r\n<p>We collect several different types of information for various purposes to provide and improve our Service to you.</p>\r\n<p>4. <b>Types of Data Collected</b></p>\r\n<p><b>Personal Data</b></p>\r\n<p>While using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you (<b>“Personal Data”</b>). Personally identifiable information may include, but is not limited to:</p>\r\n<p>0.1. Email address</p>\r\n<p>0.2. First name and last name</p>\r\n<p>0.3. Phone number</p>\r\n<p>0.4. Address, Country, State, Province, ZIP/Postal code, City</p>\r\n<p>0.5. Cookies and Usage Data</p>\r\n<p>We may use your Personal Data to contact you with newsletters, marketing or promotional materials and other information that may be of interest to you. You may opt out of receiving any, or all, of these communications from us by following the unsubscribe link.</p>\r\n<p><b>Usage Data</b></p>\r\n<p>We may also collect information that your browser sends whenever you visit our Service or when you access Service by or through any device (<b>“Usage Data”</b>).</p>\r\n<p>This Usage Data may include information such as your computer’s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that you visit, the time and date of your visit, the time spent on those pages, unique device identifiers and other diagnostic data.</p>\r\n<p>When you access Service with a device, this Usage Data may include information such as the type of device you use, your device unique ID, the IP address of your device, your device operating system, the type of Internet browser you use, unique device identifiers and other diagnostic data.</p>\r\n<p><b>Location Data</b></p><p>We may use and store information about your location if you give us permission to do so (<b>“Location Data”</b>). We use this data to provide features of our Service, to improve and customize our Service.</p><p>You can enable or disable location services when you use our Service at any time by way of your device settings.</p>\r\n<p><b>Tracking Cookies Data</b></p>\r\n<p>We use cookies and similar tracking technologies to track the activity on our Service and we hold certain information.</p>\r\n<p>Cookies are files with a small amount of data which may include an anonymous unique identifier. Cookies are sent to your browser from a website and stored on your device. Other tracking technologies are also used such as beacons, tags and scripts to collect and track information and to improve and analyze our Service.</p>\r\n<p>You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our Service.</p>\r\n<p>Examples of Cookies we use:</p>\r\n<p>0.1. <b>Session Cookies:</b> We use Session Cookies to operate our Service.</p>\r\n<p>0.2. <b>Preference Cookies:</b> We use Preference Cookies to remember your preferences and various settings.</p>\r\n<p>0.3. <b>Security Cookies:</b> We use Security Cookies for security purposes.</p>\r\n<p>0.4. <b>Advertising Cookies:</b> Advertising Cookies are used to serve you with advertisements that may be relevant to you and your interests.</p>\r\n<p><b>Other Data</b></p>\r\n<p>While using our Service, we may also collect the following information: sex, age, date of birth, place of birth, passport details, citizenship, registration at place of residence and actual address, telephone number (work, mobile), details of documents on education, qualification, professional training, employment agreements, <a href=\"https://policymaker.io/non-disclosure-agreement/\">non-disclosure agreements</a>, information on bonuses and compensation, information on marital status, family members, social security (or other taxpayer identification) number, office location and other data.</p>\r\n<p>5. <b>Use of Data</b></p>\r\n<p>Web Solutions Ltd. uses the collected data for various purposes:</p>\r\n<p>0.1. to provide and maintain our Service;</p>\r\n<p>0.2. to notify you about changes to our Service;</p>\r\n<p>0.3. to allow you to participate in interactive features of our Service when you choose to do so;</p>\r\n<p>0.4. to provide customer support;</p>\r\n<p>0.5. to gather analysis or valuable information so that we can improve our Service;</p>\r\n<p>0.6. to monitor the usage of our Service;</p>\r\n<p>0.7. to detect, prevent and address technical issues;</p>\r\n<p>0.8. to fulfil any other purpose for which you provide it;</p>\r\n<p>0.9. to carry out our obligations and enforce our rights arising from any contracts entered into between you and us, including for billing and collection;</p>\r\n<p>0.10. to provide you with notices about your account and/or subscription, including expiration and renewal notices, email-instructions, etc.;</p>\r\n<p>0.11. to provide you with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless you have opted not to receive such information;</p>\r\n<p>0.12. in any other way we may describe when you provide the information;</p>\r\n<p>0.13. for any other purpose with your consent.</p>\r\n<p>6. <b>Retention of Data</b></p>\r\n<p>We will retain your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.</p>\r\n<p>We will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period, except when this data is used to strengthen the security or to improve the functionality of our Service, or we are legally obligated to retain this data for longer time periods.</p>\r\n<p>7. <b>Transfer of Data</b></p>\r\n<p>Your information, including Personal Data, may be transferred to – and maintained on – computers located outside of your state, province, country or other governmental jurisdiction where the data protection laws may differ from those of your jurisdiction.</p>\r\n<p>If you are located outside Ghana and choose to provide information to us, please note that we transfer the data, including Personal Data, to Ghana and process it there.</p>\r\n<p>Your consent to this Privacy Policy followed by your submission of such information represents your agreement to that transfer.</p>\r\n<p>Web Solutions Ltd. will take all the steps reasonably necessary to ensure that your data is treated securely and in accordance with this Privacy Policy and no transfer of your Personal Data will take place to an organisation or a country unless there are adequate controls in place including the security of your data and other personal information.</p>\r\n<p>8. <b>Disclosure of Data</b></p>\r\n<p>We may disclose personal information that we collect, or you provide:</p>\r\n<p>0.1. <b>Disclosure for Law Enforcement.</b></p><p>Under certain circumstances, we may be required to disclose your Personal Data if required to do so by law or in response to valid requests by public authorities.</p><p>0.2. <b>Business Transaction.</b></p><p>If we or our subsidiaries are involved in a merger, acquisition or asset sale, your Personal Data may be transferred.</p><p>0.3. <b>Other cases. We may disclose your information also:</b></p><p>0.3.1. to our subsidiaries and affiliates;</p><p>0.3.2. to contractors, service providers, and other third parties we use to support our business;</p><p>0.3.3. to fulfill the purpose for which you provide it;</p><p>0.3.4. for the purpose of including your company’s logo on our website;</p><p>0.3.5. for any other purpose disclosed by us when you provide the information;</p><p>0.3.6. with your consent in any other cases;</p><p>0.3.7. if we believe disclosure is necessary or appropriate to protect the rights, property, or safety of the Company, our customers, or others.</p>\r\n<p>9. <b>Security of Data</b></p>\r\n<p>The security of your data is important to us but remember that no method of transmission over the Internet or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your Personal Data, we cannot guarantee its absolute security.</p>\r\n<p>10. <b>Your Data Protection Rights Under General Data Protection Regulation (GDPR)\r\n</b></p>\r\n<p>If you are a resident of the European Union (EU) and European Economic Area (EEA), you have certain data protection rights, covered by GDPR.</p>\r\n<p>We aim to take reasonable steps to allow you to correct, amend, delete, or limit the use of your Personal Data.</p>\r\n<p> If you wish to be informed what Personal Data we hold about you and if you want it to be removed from our systems, please email us at <b>support@afmak.com</b>.</p>\r\n<p>In certain circumstances, you have the following data protection rights:</p>\r\n<p>0.1. the right to access, update or to delete the information we have on you;</p>\r\n<p>0.2. the right of rectification. You have the right to have your information rectified if that information is inaccurate or incomplete;</p>\r\n<p>0.3. the right to object. You have the right to object to our processing of your Personal Data;</p>\r\n<p>0.4. the right of restriction. You have the right to request that we restrict the processing of your personal information;</p>\r\n<p>0.5. the right to data portability. You have the right to be provided with a copy of your Personal Data in a structured, machine-readable and commonly used format;</p>\r\n<p>0.6. the right to withdraw consent. You also have the right to withdraw your consent at any time where we rely on your consent to process your personal information;</p>\r\n<p>Please note that we may ask you to verify your identity before responding to such requests. Please note, we may not able to provide Service without some necessary data.</p>\r\n<p>You have the right to complain to a Data Protection Authority about our collection and use of your Personal Data. For more information, please contact your local data protection authority in the European Economic Area (EEA).</p>\r\n<p>11. <b>Your Data Protection Rights under the California Privacy Protection Act (CalOPPA)</b></p>\r\n<p>CalOPPA is the first state law in the nation to require commercial websites and online services to post a privacy policy. The law’s reach stretches well beyond California to require a person or company in the United States (and conceivable the world) that operates websites collecting personally identifiable information from California consumers to post a conspicuous privacy policy on its website stating exactly the information being collected and those individuals with whom it is being shared, and to comply with this policy.</p>\r\n<p>According to CalOPPA we agree to the following:</p>\r\n<p>0.1. users can visit our site anonymously;</p>\r\n<p>0.2. our Privacy Policy link includes the word “Privacy”, and can easily be found on the home page of our website;</p>\r\n<p>0.3. users will be notified of any privacy policy changes on our Privacy Policy Page;</p>\r\n<p>0.4. users are able to change their personal information by emailing us at <b>support@afmak.com</b>.</p>\r\n<p>Our Policy on “Do Not Track” Signals:</p>\r\n<p>We honor Do Not Track signals and do not track, plant cookies, or use advertising when a Do Not Track browser mechanism is in place. Do Not Track is a preference you can set in your web browser to inform websites that you do not want to be tracked.</p>\r\n<p>You can enable or disable Do Not Track by visiting the Preferences or Settings page of your web browser.</p>\r\n<p>12. <b>Your Data Protection Rights under the California Consumer Privacy Act (CCPA)</b></p>\r\n<p>If you are a California resident, you are entitled to learn what data we collect about you, ask to delete your data and not to sell (share) it. To exercise your data protection rights, you can make certain requests and ask us:</p>\r\n<p><b>0.1. What personal information we have about you. If you make this request, we will return to you:</b></p>\r\n<p>0.0.1. The categories of personal information we have collected about you.</p>\r\n<p>0.0.2. The categories of sources from which we collect your personal information.</p>\r\n<p>0.0.3. The business or commercial purpose for collecting or selling your personal information.</p>\r\n<p>0.0.4. The categories of third parties with whom we share personal information.</p>\r\n<p>0.0.5. The specific pieces of personal information we have collected about you.</p>\r\n<p>0.0.6. A list of categories of personal information that we have sold, along with the category of any other company we sold it to. If we have not sold your personal information, we will inform you of that fact.</p>\r\n<p>0.0.7. A list of categories of personal information that we have disclosed for a business purpose, along with the category of any other company we shared it with.</p>\r\n<p>Please note, you are entitled to ask us to provide you with this information up to two times in a rolling twelve-month period. When you make this request, the information provided may be limited to the personal information we collected about you in the previous 12 months.</p>\r\n<p><b>0.2. To delete your personal information. If you make this request, we will delete the personal information we hold about you as of the date of your request from our records and direct any service providers to do the same. In some cases, deletion may be accomplished through de-identification of the information. If you choose to delete your personal information, you may not be able to use certain functions that require your personal information to operate.</b></p>\r\n<p><b>0.3. To stop selling your personal information. We don’t sell or rent your personal information to any third parties for any purpose. We do not sell your personal information for monetary consideration. However, under some circumstances, a transfer of personal information to a third party, or within our family of companies, without monetary consideration may be considered a “sale” under California law. You are the only owner of your Personal Data and can request disclosure or deletion at any time.</b></p>\r\n<p>If you submit a request to stop selling your personal information, we will stop making such transfers.</p>\r\n<p>Please note, if you ask us to delete or stop selling your data, it may impact your experience with us, and you may not be able to participate in certain programs or membership services which require the usage of your personal information to function. But in no circumstances, we will discriminate against you for exercising your rights.</p>\r\n<p>To exercise your California data protection rights described above, please send your request(s) by email: <b>support@afmak.com</b>.</p>\r\n<p>Your data protection rights, described above, are covered by the CCPA, short for the California Consumer Privacy Act. To find out more, visit the official California Legislative Information website. The CCPA took effect on 01/01/2020.</p>\r\n<p>13. <b>Service Providers</b></p>\r\n<p>We may employ third party companies and individuals to facilitate our Service (<b>“Service Providers”</b>), provide Service on our behalf, perform Service-related services or assist us in analysing how our Service is used.</p>\r\n<p>These third parties have access to your Personal Data only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.</p>\r\n<p>14. <b>Analytics</b></p>\r\n<p>We may use third-party Service Providers to monitor and analyze the use of our Service.</p>\r\n<p>15. <b>CI/CD tools</b></p>\r\n<p>We may use third-party Service Providers to automate the development process of our Service.</p>\r\n<p>16. <b>Advertising</b></p><p>We may use third-party Service Providers to show advertisements to you to help support and maintain our Service.</p>\r\n<p>17. <b>Behavioral Remarketing</b></p>\r\n<p>We may use remarketing services to advertise on third party websites to you after you visited our Service. We and our third-party vendors use cookies to inform, optimise and serve ads based on your past visits to our Service.</p>\r\n<p>18. <b>Payments</b></p><p>We may provide paid products and/or services within Service. In that case, we use third-party services for payment processing (e.g. payment processors).</p><p>We will not store or collect your payment card details. That information is provided directly to our third-party payment processors whose use of your personal information is governed by their Privacy Policy. These payment processors adhere to the standards set by PCI-DSS as managed by the PCI Security Standards Council, which is a joint effort of brands like Visa, Mastercard, American Express and Discover. PCI-DSS requirements help ensure the secure handling of payment information.</p>\r\n<p>19. <b>Links to Other Sites</b></p>\r\n<p>Our Service may contain links to other sites that are not operated by us. If you click a third party link, you will be directed to that third party’s site. We strongly advise you to review the Privacy Policy of every site you visit.</p>\r\n<p>We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.</p>\r\n<p>For example, the outlined Privacy Policy has been made using <a href=\"https://policymaker.io/\">PolicyMaker.io</a>, free tool that helps create high-quality legal documents. PolicyMaker’s free online <a href=\"https://policymaker.io/privacy-policy/\">privacy policy generator</a> is an easy-to-use tool for creating a <a href=\"https://policymaker.io/blog-privacy-policy/\">privacy policy for blog</a>, website, e-commerce store or mobile app.</p>\r\n<p>20. <b><b>Children’s Privacy</b></b></p>\r\n<p>Our Services are not intended for use by children under the age of 18 (<b>“Child”</b> or <b>“Children”</b>).</p>\r\n<p>We do not knowingly collect personally identifiable information from Children under 18. If you become aware that a Child has provided us with Personal Data, please contact us. If we become aware that we have collected Personal Data from Children without verification of parental consent, we take steps to remove that information from our servers.</p>\r\n<p>21. <b>Changes to This Privacy Policy</b></p>\r\n<p>We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.</p>\r\n<p>We will let you know via email and/or a prominent notice on our Service, prior to the change becoming effective and update “effective date” at the top of this Privacy Policy.</p>\r\n<p>You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.</p>\r\n<p>22. <b>Contact Us</b></p>\r\n<p>If you have any questions about this Privacy Policy, please contact us by email: <b>support@afmak.com</b>.</p>\r\n<p style=\"margin-top: 5em; font-size: 0.7em;\">This <a href=\"https://policymaker.io/privacy-policy/\">Privacy Policy</a> was created for <b>afmak.com</b> by <a href=\"https://policymaker.io\">PolicyMaker.io</a> on 2020-05-28.</p></h2></div>','test,test1,test2,test3',NULL,0,1),(3,'Terms & Condition','terms','<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2 style=\"text-align: center;\"><b>TERMS AND CONDITIONS</b></h2><h2>\r\n<p>Last updated: 2020-05-28</p>\r\n<p>1. <b>Introduction</b></p>\r\n<p>Welcome to <b>Web Solutions Ltd.</b> (“Company”, “we”, “our”, “us”)!</p>\r\n<p>These Terms of Service (“Terms”, “Terms of Service”) govern your use of our website located at <b>afmak.com</b> (together or individually “Service”) operated by <b>Web Solutions Ltd.</b>.</p>\r\n<p>Our Privacy Policy also governs your use of our Service and explains how we collect, safeguard and disclose information that results from your use of our web pages.</p>\r\n<p>Your agreement with us includes these Terms and our Privacy Policy (“Agreements”). You acknowledge that you have read and understood Agreements, and agree to be bound of them.</p>\r\n<p>If you do not agree with (or cannot comply with) Agreements, then you may not use the Service, but please let us know by emailing at <b>support@afmak.com</b> so we can try to find a solution. These Terms apply to all visitors, users and others who wish to access or use Service.</p>\r\n<p>2. <b>Communications</b></p>\r\n<p>By using our Service, you agree to subscribe to newsletters, marketing or promotional materials and other information we may send. However, you may opt out of receiving any, or all, of these communications from us by following the unsubscribe link or by emailing at support@afmak.com.</p>\r\n<p>3. <b>Purchases</b></p><p>If you wish to purchase any product or service made available through Service (“Purchase”), you may be asked to supply certain information relevant to your Purchase including but not limited to, your credit or debit card number, the expiration date of your card, your billing address, and your shipping information.</p><p>You represent and warrant that: (i) you have the legal right to use any card(s) or other payment method(s) in connection with any Purchase; and that (ii) the information you supply to us is true, correct and complete.</p><p>We may employ the use of third party services for the purpose of facilitating payment and the completion of Purchases. By submitting your information, you grant us the right to provide the information to these third parties subject to our Privacy Policy.</p><p>We reserve the right to refuse or cancel your order at any time for reasons including but not limited to: product or service availability, errors in the description or price of the product or service, error in your order or other reasons.</p><p>We reserve the right to refuse or cancel your order if fraud or an unauthorized or illegal transaction is suspected.</p>\r\n<p>4. <b>Contests, Sweepstakes and Promotions</b></p>\r\n<p>Any contests, sweepstakes or other promotions (collectively, “Promotions”) made available through Service may be governed by rules that are separate from these Terms of Service. If you participate in any Promotions, please review the applicable rules as well as our Privacy Policy. If the rules for a Promotion conflict with these Terms of Service, Promotion rules will apply.</p>\r\n<p>5. <b>Subscriptions</b></p><p>Some parts of Service are billed on a subscription basis (\"Subscription(s)\"). You will be billed in advance on a recurring and periodic basis (\"Billing Cycle\"). Billing cycles will be set depending on the type of subscription plan you select when purchasing a Subscription.</p><p>At the end of each Billing Cycle, your Subscription will automatically renew under the exact same conditions unless you cancel it or Web Solutions Ltd. cancels it. You may cancel your Subscription renewal either through your online account management page or by contacting support@afmak.com customer support team.</p><p>A valid payment method is required to process the payment for your subscription. You shall provide Web Solutions Ltd. with accurate and complete billing information that may include but not limited to full name, address, state, postal or zip code, telephone number, and a valid payment method information. By submitting such payment information, you automatically authorize Web Solutions Ltd. to charge all Subscription fees incurred through your account to any such payment instruments.</p><p>Should automatic billing fail to occur for any reason, Web Solutions Ltd. reserves the right to terminate your access to the Service with immediate effect.</p><p>6. <b>Free Trial</b></p><p>Web Solutions Ltd. may, at its sole discretion, offer a Subscription with a free trial for a limited period of time (\"Free Trial\").</p><p>You may be required to enter your billing information in order to sign up for Free Trial.</p><p>If you do enter your billing information when signing up for Free Trial, you will not be charged by Web Solutions Ltd. until Free Trial has expired. On the last day of Free Trial period, unless you cancelled your Subscription, you will be automatically charged the applicable Subscription fees for the type of Subscription you have selected.</p><p>At any time and without notice, Web Solutions Ltd. reserves the right to (i) modify Terms of Service of Free Trial offer, or (ii) cancel such Free Trial offer.</p><p>7. <b>Fee Changes</b></p><p>Web Solutions Ltd., in its sole discretion and at any time, may modify Subscription fees for the Subscriptions. Any Subscription fee change will become effective at the end of the then-current Billing Cycle.</p><p>Web Solutions Ltd. will provide you with a reasonable prior notice of any change in Subscription fees to give you an opportunity to terminate your Subscription before such change becomes effective.</p><p>Your continued use of Service after Subscription fee change comes into effect constitutes your agreement to pay the modified Subscription fee amount.</p>\r\n<p>8. <b>Refunds</b></p><p>We issue refunds for Contracts within <b>30 days</b> of the original purchase of the Contract.</p>\r\n<p>9. <b>Content</b></p><p>Our Service allows you to post, link, store, share and otherwise make available certain information, text, graphics, videos, or other material (“Content”). You are responsible for Content that you post on or through Service, including its legality, reliability, and appropriateness.</p><p>By posting Content on or through Service, You represent and warrant that: (i) Content is yours (you own it) and/or you have the right to use it and the right to grant us the rights and license as provided in these Terms, and (ii) that the posting of your Content on or through Service does not violate the privacy rights, publicity rights, copyrights, contract rights or any other rights of any person or entity. We reserve the right to terminate the account of anyone found to be infringing on a copyright.</p><p>You retain any and all of your rights to any Content you submit, post or display on or through Service and you are responsible for protecting those rights. We take no responsibility and assume no liability for Content you or any third party posts on or through Service. However, by posting Content using Service you grant us the right and license to use, modify, publicly perform, publicly display, reproduce, and distribute such Content on and through Service. You agree that this license includes the right for us to make your Content available to other users of Service, who may also use your Content subject to these Terms.</p><p>Web Solutions Ltd. has the right but not the obligation to monitor and edit all Content provided by users.</p><p>In addition, Content found on or through this Service are the property of Web Solutions Ltd. or used with permission. You may not distribute, modify, transmit, reuse, download, repost, copy, or use said Content, whether in whole or in part, for commercial purposes or for personal gain, without express advance written permission from us.</p>\r\n<p>10. <b>Prohibited Uses</b></p>\r\n<p>You may use Service only for lawful purposes and in accordance with Terms. You agree not to use Service:</p>\r\n<p>0.1. In any way that violates any applicable national or international law or regulation.</p>\r\n<p>0.2. For the purpose of exploiting, harming, or attempting to exploit or harm minors in any way by exposing them to inappropriate content or otherwise.</p>\r\n<p>0.3. To transmit, or procure the sending of, any advertising or promotional material, including any “junk mail”, “chain letter,” “spam,” or any other similar solicitation.</p>\r\n<p>0.4. To impersonate or attempt to impersonate Company, a Company employee, another user, or any other person or entity.</p>\r\n<p>0.5. In any way that infringes upon the rights of others, or in any way is illegal, threatening, fraudulent, or harmful, or in connection with any unlawful, illegal, fraudulent, or harmful purpose or activity.</p>\r\n<p>0.6. To engage in any other conduct that restricts or inhibits anyone’s use or enjoyment of Service, or which, as determined by us, may harm or offend Company or users of Service or expose them to liability.</p>\r\n<p>Additionally, you agree not to:</p>\r\n<p>0.1. Use Service in any manner that could disable, overburden, damage, or impair Service or interfere with any other party’s use of Service, including their ability to engage in real time activities through Service.</p>\r\n<p>0.2. Use any robot, spider, or other automatic device, process, or means to access Service for any purpose, including monitoring or copying any of the material on Service.</p>\r\n<p>0.3. Use any manual process to monitor or copy any of the material on Service or for any other unauthorized purpose without our prior written consent.</p>\r\n<p>0.4. Use any device, software, or routine that interferes with the proper working of Service.</p>\r\n<p>0.5. Introduce any viruses, trojan horses, worms, logic bombs, or other material which is malicious or technologically harmful.</p>\r\n<p>0.6. Attempt to gain unauthorized access to, interfere with, damage, or disrupt any parts of Service, the server on which Service is stored, or any server, computer, or database connected to Service.</p>\r\n<p>0.7. Attack Service via a denial-of-service attack or a distributed denial-of-service attack.</p>\r\n<p>0.8. Take any action that may damage or falsify Company rating.</p>\r\n<p>0.9. Otherwise attempt to interfere with the proper working of Service.</p>\r\n<p>11. <b>Analytics</b></p>\r\n<p>We may use third-party Service Providers to monitor and analyze the use of our Service.</p>\r\n<p>12. <b>No Use By Minors</b></p>\r\n<p>Service is intended only for access and use by individuals at least eighteen (18) years old. By accessing or using Service, you warrant and represent that you are at least eighteen (18) years of age and with the full authority, right, and capacity to enter into this agreement and abide by all of the terms and conditions of Terms. If you are not at least eighteen (18) years old, you are prohibited from both the access and usage of Service.</p>\r\n<p>13. <b>Accounts</b></p><p>When you create an account with us, you guarantee that you are above the age of 18, and that the information you provide us is accurate, complete, and current at all times. Inaccurate, incomplete, or obsolete information may result in the immediate termination of your account on Service.</p><p>You are responsible for maintaining the confidentiality of your account and password, including but not limited to the restriction of access to your computer and/or account. You agree to accept responsibility for any and all activities or actions that occur under your account and/or password, whether your password is with our Service or a third-party service. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.</p><p>You may not use as a username the name of another person or entity or that is not lawfully available for use, a name or trademark that is subject to any rights of another person or entity other than you, without appropriate authorization. You may not use as a username any name that is offensive, vulgar or obscene.</p><p>We reserve the right to refuse service, terminate accounts, remove or edit content, or cancel orders in our sole discretion.</p>\r\n<p>14. <b>Intellectual Property</b></p>\r\n<p>Service and its original content (excluding Content provided by users), features and functionality are and will remain the exclusive property of Web Solutions Ltd. and its licensors. Service is protected by copyright, trademark, and other laws of  and foreign countries. Our trademarks may not be used in connection with any product or service without the prior written consent of Web Solutions Ltd..</p>\r\n<p>15. <b>Copyright Policy</b></p>\r\n<p>We respect the intellectual property rights of others. It is our policy to respond to any claim that Content posted on Service infringes on the copyright or other intellectual property rights (“Infringement”) of any person or entity.</p>\r\n<p>If you are a copyright owner, or authorized on behalf of one, and you believe that the copyrighted work has been copied in a way that constitutes copyright infringement, please submit your claim via email to support@afmak.com, with the subject line: “Copyright Infringement” and include in your claim a detailed description of the alleged Infringement as detailed below, under “DMCA Notice and Procedure for Copyright Infringement Claims”</p>\r\n<p>You may be held accountable for damages (including costs and attorneys’ fees) for misrepresentation or bad-faith claims on the infringement of any Content found on and/or through Service on your copyright.</p>\r\n<p>16. <b>DMCA Notice and Procedure for Copyright Infringement Claims</b></p>\r\n<p>You may submit a notification pursuant to the Digital Millennium Copyright Act (DMCA) by providing our Copyright Agent with the following information in writing (see 17 U.S.C 512(c)(3) for further detail):</p>\r\n<p>0.1. an electronic or physical signature of the person authorized to act on behalf of the owner of the copyright’s interest;</p>\r\n<p>0.2. a description of the copyrighted work that you claim has been infringed, including the URL (i.e., web page address) of the location where the copyrighted work exists or a copy of the copyrighted work;</p>\r\n<p>0.3. identification of the URL or other specific location on Service where the material that you claim is infringing is located;</p>\r\n<p>0.4. your address, telephone number, and email address;</p>\r\n<p>0.5. a statement by you that you have a good faith belief that the disputed use is not authorized by the copyright owner, its agent, or the law;</p>\r\n<p>0.6. a statement by you, made under penalty of perjury, that the above information in your notice is accurate and that you are the copyright owner or authorized to act on the copyright owner’s behalf.</p>\r\n<p>You can contact our Copyright Agent via email at support@afmak.com.</p>\r\n<p>17. <b>Error Reporting and Feedback</b></p>\r\n<p>You may provide us either directly at support@afmak.com or via third party sites and tools with information and feedback concerning errors, suggestions for improvements, ideas, problems, complaints, and other matters related to our Service (“Feedback”). You acknowledge and agree that: (i) you shall not retain, acquire or assert any intellectual property right or other right, title or interest in or to the Feedback; (ii) Company may have development ideas similar to the Feedback; (iii) Feedback does not contain confidential information or proprietary information from you or any third party; and (iv) Company is not under any obligation of confidentiality with respect to the Feedback. In the event the transfer of the ownership to the Feedback is not possible due to applicable mandatory laws, you grant Company and its affiliates an exclusive, transferable, irrevocable, free-of-charge, sub-licensable, unlimited and perpetual right to use (including copy, modify, create derivative works, publish, distribute and commercialize) Feedback in any manner and for any purpose.</p>\r\n<p>18. <b>Links To Other Web Sites</b></p>\r\n<p>Our Service may contain links to third party web sites or services that are not owned or controlled by Web Solutions Ltd..</p>\r\n<p>Web Solutions Ltd. has no control over, and assumes no responsibility for the content, privacy policies, or practices of any third party web sites or services. We do not warrant the offerings of any of these entities/individuals or their websites.</p>\r\n<p>For example, the outlined Terms of Service have been created using <a href=\"https://policymaker.io/\">PolicyMaker.io</a>, a free web application for generating high-quality legal documents. PolicyMaker’s <a href=\"https://policymaker.io/terms-and-conditions/\">free Terms and Conditions generator</a> is an easy-to-use free tool for creating an excellent standard Terms of Service template for a website, blog, e-commerce store or app.</p>\r\n<p>YOU ACKNOWLEDGE AND AGREE THAT COMPANY SHALL NOT BE RESPONSIBLE OR LIABLE, DIRECTLY OR INDIRECTLY, FOR ANY DAMAGE OR LOSS CAUSED OR ALLEGED TO BE CAUSED BY OR IN CONNECTION WITH USE OF OR RELIANCE ON ANY SUCH CONTENT, GOODS OR SERVICES AVAILABLE ON OR THROUGH ANY SUCH THIRD PARTY WEB SITES OR SERVICES.</p>\r\n<p>WE STRONGLY ADVISE YOU TO READ THE TERMS OF SERVICE AND PRIVACY POLICIES OF ANY THIRD PARTY WEB SITES OR SERVICES THAT YOU VISIT.</p>\r\n<p>19. <b>Disclaimer Of Warranty</b></p>\r\n<p>THESE SERVICES ARE PROVIDED BY COMPANY ON AN “AS IS” AND “AS AVAILABLE” BASIS. COMPANY MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, AS TO THE OPERATION OF THEIR SERVICES, OR THE INFORMATION, CONTENT OR MATERIALS INCLUDED THEREIN. YOU EXPRESSLY AGREE THAT YOUR USE OF THESE SERVICES, THEIR CONTENT, AND ANY SERVICES OR ITEMS OBTAINED FROM US IS AT YOUR SOLE RISK.</p>\r\n<p>NEITHER COMPANY NOR ANY PERSON ASSOCIATED WITH COMPANY MAKES ANY WARRANTY OR REPRESENTATION WITH RESPECT TO THE COMPLETENESS, SECURITY, RELIABILITY, QUALITY, ACCURACY, OR AVAILABILITY OF THE SERVICES. WITHOUT LIMITING THE FOREGOING, NEITHER COMPANY NOR ANYONE ASSOCIATED WITH COMPANY REPRESENTS OR WARRANTS THAT THE SERVICES, THEIR CONTENT, OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL BE ACCURATE, RELIABLE, ERROR-FREE, OR UNINTERRUPTED, THAT DEFECTS WILL BE CORRECTED, THAT THE SERVICES OR THE SERVER THAT MAKES IT AVAILABLE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT THE SERVICES OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL OTHERWISE MEET YOUR NEEDS OR EXPECTATIONS.</p>\r\n<p>COMPANY HEREBY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, STATUTORY, OR OTHERWISE, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, AND FITNESS FOR PARTICULAR PURPOSE.</p>\r\n<p>THE FOREGOING DOES NOT AFFECT ANY WARRANTIES WHICH CANNOT BE EXCLUDED OR LIMITED UNDER APPLICABLE LAW.</p>\r\n<p>20. <b>Limitation Of Liability</b></p>\r\n<p>EXCEPT AS PROHIBITED BY LAW, YOU WILL HOLD US AND OUR OFFICERS, DIRECTORS, EMPLOYEES, AND AGENTS HARMLESS FOR ANY INDIRECT, PUNITIVE, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGE, HOWEVER IT ARISES (INCLUDING ATTORNEYS’ FEES AND ALL RELATED COSTS AND EXPENSES OF LITIGATION AND ARBITRATION, OR AT TRIAL OR ON APPEAL, IF ANY, WHETHER OR NOT LITIGATION OR ARBITRATION IS INSTITUTED), WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE, OR OTHER TORTIOUS ACTION, OR ARISING OUT OF OR IN CONNECTION WITH THIS AGREEMENT, INCLUDING WITHOUT LIMITATION ANY CLAIM FOR PERSONAL INJURY OR PROPERTY DAMAGE, ARISING FROM THIS AGREEMENT AND ANY VIOLATION BY YOU OF ANY FEDERAL, STATE, OR LOCAL LAWS, STATUTES, RULES, OR REGULATIONS, EVEN IF COMPANY HAS BEEN PREVIOUSLY ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. EXCEPT AS PROHIBITED BY LAW, IF THERE IS LIABILITY FOUND ON THE PART OF COMPANY, IT WILL BE LIMITED TO THE AMOUNT PAID FOR THE PRODUCTS AND/OR SERVICES, AND UNDER NO CIRCUMSTANCES WILL THERE BE CONSEQUENTIAL OR PUNITIVE DAMAGES. SOME STATES DO NOT ALLOW THE EXCLUSION OR LIMITATION OF PUNITIVE, INCIDENTAL OR CONSEQUENTIAL DAMAGES, SO THE PRIOR LIMITATION OR EXCLUSION MAY NOT APPLY TO YOU.</p>\r\n<p>21. <b>Termination</b></p>\r\n<p>We may terminate or suspend your account and bar access to Service immediately, without prior notice or liability, under our sole discretion, for any reason whatsoever and without limitation, including but not limited to a breach of Terms.</p>\r\n<p>If you wish to terminate your account, you may simply discontinue using Service.</p>\r\n<p>All provisions of Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.</p>\r\n<p>22. <b>Governing Law</b></p>\r\n<p>These Terms shall be governed and construed in accordance with the laws of Ghana, which governing law applies to agreement without regard to its conflict of law provisions.</p>\r\n<p>Our failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service and supersede and replace any prior agreements we might have had between us regarding Service.</p>\r\n<p>23. <b>Changes To Service</b></p>\r\n<p>We reserve the right to withdraw or amend our Service, and any service or material we provide via Service, in our sole discretion without notice. We will not be liable if for any reason all or any part of Service is unavailable at any time or for any period. From time to time, we may restrict access to some parts of Service, or the entire Service, to users, including registered users.</p>\r\n<p>24. <b>Amendments To Terms</b></p>\r\n<p>We may amend Terms at any time by posting the amended terms on this site. It is your responsibility to review these Terms periodically.</p>\r\n<p>Your continued use of the Platform following the posting of revised Terms means that you accept and agree to the changes. You are expected to check this page frequently so you are aware of any changes, as they are binding on you.</p>\r\n<p>By continuing to access or use our Service after any revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, you are no longer authorized to use Service.</p>\r\n<p>25. <b>Waiver And Severability</b></p>\r\n<p>No waiver by Company of any term or condition set forth in Terms shall be deemed a further or continuing waiver of such term or condition or a waiver of any other term or condition, and any failure of Company to assert a right or provision under Terms shall not constitute a waiver of such right or provision.</p>\r\n<p>If any provision of Terms is held by a court or other tribunal of competent jurisdiction to be invalid, illegal or unenforceable for any reason, such provision shall be eliminated or limited to the minimum extent such that the remaining provisions of Terms will continue in full force and effect.</p>\r\n<p>26. <b>Acknowledgement</b></p>\r\n<p>BY USING SERVICE OR OTHER SERVICES PROVIDED BY US, YOU ACKNOWLEDGE THAT YOU HAVE READ THESE TERMS OF SERVICE AND AGREE TO BE BOUND BY THEM.</p>\r\n<p>27. <b>Contact Us</b></p>\r\n<p>Please send your feedback, comments, requests for technical support by email: <b>support@afmak.com</b>.</p>\r\n<p style=\"margin-top: 5em; font-size: 0.7em;\">These <a href=\"https://policymaker.io/terms-conditions/\">Terms and Conditions</a> were created for <b>afmak.com</b> by <a href=\"https://policymaker.io\">PolicyMaker.io</a> on 2020-05-28.</p></h2></div>','t1,t2,t3,t4',NULL,0,1),(4,'Afmak eCommerce','About Us','&nbsp;&nbsp;<div>&nbsp; &nbsp;<span style=\"text-decoration-line: underline; font-family: &quot;Times New Roman&quot;; font-weight: bold; text-align: center;\">EXECUTIVE SUMMARY</span></div><div style=\"font-family: &quot;Segoe UI&quot;; color: rgb(0, 0, 0);\"><p style=\"text-align:Justify;font-family:Calibri;font-size:14.666666666666666;margin:0 0 14 0;\"><span style=\"font-family:Times New Roman;\">One of the well naturally resourced continent in the world is Africa, from oil to cocoa, human resource to rivers, to forest reserve, just to mention a few ,yet finds it strenuous to market its products and services to its own indigencelet alone other continents. Largely because, some African countries have refused to fully utilize their dexterity, vocation and talents efficiently to the extent of finishing their products well enough to match international standards which greatly affects pricing and quality of their products and services in the world market. Moreover African–made products lack quality final touch, the platform to promote their products and services, ideas to improve upon their products and have poor technical know how in marketing their products and services.</span></p><p style=\"font-family:Times New Roman;font-size:14.666666666666666;margin:0 0 14 0;\"> For is the reason, Web Solutions Limited a software engineering company have designed an approach called Afmak(African Market) which is an e commerce open market to help curb the many challenges African manufacturers are facing. The internet is the easiest and fastest way of advertising, showcasing, selling, buying, informing and educating people about products and services across the world currently. Hence “Afmak” is bringing to one platform, all Africa manufacturers, and service providers as well as cooperate bodies of African origin to be conspicuously showcased, promoted, marketed, sold and purchased through assisting them to brand and manufacture their products and services to meet international standards. Afmak’s diversity of products and services and internet makes it the best platform for every manufacturer and service provider in Africa to subscribe to. Afmak soon looks to be the first point of contact for online shopping for African-made products and services in Ghana, Africa and the world at large.</p><p style=\"font-family:Times New Roman;font-size:14.666666666666666;margin:0 0 14 0;\"><br></p><p style=\"font-family:Times New Roman;font-size:14.666666666666666;margin:0 0 14 0;\"><br></p><p></p><p style=\"font-family:Times New Roman;font-weight:bold;font-size:14.666666666666666;margin:0 0 14 0;\"><span style=\"text-decoration-line: underline;\">STATEMENT OF NEED</span></p><p style=\"font-family:Times New Roman;font-size:14.666666666666666;margin:0 0 14 0;\">With your assistance “Afmak” will address several challenges in the Africa market, some of which are:</p><p style=\"font-family:Times New Roman;font-size:14.666666666666666;margin:0 0 14 0;\">**Inadequate skills</p><p style=\"font-family:Times New Roman;font-size:14.666666666666666;margin:0 0 14 0;\">*Poor packaging and Branding</p><p style=\"font-family:Times New Roman;font-size:14.666666666666666;margin:0 0 14 0;\">*Informing prospective customers about their product</p><p style=\"font-family:Times New Roman;font-size:14.666666666666666;margin:0 0 14 0;\">*Inability to trade online</p><p style=\"font-family:Times New Roman;font-size:14.666666666666666;margin:0 0 14 0;\">*Stress and difficulty in marketing made-In-Africa products and services</p><p style=\"font-family:Times New Roman;font-size:14.666666666666666;margin:0 0 14 0;\">*Lack of exposure</p><p style=\"font-family:Times New Roman;font-size:14.666666666666666;margin:0 0 14 0;\"><br></p><p></p><p style=\"font-family:Times New Roman;font-size:14.666666666666666;margin:0 0 14 0;\">During the early development of the web, there was a list of web services edited by Tim Bernes –Lee and hosted on the CERN webserver. Onhistorical snapshot from 1992 remains as more web servers went online the central list could not keep up. On the NCSA site new serves were announced under the title “What’s new”!</p><p></p><p style=\"font-family:Times New Roman;font-size:14.666666666666666;margin:0 0 14 0;\">The very first tool used for searching on the internet was Archie. The name stands for “archive” without the “v” .It was created in 1990 by Alan Emtage, Bill Heelan and J. Peter Deutsch, computer science students at a McGill University in Montreal .The program downloaded the directory listings of all the files located on public anonymous FTP (File Transfer Protocol) sites, creating a searchable database of file names: however Archie did not index the contents of these sites since the amount of data was so limited it could be readily searched manually. Approximately 100,000 people from the length and breadth of the globe visits the website <a href=\"http://www.afmak.com/\" style=\"color: rgb(109, 109, 109); text-decoration-line: underline;\"><span style=\"color: rgb(0, 0, 255);\">www.afmak.com</span></a><span style=\"color: rgb(0, 0, 255); text-decoration-line: underline;\">      per minute giving us the advantage above others .By our research there are thousands of Africans and non -Africans who wants convenient means to buy and be informed about Africa but unfortunately don’t get ,as such has to travel all the way down at high cost because of the distance and accessibility,. But with this new innovation “Afmak” just at the click of a button one stands to have free access to everything Africa stands for and convincingly makes orders for products and services of their choice. Web Solutions ltd is making it possible for a manufacturer in Sefwi Wiawso to sell his products to somebody as far as U.S, Portugal, China, Zambia, and Tumu among others at ease.</span></p></div><div><br></div>',NULL,NULL,0,0);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagesettings`
--

DROP TABLE IF EXISTS `pagesettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagesettings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contact_success` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_title` text COLLATE utf8mb4_unicode_ci,
  `contact_text` text COLLATE utf8mb4_unicode_ci,
  `side_title` text COLLATE utf8mb4_unicode_ci,
  `side_text` text COLLATE utf8mb4_unicode_ci,
  `street` text COLLATE utf8mb4_unicode_ci,
  `phone` text COLLATE utf8mb4_unicode_ci,
  `fax` text COLLATE utf8mb4_unicode_ci,
  `email` text COLLATE utf8mb4_unicode_ci,
  `site` text COLLATE utf8mb4_unicode_ci,
  `slider` tinyint(1) NOT NULL DEFAULT '1',
  `service` tinyint(1) NOT NULL DEFAULT '1',
  `featured` tinyint(1) NOT NULL DEFAULT '1',
  `small_banner` tinyint(1) NOT NULL DEFAULT '1',
  `best` tinyint(1) NOT NULL DEFAULT '1',
  `top_rated` tinyint(1) NOT NULL DEFAULT '1',
  `large_banner` tinyint(1) NOT NULL DEFAULT '1',
  `big` tinyint(1) NOT NULL DEFAULT '1',
  `hot_sale` tinyint(1) NOT NULL DEFAULT '1',
  `partners` tinyint(1) NOT NULL DEFAULT '0',
  `review_blog` tinyint(1) NOT NULL DEFAULT '1',
  `best_seller_banner` text COLLATE utf8mb4_unicode_ci,
  `best_seller_banner_link` text COLLATE utf8mb4_unicode_ci,
  `big_save_banner` text COLLATE utf8mb4_unicode_ci,
  `big_save_banner_link` text COLLATE utf8mb4_unicode_ci,
  `bottom_small` tinyint(1) NOT NULL DEFAULT '0',
  `flash_deal` tinyint(1) NOT NULL DEFAULT '0',
  `best_seller_banner1` text COLLATE utf8mb4_unicode_ci,
  `best_seller_banner_link1` text COLLATE utf8mb4_unicode_ci,
  `big_save_banner1` text COLLATE utf8mb4_unicode_ci,
  `big_save_banner_link1` text COLLATE utf8mb4_unicode_ci,
  `featured_category` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagesettings`
--

LOCK TABLES `pagesettings` WRITE;
/*!40000 ALTER TABLE `pagesettings` DISABLE KEYS */;
INSERT INTO `pagesettings` VALUES (1,'Success! Thanks for contacting us, we will get back to you shortly.','admin@geniusocean.com','<h4 class=\"subtitle\" style=\"margin-bottom: 6px; font-weight: 600; line-height: 28px; font-size: 28px; text-transform: uppercase;\">WE\'D LOVE TO</h4><h2 class=\"title\" style=\"margin-bottom: 13px;font-weight: 600;line-height: 50px;font-size: 40px;color: #0f78f2;text-transform: uppercase;\">HEAR FROM YOU</h2>','<span style=\"color: rgb(119, 119, 119);\">Send us a message and we\' ll respond as soon as possible</span><br>','<h4 class=\"title\" style=\"margin-bottom: 10px; font-weight: 600; line-height: 28px; font-size: 28px;\">Let\'s Connect</h4>','<span style=\"color: rgb(51, 51, 51);\">Get in touch with us</span>','Accra Ghana','+233 541 524 449',NULL,'support@afmak.com','https://afmak.com',1,1,1,1,1,1,1,1,1,0,0,'1592767146gfg.PNG','https://afmak.com/contact','1592768508Abun.png','https://afmak.com/item/quality-hand-woven-african-kente-from-northern-ghana-xzf1213hco',1,1,'159297600120200624_050754.jpg','https://afmak.com/category/Arts','159276850820200621_193507.jpg','https://afmak.com/item/beads-txs6684noh',1);
/*!40000 ALTER TABLE `pagesettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partners` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners`
--

LOCK TABLES `partners` WRITE;
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_gateways`
--

DROP TABLE IF EXISTS `payment_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_gateways` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_gateways`
--

LOCK TABLES `payment_gateways` WRITE;
/*!40000 ALTER TABLE `payment_gateways` DISABLE KEYS */;
INSERT INTO `payment_gateways` VALUES (46,'Pay via your Mobile Money.','Mobile Money','<font size=\"3\"><b style=\"\">Mobile Money</b><b>&nbsp;No: 6528068515</b><br><br></font>',0),(47,'TheTeller','TheTeller','TheTeller',1);
/*!40000 ALTER TABLE `payment_gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_logs`
--

DROP TABLE IF EXISTS `payment_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_logs`
--

LOCK TABLES `payment_logs` WRITE;
/*!40000 ALTER TABLE `payment_logs` DISABLE KEYS */;
INSERT INTO `payment_logs` VALUES (1,'273121949457','{\"code\":109,\"status\":\"declined\",\"reason\":\"Transaction timed out or declined\",\"transaction_id\":\"273121949457\",\"r_switch\":\"MTN\",\"subscriber_number\":\"233541524449\",\"amount\":\"150.00\",\"currency\":\"Cedis\"}'),(2,'409560941572','{\"code\":109,\"status\":\"declined\",\"reason\":\"Transaction timed out or declined\",\"transaction_id\":\"409560941572\",\"r_switch\":\"MTN\",\"subscriber_number\":\"233541524449\",\"amount\":\"10.00\",\"currency\":\"Cedis\"}'),(3,'409560941572','{\"code\":104,\"status\":\"declined\",\"reason\":\"Transaction declined or terminated!\",\"transaction_id\":\"409560941572\",\"r_switch\":\"MTN\",\"subscriber_number\":\"233541524449\",\"amount\":\"10.00\",\"currency\":\"Cedis\"}'),(4,'861264800628','{\"code\":\"000\",\"status\":\"approved\",\"reason\":\"Approved: Transaction successful!\",\"transaction_id\":\"861264800628\",\"r_switch\":\"ATL\",\"subscriber_number\":\"233266122157\",\"amount\":\"10.00\",\"currency\":\"Cedis\"}');
/*!40000 ALTER TABLE `payment_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pickups`
--

DROP TABLE IF EXISTS `pickups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pickups` (
  `id` int(191) unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pickups`
--

LOCK TABLES `pickups` WRITE;
/*!40000 ALTER TABLE `pickups` DISABLE KEYS */;
INSERT INTO `pickups` VALUES (1,'Nearest Filling Station'),(2,'Post Office');
/*!40000 ALTER TABLE `pickups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_clicks`
--

DROP TABLE IF EXISTS `product_clicks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_clicks` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `product_id` int(191) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2264 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_clicks`
--

LOCK TABLES `product_clicks` WRITE;
/*!40000 ALTER TABLE `product_clicks` DISABLE KEYS */;
INSERT INTO `product_clicks` VALUES (1,171,'2020-01-23'),(2,171,'2020-01-23'),(12,175,'2020-03-23'),(14,101,'2020-03-23'),(15,180,'2020-03-23'),(16,1,'2020-06-01'),(17,1,'2020-06-01'),(18,1,'2020-06-01'),(19,3,'2020-06-01'),(20,3,'2020-06-01'),(21,3,'2020-06-01'),(22,3,'2020-06-01'),(23,3,'2020-06-01'),(24,1,'2020-06-02'),(25,2,'2020-06-02'),(26,3,'2020-06-02'),(27,3,'2020-06-02'),(28,2,'2020-06-02'),(29,1,'2020-06-02'),(30,2,'2020-06-02'),(31,3,'2020-06-02'),(32,3,'2020-06-02'),(33,3,'2020-06-02'),(34,3,'2020-06-02'),(35,3,'2020-06-02'),(36,3,'2020-06-02'),(37,3,'2020-06-02'),(38,3,'2020-06-02'),(39,3,'2020-06-02'),(40,3,'2020-06-02'),(41,3,'2020-06-02'),(42,3,'2020-06-02'),(43,3,'2020-06-02'),(44,3,'2020-06-02'),(45,3,'2020-06-02'),(46,3,'2020-06-02'),(47,3,'2020-06-02'),(48,3,'2020-06-02'),(49,3,'2020-06-02'),(50,3,'2020-06-03'),(51,3,'2020-06-03'),(52,3,'2020-06-03'),(53,3,'2020-06-03'),(54,3,'2020-06-03'),(55,3,'2020-06-03'),(56,3,'2020-06-03'),(57,3,'2020-06-03'),(58,3,'2020-06-03'),(59,1,'2020-06-03'),(60,2,'2020-06-03'),(61,3,'2020-06-03'),(62,3,'2020-06-03'),(63,3,'2020-06-03'),(64,2,'2020-06-03'),(65,1,'2020-06-03'),(66,3,'2020-06-03'),(67,4,'2020-06-03'),(68,3,'2020-06-03'),(69,2,'2020-06-03'),(70,1,'2020-06-03'),(71,1,'2020-06-04'),(72,1,'2020-06-04'),(73,1,'2020-06-04'),(74,4,'2020-06-04'),(75,4,'2020-06-04'),(76,3,'2020-06-04'),(77,3,'2020-06-04'),(78,4,'2020-06-04'),(79,5,'2020-06-04'),(80,4,'2020-06-04'),(81,3,'2020-06-04'),(82,2,'2020-06-04'),(83,1,'2020-06-04'),(84,4,'2020-06-04'),(85,5,'2020-06-04'),(86,3,'2020-06-05'),(87,3,'2020-06-05'),(88,3,'2020-06-05'),(89,5,'2020-06-05'),(90,4,'2020-06-05'),(91,5,'2020-06-05'),(92,3,'2020-06-05'),(93,1,'2020-06-05'),(94,5,'2020-06-05'),(95,5,'2020-06-05'),(96,3,'2020-06-05'),(97,2,'2020-06-05'),(98,3,'2020-06-05'),(99,2,'2020-06-05'),(100,3,'2020-06-05'),(101,3,'2020-06-05'),(102,3,'2020-06-05'),(103,3,'2020-06-06'),(104,4,'2020-06-06'),(105,3,'2020-06-06'),(106,3,'2020-06-06'),(107,5,'2020-06-06'),(108,3,'2020-06-06'),(109,3,'2020-06-07'),(110,3,'2020-06-07'),(111,3,'2020-06-07'),(112,1,'2020-06-07'),(113,3,'2020-06-07'),(114,4,'2020-06-07'),(115,5,'2020-06-07'),(116,2,'2020-06-07'),(117,4,'2020-06-08'),(118,5,'2020-06-08'),(119,1,'2020-06-08'),(120,1,'2020-06-08'),(121,3,'2020-06-08'),(122,4,'2020-06-08'),(123,2,'2020-06-09'),(124,1,'2020-06-09'),(125,3,'2020-06-09'),(126,2,'2020-06-09'),(127,3,'2020-06-09'),(128,2,'2020-06-09'),(129,2,'2020-06-09'),(130,2,'2020-06-09'),(131,2,'2020-06-09'),(132,1,'2020-06-10'),(133,1,'2020-06-10'),(134,3,'2020-06-10'),(135,3,'2020-06-10'),(136,3,'2020-06-10'),(137,4,'2020-06-10'),(138,4,'2020-06-10'),(139,1,'2020-06-10'),(140,4,'2020-06-10'),(141,3,'2020-06-11'),(142,2,'2020-06-11'),(143,5,'2020-06-11'),(144,5,'2020-06-11'),(145,6,'2020-06-11'),(146,7,'2020-06-11'),(147,7,'2020-06-11'),(148,3,'2020-06-11'),(149,3,'2020-06-11'),(150,3,'2020-06-11'),(151,6,'2020-06-11'),(152,8,'2020-06-11'),(153,9,'2020-06-11'),(154,4,'2020-06-11'),(155,5,'2020-06-11'),(156,7,'2020-06-11'),(157,2,'2020-06-11'),(158,1,'2020-06-11'),(160,3,'2020-06-12'),(161,4,'2020-06-12'),(162,6,'2020-06-12'),(163,7,'2020-06-12'),(164,8,'2020-06-12'),(165,6,'2020-06-12'),(166,9,'2020-06-12'),(167,8,'2020-06-12'),(168,9,'2020-06-12'),(169,6,'2020-06-12'),(170,5,'2020-06-12'),(171,4,'2020-06-12'),(172,3,'2020-06-12'),(173,2,'2020-06-12'),(174,1,'2020-06-12'),(175,9,'2020-06-12'),(176,8,'2020-06-12'),(177,7,'2020-06-12'),(178,3,'2020-06-12'),(179,3,'2020-06-12'),(180,4,'2020-06-12'),(181,6,'2020-06-12'),(182,7,'2020-06-13'),(183,4,'2020-06-13'),(184,8,'2020-06-13'),(185,5,'2020-06-13'),(186,3,'2020-06-13'),(187,3,'2020-06-13'),(188,2,'2020-06-13'),(189,7,'2020-06-13'),(190,3,'2020-06-14'),(191,6,'2020-06-14'),(192,3,'2020-06-14'),(193,3,'2020-06-14'),(194,9,'2020-06-15'),(195,6,'2020-06-15'),(196,5,'2020-06-15'),(197,4,'2020-06-15'),(198,3,'2020-06-15'),(199,2,'2020-06-15'),(200,1,'2020-06-15'),(201,9,'2020-06-15'),(202,8,'2020-06-15'),(203,7,'2020-06-15'),(204,5,'2020-06-15'),(205,9,'2020-06-16'),(206,6,'2020-06-16'),(207,5,'2020-06-16'),(208,4,'2020-06-16'),(209,3,'2020-06-16'),(210,2,'2020-06-16'),(211,1,'2020-06-16'),(212,9,'2020-06-16'),(213,8,'2020-06-16'),(214,7,'2020-06-16'),(215,4,'2020-06-16'),(216,6,'2020-06-17'),(217,5,'2020-06-17'),(218,4,'2020-06-17'),(219,3,'2020-06-17'),(220,2,'2020-06-17'),(221,1,'2020-06-17'),(222,9,'2020-06-17'),(223,8,'2020-06-17'),(224,7,'2020-06-17'),(225,6,'2020-06-17'),(226,6,'2020-06-17'),(227,5,'2020-06-17'),(228,6,'2020-06-17'),(229,4,'2020-06-17'),(230,5,'2020-06-17'),(231,3,'2020-06-17'),(232,4,'2020-06-17'),(233,2,'2020-06-17'),(234,3,'2020-06-17'),(235,1,'2020-06-17'),(236,2,'2020-06-17'),(237,1,'2020-06-17'),(238,9,'2020-06-17'),(239,8,'2020-06-17'),(240,9,'2020-06-17'),(241,7,'2020-06-17'),(242,8,'2020-06-17'),(243,7,'2020-06-17'),(244,9,'2020-06-17'),(245,7,'2020-06-17'),(246,4,'2020-06-18'),(247,3,'2020-06-18'),(248,2,'2020-06-18'),(249,1,'2020-06-18'),(250,6,'2020-06-18'),(251,5,'2020-06-18'),(252,4,'2020-06-18'),(253,3,'2020-06-18'),(254,2,'2020-06-18'),(255,1,'2020-06-18'),(256,6,'2020-06-18'),(257,5,'2020-06-18'),(258,4,'2020-06-18'),(259,3,'2020-06-18'),(260,2,'2020-06-18'),(261,1,'2020-06-18'),(262,5,'2020-06-18'),(263,6,'2020-06-18'),(264,4,'2020-06-18'),(265,3,'2020-06-18'),(266,2,'2020-06-18'),(267,1,'2020-06-18'),(268,5,'2020-06-18'),(269,6,'2020-06-18'),(270,4,'2020-06-18'),(271,3,'2020-06-18'),(272,2,'2020-06-18'),(273,1,'2020-06-18'),(274,5,'2020-06-18'),(275,6,'2020-06-18'),(276,4,'2020-06-18'),(277,3,'2020-06-18'),(278,2,'2020-06-18'),(279,1,'2020-06-18'),(280,5,'2020-06-18'),(281,6,'2020-06-18'),(282,4,'2020-06-18'),(283,3,'2020-06-18'),(284,2,'2020-06-18'),(285,1,'2020-06-18'),(286,5,'2020-06-18'),(287,2,'2020-06-18'),(288,3,'2020-06-18'),(289,4,'2020-06-18'),(290,1,'2020-06-18'),(291,5,'2020-06-18'),(292,2,'2020-06-18'),(293,3,'2020-06-18'),(294,4,'2020-06-18'),(295,4,'2020-06-18'),(296,5,'2020-06-18'),(297,3,'2020-06-18'),(298,4,'2020-06-18'),(299,3,'2020-06-18'),(300,2,'2020-06-18'),(301,1,'2020-06-18'),(302,5,'2020-06-18'),(303,4,'2020-06-18'),(304,1,'2020-06-18'),(305,2,'2020-06-18'),(306,3,'2020-06-18'),(307,5,'2020-06-18'),(308,4,'2020-06-18'),(309,3,'2020-06-18'),(310,1,'2020-06-18'),(311,2,'2020-06-18'),(312,5,'2020-06-18'),(313,4,'2020-06-18'),(314,3,'2020-06-18'),(315,2,'2020-06-18'),(316,1,'2020-06-18'),(317,5,'2020-06-18'),(318,4,'2020-06-18'),(319,2,'2020-06-18'),(320,3,'2020-06-18'),(321,1,'2020-06-18'),(322,5,'2020-06-18'),(323,4,'2020-06-18'),(324,3,'2020-06-18'),(325,2,'2020-06-18'),(326,1,'2020-06-18'),(327,5,'2020-06-18'),(328,3,'2020-06-18'),(329,2,'2020-06-18'),(330,4,'2020-06-18'),(331,1,'2020-06-18'),(332,5,'2020-06-18'),(333,4,'2020-06-18'),(334,3,'2020-06-18'),(335,2,'2020-06-18'),(336,1,'2020-06-18'),(337,5,'2020-06-18'),(338,4,'2020-06-18'),(339,3,'2020-06-18'),(340,2,'2020-06-18'),(341,1,'2020-06-18'),(342,5,'2020-06-18'),(343,4,'2020-06-18'),(344,2,'2020-06-18'),(345,3,'2020-06-18'),(346,1,'2020-06-18'),(347,5,'2020-06-18'),(348,2,'2020-06-18'),(349,3,'2020-06-18'),(350,4,'2020-06-18'),(351,1,'2020-06-18'),(352,6,'2020-06-18'),(353,9,'2020-06-18'),(354,6,'2020-06-18'),(355,8,'2020-06-18'),(356,7,'2020-06-18'),(357,1,'2020-06-18'),(358,5,'2020-06-18'),(359,6,'2020-06-18'),(360,4,'2020-06-18'),(361,2,'2020-06-18'),(362,3,'2020-06-18'),(363,3,'2020-06-18'),(364,6,'2020-06-18'),(365,5,'2020-06-18'),(366,4,'2020-06-18'),(367,3,'2020-06-18'),(368,2,'2020-06-18'),(369,1,'2020-06-18'),(370,9,'2020-06-18'),(371,8,'2020-06-18'),(372,7,'2020-06-18'),(373,3,'2020-06-18'),(374,4,'2020-06-18'),(375,4,'2020-06-18'),(376,5,'2020-06-18'),(377,2,'2020-06-18'),(378,9,'2020-06-18'),(379,11,'2020-06-18'),(380,9,'2020-06-18'),(381,4,'2020-06-18'),(382,7,'2020-06-18'),(383,9,'2020-06-18'),(384,8,'2020-06-18'),(385,11,'2020-06-18'),(386,6,'2020-06-18'),(387,5,'2020-06-18'),(388,8,'2020-06-18'),(389,11,'2020-06-18'),(390,1,'2020-06-18'),(391,6,'2020-06-18'),(392,3,'2020-06-18'),(393,7,'2020-06-18'),(394,8,'2020-06-19'),(395,7,'2020-06-19'),(396,11,'2020-06-19'),(397,11,'2020-06-19'),(398,11,'2020-06-19'),(399,11,'2020-06-19'),(400,6,'2020-06-19'),(401,5,'2020-06-19'),(402,4,'2020-06-19'),(403,3,'2020-06-19'),(404,2,'2020-06-19'),(405,1,'2020-06-19'),(406,9,'2020-06-19'),(407,8,'2020-06-19'),(408,7,'2020-06-19'),(409,3,'2020-06-19'),(410,3,'2020-06-19'),(411,11,'2020-06-20'),(412,6,'2020-06-20'),(413,5,'2020-06-20'),(414,4,'2020-06-20'),(415,3,'2020-06-20'),(416,2,'2020-06-20'),(417,1,'2020-06-20'),(418,9,'2020-06-20'),(419,8,'2020-06-20'),(420,7,'2020-06-20'),(421,13,'2020-06-20'),(422,6,'2020-06-20'),(423,13,'2020-06-20'),(424,14,'2020-06-20'),(425,4,'2020-06-20'),(426,13,'2020-06-20'),(427,14,'2020-06-20'),(429,2,'2020-06-20'),(430,15,'2020-06-20'),(431,15,'2020-06-20'),(432,15,'2020-06-20'),(433,7,'2020-06-20'),(434,9,'2020-06-20'),(435,3,'2020-06-21'),(436,7,'2020-06-21'),(437,4,'2020-06-21'),(439,15,'2020-06-21'),(440,14,'2020-06-21'),(441,13,'2020-06-21'),(442,11,'2020-06-21'),(443,6,'2020-06-21'),(444,5,'2020-06-21'),(445,4,'2020-06-21'),(446,3,'2020-06-21'),(448,1,'2020-06-21'),(449,9,'2020-06-21'),(450,8,'2020-06-21'),(451,7,'2020-06-21'),(452,2,'2020-06-21'),(453,8,'2020-06-21'),(454,6,'2020-06-21'),(455,5,'2020-06-21'),(456,13,'2020-06-21'),(457,14,'2020-06-21'),(458,13,'2020-06-21'),(459,15,'2020-06-21'),(461,9,'2020-06-21'),(462,14,'2020-06-21'),(463,1,'2020-06-21'),(464,8,'2020-06-21'),(465,3,'2020-06-21'),(466,13,'2020-06-22'),(467,15,'2020-06-22'),(468,15,'2020-06-22'),(469,14,'2020-06-22'),(470,13,'2020-06-22'),(471,11,'2020-06-22'),(472,6,'2020-06-22'),(473,5,'2020-06-22'),(474,4,'2020-06-22'),(475,3,'2020-06-22'),(477,1,'2020-06-22'),(478,9,'2020-06-22'),(479,8,'2020-06-22'),(480,7,'2020-06-22'),(481,2,'2020-06-22'),(482,11,'2020-06-22'),(483,13,'2020-06-22'),(484,14,'2020-06-22'),(485,15,'2020-06-22'),(486,15,'2020-06-22'),(487,7,'2020-06-22'),(488,16,'2020-06-22'),(489,18,'2020-06-22'),(490,1,'2020-06-22'),(491,8,'2020-06-22'),(492,20,'2020-06-23'),(493,19,'2020-06-23'),(494,18,'2020-06-23'),(495,17,'2020-06-23'),(496,16,'2020-06-23'),(497,15,'2020-06-23'),(498,14,'2020-06-23'),(499,13,'2020-06-23'),(500,11,'2020-06-23'),(501,5,'2020-06-23'),(502,6,'2020-06-23'),(503,4,'2020-06-23'),(504,3,'2020-06-23'),(506,1,'2020-06-23'),(507,9,'2020-06-23'),(508,8,'2020-06-23'),(509,7,'2020-06-23'),(510,2,'2020-06-23'),(511,18,'2020-06-23'),(512,16,'2020-06-23'),(513,18,'2020-06-23'),(514,19,'2020-06-23'),(515,19,'2020-06-23'),(516,20,'2020-06-23'),(517,17,'2020-06-23'),(518,20,'2020-06-23'),(519,16,'2020-06-23'),(520,17,'2020-06-23'),(521,15,'2020-06-23'),(522,15,'2020-06-23'),(523,21,'2020-06-23'),(524,21,'2020-06-23'),(525,9,'2020-06-23'),(526,7,'2020-06-23'),(527,7,'2020-06-23'),(528,7,'2020-06-23'),(529,7,'2020-06-23'),(530,7,'2020-06-23'),(531,8,'2020-06-23'),(532,7,'2020-06-23'),(533,7,'2020-06-23'),(534,7,'2020-06-23'),(535,7,'2020-06-23'),(536,7,'2020-06-23'),(537,7,'2020-06-23'),(538,7,'2020-06-23'),(539,7,'2020-06-23'),(540,7,'2020-06-23'),(541,7,'2020-06-23'),(542,6,'2020-06-23'),(543,6,'2020-06-23'),(544,6,'2020-06-23'),(545,6,'2020-06-23'),(546,7,'2020-06-24'),(547,2,'2020-06-24'),(548,7,'2020-06-24'),(549,20,'2020-06-24'),(550,7,'2020-06-24'),(551,3,'2020-06-24'),(552,7,'2020-06-24'),(553,7,'2020-06-24'),(554,21,'2020-06-24'),(555,20,'2020-06-24'),(556,19,'2020-06-24'),(557,18,'2020-06-24'),(558,17,'2020-06-24'),(559,16,'2020-06-24'),(560,15,'2020-06-24'),(561,14,'2020-06-24'),(562,11,'2020-06-24'),(563,5,'2020-06-24'),(564,13,'2020-06-24'),(565,6,'2020-06-24'),(566,4,'2020-06-24'),(567,3,'2020-06-24'),(569,1,'2020-06-24'),(570,9,'2020-06-24'),(571,8,'2020-06-24'),(572,7,'2020-06-24'),(573,2,'2020-06-24'),(574,7,'2020-06-24'),(575,21,'2020-06-24'),(576,7,'2020-06-24'),(577,7,'2020-06-24'),(578,7,'2020-06-24'),(579,7,'2020-06-24'),(580,18,'2020-06-24'),(581,3,'2020-06-24'),(582,20,'2020-06-24'),(583,4,'2020-06-24'),(584,22,'2020-06-24'),(585,22,'2020-06-24'),(586,21,'2020-06-24'),(587,15,'2020-06-24'),(588,18,'2020-06-24'),(589,16,'2020-06-24'),(590,20,'2020-06-24'),(591,19,'2020-06-24'),(592,17,'2020-06-24'),(593,14,'2020-06-24'),(594,16,'2020-06-24'),(595,24,'2020-06-24'),(596,24,'2020-06-24'),(597,24,'2020-06-24'),(598,21,'2020-06-24'),(599,15,'2020-06-24'),(600,18,'2020-06-24'),(601,16,'2020-06-24'),(602,20,'2020-06-24'),(603,19,'2020-06-24'),(604,17,'2020-06-24'),(605,14,'2020-06-24'),(606,23,'2020-06-24'),(607,23,'2020-06-24'),(609,24,'2020-06-24'),(611,24,'2020-06-24'),(612,24,'2020-06-24'),(613,24,'2020-06-24'),(614,24,'2020-06-24'),(615,24,'2020-06-24'),(616,24,'2020-06-24'),(617,24,'2020-06-24'),(618,24,'2020-06-24'),(619,23,'2020-06-24'),(620,23,'2020-06-24'),(621,23,'2020-06-24'),(622,23,'2020-06-24'),(623,23,'2020-06-24'),(624,23,'2020-06-24'),(625,23,'2020-06-24'),(626,23,'2020-06-24'),(635,23,'2020-06-24'),(636,23,'2020-06-24'),(637,24,'2020-06-24'),(638,24,'2020-06-24'),(639,24,'2020-06-24'),(640,24,'2020-06-24'),(641,24,'2020-06-24'),(642,24,'2020-06-24'),(643,24,'2020-06-24'),(644,24,'2020-06-24'),(645,24,'2020-06-24'),(646,24,'2020-06-24'),(647,24,'2020-06-24'),(648,24,'2020-06-24'),(649,24,'2020-06-24'),(650,24,'2020-06-24'),(651,16,'2020-06-24'),(653,23,'2020-06-24'),(654,23,'2020-06-24'),(655,7,'2020-06-24'),(657,23,'2020-06-24'),(658,23,'2020-06-24'),(659,23,'2020-06-24'),(660,7,'2020-06-24'),(661,23,'2020-06-24'),(662,15,'2020-06-24'),(663,23,'2020-06-24'),(664,23,'2020-06-24'),(665,23,'2020-06-24'),(666,24,'2020-06-24'),(667,14,'2020-06-24'),(668,24,'2020-06-25'),(669,24,'2020-06-25'),(670,23,'2020-06-25'),(673,17,'2020-06-25'),(674,17,'2020-06-25'),(675,17,'2020-06-25'),(676,17,'2020-06-25'),(677,2,'2020-06-25'),(678,23,'2020-06-25'),(679,23,'2020-06-25'),(680,1,'2020-06-25'),(681,7,'2020-06-25'),(682,24,'2020-06-25'),(683,23,'2020-06-25'),(684,22,'2020-06-25'),(685,21,'2020-06-25'),(686,20,'2020-06-25'),(687,19,'2020-06-25'),(688,18,'2020-06-25'),(689,17,'2020-06-25'),(690,15,'2020-06-25'),(691,11,'2020-06-25'),(692,5,'2020-06-25'),(693,14,'2020-06-25'),(694,13,'2020-06-25'),(695,6,'2020-06-25'),(696,4,'2020-06-25'),(697,3,'2020-06-25'),(698,16,'2020-06-25'),(700,1,'2020-06-25'),(701,9,'2020-06-25'),(702,8,'2020-06-25'),(703,7,'2020-06-25'),(704,2,'2020-06-25'),(705,24,'2020-06-25'),(706,8,'2020-06-25'),(707,4,'2020-06-25'),(708,21,'2020-06-25'),(709,22,'2020-06-25'),(710,22,'2020-06-25'),(711,2,'2020-06-25'),(712,23,'2020-06-25'),(713,5,'2020-06-25'),(714,3,'2020-06-25'),(715,24,'2020-06-25'),(716,24,'2020-06-25'),(717,24,'2020-06-25'),(718,24,'2020-06-25'),(719,23,'2020-06-25'),(720,13,'2020-06-25'),(721,11,'2020-06-25'),(722,23,'2020-06-25'),(723,23,'2020-06-25'),(724,23,'2020-06-25'),(725,23,'2020-06-25'),(726,9,'2020-06-25'),(727,24,'2020-06-25'),(729,9,'2020-06-25'),(730,5,'2020-06-25'),(731,13,'2020-06-25'),(732,24,'2020-06-25'),(734,24,'2020-06-25'),(735,23,'2020-06-25'),(736,15,'2020-06-26'),(737,11,'2020-06-26'),(739,7,'2020-06-26'),(740,8,'2020-06-26'),(741,8,'2020-06-26'),(742,18,'2020-06-26'),(743,18,'2020-06-26'),(744,15,'2020-06-26'),(745,8,'2020-06-26'),(746,8,'2020-06-26'),(747,8,'2020-06-26'),(748,8,'2020-06-26'),(749,8,'2020-06-26'),(750,8,'2020-06-26'),(751,8,'2020-06-26'),(752,8,'2020-06-26'),(753,8,'2020-06-26'),(754,8,'2020-06-26'),(755,8,'2020-06-26'),(756,8,'2020-06-26'),(757,8,'2020-06-26'),(758,8,'2020-06-26'),(759,8,'2020-06-26'),(760,18,'2020-06-26'),(761,8,'2020-06-26'),(762,8,'2020-06-26'),(763,8,'2020-06-26'),(764,8,'2020-06-26'),(765,7,'2020-06-26'),(766,8,'2020-06-26'),(767,8,'2020-06-26'),(768,18,'2020-06-26'),(769,8,'2020-06-26'),(770,8,'2020-06-26'),(771,8,'2020-06-26'),(772,8,'2020-06-26'),(773,24,'2020-06-26'),(774,8,'2020-06-26'),(775,18,'2020-06-26'),(776,8,'2020-06-26'),(777,15,'2020-06-26'),(778,24,'2020-06-26'),(779,23,'2020-06-26'),(780,22,'2020-06-26'),(781,21,'2020-06-26'),(782,20,'2020-06-26'),(783,19,'2020-06-26'),(784,18,'2020-06-26'),(785,17,'2020-06-26'),(786,15,'2020-06-26'),(787,11,'2020-06-26'),(788,5,'2020-06-26'),(789,14,'2020-06-26'),(790,13,'2020-06-26'),(791,6,'2020-06-26'),(792,4,'2020-06-26'),(793,3,'2020-06-26'),(794,16,'2020-06-26'),(796,1,'2020-06-26'),(797,9,'2020-06-26'),(798,8,'2020-06-26'),(799,7,'2020-06-26'),(800,2,'2020-06-26'),(801,8,'2020-06-26'),(802,8,'2020-06-26'),(803,8,'2020-06-26'),(804,8,'2020-06-26'),(805,8,'2020-06-26'),(806,8,'2020-06-26'),(807,8,'2020-06-26'),(808,8,'2020-06-26'),(809,8,'2020-06-26'),(810,8,'2020-06-26'),(811,8,'2020-06-26'),(812,8,'2020-06-26'),(813,23,'2020-06-26'),(814,23,'2020-06-26'),(815,8,'2020-06-26'),(816,19,'2020-06-26'),(817,8,'2020-06-26'),(818,17,'2020-06-26'),(819,23,'2020-06-26'),(820,8,'2020-06-26'),(821,8,'2020-06-26'),(822,8,'2020-06-26'),(823,8,'2020-06-26'),(824,7,'2020-06-26'),(825,16,'2020-06-26'),(826,20,'2020-06-27'),(827,24,'2020-06-27'),(828,15,'2020-06-27'),(829,11,'2020-06-27'),(830,24,'2020-06-27'),(831,23,'2020-06-27'),(832,22,'2020-06-27'),(833,21,'2020-06-27'),(834,20,'2020-06-27'),(835,19,'2020-06-27'),(836,18,'2020-06-27'),(837,17,'2020-06-27'),(838,15,'2020-06-27'),(839,11,'2020-06-27'),(840,5,'2020-06-27'),(841,14,'2020-06-27'),(842,13,'2020-06-27'),(843,6,'2020-06-27'),(844,4,'2020-06-27'),(845,3,'2020-06-27'),(846,16,'2020-06-27'),(848,1,'2020-06-27'),(849,9,'2020-06-27'),(850,8,'2020-06-27'),(851,7,'2020-06-27'),(852,2,'2020-06-27'),(853,11,'2020-06-27'),(854,18,'2020-06-27'),(855,3,'2020-06-27'),(856,23,'2020-06-27'),(857,6,'2020-06-27'),(858,7,'2020-06-27'),(859,18,'2020-06-27'),(860,24,'2020-06-27'),(861,8,'2020-06-27'),(862,16,'2020-06-27'),(863,13,'2020-06-27'),(865,19,'2020-06-27'),(866,5,'2020-06-27'),(867,11,'2020-06-27'),(868,1,'2020-06-27'),(869,17,'2020-06-27'),(870,21,'2020-06-27'),(871,4,'2020-06-27'),(872,23,'2020-06-27'),(873,14,'2020-06-27'),(874,3,'2020-06-27'),(875,9,'2020-06-27'),(876,6,'2020-06-27'),(877,3,'2020-06-27'),(878,8,'2020-06-27'),(879,24,'2020-06-27'),(880,24,'2020-06-27'),(881,22,'2020-06-27'),(882,8,'2020-06-27'),(883,23,'2020-06-27'),(884,14,'2020-06-27'),(885,1,'2020-06-27'),(887,9,'2020-06-27'),(889,6,'2020-06-27'),(890,24,'2020-06-27'),(891,5,'2020-06-27'),(892,23,'2020-06-28'),(893,20,'2020-06-28'),(894,8,'2020-06-28'),(895,7,'2020-06-28'),(896,14,'2020-06-28'),(897,22,'2020-06-28'),(898,4,'2020-06-28'),(899,20,'2020-06-28'),(900,14,'2020-06-28'),(901,21,'2020-06-28'),(902,21,'2020-06-28'),(903,24,'2020-06-28'),(904,23,'2020-06-28'),(905,22,'2020-06-28'),(906,21,'2020-06-28'),(907,20,'2020-06-28'),(908,19,'2020-06-28'),(909,18,'2020-06-28'),(910,17,'2020-06-28'),(911,15,'2020-06-28'),(912,11,'2020-06-28'),(913,5,'2020-06-28'),(914,14,'2020-06-28'),(915,13,'2020-06-28'),(916,6,'2020-06-28'),(917,4,'2020-06-28'),(918,3,'2020-06-28'),(919,16,'2020-06-28'),(921,1,'2020-06-28'),(922,9,'2020-06-28'),(923,8,'2020-06-28'),(924,7,'2020-06-28'),(925,2,'2020-06-28'),(926,19,'2020-06-28'),(927,9,'2020-06-28'),(928,28,'2020-06-28'),(929,28,'2020-06-28'),(930,28,'2020-06-28'),(931,28,'2020-06-28'),(932,24,'2020-06-28'),(933,2,'2020-06-28'),(934,2,'2020-06-28'),(935,18,'2020-06-28'),(936,17,'2020-06-28'),(937,21,'2020-06-28'),(938,16,'2020-06-28'),(939,20,'2020-06-28'),(940,22,'2020-06-28'),(941,25,'2020-06-29'),(942,24,'2020-06-29'),(943,23,'2020-06-29'),(944,28,'2020-06-29'),(945,8,'2020-06-29'),(946,17,'2020-06-29'),(947,6,'2020-06-29'),(948,23,'2020-06-29'),(949,24,'2020-06-29'),(950,23,'2020-06-29'),(951,22,'2020-06-29'),(952,21,'2020-06-29'),(953,20,'2020-06-29'),(954,19,'2020-06-29'),(955,18,'2020-06-29'),(956,17,'2020-06-29'),(957,15,'2020-06-29'),(958,11,'2020-06-29'),(959,5,'2020-06-29'),(960,14,'2020-06-29'),(961,13,'2020-06-29'),(962,6,'2020-06-29'),(963,4,'2020-06-29'),(964,3,'2020-06-29'),(965,28,'2020-06-29'),(966,27,'2020-06-29'),(967,26,'2020-06-29'),(968,25,'2020-06-29'),(969,16,'2020-06-29'),(971,1,'2020-06-29'),(972,9,'2020-06-29'),(973,8,'2020-06-29'),(974,7,'2020-06-29'),(975,2,'2020-06-29'),(977,23,'2020-06-29'),(978,7,'2020-06-29'),(979,27,'2020-06-29'),(980,27,'2020-06-29'),(981,23,'2020-06-29'),(982,25,'2020-06-29'),(983,25,'2020-06-29'),(984,26,'2020-06-29'),(985,28,'2020-06-29'),(986,28,'2020-06-29'),(987,26,'2020-06-29'),(988,30,'2020-06-29'),(989,30,'2020-06-29'),(990,30,'2020-06-29'),(991,30,'2020-06-29'),(992,30,'2020-06-29'),(993,20,'2020-06-29'),(994,18,'2020-06-29'),(995,21,'2020-06-29'),(996,17,'2020-06-29'),(997,18,'2020-06-29'),(998,6,'2020-06-29'),(999,29,'2020-06-29'),(1000,29,'2020-06-29'),(1001,29,'2020-06-29'),(1002,29,'2020-06-29'),(1003,29,'2020-06-29'),(1004,29,'2020-06-29'),(1005,29,'2020-06-29'),(1006,29,'2020-06-29'),(1007,29,'2020-06-29'),(1008,29,'2020-06-29'),(1009,29,'2020-06-29'),(1010,17,'2020-06-29'),(1011,19,'2020-06-29'),(1012,13,'2020-06-29'),(1013,14,'2020-06-29'),(1014,7,'2020-06-29'),(1015,23,'2020-06-29'),(1016,24,'2020-06-29'),(1017,8,'2020-06-29'),(1018,5,'2020-06-29'),(1019,5,'2020-06-29'),(1020,8,'2020-06-29'),(1021,22,'2020-06-29'),(1022,4,'2020-06-29'),(1024,23,'2020-06-29'),(1025,27,'2020-06-29'),(1026,26,'2020-06-29'),(1027,9,'2020-06-29'),(1028,16,'2020-06-29'),(1029,27,'2020-06-29'),(1030,28,'2020-06-29'),(1031,25,'2020-06-29'),(1032,25,'2020-06-29'),(1033,26,'2020-06-29'),(1034,26,'2020-06-29'),(1035,26,'2020-06-29'),(1036,18,'2020-06-30'),(1037,18,'2020-06-30'),(1038,15,'2020-06-30'),(1039,19,'2020-06-30'),(1040,14,'2020-06-30'),(1041,29,'2020-06-30'),(1042,30,'2020-06-30'),(1043,24,'2020-06-30'),(1044,23,'2020-06-30'),(1045,22,'2020-06-30'),(1046,21,'2020-06-30'),(1047,20,'2020-06-30'),(1048,19,'2020-06-30'),(1049,18,'2020-06-30'),(1050,17,'2020-06-30'),(1051,15,'2020-06-30'),(1052,11,'2020-06-30'),(1053,5,'2020-06-30'),(1054,14,'2020-06-30'),(1055,13,'2020-06-30'),(1056,6,'2020-06-30'),(1057,4,'2020-06-30'),(1058,29,'2020-06-30'),(1059,3,'2020-06-30'),(1060,28,'2020-06-30'),(1061,27,'2020-06-30'),(1062,26,'2020-06-30'),(1063,25,'2020-06-30'),(1064,16,'2020-06-30'),(1066,1,'2020-06-30'),(1067,9,'2020-06-30'),(1068,8,'2020-06-30'),(1069,7,'2020-06-30'),(1070,30,'2020-06-30'),(1071,2,'2020-06-30'),(1072,11,'2020-06-30'),(1073,29,'2020-06-30'),(1074,29,'2020-06-30'),(1075,29,'2020-06-30'),(1076,13,'2020-06-30'),(1077,29,'2020-06-30'),(1079,24,'2020-06-30'),(1080,23,'2020-06-30'),(1081,31,'2020-06-30'),(1082,31,'2020-06-30'),(1083,31,'2020-06-30'),(1084,31,'2020-06-30'),(1085,31,'2020-06-30'),(1086,31,'2020-06-30'),(1087,31,'2020-06-30'),(1088,31,'2020-06-30'),(1089,31,'2020-06-30'),(1090,8,'2020-06-30'),(1091,3,'2020-06-30'),(1092,30,'2020-06-30'),(1093,31,'2020-06-30'),(1094,31,'2020-06-30'),(1095,30,'2020-06-30'),(1096,29,'2020-06-30'),(1097,29,'2020-06-30'),(1098,30,'2020-06-30'),(1099,30,'2020-06-30'),(1100,31,'2020-06-30'),(1101,28,'2020-06-30'),(1102,8,'2020-06-30'),(1103,29,'2020-06-30'),(1104,8,'2020-06-30'),(1105,1,'2020-06-30'),(1107,1,'2020-06-30'),(1108,7,'2020-06-30'),(1109,19,'2020-07-01'),(1110,15,'2020-07-01'),(1111,6,'2020-07-01'),(1112,17,'2020-07-01'),(1113,9,'2020-07-01'),(1114,11,'2020-07-01'),(1115,14,'2020-07-01'),(1116,16,'2020-07-01'),(1117,21,'2020-07-01'),(1118,7,'2020-07-01'),(1119,23,'2020-07-01'),(1120,24,'2020-07-01'),(1121,27,'2020-07-01'),(1122,22,'2020-07-01'),(1123,2,'2020-07-01'),(1124,29,'2020-07-01'),(1125,29,'2020-07-01'),(1126,31,'2020-07-01'),(1127,24,'2020-07-01'),(1128,23,'2020-07-01'),(1129,22,'2020-07-01'),(1130,21,'2020-07-01'),(1131,20,'2020-07-01'),(1132,19,'2020-07-01'),(1133,18,'2020-07-01'),(1134,15,'2020-07-01'),(1135,11,'2020-07-01'),(1136,5,'2020-07-01'),(1137,14,'2020-07-01'),(1138,13,'2020-07-01'),(1139,6,'2020-07-01'),(1140,4,'2020-07-01'),(1141,29,'2020-07-01'),(1142,3,'2020-07-01'),(1143,28,'2020-07-01'),(1144,27,'2020-07-01'),(1145,26,'2020-07-01'),(1146,25,'2020-07-01'),(1147,17,'2020-07-01'),(1148,16,'2020-07-01'),(1150,1,'2020-07-01'),(1151,9,'2020-07-01'),(1152,8,'2020-07-01'),(1153,7,'2020-07-01'),(1154,30,'2020-07-01'),(1155,2,'2020-07-01'),(1156,31,'2020-07-01'),(1157,26,'2020-07-01'),(1158,22,'2020-07-01'),(1159,19,'2020-07-01'),(1160,17,'2020-07-01'),(1161,16,'2020-07-01'),(1162,24,'2020-07-01'),(1163,19,'2020-07-01'),(1165,21,'2020-07-01'),(1166,21,'2020-07-01'),(1167,6,'2020-07-01'),(1168,11,'2020-07-01'),(1169,23,'2020-07-01'),(1170,13,'2020-07-01'),(1171,6,'2020-07-01'),(1172,22,'2020-07-01'),(1173,14,'2020-07-01'),(1174,1,'2020-07-01'),(1175,14,'2020-07-01'),(1176,1,'2020-07-01'),(1177,30,'2020-07-01'),(1178,29,'2020-07-01'),(1179,1,'2020-07-01'),(1180,14,'2020-07-01'),(1181,1,'2020-07-01'),(1182,1,'2020-07-01'),(1183,25,'2020-07-01'),(1184,29,'2020-07-01'),(1185,29,'2020-07-01'),(1186,19,'2020-07-01'),(1187,31,'2020-07-01'),(1188,8,'2020-07-01'),(1189,14,'2020-07-02'),(1190,29,'2020-07-02'),(1191,26,'2020-07-02'),(1192,5,'2020-07-02'),(1193,14,'2020-07-02'),(1194,1,'2020-07-02'),(1195,14,'2020-07-02'),(1196,13,'2020-07-02'),(1197,6,'2020-07-02'),(1198,4,'2020-07-02'),(1199,1,'2020-07-02'),(1200,15,'2020-07-02'),(1201,11,'2020-07-02'),(1202,5,'2020-07-02'),(1203,29,'2020-07-02'),(1204,23,'2020-07-02'),(1205,24,'2020-07-02'),(1206,21,'2020-07-02'),(1207,3,'2020-07-02'),(1208,31,'2020-07-02'),(1209,28,'2020-07-02'),(1210,27,'2020-07-02'),(1211,26,'2020-07-02'),(1212,25,'2020-07-02'),(1213,20,'2020-07-02'),(1214,19,'2020-07-02'),(1215,18,'2020-07-02'),(1216,17,'2020-07-02'),(1217,16,'2020-07-02'),(1219,9,'2020-07-02'),(1220,8,'2020-07-02'),(1221,7,'2020-07-02'),(1222,30,'2020-07-02'),(1223,22,'2020-07-02'),(1224,2,'2020-07-02'),(1225,24,'2020-07-02'),(1226,26,'2020-07-02'),(1227,29,'2020-07-02'),(1228,29,'2020-07-02'),(1229,31,'2020-07-02'),(1230,11,'2020-07-02'),(1231,26,'2020-07-02'),(1232,7,'2020-07-02'),(1233,11,'2020-07-02'),(1234,15,'2020-07-02'),(1235,28,'2020-07-02'),(1236,5,'2020-07-02'),(1237,28,'2020-07-02'),(1238,21,'2020-07-02'),(1239,21,'2020-07-02'),(1240,21,'2020-07-02'),(1241,21,'2020-07-02'),(1242,23,'2020-07-02'),(1243,24,'2020-07-02'),(1245,29,'2020-07-02'),(1246,25,'2020-07-02'),(1247,26,'2020-07-02'),(1248,25,'2020-07-02'),(1249,26,'2020-07-02'),(1250,26,'2020-07-02'),(1251,7,'2020-07-02'),(1252,29,'2020-07-02'),(1253,2,'2020-07-03'),(1254,24,'2020-07-03'),(1255,14,'2020-07-03'),(1256,13,'2020-07-03'),(1257,6,'2020-07-03'),(1258,4,'2020-07-03'),(1259,1,'2020-07-03'),(1260,15,'2020-07-03'),(1261,11,'2020-07-03'),(1262,5,'2020-07-03'),(1263,29,'2020-07-03'),(1264,23,'2020-07-03'),(1265,24,'2020-07-03'),(1266,21,'2020-07-03'),(1267,3,'2020-07-03'),(1268,31,'2020-07-03'),(1269,28,'2020-07-03'),(1270,27,'2020-07-03'),(1271,26,'2020-07-03'),(1272,25,'2020-07-03'),(1273,20,'2020-07-03'),(1274,19,'2020-07-03'),(1275,18,'2020-07-03'),(1276,17,'2020-07-03'),(1277,16,'2020-07-03'),(1279,9,'2020-07-03'),(1280,8,'2020-07-03'),(1281,7,'2020-07-03'),(1282,30,'2020-07-03'),(1283,22,'2020-07-03'),(1284,2,'2020-07-03'),(1285,2,'2020-07-03'),(1286,24,'2020-07-03'),(1287,29,'2020-07-03'),(1288,29,'2020-07-03'),(1289,26,'2020-07-04'),(1290,27,'2020-07-04'),(1291,28,'2020-07-04'),(1292,25,'2020-07-04'),(1293,18,'2020-07-04'),(1294,14,'2020-07-04'),(1295,13,'2020-07-04'),(1296,6,'2020-07-04'),(1297,4,'2020-07-04'),(1298,1,'2020-07-04'),(1299,15,'2020-07-04'),(1300,11,'2020-07-04'),(1301,5,'2020-07-04'),(1302,29,'2020-07-04'),(1303,23,'2020-07-04'),(1304,24,'2020-07-04'),(1305,21,'2020-07-04'),(1306,3,'2020-07-04'),(1307,31,'2020-07-04'),(1308,28,'2020-07-04'),(1309,27,'2020-07-04'),(1310,26,'2020-07-04'),(1311,25,'2020-07-04'),(1312,20,'2020-07-04'),(1313,19,'2020-07-04'),(1314,18,'2020-07-04'),(1315,17,'2020-07-04'),(1316,16,'2020-07-04'),(1318,9,'2020-07-04'),(1319,8,'2020-07-04'),(1320,7,'2020-07-04'),(1321,30,'2020-07-04'),(1322,22,'2020-07-04'),(1323,2,'2020-07-04'),(1324,30,'2020-07-04'),(1325,6,'2020-07-04'),(1326,29,'2020-07-04'),(1327,29,'2020-07-04'),(1328,5,'2020-07-04'),(1329,15,'2020-07-04'),(1330,23,'2020-07-04'),(1331,7,'2020-07-04'),(1332,9,'2020-07-04'),(1333,28,'2020-07-04'),(1334,24,'2020-07-04'),(1335,7,'2020-07-04'),(1336,11,'2020-07-04'),(1337,24,'2020-07-04'),(1338,1,'2020-07-04'),(1339,6,'2020-07-04'),(1341,23,'2020-07-04'),(1342,4,'2020-07-04'),(1343,13,'2020-07-04'),(1344,14,'2020-07-04'),(1345,30,'2020-07-04'),(1346,11,'2020-07-04'),(1347,15,'2020-07-04'),(1348,1,'2020-07-04'),(1349,31,'2020-07-04'),(1350,23,'2020-07-04'),(1351,29,'2020-07-04'),(1352,24,'2020-07-04'),(1353,7,'2020-07-04'),(1354,9,'2020-07-04'),(1355,8,'2020-07-04'),(1356,22,'2020-07-04'),(1357,30,'2020-07-04'),(1358,26,'2020-07-04'),(1359,25,'2020-07-04'),(1361,18,'2020-07-04'),(1362,16,'2020-07-04'),(1363,20,'2020-07-04'),(1364,2,'2020-07-04'),(1365,8,'2020-07-04'),(1366,29,'2020-07-04'),(1367,19,'2020-07-04'),(1368,17,'2020-07-05'),(1369,27,'2020-07-05'),(1370,28,'2020-07-05'),(1371,7,'2020-07-05'),(1372,6,'2020-07-05'),(1373,9,'2020-07-05'),(1374,5,'2020-07-05'),(1375,2,'2020-07-05'),(1376,3,'2020-07-05'),(1377,21,'2020-07-05'),(1378,9,'2020-07-05'),(1379,28,'2020-07-05'),(1380,14,'2020-07-05'),(1381,13,'2020-07-05'),(1382,6,'2020-07-05'),(1383,4,'2020-07-05'),(1384,1,'2020-07-05'),(1385,15,'2020-07-05'),(1386,11,'2020-07-05'),(1387,5,'2020-07-05'),(1388,29,'2020-07-05'),(1389,23,'2020-07-05'),(1390,24,'2020-07-05'),(1391,21,'2020-07-05'),(1392,3,'2020-07-05'),(1393,31,'2020-07-05'),(1394,28,'2020-07-05'),(1395,27,'2020-07-05'),(1396,26,'2020-07-05'),(1397,25,'2020-07-05'),(1398,20,'2020-07-05'),(1399,19,'2020-07-05'),(1400,18,'2020-07-05'),(1401,17,'2020-07-05'),(1402,16,'2020-07-05'),(1404,9,'2020-07-05'),(1405,8,'2020-07-05'),(1406,7,'2020-07-05'),(1407,30,'2020-07-05'),(1408,22,'2020-07-05'),(1409,2,'2020-07-05'),(1410,8,'2020-07-05'),(1411,23,'2020-07-05'),(1412,23,'2020-07-05'),(1413,9,'2020-07-05'),(1414,6,'2020-07-05'),(1415,8,'2020-07-05'),(1416,19,'2020-07-05'),(1417,17,'2020-07-05'),(1418,30,'2020-07-05'),(1419,18,'2020-07-05'),(1420,22,'2020-07-05'),(1421,19,'2020-07-06'),(1422,29,'2020-07-06'),(1423,6,'2020-07-06'),(1424,16,'2020-07-06'),(1425,21,'2020-07-06'),(1426,23,'2020-07-06'),(1427,15,'2020-07-06'),(1428,23,'2020-07-06'),(1429,14,'2020-07-06'),(1430,13,'2020-07-06'),(1431,6,'2020-07-06'),(1432,4,'2020-07-06'),(1433,1,'2020-07-06'),(1434,15,'2020-07-06'),(1435,11,'2020-07-06'),(1436,5,'2020-07-06'),(1437,29,'2020-07-06'),(1438,23,'2020-07-06'),(1439,24,'2020-07-06'),(1440,21,'2020-07-06'),(1441,3,'2020-07-06'),(1442,31,'2020-07-06'),(1443,28,'2020-07-06'),(1444,27,'2020-07-06'),(1445,26,'2020-07-06'),(1446,25,'2020-07-06'),(1447,20,'2020-07-06'),(1448,19,'2020-07-06'),(1449,18,'2020-07-06'),(1450,17,'2020-07-06'),(1451,16,'2020-07-06'),(1453,9,'2020-07-06'),(1454,8,'2020-07-06'),(1455,7,'2020-07-06'),(1456,30,'2020-07-06'),(1457,22,'2020-07-06'),(1458,2,'2020-07-06'),(1459,30,'2020-07-06'),(1460,31,'2020-07-06'),(1461,29,'2020-07-06'),(1462,24,'2020-07-06'),(1463,29,'2020-07-06'),(1464,13,'2020-07-06'),(1465,27,'2020-07-07'),(1466,26,'2020-07-07'),(1467,31,'2020-07-07'),(1468,25,'2020-07-07'),(1469,29,'2020-07-07'),(1470,14,'2020-07-07'),(1471,13,'2020-07-07'),(1472,6,'2020-07-07'),(1473,4,'2020-07-07'),(1474,15,'2020-07-07'),(1475,11,'2020-07-07'),(1476,5,'2020-07-07'),(1477,29,'2020-07-07'),(1478,23,'2020-07-07'),(1479,24,'2020-07-07'),(1480,21,'2020-07-07'),(1481,3,'2020-07-07'),(1482,31,'2020-07-07'),(1483,28,'2020-07-07'),(1484,27,'2020-07-07'),(1485,26,'2020-07-07'),(1486,25,'2020-07-07'),(1487,20,'2020-07-07'),(1488,19,'2020-07-07'),(1489,18,'2020-07-07'),(1490,17,'2020-07-07'),(1491,16,'2020-07-07'),(1492,1,'2020-07-07'),(1493,9,'2020-07-07'),(1494,8,'2020-07-07'),(1495,7,'2020-07-07'),(1496,30,'2020-07-07'),(1497,22,'2020-07-07'),(1498,2,'2020-07-07'),(1499,4,'2020-07-07'),(1500,29,'2020-07-07'),(1501,27,'2020-07-07'),(1502,2,'2020-07-07'),(1503,6,'2020-07-07'),(1504,3,'2020-07-07'),(1505,5,'2020-07-07'),(1506,15,'2020-07-07'),(1507,5,'2020-07-07'),(1508,24,'2020-07-07'),(1509,8,'2020-07-07'),(1510,4,'2020-07-07'),(1511,8,'2020-07-07'),(1512,18,'2020-07-07'),(1513,21,'2020-07-08'),(1514,3,'2020-07-08'),(1515,6,'2020-07-08'),(1516,20,'2020-07-08'),(1517,9,'2020-07-08'),(1518,4,'2020-07-08'),(1519,5,'2020-07-08'),(1520,11,'2020-07-08'),(1521,29,'2020-07-08'),(1522,2,'2020-07-08'),(1523,30,'2020-07-08'),(1524,1,'2020-07-08'),(1525,27,'2020-07-08'),(1526,22,'2020-07-08'),(1527,26,'2020-07-08'),(1528,24,'2020-07-08'),(1529,14,'2020-07-08'),(1530,23,'2020-07-08'),(1531,15,'2020-07-08'),(1532,13,'2020-07-08'),(1533,28,'2020-07-08'),(1534,31,'2020-07-08'),(1535,4,'2020-07-08'),(1536,8,'2020-07-08'),(1537,7,'2020-07-08'),(1538,17,'2020-07-08'),(1539,18,'2020-07-08'),(1540,19,'2020-07-08'),(1541,16,'2020-07-08'),(1542,25,'2020-07-08'),(1543,6,'2020-07-08'),(1544,29,'2020-07-08'),(1545,14,'2020-07-08'),(1546,13,'2020-07-08'),(1547,6,'2020-07-08'),(1548,4,'2020-07-08'),(1549,15,'2020-07-08'),(1550,11,'2020-07-08'),(1551,5,'2020-07-08'),(1552,29,'2020-07-08'),(1553,23,'2020-07-08'),(1554,24,'2020-07-08'),(1555,21,'2020-07-08'),(1556,3,'2020-07-08'),(1557,31,'2020-07-08'),(1558,28,'2020-07-08'),(1559,27,'2020-07-08'),(1560,26,'2020-07-08'),(1561,25,'2020-07-08'),(1562,20,'2020-07-08'),(1563,19,'2020-07-08'),(1564,18,'2020-07-08'),(1565,17,'2020-07-08'),(1566,16,'2020-07-08'),(1567,1,'2020-07-08'),(1568,9,'2020-07-08'),(1569,8,'2020-07-08'),(1570,7,'2020-07-08'),(1571,30,'2020-07-08'),(1572,22,'2020-07-08'),(1573,2,'2020-07-08'),(1574,14,'2020-07-08'),(1575,23,'2020-07-08'),(1576,23,'2020-07-08'),(1577,29,'2020-07-08'),(1578,17,'2020-07-08'),(1579,8,'2020-07-08'),(1580,18,'2020-07-08'),(1581,19,'2020-07-08'),(1582,14,'2020-07-08'),(1583,3,'2020-07-08'),(1584,16,'2020-07-08'),(1585,28,'2020-07-08'),(1586,24,'2020-07-08'),(1587,22,'2020-07-08'),(1588,23,'2020-07-08'),(1589,11,'2020-07-09'),(1590,30,'2020-07-09'),(1591,31,'2020-07-09'),(1592,8,'2020-07-09'),(1593,6,'2020-07-09'),(1594,23,'2020-07-09'),(1595,13,'2020-07-09'),(1596,14,'2020-07-09'),(1597,14,'2020-07-09'),(1598,13,'2020-07-09'),(1599,6,'2020-07-09'),(1600,4,'2020-07-09'),(1601,15,'2020-07-09'),(1602,11,'2020-07-09'),(1603,5,'2020-07-09'),(1604,29,'2020-07-09'),(1605,23,'2020-07-09'),(1606,24,'2020-07-09'),(1607,21,'2020-07-09'),(1608,3,'2020-07-09'),(1609,31,'2020-07-09'),(1610,28,'2020-07-09'),(1611,27,'2020-07-09'),(1612,26,'2020-07-09'),(1613,25,'2020-07-09'),(1614,20,'2020-07-09'),(1615,19,'2020-07-09'),(1616,18,'2020-07-09'),(1617,17,'2020-07-09'),(1618,16,'2020-07-09'),(1619,1,'2020-07-09'),(1620,9,'2020-07-09'),(1621,8,'2020-07-09'),(1622,7,'2020-07-09'),(1623,30,'2020-07-09'),(1624,22,'2020-07-09'),(1625,2,'2020-07-09'),(1626,30,'2020-07-09'),(1627,7,'2020-07-09'),(1628,14,'2020-07-09'),(1629,7,'2020-07-09'),(1630,14,'2020-07-09'),(1631,29,'2020-07-09'),(1632,30,'2020-07-09'),(1633,14,'2020-07-10'),(1634,14,'2020-07-10'),(1635,30,'2020-07-10'),(1636,14,'2020-07-10'),(1637,13,'2020-07-10'),(1638,6,'2020-07-10'),(1639,4,'2020-07-10'),(1640,15,'2020-07-10'),(1641,11,'2020-07-10'),(1642,5,'2020-07-10'),(1643,29,'2020-07-10'),(1644,23,'2020-07-10'),(1645,24,'2020-07-10'),(1646,21,'2020-07-10'),(1647,3,'2020-07-10'),(1648,31,'2020-07-10'),(1649,28,'2020-07-10'),(1650,27,'2020-07-10'),(1651,26,'2020-07-10'),(1652,25,'2020-07-10'),(1653,20,'2020-07-10'),(1654,19,'2020-07-10'),(1655,18,'2020-07-10'),(1656,17,'2020-07-10'),(1657,16,'2020-07-10'),(1658,1,'2020-07-10'),(1659,9,'2020-07-10'),(1660,8,'2020-07-10'),(1661,7,'2020-07-10'),(1662,30,'2020-07-10'),(1663,22,'2020-07-10'),(1664,2,'2020-07-10'),(1665,7,'2020-07-10'),(1666,31,'2020-07-10'),(1667,18,'2020-07-10'),(1668,31,'2020-07-10'),(1669,24,'2020-07-10'),(1670,19,'2020-07-10'),(1671,14,'2020-07-10'),(1672,8,'2020-07-10'),(1673,8,'2020-07-10'),(1674,6,'2020-07-10'),(1675,26,'2020-07-10'),(1676,2,'2020-07-10'),(1677,16,'2020-07-10'),(1678,1,'2020-07-10'),(1679,17,'2020-07-10'),(1680,23,'2020-07-10'),(1681,30,'2020-07-10'),(1682,14,'2020-07-10'),(1683,6,'2020-07-11'),(1684,13,'2020-07-11'),(1685,14,'2020-07-11'),(1686,13,'2020-07-11'),(1687,6,'2020-07-11'),(1688,4,'2020-07-11'),(1689,15,'2020-07-11'),(1690,11,'2020-07-11'),(1691,5,'2020-07-11'),(1692,29,'2020-07-11'),(1693,23,'2020-07-11'),(1694,24,'2020-07-11'),(1695,21,'2020-07-11'),(1696,3,'2020-07-11'),(1697,31,'2020-07-11'),(1698,28,'2020-07-11'),(1699,27,'2020-07-11'),(1700,26,'2020-07-11'),(1701,25,'2020-07-11'),(1702,20,'2020-07-11'),(1703,19,'2020-07-11'),(1704,18,'2020-07-11'),(1705,17,'2020-07-11'),(1706,16,'2020-07-11'),(1707,1,'2020-07-11'),(1708,9,'2020-07-11'),(1709,8,'2020-07-11'),(1710,7,'2020-07-11'),(1711,30,'2020-07-11'),(1712,22,'2020-07-11'),(1713,2,'2020-07-11'),(1714,14,'2020-07-11'),(1715,8,'2020-07-11'),(1716,29,'2020-07-11'),(1717,6,'2020-07-11'),(1718,30,'2020-07-11'),(1719,14,'2020-07-11'),(1720,29,'2020-07-11'),(1721,4,'2020-07-11'),(1722,2,'2020-07-11'),(1723,5,'2020-07-11'),(1724,30,'2020-07-11'),(1725,14,'2020-07-12'),(1726,6,'2020-07-12'),(1727,18,'2020-07-12'),(1728,30,'2020-07-12'),(1729,3,'2020-07-12'),(1730,14,'2020-07-12'),(1731,13,'2020-07-12'),(1732,6,'2020-07-12'),(1733,4,'2020-07-12'),(1734,15,'2020-07-12'),(1735,11,'2020-07-12'),(1736,5,'2020-07-12'),(1737,29,'2020-07-12'),(1738,23,'2020-07-12'),(1739,24,'2020-07-12'),(1740,21,'2020-07-12'),(1741,3,'2020-07-12'),(1742,31,'2020-07-12'),(1743,28,'2020-07-12'),(1744,27,'2020-07-12'),(1745,26,'2020-07-12'),(1746,25,'2020-07-12'),(1747,20,'2020-07-12'),(1748,19,'2020-07-12'),(1749,18,'2020-07-12'),(1750,17,'2020-07-12'),(1751,16,'2020-07-12'),(1752,1,'2020-07-12'),(1753,9,'2020-07-12'),(1754,8,'2020-07-12'),(1755,7,'2020-07-12'),(1756,30,'2020-07-12'),(1757,22,'2020-07-12'),(1758,2,'2020-07-12'),(1759,29,'2020-07-12'),(1760,30,'2020-07-12'),(1761,30,'2020-07-12'),(1762,7,'2020-07-12'),(1763,7,'2020-07-12'),(1764,26,'2020-07-12'),(1765,2,'2020-07-12'),(1766,15,'2020-07-12'),(1767,14,'2020-07-12'),(1768,7,'2020-07-13'),(1769,29,'2020-07-13'),(1770,29,'2020-07-13'),(1771,1,'2020-07-13'),(1772,14,'2020-07-13'),(1773,13,'2020-07-13'),(1774,6,'2020-07-13'),(1775,4,'2020-07-13'),(1776,15,'2020-07-13'),(1777,11,'2020-07-13'),(1778,5,'2020-07-13'),(1779,29,'2020-07-13'),(1780,23,'2020-07-13'),(1781,24,'2020-07-13'),(1782,21,'2020-07-13'),(1783,3,'2020-07-13'),(1784,31,'2020-07-13'),(1785,28,'2020-07-13'),(1786,27,'2020-07-13'),(1787,26,'2020-07-13'),(1788,25,'2020-07-13'),(1789,20,'2020-07-13'),(1790,19,'2020-07-13'),(1791,18,'2020-07-13'),(1792,17,'2020-07-13'),(1793,16,'2020-07-13'),(1794,1,'2020-07-13'),(1795,9,'2020-07-13'),(1796,8,'2020-07-13'),(1797,7,'2020-07-13'),(1798,30,'2020-07-13'),(1799,22,'2020-07-13'),(1800,2,'2020-07-13'),(1801,1,'2020-07-13'),(1802,29,'2020-07-13'),(1803,21,'2020-07-13'),(1804,27,'2020-07-13'),(1805,25,'2020-07-13'),(1806,29,'2020-07-13'),(1807,17,'2020-07-13'),(1808,4,'2020-07-14'),(1809,5,'2020-07-14'),(1810,20,'2020-07-14'),(1811,18,'2020-07-14'),(1812,28,'2020-07-14'),(1813,21,'2020-07-14'),(1814,24,'2020-07-14'),(1815,17,'2020-07-14'),(1816,19,'2020-07-14'),(1817,24,'2020-07-14'),(1818,18,'2020-07-14'),(1819,16,'2020-07-14'),(1820,6,'2020-07-14'),(1821,4,'2020-07-14'),(1822,4,'2020-07-14'),(1823,14,'2020-07-14'),(1824,13,'2020-07-14'),(1825,6,'2020-07-14'),(1826,4,'2020-07-14'),(1827,15,'2020-07-14'),(1828,11,'2020-07-14'),(1829,5,'2020-07-14'),(1830,29,'2020-07-14'),(1831,23,'2020-07-14'),(1832,24,'2020-07-14'),(1833,21,'2020-07-14'),(1834,3,'2020-07-14'),(1835,31,'2020-07-14'),(1836,28,'2020-07-14'),(1837,27,'2020-07-14'),(1838,26,'2020-07-14'),(1839,25,'2020-07-14'),(1840,20,'2020-07-14'),(1841,19,'2020-07-14'),(1842,18,'2020-07-14'),(1843,17,'2020-07-14'),(1844,16,'2020-07-14'),(1845,1,'2020-07-14'),(1846,9,'2020-07-14'),(1847,8,'2020-07-14'),(1848,7,'2020-07-14'),(1849,30,'2020-07-14'),(1850,22,'2020-07-14'),(1851,2,'2020-07-14'),(1852,14,'2020-07-14'),(1853,30,'2020-07-14'),(1854,23,'2020-07-14'),(1855,29,'2020-07-14'),(1856,13,'2020-07-14'),(1857,21,'2020-07-14'),(1858,3,'2020-07-14'),(1859,13,'2020-07-14'),(1860,3,'2020-07-14'),(1861,9,'2020-07-14'),(1862,30,'2020-07-14'),(1863,8,'2020-07-14'),(1864,24,'2020-07-14'),(1865,15,'2020-07-14'),(1866,8,'2020-07-14'),(1867,26,'2020-07-14'),(1868,25,'2020-07-14'),(1869,8,'2020-07-14'),(1870,24,'2020-07-14'),(1871,26,'2020-07-14'),(1872,30,'2020-07-14'),(1873,31,'2020-07-14'),(1874,6,'2020-07-14'),(1875,11,'2020-07-14'),(1876,30,'2020-07-15'),(1877,11,'2020-07-15'),(1878,4,'2020-07-15'),(1879,3,'2020-07-15'),(1880,2,'2020-07-15'),(1881,7,'2020-07-15'),(1882,20,'2020-07-15'),(1883,19,'2020-07-15'),(1884,18,'2020-07-15'),(1885,24,'2020-07-15'),(1886,13,'2020-07-15'),(1887,30,'2020-07-15'),(1888,27,'2020-07-15'),(1889,21,'2020-07-15'),(1890,29,'2020-07-15'),(1891,22,'2020-07-15'),(1892,28,'2020-07-15'),(1893,17,'2020-07-15'),(1894,6,'2020-07-15'),(1895,9,'2020-07-15'),(1896,25,'2020-07-15'),(1897,8,'2020-07-15'),(1898,1,'2020-07-15'),(1899,26,'2020-07-15'),(1900,15,'2020-07-15'),(1901,14,'2020-07-15'),(1902,5,'2020-07-15'),(1903,16,'2020-07-15'),(1904,31,'2020-07-15'),(1905,23,'2020-07-15'),(1906,4,'2020-07-15'),(1907,14,'2020-07-15'),(1908,13,'2020-07-15'),(1909,6,'2020-07-15'),(1910,4,'2020-07-15'),(1911,15,'2020-07-15'),(1912,11,'2020-07-15'),(1913,5,'2020-07-15'),(1914,29,'2020-07-15'),(1915,23,'2020-07-15'),(1916,24,'2020-07-15'),(1917,21,'2020-07-15'),(1918,3,'2020-07-15'),(1919,31,'2020-07-15'),(1920,28,'2020-07-15'),(1921,27,'2020-07-15'),(1922,26,'2020-07-15'),(1923,25,'2020-07-15'),(1924,20,'2020-07-15'),(1925,19,'2020-07-15'),(1926,18,'2020-07-15'),(1927,17,'2020-07-15'),(1928,16,'2020-07-15'),(1929,1,'2020-07-15'),(1930,9,'2020-07-15'),(1931,8,'2020-07-15'),(1932,7,'2020-07-15'),(1933,30,'2020-07-15'),(1934,22,'2020-07-15'),(1935,2,'2020-07-15'),(1936,20,'2020-07-15'),(1937,24,'2020-07-15'),(1938,22,'2020-07-15'),(1939,4,'2020-07-15'),(1940,14,'2020-07-15'),(1941,16,'2020-07-15'),(1942,4,'2020-07-15'),(1943,22,'2020-07-15'),(1944,13,'2020-07-15'),(1945,29,'2020-07-15'),(1946,14,'2020-07-15'),(1947,20,'2020-07-16'),(1948,18,'2020-07-16'),(1949,17,'2020-07-16'),(1950,21,'2020-07-16'),(1951,24,'2020-07-16'),(1952,19,'2020-07-16'),(1953,16,'2020-07-16'),(1954,7,'2020-07-16'),(1955,23,'2020-07-16'),(1956,27,'2020-07-16'),(1957,23,'2020-07-16'),(1958,22,'2020-07-16'),(1959,13,'2020-07-16'),(1960,1,'2020-07-16'),(1961,14,'2020-07-16'),(1962,13,'2020-07-16'),(1963,6,'2020-07-16'),(1964,4,'2020-07-16'),(1965,15,'2020-07-16'),(1966,11,'2020-07-16'),(1967,5,'2020-07-16'),(1968,29,'2020-07-16'),(1969,23,'2020-07-16'),(1970,24,'2020-07-16'),(1971,21,'2020-07-16'),(1972,3,'2020-07-16'),(1973,31,'2020-07-16'),(1974,28,'2020-07-16'),(1975,27,'2020-07-16'),(1976,26,'2020-07-16'),(1977,25,'2020-07-16'),(1978,20,'2020-07-16'),(1979,19,'2020-07-16'),(1980,18,'2020-07-16'),(1981,17,'2020-07-16'),(1982,16,'2020-07-16'),(1983,1,'2020-07-16'),(1984,9,'2020-07-16'),(1985,8,'2020-07-16'),(1986,7,'2020-07-16'),(1987,30,'2020-07-16'),(1988,22,'2020-07-16'),(1989,2,'2020-07-16'),(1990,7,'2020-07-16'),(1991,25,'2020-07-16'),(1992,9,'2020-07-16'),(1993,11,'2020-07-16'),(1994,27,'2020-07-16'),(1995,8,'2020-07-16'),(1996,29,'2020-07-16'),(1997,9,'2020-07-16'),(1998,11,'2020-07-16'),(1999,1,'2020-07-16'),(2000,17,'2020-07-16'),(2001,31,'2020-07-16'),(2002,14,'2020-07-16'),(2003,6,'2020-07-16'),(2004,23,'2020-07-16'),(2005,15,'2020-07-16'),(2006,5,'2020-07-16'),(2007,14,'2020-07-16'),(2008,13,'2020-07-16'),(2009,19,'2020-07-16'),(2010,29,'2020-07-16'),(2011,21,'2020-07-16'),(2012,14,'2020-07-16'),(2013,5,'2020-07-16'),(2014,29,'2020-07-16'),(2015,14,'2020-07-16'),(2016,3,'2020-07-16'),(2017,3,'2020-07-16'),(2018,6,'2020-07-17'),(2019,2,'2020-07-17'),(2020,5,'2020-07-17'),(2021,28,'2020-07-17'),(2022,26,'2020-07-17'),(2023,6,'2020-07-17'),(2024,30,'2020-07-17'),(2025,4,'2020-07-17'),(2026,30,'2020-07-17'),(2027,15,'2020-07-17'),(2028,28,'2020-07-17'),(2029,24,'2020-07-17'),(2030,29,'2020-07-17'),(2031,25,'2020-07-17'),(2032,5,'2020-07-17'),(2033,22,'2020-07-17'),(2034,18,'2020-07-17'),(2035,14,'2020-07-17'),(2036,13,'2020-07-17'),(2037,6,'2020-07-17'),(2038,4,'2020-07-17'),(2039,15,'2020-07-17'),(2040,11,'2020-07-17'),(2041,5,'2020-07-17'),(2042,29,'2020-07-17'),(2043,23,'2020-07-17'),(2044,24,'2020-07-17'),(2045,21,'2020-07-17'),(2046,3,'2020-07-17'),(2047,31,'2020-07-17'),(2048,28,'2020-07-17'),(2049,27,'2020-07-17'),(2050,26,'2020-07-17'),(2051,25,'2020-07-17'),(2052,20,'2020-07-17'),(2053,19,'2020-07-17'),(2054,18,'2020-07-17'),(2055,17,'2020-07-17'),(2056,16,'2020-07-17'),(2057,1,'2020-07-17'),(2058,9,'2020-07-17'),(2059,8,'2020-07-17'),(2060,7,'2020-07-17'),(2061,30,'2020-07-17'),(2062,22,'2020-07-17'),(2063,2,'2020-07-17'),(2064,25,'2020-07-17'),(2065,26,'2020-07-17'),(2066,29,'2020-07-17'),(2067,2,'2020-07-17'),(2068,28,'2020-07-17'),(2069,26,'2020-07-17'),(2070,18,'2020-07-17'),(2071,15,'2020-07-17'),(2072,31,'2020-07-17'),(2073,8,'2020-07-17'),(2074,3,'2020-07-18'),(2075,1,'2020-07-18'),(2076,21,'2020-07-18'),(2077,18,'2020-07-18'),(2078,13,'2020-07-18'),(2079,15,'2020-07-18'),(2080,14,'2020-07-18'),(2081,13,'2020-07-18'),(2082,6,'2020-07-18'),(2083,4,'2020-07-18'),(2084,15,'2020-07-18'),(2085,11,'2020-07-18'),(2086,5,'2020-07-18'),(2087,29,'2020-07-18'),(2088,23,'2020-07-18'),(2089,24,'2020-07-18'),(2090,21,'2020-07-18'),(2091,3,'2020-07-18'),(2092,31,'2020-07-18'),(2093,28,'2020-07-18'),(2094,27,'2020-07-18'),(2095,26,'2020-07-18'),(2096,25,'2020-07-18'),(2097,20,'2020-07-18'),(2098,19,'2020-07-18'),(2099,18,'2020-07-18'),(2100,17,'2020-07-18'),(2101,16,'2020-07-18'),(2102,1,'2020-07-18'),(2103,9,'2020-07-18'),(2104,8,'2020-07-18'),(2105,7,'2020-07-18'),(2106,30,'2020-07-18'),(2107,22,'2020-07-18'),(2108,2,'2020-07-18'),(2109,18,'2020-07-18'),(2110,13,'2020-07-18'),(2111,23,'2020-07-18'),(2112,17,'2020-07-18'),(2113,9,'2020-07-18'),(2114,22,'2020-07-18'),(2115,18,'2020-07-18'),(2116,8,'2020-07-18'),(2117,13,'2020-07-18'),(2118,11,'2020-07-18'),(2119,17,'2020-07-18'),(2120,9,'2020-07-18'),(2121,28,'2020-07-18'),(2122,14,'2020-07-18'),(2123,17,'2020-07-18'),(2124,24,'2020-07-18'),(2125,4,'2020-07-18'),(2126,21,'2020-07-19'),(2127,11,'2020-07-19'),(2128,6,'2020-07-19'),(2129,31,'2020-07-19'),(2130,4,'2020-07-19'),(2131,22,'2020-07-19'),(2132,15,'2020-07-19'),(2133,20,'2020-07-19'),(2134,14,'2020-07-19'),(2135,13,'2020-07-19'),(2136,6,'2020-07-19'),(2137,4,'2020-07-19'),(2138,15,'2020-07-19'),(2139,11,'2020-07-19'),(2140,5,'2020-07-19'),(2141,29,'2020-07-19'),(2142,23,'2020-07-19'),(2143,24,'2020-07-19'),(2144,21,'2020-07-19'),(2145,3,'2020-07-19'),(2146,31,'2020-07-19'),(2147,28,'2020-07-19'),(2148,27,'2020-07-19'),(2149,26,'2020-07-19'),(2150,25,'2020-07-19'),(2151,20,'2020-07-19'),(2152,19,'2020-07-19'),(2153,18,'2020-07-19'),(2154,17,'2020-07-19'),(2155,16,'2020-07-19'),(2156,1,'2020-07-19'),(2157,9,'2020-07-19'),(2158,8,'2020-07-19'),(2159,7,'2020-07-19'),(2160,30,'2020-07-19'),(2161,22,'2020-07-19'),(2162,2,'2020-07-19'),(2163,1,'2020-07-19'),(2164,23,'2020-07-19'),(2165,19,'2020-07-19'),(2166,14,'2020-07-19'),(2167,20,'2020-07-19'),(2168,24,'2020-07-19'),(2169,18,'2020-07-19'),(2170,21,'2020-07-19'),(2171,16,'2020-07-19'),(2172,22,'2020-07-19'),(2173,19,'2020-07-19'),(2174,13,'2020-07-19'),(2175,7,'2020-07-19'),(2176,23,'2020-07-19'),(2177,27,'2020-07-19'),(2178,5,'2020-07-20'),(2179,29,'2020-07-20'),(2180,29,'2020-07-20'),(2181,29,'2020-07-20'),(2182,29,'2020-07-20'),(2183,9,'2020-07-20'),(2184,25,'2020-07-20'),(2185,1,'2020-07-20'),(2186,14,'2020-07-20'),(2187,13,'2020-07-20'),(2188,6,'2020-07-20'),(2189,4,'2020-07-20'),(2190,15,'2020-07-20'),(2191,11,'2020-07-20'),(2192,5,'2020-07-20'),(2193,29,'2020-07-20'),(2194,23,'2020-07-20'),(2195,24,'2020-07-20'),(2196,21,'2020-07-20'),(2197,3,'2020-07-20'),(2198,31,'2020-07-20'),(2199,28,'2020-07-20'),(2200,27,'2020-07-20'),(2201,26,'2020-07-20'),(2202,25,'2020-07-20'),(2203,20,'2020-07-20'),(2204,19,'2020-07-20'),(2205,18,'2020-07-20'),(2206,17,'2020-07-20'),(2207,16,'2020-07-20'),(2208,1,'2020-07-20'),(2209,9,'2020-07-20'),(2210,8,'2020-07-20'),(2211,7,'2020-07-20'),(2212,30,'2020-07-20'),(2213,22,'2020-07-20'),(2214,2,'2020-07-20'),(2215,5,'2020-07-20'),(2216,14,'2020-07-20'),(2217,23,'2020-07-20'),(2218,14,'2020-07-20'),(2219,30,'2020-07-20'),(2220,28,'2020-07-20'),(2221,7,'2020-07-20'),(2222,23,'2020-07-20'),(2223,13,'2020-07-20'),(2224,29,'2020-07-20'),(2225,2,'2020-07-20'),(2226,7,'2020-07-21'),(2227,26,'2020-07-21'),(2228,24,'2020-07-21'),(2229,15,'2020-07-21'),(2230,3,'2020-07-21'),(2231,23,'2020-07-21'),(2232,8,'2020-07-21'),(2233,14,'2020-07-21'),(2234,13,'2020-07-21'),(2235,6,'2020-07-21'),(2236,4,'2020-07-21'),(2237,15,'2020-07-21'),(2238,11,'2020-07-21'),(2239,5,'2020-07-21'),(2240,29,'2020-07-21'),(2241,23,'2020-07-21'),(2242,24,'2020-07-21'),(2243,21,'2020-07-21'),(2244,3,'2020-07-21'),(2245,31,'2020-07-21'),(2246,28,'2020-07-21'),(2247,27,'2020-07-21'),(2248,26,'2020-07-21'),(2249,25,'2020-07-21'),(2250,20,'2020-07-21'),(2251,19,'2020-07-21'),(2252,18,'2020-07-21'),(2253,17,'2020-07-21'),(2254,16,'2020-07-21'),(2255,1,'2020-07-21'),(2256,9,'2020-07-21'),(2257,8,'2020-07-21'),(2258,7,'2020-07-21'),(2259,30,'2020-07-21'),(2260,22,'2020-07-21'),(2261,2,'2020-07-21'),(2262,1,'2020-07-21'),(2263,14,'2020-07-21');
/*!40000 ALTER TABLE `product_clicks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(191) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) DEFAULT NULL,
  `product_type` enum('normal','affiliate') NOT NULL DEFAULT 'normal',
  `affiliate_link` text,
  `user_id` int(191) NOT NULL DEFAULT '0',
  `category_id` int(191) unsigned NOT NULL,
  `subcategory_id` int(191) unsigned DEFAULT NULL,
  `childcategory_id` int(191) unsigned DEFAULT NULL,
  `attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_qty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` double NOT NULL,
  `previous_price` double DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `stock` int(191) DEFAULT NULL,
  `policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `views` int(191) unsigned NOT NULL DEFAULT '0',
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text,
  `colors` text,
  `product_condition` tinyint(1) NOT NULL DEFAULT '0',
  `ship` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_meta` tinyint(1) NOT NULL DEFAULT '0',
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `youtube` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Physical','Digital','License') NOT NULL,
  `license` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `license_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `platform` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `licence_type` varchar(255) DEFAULT NULL,
  `measure` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `best` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `top` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `hot` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `latest` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `big` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `trending` tinyint(1) NOT NULL DEFAULT '0',
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_date` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `whole_sell_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `whole_sell_discount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_catalog` tinyint(1) NOT NULL DEFAULT '0',
  `catalog_id` int(191) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `name` (`name`),
  FULLTEXT KEY `attributes` (`attributes`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'tXS6684nOh','normal',NULL,0,33,3,NULL,NULL,'Beads','beads-txs6684noh','1590956962ezmwf2UO.png','1590956962ai8Aencu.jpg',NULL,NULL,NULL,NULL,NULL,3.4482758620689657,3.4482758620689657,'&nbsp;Beads from Ghana&nbsp;',1,'<br>',1,108,NULL,'beads','#000000',0,NULL,0,'bead made in ghana','bead made in ghana',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,1,1,1,1,1,'2020-05-31 12:29:22','2020-07-21 01:52:55',1,'06/24/2020',NULL,NULL,1,0),(2,'IoC0838VnP','normal',NULL,0,35,NULL,NULL,NULL,'Ghana Rice unlabeled','ghana-rice-unlabeled-ioc0838vnp','1591011212hEpkCwCA.png','1591011212hgxtZJdP.jpg',NULL,NULL,NULL,NULL,NULL,20.689655172413794,25.862068965517242,'Ghana ?? Rice 25kg unlebled sack&nbsp;<div>&nbsp;</div>',50,'<br>',1,101,'Ghana, rice',NULL,NULL,0,NULL,0,NULL,NULL,NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,1,1,1,1,1,'2020-06-01 03:33:32','2020-07-21 01:46:34',1,'06/27/2020',NULL,NULL,0,0),(3,'X6A1509xYR','normal',NULL,0,31,NULL,NULL,NULL,'Ghana Rice','ghana-rice-x6a1509xyr','1591011646fZZRH9LH.png','1591011646v3KBokHs.jpg',NULL,NULL,NULL,NULL,NULL,21.551724137931036,25.862068965517242,'Ghana Rice&nbsp;',49,'<br>',1,166,'Ghana rice',NULL,NULL,0,NULL,0,NULL,NULL,NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,1,1,1,1,1,'2020-06-01 03:40:46','2020-07-21 01:46:07',1,'07/31/2020',NULL,NULL,1,0),(4,'Hts8363wWY','normal',NULL,0,27,NULL,NULL,NULL,'Flower pots','flower-pots-hts8363wwy','1591208653kWKqFNuJ.png','1591208653b2C9nHcY.jpg',NULL,NULL,NULL,NULL,NULL,14.655172413793103,17.24137931034483,'Clay pottery for your gardening<div><br></div>',100,'<br>',1,107,'Flower pots',NULL,NULL,0,NULL,0,NULL,NULL,NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,1,1,1,1,1,'2020-06-03 10:24:13','2020-07-21 01:45:43',1,'06/30/2020',NULL,NULL,0,0),(5,'ErY957283G','normal',NULL,0,26,NULL,NULL,NULL,'Face Masks','face-masks-ery957283g','1591269906XC2BkIbS.png','1591269906FrV80rvA.jpg',NULL,NULL,NULL,NULL,NULL,1.206896551724138,1.7241379310344829,'Face masks crocheted&nbsp;',199,'<br>',1,99,'Face masks','Face masks','#000000',0,NULL,0,NULL,NULL,NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,1,1,1,1,1,'2020-06-04 03:25:06','2020-07-21 01:46:00',1,'07/31/2020',NULL,NULL,0,0),(6,'0h43350s8z','normal',NULL,0,27,NULL,NULL,NULL,'Flower pots','flower-pots-0h43350s8z','1591863622Fh2lRNzV.png','1591863622k83LJDFV.jpg',NULL,NULL,NULL,NULL,'#c21c1c,#e4e829,#1fe633,#e61d8a',20.689655172413794,31.03448275862069,'clay flower pots',NULL,'<br>',1,92,'flower pots,pots','flower pots','#000000',2,'one week',0,'flower pots,pots','clay flower pots',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,0,0,'2020-06-11 00:20:22','2020-07-21 01:45:41',1,'07/31/2020','5','3',0,0),(7,'lmd6107v6r','normal',NULL,32,34,16,NULL,NULL,'Graphic Design & Animation Services','graphic-design-animation-services-lmd6107v6r','1591866189tYN8z1LV.jpg','159186618906k2GZE8.jpg',NULL,NULL,NULL,NULL,NULL,17.24137931034483,0,'<br>',NULL,'<br>',1,110,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,0,'2020-06-11 01:03:09','2020-07-21 01:46:30',0,NULL,NULL,NULL,0,0),(8,'Iv77306veR','normal',NULL,32,34,17,NULL,NULL,'Web Development','web-development-iv77306ver','1591867475pgU8Zu1s.jpg','1591867475dcD8k022.jpg',NULL,NULL,NULL,NULL,NULL,172.41379310344828,0,'&nbsp;We provide the best form of web development services for all kind of demand',NULL,'<br>',1,131,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,0,'2020-06-11 01:24:34','2020-07-21 01:46:28',0,NULL,NULL,NULL,0,0),(9,'l2F83313pv','normal',NULL,32,34,38,NULL,NULL,'Social Media Marketing Services','social-media-marketing-services-l2f83313pv','1591868494caR0vPR9.jpg','1591868494XvOeKdfJ.jpg',NULL,NULL,NULL,NULL,NULL,51.724137931034484,0,'Social Media Marketing Services<br>',NULL,'<br>',1,73,'Social Media Marketing Services,digital marketing',NULL,NULL,0,NULL,0,NULL,NULL,NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,0,'2020-06-11 01:41:34','2020-07-21 01:46:27',0,NULL,NULL,NULL,0,0),(11,'kq72910PQu','normal',NULL,29,25,9,2,NULL,'Crochet  baby dress (3-9 months)','crochet-baby-dress-3-9-months-kq72910pqu','1593859121td0KwgXl.jpg','1593859121CizBkQkL.jpg',NULL,NULL,NULL,NULL,NULL,8.620689655172415,17.24137931034483,'Pretty crocheted dress. Beautiful&nbsp; baby dress to doll up your beautiful baby girl.',1,'No return',1,60,'Crochet dress,baby dress,pretty pinafore,crochet',NULL,NULL,2,NULL,0,'Crochet dress,crochet,pretty pinafore,baby dress','Hand crocheted pretty dress for a beautiful baby girl (3-9) months.',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,1,1,0,0,'2020-06-18 01:52:05','2020-07-21 01:45:58',1,'06/30/2020',NULL,NULL,0,0),(13,'rY55096TNM','normal',NULL,0,27,NULL,NULL,NULL,'Kente','kente-ry55096tnm','1592657213slE3zPvE.png','1592657213dkGy2PQc.jpg',NULL,NULL,NULL,NULL,'#ed0bbb,#ed1010,#24abd6',46.55172413793104,51.724137931034484,'Well woven nothing kente&nbsp;<span style=\"color: rgb(128, 128, 128); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Quality hand woven African Kente from Northern Ghana,&nbsp;</span><div><span style=\"color: rgb(128, 128, 128); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">(Daboya and Yendi), cloth in three and four colours</span><div><font color=\"#808080\" face=\"Open Sans, Arial, sans-serif\"><br></font><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; line-height: 20px; color: rgb(128, 128, 128); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Price is for 4 yards. (4 yards for women)</p></div></div>',NULL,'<h4 class=\"heading\" style=\"margin-bottom: 0px; font-weight: 600; line-height: 1.2381; font-size: 14px; color: rgb(13, 51, 89);\">&nbsp;&nbsp;</h4><h4 class=\"heading\" style=\"margin-bottom: 0px; font-weight: 600; line-height: 1.2381; font-size: 14px; color: rgb(13, 51, 89);\">&nbsp; &nbsp; No Return Policy</h4>',1,60,NULL,NULL,NULL,0,'A week',0,'Well woven nothing kente,Quality hand woven African Kente from Northern Ghana','Quality hand woven African Kente from Northern Ghana,',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1,1,1,0,'2020-06-20 04:46:53','2020-07-21 01:45:40',1,'08/31/2020',NULL,NULL,0,0),(14,'xzf1213hco','normal',NULL,0,27,NULL,NULL,NULL,'Quality hand woven African Kente from Northern Ghana,','quality-hand-woven-african-kente-from-northern-ghana-xzf1213hco','1592661576EkLYjRVE.png','1592661576BNnIRLSL.jpg',NULL,NULL,NULL,NULL,'#e040a0,#de1c1c,#13a310,#2515db',46.55172413793104,51.724137931034484,'Well woven nothing kente&nbsp;<span open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"color: rgb(128, 128, 128);\">Quality hand woven African Kente from Northern Ghana,&nbsp;</span><div><span open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"color: rgb(128, 128, 128);\">(Daboya and Yendi), cloth in three and four colours</span><div><font color=\"#808080\" face=\"Open Sans, Arial, sans-serif\"><br></font><p open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(128, 128, 128); line-height: 20px; padding: 0px; border: 0px; outline: 0px;\">Price is for 4 yards. (4 yards for women)</p></div></div>',NULL,NULL,1,79,'kente,Well woven nothing kente,Quality hand woven African Kente from Northern Ghana,',NULL,NULL,2,'A week',0,'northern kente,kente,ghana kente,Quality hand woven African Kente,Quality hand woven African Kente from Northern Ghana,','Quality hand woven African Kente from Northern Ghana,',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,1,0,0,'2020-06-20 05:59:36','2020-07-21 02:09:12',1,'06/30/2020','1','1',0,0),(15,'mJN869948m','normal',NULL,29,25,9,2,'{\"dress\":{\"values\":[\"Clothes\"],\"prices\":[\"0\"],\"details_status\":1}}','Hand crocheted pretty dress for a beautiful baby girl (3-9) months.','hand-crocheted-pretty-dress-for-a-beautiful-baby-girl-3-9-months-mjn869948m','1593858921BGMWAuti.jpg','1593858921vebUuaxj.jpg',NULL,NULL,NULL,NULL,NULL,6.0344827586206895,10.344827586206897,'<div>Hand crocheted pretty dress for a beautiful baby girl (3-9) months.</div><div>Can also be used as a beautiful top over some sleek trousers or leggings for a toddler.<br></div>',2,'<br>',1,64,'Hand crocheted pretty dress for a beautiful baby girl (3-9) months.',NULL,NULL,2,NULL,0,NULL,'Hand crocheted pretty dress for a beautiful baby girl (3-9) months.',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,1,1,1,0,'2020-06-20 10:49:39','2020-07-21 01:45:57',1,'06/30/2020',NULL,NULL,0,0),(16,'bNJ0516Gpe','normal',NULL,0,33,4,NULL,NULL,'Ladies Hand Bag','ladies-hand-bag-bnj0516gpe','1592850645F058bRTR.png','1592850645QQaRNewZ.jpg',NULL,NULL,NULL,NULL,NULL,20.689655172413794,25.862068965517242,'Ladies Hand Bag<br>',NULL,'<br>',1,52,'Ladies Hand Bag',NULL,NULL,2,NULL,0,'Ladies Hand Bag','Ladies Hand Bag',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,0,'2020-06-22 10:30:45','2020-07-21 01:46:23',0,NULL,NULL,NULL,0,0),(17,'YT206580pe','normal',NULL,0,33,4,NULL,NULL,'Ladies Hand Bag','ladies-hand-bag-yt206580pe','1592850770huktPisd.png','15928507702ZfI9Tbp.jpg',NULL,NULL,NULL,NULL,NULL,20.689655172413794,25.862068965517242,'Ladies Hand Bag<br>',NULL,'<br>',1,58,'Ladies Hand Bag',NULL,NULL,2,NULL,0,'Ladies Hand Bag','Ladies Hand Bag',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,0,'2020-06-22 10:32:50','2020-07-21 01:46:22',0,NULL,NULL,NULL,0,0),(18,'Azc0784U97','normal',NULL,0,33,4,NULL,NULL,'Ladies Hand Bag','ladies-hand-bag-azc0784u97','1592850884x2q0WG77.png','1592850884QRwZtvY4.jpg',NULL,NULL,NULL,NULL,NULL,14.655172413793103,17.24137931034483,'Ladies Hand Bag<br>',NULL,'<br>',1,65,'Ladies Hand Bag',NULL,NULL,2,NULL,0,'Ladies Hand Bag','Ladies Hand Bag',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,0,'2020-06-22 10:34:44','2020-07-21 01:46:20',0,NULL,NULL,NULL,0,0),(19,'wAo0888ork','normal',NULL,0,33,4,NULL,NULL,'Ladies Hand Bag','ladies-hand-bag-wao0888ork','1592851010dgZweR0V.png','1592851010hvyyXBcz.jpg',NULL,NULL,NULL,NULL,NULL,20.689655172413794,25.862068965517242,'&nbsp;Ladies Hand Bag',NULL,'<br>',1,54,'Ladies Hand Bag',NULL,NULL,2,NULL,0,'Ladies Hand Bag','Ladies Hand Bag',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,0,'2020-06-22 10:36:50','2020-07-21 01:46:19',0,NULL,NULL,NULL,0,0),(20,'Pyc1350NkP','normal',NULL,0,33,4,NULL,NULL,'Ladies Hand Bag','ladies-hand-bag-pyc1350nkp','1592851454uKzViEJm.png','1592851454mGTpVYkX.jpg',NULL,NULL,NULL,NULL,NULL,20.689655172413794,27.586206896551726,'Ladies Hand Bag<br>',NULL,'<br>',1,48,'Ladies Hand Bag',NULL,NULL,2,NULL,0,'Ladies Hand Bag','Ladies Hand Bag',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,1,1,0,0,'2020-06-22 10:44:14','2020-07-21 01:46:17',0,NULL,NULL,NULL,0,0),(21,'DZG7484TSs','normal',NULL,0,31,24,NULL,NULL,'Glass bottles','glass-bottles-dzg7484tss','1592917685q8hz9Fvy.png','1592917685nof0Fw6t.jpg',NULL,NULL,NULL,NULL,NULL,1.7241379310344829,2.0689655172413794,'<div>780ml</div><div>10gh for 1 piece</div><div><br></div><div><br></div><div>380ml&nbsp;</div><div>9.50p for 1 piece</div><div><br></div><div><br></div><div><br></div><div>280ml</div><div>7.50 for 1 piece</div><div><br></div><div><br></div><div>100ml</div><div>7gh for 1 piece&nbsp;</div><div><br></div><div><br></div><div>50ml</div><div>5.50 for 1 pieces</div><div><br></div><div><br></div><div>Wholesale prices available if you’re buying per carton&nbsp;</div>',NULL,'<br>',1,58,NULL,NULL,NULL,2,NULL,0,'Glass bottles','Glass bottles',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,1,1,1,1,1,'2020-06-23 05:08:05','2020-07-21 01:46:06',0,NULL,'10','3',0,0),(22,'kNb6406Efr','normal',NULL,0,35,27,NULL,NULL,'Raw Cocoa beans','raw-cocoa-beans-knb6406efr','1593016671mfNOZGRm.png','1593016672cJc3zhNu.jpg',NULL,'50KG','1','0',NULL,120.6896551724138,0,'Raw Cocoa beans&nbsp;<br>',NULL,'<br>',1,50,'Raw Cocoa beans','Raw Cocoa beans','#000000',0,NULL,0,'Raw Cocoa beans','Raw Cocoa beans',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,1,1,0,0,'2020-06-24 08:37:52','2020-07-21 01:46:33',0,NULL,NULL,NULL,0,0),(23,'Dot1513jts','normal',NULL,0,30,36,NULL,NULL,'Original Zomi Palm Oil','original-zomi-palm-oil-dot1513jts','1593021954dioVtamm.png','1593021955eQMsV18v.jpg',NULL,NULL,NULL,NULL,NULL,10.344827586206897,0,'Original Zomi Palm Oil&nbsp;<br>',NULL,'<br>',1,98,'Original Zomi Palm Oil',NULL,NULL,0,NULL,0,NULL,NULL,NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,1,1,0,0,'2020-06-24 10:05:54','2020-07-21 01:46:03',0,NULL,NULL,NULL,0,0),(24,'qx75691Qvb','normal',NULL,0,31,22,NULL,NULL,'Cane Handles for bags','cane-handles-for-bags-qx75691qvb','1593025914sGkEkq7A.png','1593025914fmbvmpXc.jpg',NULL,NULL,NULL,NULL,NULL,2.586206896551724,0,'Cane Handles for bags&nbsp;<br>',NULL,'<br>',1,97,'Cane Handles for bags',NULL,NULL,0,NULL,0,'Cane Handles for bags','Cane Handles for bags',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,1,1,1,1,'2020-06-24 11:11:54','2020-07-21 01:46:04',1,'06/30/2020',NULL,NULL,0,0),(25,'Sue38861SN','normal',NULL,64,33,4,NULL,NULL,'Adepa sandals','adepa-sandals-sue38861sn','15933440935hMzTbzb.jpg','1593344093RtMU4xK1.jpg',NULL,NULL,NULL,NULL,NULL,5.172413793103448,6.0344827586206895,'Adepa sandals&nbsp;<br>',NULL,'<br>',1,42,NULL,NULL,NULL,2,NULL,0,'sandals','Adepa sandals',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,'2020-06-28 03:34:53','2020-07-21 01:46:15',0,NULL,NULL,NULL,0,0),(26,'Zjy4170RlR','normal',NULL,64,33,4,NULL,NULL,'Adepa collection','adepa-collection-zjy4170rlr','1593344378Nr06VG4U.jpg','1593344378wbes5q6u.jpg',NULL,NULL,NULL,NULL,NULL,13.793103448275863,17.24137931034483,'sandals and bag',NULL,'<br>',1,49,'sandals and bag',NULL,NULL,2,NULL,0,'sandals and bag','sandals and bag',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,0,'2020-06-28 03:39:38','2020-07-21 01:46:14',1,'07/31/2020',NULL,NULL,0,0),(27,'non4467EFZ','normal',NULL,64,33,4,NULL,NULL,'Ladies Purse','ladies-purse-non4467efz','15933445961jmiVZSk.jpg','1593344596vaVdO0fh.jpg',NULL,NULL,NULL,NULL,NULL,6.8965517241379315,8.620689655172415,'Ladies Purse<br>',NULL,'<br>',1,38,'Ladies Purse',NULL,NULL,2,NULL,0,'Ladies Purse','Ladies Purse',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,0,'2020-06-28 03:43:16','2020-07-21 01:46:12',1,'07/31/2020',NULL,NULL,0,0),(28,'cvt4627aqG','normal',NULL,64,33,4,NULL,NULL,'Ladies Sandals','ladies-sandals-cvt4627aqg','15933448699M1QtrZK.jpg','1593344869nyw4eiZy.jpg',NULL,NULL,NULL,NULL,NULL,2.586206896551724,4.310344827586207,'ladies Sandals',NULL,'<br>',1,47,'sandals',NULL,NULL,2,NULL,0,'ladies sandals','ladies sandals',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,0,'2020-06-28 03:47:48','2020-07-21 01:46:11',1,'07/31/2020',NULL,NULL,0,0),(29,'J9x7388t2V','normal',NULL,65,30,34,NULL,NULL,'Wild Flower Honey','wild-flower-honey-j9x7388t2v','1593437725wo1keLSQ.jpg','1593437725JIQfCIpF.jpg',NULL,'450g','1','0',NULL,4.310344827586207,6.0344827586206895,'100% raw natural honey&nbsp;',NULL,'<br>',1,86,'honey',NULL,NULL,0,'A week',0,'natural honey','natural honey',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,'2020-06-29 05:35:25','2020-07-21 01:46:01',0,NULL,NULL,NULL,0,0),(30,'XS0774004t','normal',NULL,65,35,27,NULL,NULL,'Wild Flower Honey','wild-flower-honey-xs0774004t','1593497862u6y1eByL.jpg','1593497862ppafDbmz.jpg',NULL,'625g','1','0',NULL,6.0344827586206895,8.620689655172415,'Wild Flower raw natural Honey<br>',NULL,'<br>',1,57,'Honey',NULL,NULL,0,NULL,0,'raw honey','Wild Flower Honey',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,0,'2020-06-29 05:38:20','2020-07-21 01:46:31',0,NULL,NULL,NULL,0,0),(31,'wTL2265uP3','normal',NULL,0,32,14,NULL,NULL,'Adihhub Magazine','adihhub-magazine-wtl2265up3','1593522568kp3AJuNK.png','1593522568u0FlzuZj.jpg',NULL,NULL,NULL,NULL,NULL,6.0344827586206895,8.620689655172415,'&nbsp;Adihhub Magazine&nbsp;',900,'<br>',1,48,'Magazine,Adihhub Magazine',NULL,NULL,0,'A week',0,'Adihhub Magazine,Magazine','Adihhub Magazine',NULL,'Physical',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,1,0,1,1,'2020-06-30 05:09:28','2020-07-21 01:46:09',1,'07/31/2020','900','5',0,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rating` tinyint(2) NOT NULL,
  `review_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replies`
--

DROP TABLE IF EXISTS `replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) unsigned NOT NULL,
  `comment_id` int(191) unsigned NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replies`
--

LOCK TABLES `replies` WRITE;
/*!40000 ALTER TABLE `replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL,
  `product_id` int(192) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (16,'Manager','orders , products , affilate_products , customers , vendors , vendor_subscription_plans , categories , bulk_product_upload , product_discussion , set_coupons , blog , messages , general_settings , home_page_settings , menu_page_settings , emails_settings , payment_settings , social_settings , language_settings , seo_tools , subscribers'),(17,'Moderator','orders , products , customers , vendors , categories , blog , messages , home_page_settings , payment_settings , social_settings , language_settings , seo_tools , subscribers'),(18,'Staff','orders , products , vendors , vendor_subscription_plans , categories , blog , home_page_settings , menu_page_settings , language_settings , seo_tools , subscribers');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seotools`
--

DROP TABLE IF EXISTS `seotools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seotools` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `google_analytics` text COLLATE utf8mb4_unicode_ci,
  `meta_keys` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seotools`
--

LOCK TABLES `seotools` WRITE;
/*!40000 ALTER TABLE `seotools` DISABLE KEYS */;
INSERT INTO `seotools` VALUES (1,'<!-- Global site tag (gtag.js) - Google Analytics -->\r\n<script async src=\"https://www.googletagmanager.com/gtag/js?id=UA-165935747-1\"></script>\r\n<script>\r\n  window.dataLayer = window.dataLayer || [];\r\n  function gtag(){dataLayer.push(arguments);}\r\n  gtag(\'js\', new Date());\r\n\r\n  gtag(\'config\', \'UA-165935747-1\');\r\n</script>','Afmak, Products made in Africa, Arts and craft, African made, made in Africa, indigenous arts, hand made');
/*!40000 ALTER TABLE `seotools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL DEFAULT '0',
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (2,0,'FREE SHIPPING','Free Shipping All Order','1561348133service1.png'),(3,0,'PAYMENT METHOD','Secure Payment','1561348138service2.png'),(4,0,'30 DAY RETURNS','30-Day Return Policy','1561348143service3.png'),(5,0,'HELP CENTER','24/7 Support System','1561348147service4.png'),(6,32,'Website Development','we develop state of the art websites with highly dedicated team to assist you on every step of the way for you to enjoy owning your own website','1593074942CAR SHOP.htm_20140416151401.jpg'),(7,32,'Social media Marketing Services','We are good at Social media Marketing Services and are very ready to help your business stand strong as a business and a brand','159307555308da8dcba3e7588bc9278d292c50a3be-round-web-contact-icons-set.jpg'),(8,32,'The best  Customer Service','We are specialize in The best  Customer Service \r\nTalk to us today and leave refreshed and happy','1593075688gfg.png'),(9,32,'The very best of Graphic Designing Skillis','The very best of Graphic Designing Skillis is what we assure you , at a very affordable price \r\nGive us a try today fro your business and you will never look back','1593075901category_13.jpg');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippings`
--

DROP TABLE IF EXISTS `shippings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shippings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL DEFAULT '0',
  `title` text,
  `subtitle` text,
  `price` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippings`
--

LOCK TABLES `shippings` WRITE;
/*!40000 ALTER TABLE `shippings` DISABLE KEYS */;
INSERT INTO `shippings` VALUES (1,0,'Free Shipping','(10 - 12 days)',0),(2,0,'Express Shipping','(5 - 6 days)',10);
/*!40000 ALTER TABLE `shippings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sliders` (
  `id` int(191) unsigned NOT NULL AUTO_INCREMENT,
  `subtitle_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subtitle_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_anime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `title_size` varchar(50) DEFAULT NULL,
  `title_color` varchar(50) DEFAULT NULL,
  `title_anime` varchar(50) DEFAULT NULL,
  `details_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details_size` varchar(50) DEFAULT NULL,
  `details_color` varchar(50) DEFAULT NULL,
  `details_anime` varchar(50) DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES (9,NULL,NULL,'#000000','fadeIn',NULL,NULL,'#000000','fadeIn',NULL,NULL,'#000000','fadeIn','1593949327Sat_4_07_2020_17_07_45.png','slide-two','https://afmak.com/user/login'),(10,NULL,NULL,'#000000','fadeIn',NULL,NULL,'#000000','fadeIn',NULL,NULL,'#000000','fadeIn','1593477924Tue_30_06_2020_00_39_53.png','slide-two','https://afmak.com/user/login'),(11,NULL,NULL,'#000000','fadeIn',NULL,NULL,'#000000','fadeIn',NULL,NULL,'#000000','fadeIn','1594452505Photo_1594412630010-1.png','slide-two','https://afmak.com/user/login');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_providers`
--

DROP TABLE IF EXISTS `social_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_providers` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_providers`
--

LOCK TABLES `social_providers` WRITE;
/*!40000 ALTER TABLE `social_providers` DISABLE KEYS */;
INSERT INTO `social_providers` VALUES (1,31,'10157893070205709','facebook','2020-05-08 07:24:56','2020-05-08 07:24:56'),(2,32,'10217248341548081','facebook','2020-06-01 01:32:51','2020-06-01 01:32:51'),(3,39,'2970264446394839','facebook','2020-06-15 14:15:18','2020-06-15 14:15:18'),(4,40,'10149999913168139','facebook','2020-06-21 22:55:49','2020-06-21 22:55:49'),(5,41,'2936767999703666','facebook','2020-06-22 01:04:39','2020-06-22 01:04:39'),(6,71,'10213353958323039','facebook','2020-07-14 14:05:20','2020-07-14 14:05:20');
/*!40000 ALTER TABLE `social_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialsettings`
--

DROP TABLE IF EXISTS `socialsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialsettings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gplus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dribble` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_status` tinyint(4) NOT NULL DEFAULT '1',
  `g_status` tinyint(4) NOT NULL DEFAULT '1',
  `t_status` tinyint(4) NOT NULL DEFAULT '1',
  `l_status` tinyint(4) NOT NULL DEFAULT '1',
  `d_status` tinyint(4) NOT NULL DEFAULT '1',
  `f_check` tinyint(10) DEFAULT NULL,
  `g_check` tinyint(10) DEFAULT NULL,
  `fclient_id` text COLLATE utf8mb4_unicode_ci,
  `fclient_secret` text COLLATE utf8mb4_unicode_ci,
  `fredirect` text COLLATE utf8mb4_unicode_ci,
  `gclient_id` text COLLATE utf8mb4_unicode_ci,
  `gclient_secret` text COLLATE utf8mb4_unicode_ci,
  `gredirect` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialsettings`
--

LOCK TABLES `socialsettings` WRITE;
/*!40000 ALTER TABLE `socialsettings` DISABLE KEYS */;
INSERT INTO `socialsettings` VALUES (1,'https://facebook.com/afmakcom/','https://www.instagram.com/afmakofficial/','https://twitter.com/afmakofficial','https://www.linkedin.com/mwlite/in/afmak-world-0102331b1','https://dribbble.com/',1,1,1,1,0,1,0,'247243813353089','80a97dcae4dfdf221c11d0d9fb7a8e97','https://afmak.com/auth/facebook/callback','904681031719-sh1aolu42k7l93ik0bkiddcboghbpcfi.apps.googleusercontent.com','yGBWmUpPtn5yWhDAsXnswEX3','https://afmak.com/auth/google/callback');
/*!40000 ALTER TABLE `socialsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategories` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `category_id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (2,33,'Textile','Textile',1),(3,33,'Jewellery','jewellery',1),(4,33,'Women','Ladies',1),(5,33,'Men','Guys',1),(6,33,'Kids','Children',1),(7,26,'Electronics','Digital-products',1),(8,25,'Toys','Toys',1),(9,25,'Clothing','Dress',1),(10,26,'Crafts','crafts',1),(11,26,'Fashion','Fashion',1),(12,32,'Videos & Movies','video',1),(13,32,'Audio Files','audio',1),(14,32,'E-Books','ebooks',1),(15,32,'Apps & Software','software',1),(16,34,'Graphic Design & Animation','graphics',1),(17,34,'Web Development','web',1),(18,34,'Health Care','health',1),(19,34,'Cooks','cooks',1),(20,28,'Kids','kids',1),(21,28,'Adult','adult',1),(22,31,'Agro Materials','agro',1),(23,31,'Natural Resources','resources',1),(24,31,'Industrail','industry',1),(25,27,'Furniture','Furniture',1),(27,35,'Farm Harvest','Harvest',1),(28,35,'Farm Animals','animals',1),(29,35,'Tubers','tubers',1),(30,35,'Cereals','cereals',1),(31,27,'Wood Works','wooden',1),(32,27,'Metal Works','metals',1),(33,27,'Plastics','plastics',1),(34,30,'Food Substances','substances',1),(35,30,'Drinks','drinks',1),(36,30,'Fruits & Vegetables','fruits--vegetables',1),(37,30,'Dairy, Meat / Fish / Eggs,','dairy-meat--fish--eggs',1),(38,34,'Social Media Marketing Services','software-services',1),(39,35,'Flowers','flowers',1),(40,35,'Fruits & Vegetables','fruits-and--vegetables',1),(41,27,'Clothing & Textile','fabrics',1),(42,32,'Books','books',1);
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribers` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers`
--

LOCK TABLES `subscribers` WRITE;
/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (7,'Unlimited','GHs','USD',150,365,0,'<img src=\"https://i.imgur.com/2MW15vv.png\" width=\"381\">'),(8,'Basic','$','USD',0,30,0,'<img src=\"https://i.imgur.com/kbdLcQY.png\" width=\"381\">');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notifications`
--

DROP TABLE IF EXISTS `user_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_notifications` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notifications`
--

LOCK TABLES `user_notifications` WRITE;
/*!40000 ALTER TABLE `user_notifications` DISABLE KEYS */;
INSERT INTO `user_notifications` VALUES (1,64,'W75S1593709005',0,'2020-07-02 08:56:45','2020-07-02 08:56:45'),(2,64,'t7bb1593710320',0,'2020-07-02 09:18:40','2020-07-02 09:18:40');
/*!40000 ALTER TABLE `user_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_subscriptions`
--

DROP TABLE IF EXISTS `user_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_subscriptions` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL,
  `subscription_id` int(191) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Free',
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `payment_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_subscriptions`
--

LOCK TABLES `user_subscriptions` WRITE;
/*!40000 ALTER TABLE `user_subscriptions` DISABLE KEYS */;
INSERT INTO `user_subscriptions` VALUES (81,27,5,'Standard','$','NGN',60,45,25,'<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>','Paystack','688094995',NULL,'2019-10-09 21:32:57','2019-10-09 21:32:57',1,NULL),(82,32,8,'Basic','$','USD',0,30,0,'<img src=\"https://i.imgur.com/kbdLcQY.png\" width=\"381\">','Free',NULL,NULL,'2020-06-09 01:22:43','2020-06-09 01:22:43',1,NULL),(83,38,8,'Basic','$','USD',0,30,0,'<img src=\"https://i.imgur.com/kbdLcQY.png\" width=\"381\">','Free',NULL,NULL,'2020-06-10 11:10:05','2020-06-10 11:10:05',1,NULL),(84,29,8,'Basic','$','USD',0,30,0,'<img src=\"https://i.imgur.com/kbdLcQY.png\" width=\"381\">','Free',NULL,NULL,'2020-06-16 12:12:49','2020-06-16 12:12:49',1,NULL),(85,43,8,'Basic','$','USD',0,30,0,'<img src=\"https://i.imgur.com/kbdLcQY.png\" width=\"381\">','Free',NULL,NULL,'2020-06-22 08:11:52','2020-06-22 08:11:52',1,NULL),(86,61,8,'Basic','$','USD',0,30,0,'<img src=\"https://i.imgur.com/kbdLcQY.png\" width=\"381\">','Free',NULL,NULL,'2020-06-27 03:29:16','2020-06-27 03:29:16',1,NULL),(87,64,8,'Basic','$','USD',0,30,0,'<img src=\"https://i.imgur.com/kbdLcQY.png\" width=\"381\">','Free',NULL,NULL,'2020-06-28 02:04:48','2020-06-28 02:04:48',1,NULL),(88,65,8,'Basic','$','USD',0,30,0,'<img src=\"https://i.imgur.com/kbdLcQY.png\" width=\"381\">','Free',NULL,NULL,'2020-06-29 03:38:11','2020-06-29 03:38:11',1,NULL),(89,67,8,'Basic','$','USD',0,30,0,'<img src=\"https://i.imgur.com/kbdLcQY.png\" width=\"381\">','Free',NULL,NULL,'2020-06-30 05:54:11','2020-06-30 05:54:11',1,NULL),(90,70,8,'Basic','$','USD',0,30,0,'<img src=\"https://i.imgur.com/kbdLcQY.png\" width=\"381\">','Free',NULL,NULL,'2020-07-13 05:45:19','2020-07-13 05:45:19',1,NULL);
/*!40000 ALTER TABLE `user_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_provider` tinyint(10) NOT NULL DEFAULT '0',
  `status` tinyint(10) NOT NULL DEFAULT '0',
  `verification_link` text COLLATE utf8mb4_unicode_ci,
  `email_verified` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `affilate_code` text COLLATE utf8mb4_unicode_ci,
  `affilate_income` double NOT NULL DEFAULT '0',
  `shop_name` text COLLATE utf8mb4_unicode_ci,
  `owner_name` text COLLATE utf8mb4_unicode_ci,
  `shop_number` text COLLATE utf8mb4_unicode_ci,
  `shop_address` text COLLATE utf8mb4_unicode_ci,
  `reg_number` text COLLATE utf8mb4_unicode_ci,
  `shop_message` text COLLATE utf8mb4_unicode_ci,
  `shop_details` text COLLATE utf8mb4_unicode_ci,
  `shop_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_url` text COLLATE utf8mb4_unicode_ci,
  `g_url` text COLLATE utf8mb4_unicode_ci,
  `t_url` text COLLATE utf8mb4_unicode_ci,
  `l_url` text COLLATE utf8mb4_unicode_ci,
  `is_vendor` tinyint(1) NOT NULL DEFAULT '0',
  `f_check` tinyint(1) NOT NULL DEFAULT '0',
  `g_check` tinyint(1) NOT NULL DEFAULT '0',
  `t_check` tinyint(1) NOT NULL DEFAULT '0',
  `l_check` tinyint(1) NOT NULL DEFAULT '0',
  `mail_sent` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_cost` double NOT NULL DEFAULT '0',
  `current_balance` double NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `ban` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (29,'Sharon Wuver',NULL,NULL,NULL,NULL,'Adako Jarchie','+233208449693',NULL,'selawuver@gmail.com','$2y$10$3p8xHiW/LSe0qJfAeS3eYOGjIhPgYLX6ZNiLWqBag2rMuBJIfWfKC','nSUyyeV95Keb7aTcUmX2QoL7r70SyMQ4ixIA4e8556mpwQoqQPIDHcKm0BO1','2020-05-01 18:31:54','2020-07-09 11:40:03',0,0,'6addde9752804459bfa4fa3618bbb794','Yes','02ca146b019b6cc31db9b3460b8d29a6',0,'Ronsie’s Crochets','Sharon Wuver','01','Adako Jarchie',NULL,'Leave a description of your desired crochet item and we will get back to you on it',NULL,'1594323603525EC9BE-DF1F-48A8-AAB9-B43E9053A6AF.jpeg',NULL,NULL,NULL,NULL,2,0,0,0,0,1,0,0,'2020-07-16',0),(30,'Mr Elvis Selorm Kalitsi',NULL,'00233',NULL,NULL,'Ashongman Estate','0208266322',NULL,'elsormeek@gmail.com','$2y$10$s8IhLQKRiRXCu.jeaCSpHuTv0X9Rw.wRkdzKzZxE7.9ZNf4ux2yxi','4GXsghMYwfeGqAsMk3uBMTenFsTTTT7OFGkyoeHDZrpx4VP6XaGL1GKijkbJ','2020-05-03 03:11:37','2020-06-27 10:59:38',0,0,'d1124a957b2a3b6e2f993a3ea378328d','No','ba6ace59d70983f06995721cf6be6d85',0,'Elsormeek Ventures','Mr Selorm Kalitsi','17','Ayigya Maxima-Tech','A01189','089','<br>',NULL,NULL,NULL,NULL,NULL,2,0,0,0,0,0,0,0,NULL,0),(31,'Max Shawndreck','https://graph.facebook.com/v3.0/10157893070205709/picture?width=1920',NULL,NULL,NULL,NULL,NULL,NULL,'me@shawndreck.com',NULL,'L1eW6hCbo3lrauDxf07VaAfX6DddQ7wBqbLc3Rl8wRhv7il6GPx6RVkJczTq','2020-05-08 07:24:56','2020-06-07 23:02:26',1,0,NULL,'Yes','2413fc32b4f3712ce16497edbe1d7654',81.55000000000001,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0),(32,'Elvis Selorm Kalitsi','https://graph.facebook.com/v3.0/10217248341548081/picture?width=1920','00233','Accra','Ghana','J11 Vra Akuse','0266122157',NULL,'elviskalitsi@gmail.com',NULL,'ruXLNsFu9n5UjELiWqV5QXrGjoVpMcJ5ybDdwuWXnuG2vkIvOyJa6dIZvJ0X','2020-06-01 01:32:51','2020-06-25 01:18:46',1,0,NULL,'Yes','1e5fdc8cabf943cbac49c34c63e53a93',0,'Web Consult','Mr Selorm Kalitsi','0208266322','Ashanti 123','A01189',NULL,'We are a software engineering firm&nbsp;','1591866370computer-t.jpg','https://web.facebook.com/Web-Solution-Ghana-594946557235253/','https://google.com/','https://twitter.com/','https://linkedin.com/',2,1,0,0,0,1,0,0,'2020-07-09',0),(33,'Nana Akua Nyarko',NULL,NULL,NULL,NULL,'Daban newsite','0540241484',NULL,'dorcasnyarko41@gmail.com','$2y$10$CY7BbbXEiobWvS0.LvDXuuNlikvYoNLHst2YQGxsv0OICdPtEF7B2','wAYQFdqPqVmLqRoK30KqITzMbsN5gSrkufwT1iJzwYt7PXxAdxxcQWSSCaJc','2020-06-04 03:06:48','2020-06-06 00:59:07',0,0,'8c181823197e060edabbdda8121fc1f3','Yes','29ca817791bdeb3b28d1a6649a3d8cba',0,'Goldies kitchen','Nana Akua','Ks 9961','Plot 11','0540241484','Selling of shito',NULL,NULL,NULL,NULL,NULL,NULL,2,0,0,0,0,0,0,0,NULL,0),(34,'Max Testing',NULL,NULL,NULL,NULL,'Accra','1234567',NULL,'ad@shawndreck.com','$2y$10$7TCl.uiamOzf3wu9Ou1M8.w9C1XGMcGl9OVd5y9k0h/4N4hpZatOq',NULL,'2020-06-07 17:43:23','2020-06-07 17:43:23',0,0,'b6a368cba8c4440332bf54745343edb8','No','cf866752d1bd3c2eb5558e873fc672cf',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0),(35,'Cynthia Abena Serwaa Appiah',NULL,NULL,NULL,NULL,'Oyarifa','0545925711',NULL,'abenaserwaa10@yahoo.com','$2y$10$cH0Y1Yr7KTfODNoqn5QwuO5D8Cxmbcme9tszWq9JnLribYXBhf26u',NULL,'2020-06-09 00:19:14','2020-06-09 00:19:14',0,0,'f24d7ffd0a2ecafc8df2882c58375e3f','No','ab8494a9c68519058d66278c5e2a2ee9',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0),(36,'shinystar ladyzu',NULL,NULL,NULL,NULL,'Kumasi - Aboabo','0241864161',NULL,'zulaiadamu10@gmail.com','$2y$10$Cb6QSQZw9q1E1iMpwynrJejCqpsw5843RWmB8SzJ38B1aOYVxK8Me',NULL,'2020-06-10 03:19:42','2020-06-10 03:19:42',0,0,'64c0c9c301da1a19508a3360568c9cfd','No','65cde772a0768aa27dd8a95fd9acf577',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0),(38,'EMB Ahenfie(KayaApp grocery)',NULL,NULL,NULL,NULL,'Ks 224,Adum- Kumasi, Dovewell Building, hapaSpace, Prempeh II Street, Adum','+233543219213',NULL,'info@embahenfie.org','$2y$10$PVVMIve3KQxHko/0jiqHgu9O9egfP4mmUErq3dPLZG7l4ffq9w5Ry',NULL,'2020-06-10 10:39:01','2020-06-10 11:10:05',0,0,'d954e74fa6590098c95cb6e6b7f16bcb','No','5fc3999d269c1dd0a097fa05f58d5bec',0,'KayaApp grocery shopping service','Maame Kaya','0543219213','Race Course Market, Bantama-Kumasi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,0,0,0,1,0,0,'2020-07-10',0),(39,'Asare Kwabena','https://graph.facebook.com/v3.0/2970264446394839/picture?width=1920',NULL,NULL,NULL,NULL,NULL,NULL,'kapo1612@hotmail.com',NULL,NULL,'2020-06-15 14:15:18','2020-06-15 14:15:18',1,0,NULL,'Yes','383642cb4dfade3059d1bc0f1d525be1',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0),(40,'Will Yangescu','https://graph.facebook.com/v3.0/10149999913168139/picture?width=1920',NULL,NULL,NULL,NULL,NULL,NULL,'qyfrinhdel_1576843347@tfbnw.net',NULL,'cyCvl9Yx5KsDo5zgcamhnXcdwcHc7HC6pA1hdz0ZtYFXeya7xHWG6peYsGre','2020-06-21 22:55:49','2020-06-21 22:55:49',1,0,NULL,'Yes','59c96c184bf2077c4198e36821dbd135',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0),(41,'Tonny Yeboah','https://graph.facebook.com/v3.0/2936767999703666/picture?width=1920',NULL,NULL,NULL,NULL,NULL,NULL,'tonny85@ymail.com',NULL,NULL,'2020-06-22 01:04:39','2020-06-22 01:04:39',1,0,NULL,'Yes','6aad3103746d45b4ca3eef5b4e3a6e1a',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0),(42,'Samuel Eze',NULL,NULL,NULL,NULL,'Madina','0507879257',NULL,'bishopsam.bs@gmail.com','$2y$10$oYcP.BBUx08u1VFSQPZy2OmYWv/tiSOI8Bb92Qnoe7j9dQWHZa9eW',NULL,'2020-06-22 04:43:48','2020-06-22 04:44:50',0,0,'7113bf91e4bdbf8733dc5e81f4ba2bd1','Yes','f9e7bd3aaab8f4b5825a72ad074b6a06',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0),(43,'Harriet Owusu-Afriyie Werekowaah',NULL,NULL,NULL,NULL,'KS14557','0540968917',NULL,'harrietafriyie83@yahoo.com','$2y$10$lgU8x/NRHpzJnqy0qRo7fOlJlgXT3YpyR2UIiiqwUbrNnRkfCAsA6','BtJ6ITM63tC0PAX6z9T3e3ZtksqzQ80kAswVIC8vdPVxobLfxJCXsHaN7awo','2020-06-22 05:36:33','2020-06-22 08:11:52',0,0,'47e39ed02ab98f75c82a07a836ea5231','No','30c3efd31267340428de13bb6f431a81',0,'Destiny shoes palace','Harriet Owusu Afriyie Werekowaah','80','KS14557',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,0,0,0,1,0,0,'2020-07-22',0),(44,'Anthony Akwasi Yeboah',NULL,NULL,NULL,NULL,'Post office box 59','0240969221',NULL,'kbadu85@gmail.com','$2y$10$bLAbDQuIdHFfEe9YCqM27ehr2uk3bWZMe/Y3sUza5NytwnfS.gckK','25kRM8XgN1peAI0JtXwZUC7JzozEaDeLAXiWSKLKOZ86xXB2Ey0wyMwBVhc1','2020-06-22 06:41:32','2020-06-22 13:26:50',0,0,'c8723500e35a15f3059c606647301c1c','No','893891ee099b57ed1f7177f9802e538c',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0),(45,'Nii Marmah',NULL,NULL,NULL,NULL,'Jamestown off Bannerman road','0201606701',NULL,'maama55@yahoo.co.uk','$2y$10$gNqZcjRz6MMw/5xzEGVuxe9yyiMH64Gkt8AZO2WV1GomIM8vYHPn6','NowmnFP0krUPy20hqREzpHaGTUiiRtcCIMGAgBeooILLvbM9Ff4PyrY90bmE','2020-06-22 09:22:49','2020-06-22 09:39:45',0,0,'e35cdf2d6c4ffd2df6285543afdc0e54','No','74b7c4e3399ecc9f80dccf7cd800f794',0,'Jamestown boutique','Nii Marmah','0277456816','1st Bannerman road Jamestown','ET001962016','Call or reach out to 247',NULL,NULL,NULL,NULL,NULL,NULL,2,0,0,0,0,0,0,0,NULL,0),(46,'Anthony Akwasi Yeboah',NULL,NULL,NULL,NULL,'Post office box 59','0240969221',NULL,'thetonnyshow20@gmail.com','$2y$10$k0J0E9pkMRSP4jXOopW6U.SRjAJPfDfE/YI9vpftIPiSlhw3cy.72',NULL,'2020-06-22 13:33:25','2020-07-05 17:55:30',0,0,'954d792f42f58076d0aa8daa3e9420ef','Yes','468ee13db418ed1bf3773a52efdf9882',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0),(47,'DavlMal',NULL,NULL,NULL,NULL,'Swanlake','0209238719',NULL,'malwinebabee@gmail.com','$2y$10$9xpKT6j9hCvZqdlgPl9fA.pqq281DCsMU.7BvQZYSGY.jg7XvzIJS','zbGWGFmoIdxPkuT9Tykxi0HFPakufseuCzFiztaGg99ikAxNrfkpaPrqgPgF','2020-06-23 10:26:33','2020-06-23 11:45:35',0,0,'8885c80a564998f98c6ea49bdc85d42b','Yes','382aa1310aad1ebf10c045a304b082df',0,'DavMal','Malwine','12','Swanlake','324','Hi',NULL,NULL,NULL,NULL,NULL,NULL,2,0,0,0,0,0,0,0,NULL,0),(48,'Daniel Aparimasa',NULL,NULL,NULL,NULL,'Kumasi Ghana','0206112221',NULL,'tintyfoods@gmail.com','$2y$10$onX5T1L3fiqNwHphS85KY.mWfY5s1/mzvAWtf4UcgbqjwaLeCAqii',NULL,'2020-06-24 00:19:05','2020-06-24 00:19:05',0,0,'6414d02742dc82d81f980e896698a990','No','33139cc0d4a7dbb8914116cfe469c0d6',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0),(58,'Max',NULL,NULL,NULL,NULL,'Accra','1234567890',NULL,'shawndreck@gmail.com','$2y$10$ymvkjuqvrbhAaxQUma0x5enPyLbqFailoboQ/gM4xqbDX1shMY3r6',NULL,'2020-06-25 11:13:55','2020-06-25 11:13:55',0,0,'977a6d4d7d3698a6b5c07bd26535c714','No','913859197f08ec09a1d5fd61abd1cb21',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0),(59,'Kwame Akable',NULL,NULL,NULL,NULL,'C/o Charles Anachanser p.o.box 16890AN','+233243939819',NULL,'albertinycom@yahoo.com','$2y$10$l9jGlSgiqJ0swJJo.07FvOFQM1OrjIuBxXg.xViNattlTkyvV1.9e',NULL,'2020-06-27 02:05:00','2020-06-27 02:05:00',0,0,'2160facf1e2d86806aa095608739794a','No','43258d5ecc0102bdfb6bda851a5b68a3',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0),(60,'Kwame Akable',NULL,NULL,NULL,NULL,'C/o Charles Anachanser p.o.box 16890AN','+233243939819',NULL,'albertinycom83@gmail.com','$2y$10$dWByx6WxiEIbelrO7lz24.ZgfOqb8N4rTG85xZToSTCMlwmq/jDnK',NULL,'2020-06-27 02:05:43','2020-06-27 02:07:25',0,0,'e7d8de55d8420e05c91748b831f25cb5','Yes','c689c5dbb659cd693408feae84de85bf',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0),(61,'Kobla',NULL,NULL,NULL,NULL,'J11 Vra Akuse','0266122157',NULL,'selormkal926@gmail.com','$2y$10$dbSG6WdKSBCKLsnWy2iZ6et8/gWwi7zp9bgyNkQtx1cIvs.aq2eMG',NULL,'2020-06-27 03:23:28','2020-06-27 06:10:35',0,0,'ad9498776eaa2490149d4e111f13f4dc','Yes','c8522e6df3560e8990fce4bb651c83db',0,'Accomodation Finders','Kobla Kal','0266122157','Ayigya Maxima-Tech','A01','0266122157',NULL,'15932670354af6a81dace8ffd46294e0f4d832f42c.jpg',NULL,NULL,NULL,NULL,2,0,0,0,0,1,0,0,'2020-07-27',0),(62,'Ibrahim Sarpong',NULL,NULL,NULL,NULL,'Kumasi','0267570256',NULL,'sagbrain.2uk@googlemail.com','$2y$10$06Q9ffkZFdGXjRAQsFvqLeduB0GZcPW.F7uJ4xWhXii.XI8BuSvS2',NULL,'2020-06-27 07:52:55','2020-06-28 05:02:31',0,0,'4428321cda4a2a870ed0a67e65859bcb','Yes','28e7af8130ef4704b9ecef1426e082c6',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0),(63,'FRANCIS NSIAH',NULL,NULL,NULL,NULL,'OFFINSO ADUKRO','0240980199',NULL,'meazmaestro099@gmail.com','$2y$10$mrWR1F9sRF7SMdf5LTGHl.0VnFpLOlPERPSVArk2NwugB130GEtlW',NULL,'2020-06-27 23:07:36','2020-06-27 23:10:31',0,0,'638dfed32c0d8f7276cfc09b2827193a','Yes','f691c8d5be6af3c26346989a986cdfd7',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0),(64,'Mary Otchere',NULL,'00233','Accra','Ghana','Ayigya Maxima','0242836165',NULL,'otcheremary49@gmail.com','$2y$10$02dH.9mBfsYb9NqHw0QroOJ2NRgS6o9M4oFyYn6hJXCf6w105FouK','uGa06q3Pm2q3rHprnuy8buWJIF6seBlELeMyUNdCClgxYYHb30I76ZjFAF90','2020-06-28 01:59:14','2020-06-28 02:13:45',0,0,'4bebf945b9db93e8bf41a93cf0f4ac3b','Yes','7bc642bcc2d323d5c4f6d161354e9451',0,'adepa','Mary Otchere','0242836165','Ayigya','83667','0242836165',NULL,NULL,NULL,NULL,NULL,NULL,2,0,0,0,0,1,0,0,'2020-07-28',0),(65,'Crescent moon limited',NULL,NULL,NULL,NULL,'Box SE 2357 Suame ksi','0247555682',NULL,'crescentmooncomltd@gmail.com','$2y$10$59Rc/0KshRflMKeLQNwm5eKZWOK6RX8XWGQYjK3fQP9zpBpbKRtDe','0fi9A9KTHW67MCvFQoskR3WmnNAg66APu7Q8toxOAuCZcGGCDJcq58rfCfn4','2020-06-28 17:27:41','2020-06-29 03:38:11',0,0,'8b3b9a0c464893ed3cc2255fa0c2970d','Yes','192e0c5f557f9071940be8a23f85f579',0,'Crescent moon','Owusu krah richmond','0247555682','Box SE 2357 Suame ksi',NULL,'Our honey is unheated and unprocessed. \r\nIt’s in it’s raw and natural form',NULL,NULL,NULL,NULL,NULL,NULL,2,0,0,0,0,1,0,0,'2020-07-29',0),(66,'Emmanuel Amoh-Obeng',NULL,NULL,NULL,NULL,'Korle bu','0552346759',NULL,'amohobeng@gmail.com','$2y$10$VVk3PLQ74pU4GRdI2w7UJO6DJqRTwNp1M1.GLu2sfumTpPiVOdFva','OrWfv38ujlRl2rWnn6FXBJKsms5INiKCPVvKH2dWyJIBLfqEW1j46wYnu1Sg','2020-06-30 05:46:41','2020-06-30 05:47:29',0,0,'4a933c8c199a4b34e9a5357cf6cf4771','Yes','48c0cac48f5fd64aa24413f49a8ed36b',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0),(67,'Emmanuel Amoh-Obeng',NULL,NULL,NULL,NULL,'Korle bu','0552346759',NULL,'twilearningcenter@gmail.com','$2y$10$PGviwpjGNCVxGMJj735poOxVIn9ucAe4WJ2uIFTn7CxLbGppmnZSS','Md6epdhzrNNO0yDuKCxERsW9CsJFeM36jq7qhch5jT6evkcxB1EHs6vM0NTT','2020-06-30 05:49:49','2020-06-30 05:54:11',0,0,'4dd09ab035d26c9f8c0dceede7e83a83','Yes','d9aaa44f8dca6772da29ecd0651a8079',0,'TLC','Emmanuel Amoh-Obeng','+233552346759','Accra - Ghana ??',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,0,0,0,1,0,0,'2020-07-30',0),(68,'Ernest Obeng',NULL,NULL,NULL,NULL,'P. O. Box 2, Accra - Nungua','+233204831553',NULL,'ernieobeng1@gmail.com','$2y$10$xLaaGsIXSCDHkfaTaVFKKub/RlXBgBmHioOi2Y58XLkAG8Dmt6wS2',NULL,'2020-06-30 09:59:46','2020-06-30 19:57:27',0,0,'5f77ce2cd442d5baad397fd6cfd6e789','Yes','e3071b7ea75fb357248cb9026b84ac88',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0),(69,'theodora moses',NULL,NULL,NULL,NULL,'community 20, spintex','0242284359',NULL,'theodoramoses98@gmail.com','$2y$10$XfjdrWwYpBJ9cFE.DWGTUO9Ko59SXNP1edYuQ8HUnpe60ToqkmIIW',NULL,'2020-07-02 02:34:04','2020-07-02 02:34:40',0,0,'f5981fbea6bb5e83b4b350bd5a9e990a','Yes','157ff754ed027977e2d2955eb37d707d',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0),(70,'Kofi Degato',NULL,NULL,NULL,NULL,'Gz 098 7794','05412127i0',NULL,'Kdegato@yahoo.com','$2y$10$AMTshQlxrrh339d8cLch3OrOTA7PyqQGhf5Hp6s1zM2sht3ottxL6','1hihNdpSQTfgblLnc8E0zw26FwFTb9gBBUiaNp9pEi2kllx4XkzwKu4D5AMn','2020-07-13 04:57:31','2020-07-13 05:45:19',0,0,'30ef431268d4b455f52f69269b39a744','Yes','d5e094cc8f3eba98224c5e1881ff190f',0,'Lij Enterprise','Kofi Degato','0541212780','GZ 098 7794','1212780',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,0,0,0,1,0,0,'2020-08-12',0),(71,'Seth Ofori Twumasi','https://graph.facebook.com/v3.0/10213353958323039/picture?width=1920',NULL,NULL,NULL,NULL,NULL,NULL,'sethofori83@yahoo.com',NULL,NULL,'2020-07-14 14:05:20','2020-07-14 14:05:20',1,0,NULL,'Yes','bdea6d98a75d6fdd5edc227871197756',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_orders`
--

DROP TABLE IF EXISTS `vendor_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_orders` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL,
  `order_id` int(191) NOT NULL,
  `qty` int(191) NOT NULL,
  `price` double NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_orders`
--

LOCK TABLES `vendor_orders` WRITE;
/*!40000 ALTER TABLE `vendor_orders` DISABLE KEYS */;
INSERT INTO `vendor_orders` VALUES (1,64,2,1,7.72,'W75S1593709005','pending'),(2,64,3,1,7.72,'t7bb1593710320','pending');
/*!40000 ALTER TABLE `vendor_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verifications`
--

DROP TABLE IF EXISTS `verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verifications` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) NOT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('Pending','Verified','Declined') DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `admin_warning` tinyint(1) NOT NULL DEFAULT '0',
  `warning_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verifications`
--

LOCK TABLES `verifications` WRITE;
/*!40000 ALTER TABLE `verifications` DISABLE KEYS */;
INSERT INTO `verifications` VALUES (1,30,NULL,NULL,NULL,1,'shop number 17','2020-06-05 23:21:40','2020-06-05 23:21:40'),(2,30,'15930739763532_498232200213568_961844200_n.png.jpg','Verified','17',0,'shop number','2020-06-06 01:03:19','2020-06-25 00:34:00'),(3,45,NULL,NULL,NULL,1,'confirm your email','2020-06-24 02:50:53','2020-06-24 02:50:53'),(4,47,NULL,NULL,NULL,1,'Enter prove of your Tin Numer or your shop number','2020-06-25 00:35:38','2020-06-25 00:35:38'),(5,45,NULL,NULL,NULL,1,'Enter prove of your Tin Numer or your shop number','2020-06-25 00:35:58','2020-06-25 00:35:58'),(6,43,NULL,NULL,NULL,1,'Enter prove of your Tin Numer or your shop number','2020-06-25 00:36:08','2020-06-25 00:36:08'),(7,38,NULL,NULL,NULL,1,'Enter prove of your Tin Numer or your shop number','2020-06-25 00:36:22','2020-06-25 00:36:22'),(8,33,NULL,NULL,NULL,1,'Enter prove of your Tin Numer or your shop number','2020-06-25 00:36:33','2020-06-25 00:36:33'),(9,32,'15930745263532_498232200213568_961844200_n.png.jpg','Verified','1',0,'Enter prove of your Tin Numer or your shop number','2020-06-25 00:36:53','2020-06-25 07:36:16'),(10,29,NULL,NULL,NULL,1,'Enter prove of your Tin Numer or your shop number','2020-06-25 00:37:04','2020-06-25 00:37:04');
/*!40000 ALTER TABLE `verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlists` (
  `id` int(191) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(191) unsigned NOT NULL,
  `product_id` int(191) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
INSERT INTO `wishlists` VALUES (3,22,101),(4,22,100),(5,22,99),(6,22,97),(7,22,106),(8,22,105),(9,22,104),(10,22,107),(11,22,109),(12,22,119),(13,22,118),(14,22,117),(15,22,116),(16,40,14),(17,65,30);
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdraws`
--

DROP TABLE IF EXISTS `withdraws`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `withdraws` (
  `id` int(191) NOT NULL AUTO_INCREMENT,
  `user_id` int(191) DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `swift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `amount` float DEFAULT NULL,
  `fee` float DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('pending','completed','rejected') NOT NULL DEFAULT 'pending',
  `type` enum('user','vendor') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdraws`
--

LOCK TABLES `withdraws` WRITE;
/*!40000 ALTER TABLE `withdraws` DISABLE KEYS */;
INSERT INTO `withdraws` VALUES (1,31,'Skrill','me@shawndreck.com',NULL,NULL,NULL,NULL,NULL,'Testing affiliate redraw',11.38,5.862,'2020-06-05 15:51:02','2020-06-05 15:55:01','completed','user'),(2,31,'Skrill','me@shawndreck.com',NULL,NULL,NULL,NULL,NULL,NULL,15.15,6.0605,'2020-06-08 07:02:26','2020-06-08 07:02:26','pending','user');
/*!40000 ALTER TABLE `withdraws` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-21 18:54:15
