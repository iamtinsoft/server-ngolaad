-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: tinsdghh_ngolaad
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `about`
--

DROP TABLE IF EXISTS `about`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `about` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_general_ci NOT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `imageUrl` text COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about`
--

LOCK TABLES `about` WRITE;
/*!40000 ALTER TABLE `about` DISABLE KEYS */;
INSERT INTO `about` VALUES (1,' We are a fast growing Consulting Company','<p>Through helping organisations mitigate risks and continuously improve their brands, we drive positive, sustainable change for our clients and society at large.</p>\n<p>&nbsp;</p>\n<p>At Ngolaad, our mission is to deliver sustainable solutions that align with our client\'s vision. The insights and quality services we provide help build trust and confidence in any market. We develop outstanding professionals who team to deliver on our promises to all our stakeholders. In so doing, we play a critical role in building a better working culture for our people, our clients and our communities.</p>\n<p>&nbsp;</p>\n<p>Through our four integrated service lines &mdash; Consulting, Managed Services, Training and Mentoring and our deep sector knowledge, we help our clients to capitalise on new opportunities and manage risk to deliver sustainable growth. Our high-performing, multidisciplinary teams help them fulfil regulatory requirements, define strategic direction and meet stakeholder needs. We work continuously to improve the quality of all our services, investing in our people and innovation. And we&rsquo;re proud to work with others &ndash; from our clients to wider stakeholders &ndash; to use our knowledge, skills and experience to help achieve our mission and deliver positive change.</p>','uploads/2024-03-09T09:17:41.977Z-about new.jpeg','2024-03-09 03:26:20',1);
/*!40000 ALTER TABLE `about` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(500) NOT NULL,
  `lastLogin` varchar(20) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Victor','Fadipe','viktinho56@gmail.com','$2a$10$8ocCC.xqlQm3ticke1zy1uN5fL.DNGPVrUZ4hOxSIKvba/4adHi4m','2024-01-30 11:54:13','2024-01-30 11:54:13',1),(2,'Ibraheem','Janet','victor.developer@tritekconsulting.co.uk','$2a$10$rsoXoMqD1fUJ2sHOlQkfb.yQMBsjrqf99..XzZLyrh53aSzXl9lEa','2/7/2024','2024-02-07 11:46:20',0),(3,'Ola','Adeyeemo','ola.adeyemo@ngolaad.com','$2a$10$0uq5TAQI8C2Xtb5RTfI3J.A.ulLw//2V0I7fnq1uiNI2Jwq.tgH4C','2/8/2024','2024-02-08 13:17:40',1),(4,'Ngozi','Ba','ngozi@ngolaad.com','$2a$10$6ERraDQZXwPg80oKBc8T/.N.rT8Y0SC5Btg64Ye5/N1987sbrC.oy','2/8/2024','2024-02-08 13:24:18',1);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naame` text NOT NULL,
  `email` text NOT NULL,
  `mobile` text NOT NULL,
  `alternativePhoneNo` text NOT NULL,
  `appointmentDate` text NOT NULL,
  `appointmentTime` text NOT NULL,
  `message` text NOT NULL,
  `privacy` varchar(45) DEFAULT NULL,
  `status` int NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_study`
--

DROP TABLE IF EXISTS `case_study`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_study` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `imageCover` text NOT NULL,
  `content` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_study`
--

LOCK TABLES `case_study` WRITE;
/*!40000 ALTER TABLE `case_study` DISABLE KEYS */;
INSERT INTO `case_study` VALUES (1,'D365','d365','uploads/2024-02-10T23:07:57.607Z-case study 2.jpeg','<h2><strong>What was our client\'s requirement?</strong></h2>\n<p>Our client is a top Tier analytical Service Company that deals with lot of credit, banking, and financial information.</p>','2024-02-10 18:07:57',1);
/*!40000 ALTER TABLE `case_study` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clientName` varchar(100) NOT NULL,
  `clientLogo` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (2,'Residential Management Group','uploads/2024-02-08T19:22:42.439Z-rmg-logo.png','2024-02-07 12:27:10',1),(4,'Lloyds Banking Group','uploads/2024-02-08T19:23:42.603Z-lloyds-bank-300.png','2024-02-07 12:46:54',1),(5,'RBS','uploads/2024-02-08T19:25:05.928Z-Logos-510x288-RBS.jpg','2024-02-08 11:41:47',1),(7,'HMRC','uploads/2024-02-10T22:10:58.731Z-HMRC.png','2024-02-08 14:29:56',1),(9,'UKHSA','uploads/2024-02-10T22:12:22.283Z-UKHSA.jpeg','2024-02-08 14:34:56',1);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `courseName` varchar(100) NOT NULL,
  `courseCover` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (5,'Workplace Communication','uploads/2024-02-08T19:51:58.028Z-thquake-13.webp','<p>Effective communication is essential to all organisations. This includes both internal communication with staff and external communication, e.g. with customers or suppliers. &nbsp;Communication skills are highly sought after by employers in all roles, especially in leadership roles. Whilst it is important for employability, it is also essential for promotion and job satisfaction.</p>\n<p>&nbsp;</p>\n<p>This course offers participants the knowledge, practices, tools, skills and process needed to become an effective communicator.</p>\n<p>&nbsp;</p>\n<p><strong>Course Outline</strong></p>\n<ul>\n<li>What is communication?&nbsp;</li>\n<li>Effective communication process</li>\n<li>7 Cs of Communication&nbsp;</li>\n<li>Effective communication skills</li>\n<li>Basic Communication Styles</li>\n<li>Workplace verbal communication</li>\n<li>Workplace written communication</li>\n<li>The STAR Technique</li>\n</ul>\n<p>&nbsp;</p>\n<p><img src=\"https://community.thriveglobal.com/wp-content/uploads/2018/07/workplace-training-wordcloud5-post.jpg\" alt=\"Fostering Effective Workplace Communication - Thrive Global\" width=\"391\" height=\"206\"></p>','2024-02-08 14:46:15',1),(9,'Become a KYC | AML ANALYST','uploads/2024-03-23T08:01:25.131Z-KYC.webp','<p><img src=\"https://img.freepik.com/free-vector/red-grunge-style-coming-soon-design_1017-26691.jpg?size=626&amp;ext=jpg&amp;ga=GA1.1.1395880969.1709596800&amp;semt=ais\" alt=\"Page 2 | Movie Coming Soon Sign Images - Free Download on Freepik\" width=\"311\" height=\"207\"></p>\n<p>&nbsp;</p>\n<p><img src=\"https://penneo.com/wp-content/uploads/2022/04/kyc-requirements.png\" alt=\"KYC, AML, and CDD: What Is the Difference? - Penneo\" width=\"321\" height=\"193\"><img src=\"https://penneo.com/wp-content/uploads/2022/04/aml-requirements.png\" alt=\"KYC, AML, and CDD: What Is the Difference? - Penneo\" width=\"325\" height=\"195\"></p>','2024-03-23 04:01:25',1),(10,'PMO','uploads/2024-03-23T08:06:41.317Z-Banner-image-Project-Management-is-not-about-Project-Anymore.webp','<p>A project management office functions as a regulatory commission that seeks to standardize the execution of projects in order to maintain productivity. A PMO offers guidance to project managers and develops metrics on the practice of project management.</p>\n<p>&nbsp;</p>\n<p>This course offers participants the knowledge, tools and skills needed to become a Project Management Office Manager.</p>\n<p>&nbsp;</p>\n<p>Participants will receive practical learning experience.</p>\n<p>&nbsp;</p>\n<p><strong>Course Outline</strong></p>\n<ul>\n<li>PMO Framework</li>\n<li>PMO Roles and Responsibilities</li>\n<li>PMO Functions</li>\n<li>Workload Management</li>\n<li>Resource Management</li>\n<li>PMO Reports</li>\n<li>PMO Tools</li>\n</ul>\n<p>&nbsp;</p>\n<p>Please&nbsp;<a href=\"../../../contact-us\"><strong>contact us</strong></a> for further information.</p>\n<p>&nbsp;</p>\n<p><img src=\"https://www.orangescrum.com/img/home_outer/tutorial/webp/Chapter4-2-v1.webp\" alt=\"Project Management Office and Its Role | Orangescrum Tutorial\" width=\"694\" height=\"339\"></p>','2024-03-23 04:06:41',1),(11,'Project Management','uploads/2024-03-23T08:10:32.303Z-project-management.webp','<p>This training course provides you with effective project management skills required to manage a project from initiation to closure, using relevant project management frameworks and tools. It shows you the pitfalls in project management and how to avoid them.</p>\n<p>&nbsp;</p>\n<p>This course offers participants the knowledge, tools, techniques and skills needed to become a proficient Project Manager.</p>\n<p>&nbsp;</p>\n<p>Participants will receive practical learning experience.</p>\n<p>&nbsp;</p>\n<p><strong>Course Outline</strong></p>\n<ul>\n<li>Fundamentals of Project Management</li>\n<li>Project Methodologies</li>\n<li>Project Life-cycle</li>\n<li>Quality and Go-Live Management</li>\n<li>Risk Management</li>\n<li>Conflict Management</li>\n<li>Stakeholder Management&nbsp;</li>\n<li>Project Management Tools e.g Jira, MSP</li>\n</ul>\n<p>&nbsp;</p>\n<p>Please <a href=\"../../../contact-us\"><strong>contact us</strong></a> for further information.</p>\n<p>&nbsp;</p>\n<p><img src=\"https://instituteprojectmanagement.com/wp-content/uploads//2022/10/2_1.jpg\" alt=\"What is Project Management? - Institute of Project Management\" width=\"745\" height=\"409\"></p>','2024-03-23 04:10:32',1),(12,'Business Analysis','uploads/2024-03-23T08:13:31.255Z-business-analyst-min.jpg','<p>With a strong focus on predefined business needs, business analysts identify problems, opportunities and needs of a company. They offer solutions and also help implement them. Our business analysis training offers participants the tools and techniques needed to proffer business solutions that are aligned with corporate strategic vision.</p>\n<p>&nbsp;</p>\n<p>This course offers participants the tools, techniques and skills needed to analyse business needs and support organisation in implementing solutions that align with the strategic vision.</p>\n<p>&nbsp;</p>\n<p>Participants will receive practical learning experience.</p>\n<p>&nbsp;</p>\n<p><strong>Course Outline</strong></p>\n<ul>\n<li>Fundamentals of Business Analysis</li>\n<li>Strategic Analysis</li>\n<li>Use Cases &amp; Modelling</li>\n<li>Requirement Engineering</li>\n<li>Software Development Life Cycle (SDLC)</li>\n<li>BA Tools</li>\n</ul>\n<p>&nbsp;</p>\n<p>Please <a href=\"../../../contact-us\"><strong>contact us</strong></a> for further information.</p>\n<p>&nbsp;</p>\n<p><img src=\"https://quintagroup.com/services/service-images/business-analysis.jpg\" alt=\"Business analysis services &mdash; Quintagroup\" width=\"689\" height=\"372\"></p>','2024-03-23 04:13:31',1);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission`
--

DROP TABLE IF EXISTS `mission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission`
--

LOCK TABLES `mission` WRITE;
/*!40000 ALTER TABLE `mission` DISABLE KEYS */;
INSERT INTO `mission` VALUES (1,'<p>At Ngolaad, our mission is to deliver sustainable solutions that align with our client\'s vision. The insights and quality services we provide help build trust and confidence in any market. We develop outstanding professionals who team to deliver on our promises to all our stakeholders.</p>\n<p><img src=\"https://www.tradepressservices.com/wp-content/uploads/2019/09/Mission-Statements.jpg\" alt=\"How to Develop Corporate Mission Statements - Trade Press Services\" width=\"178\" height=\"134\"></p>','2024-02-10 14:58:47',1);
/*!40000 ALTER TABLE `mission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privacy`
--

DROP TABLE IF EXISTS `privacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privacy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privacy`
--

LOCK TABLES `privacy` WRITE;
/*!40000 ALTER TABLE `privacy` DISABLE KEYS */;
INSERT INTO `privacy` VALUES (1,'<p><strong>INTRODUCTION</strong></p>\n<p>1.1 This is the privacy policy referred to in the Terms of Use.<br>1.2 Terms defined in this privacy policy shall have the meanings given to them in the Terms of Use on Ngolaad.com<br>1.3 For the purpose of the Data Protection Act 2018 (the &ldquo;Act&rdquo;), the data controller is Abiodun Adeyemo reachable via info@ngolaad.com. &ldquo;Data&rdquo; and &ldquo;Personal Data&rdquo; have the meanings given to them in the Act.<br>1.4 This privacy policy (together with our terms of and any other documents referred to in it) sets out the basis on which any Personal Data we collect from you, or that you provide to us, will be processed by us.<br>1.5 Please read the following carefully to understand our views and practices regarding your personal data and how we will treat it. By visiting the website, you are accepting and consenting to the practices described in this policy. Any questions at all about this policy or the website, please email&nbsp;info@ngolaad.com<br>1.6 Our nominated representative for the purpose of the Act is&nbsp;<strong>Mr. </strong><strong>A. Adeyemo</strong></p>\n<p>&nbsp;</p>\n<p><strong>2. INFORMATION WE COLLECT FROM YOU</strong></p>\n<p>2.1 We will collect and process the following data about you:<br>(a) Information you give us. This is information about you that you give us by filling in forms on the website or by corresponding with us by phone, e-mail, or otherwise. It includes information you provide when you register to use the website, subscribe to our service, search for a product, place an order with us, participate in discussion boards or other social media functions on our site, enter a competition, promotion or survey, click and use links provided throughout, use and engage with the website in any way and when you report a problem with the website. The information you give us may include your name, address, e-mail address and phone number, financial and credit card information, personal description and photograph;</p>\n<p>(b) Information we collect about you. With regard to each of your visits to the Website we will automatically collect the following information:<br>&bull; technical information, including the Internet protocol (IP) address used to connect your computer or alternative device to the Internet, your login information, browser type, and version, time zone setting, browser plug-in types and versions, operating system and platform; and<br>&bull; information about your visit, including the full Uniform Resource Locators (&ldquo;URL&rdquo;), clickstream to, through and from the Website (including date and time), products you viewed or searched for&rsquo; page response times, download errors, length of visits to certain pages, page interaction information (such as scrolling, clicks, and mouse-overs), methods used to browse away from the page, and any phone number used to call our customer service number.</p>\n<p>(c) Information we receive from other sources. This is the information we receive about you if you use any of the other Websites we operate or the other services we provide. We are working closely with third parties (including, for example, business partners, sub-contractors in technical, payment and delivery services, advertising networks, analytics providers, search information providers, credit reference agencies). We will notify you when we receive information about you from them and the purposes for which we intend to use that information.</p>\n<p>&nbsp;</p>\n<p><strong>3. USES OF THE INFORMATION</strong></p>\n<p>We use information held about you in the following ways:<br>3.1 Information you give to us. We will use this information:<br>(i) to carry out our obligations arising under the terms of use;<br>(ii) to provide you with information about other goods and services that are similar to those that you have already purchased, enquired about or otherwise engaged with;<br>(iii) to notify you about changes to the Website; and<br>(iv) to ensure that content from the website is presented in the most effective manner for you and for your computer or internet-enabled device.<br>3.2 Information we collect about you.<br>We will use this information:<br>(a) to administer the Website and for internal operations, including troubleshooting, data analysis, testing, research, statistical and survey purposes;<br>(b) to improve the Website to ensure that content is presented in the most effective manner for you and for your computer or internet-enabled device;<br>(c) to allow you to participate in interactive features of our service when you choose to do so;<br>(d) as part of our efforts to keep the Website safe and secure;<br>(e) to measure or understand the effectiveness of advertising we serve to you and others, and to deliver relevant advertising to you; and<br>(f) to make suggestions and recommendations to you and other users of the Website about goods or services that may interest you or them.<br>3.3 Information we receive from other sources. We will combine this information with the information you give to us and the information we collect about you. We will use this information and the combined information for the purposes set out above (depending on the types of information we receive).</p>\n<p>&nbsp;</p>\n<p><strong>4. DISCLOSURE OF YOUR INFORMATION</strong></p>\n<p>(a) We will NOT disclose your personal information to third parties:<br>&bull; to give effect to clause 3.1 above;<br>&bull; in the event that we sell or buy any business or assets, in which case we will seek your permission prior to disclosing your Personal Data to the prospective seller or buyer of such business or assets.<br>(b) if we are acquired by a third party, in which case we will require consent to use your personal data held by it about its customers will be one of the transferred assets.<br>(c) if we are under a duty to disclose or share your Personal Data in order to comply with any legal obligation, or in order to enforce or apply our&nbsp;terms of use&nbsp;and other agreements; or to protect the rights, property, or safety of the Website, our customers, or others. This includes exchanging information with other companies and organizations for the purposes of fraud protection and credit risk reduction.</p>\n<p>&nbsp;</p>\n<p><strong>5. WHERE WE STORE YOUR PERSONAL DATA</strong></p>\n<p>5.1 By submitting your Personal Data, you agree to this transfer, storing or processing within the remit of the laid out by the General Data Protection Regulation. We will take all steps reasonably necessary to ensure that your data is treated securely and in accordance with this privacy policy.<br>5.2 All information you provide to us is stored on our secure servers within the United Kingdom. Any payment transactions will be encrypted using SSL technology. Where we have given you (or where you have chosen) a password which enables you to access certain parts of the Website, you are responsible for keeping this password confidential. We ask you not to share a password with anyone.<br>5.3 Unfortunately, the transmission of information via the internet is not completely secure. Although we will do our best to protect your Personal Data, we cannot guarantee the security of your Data transmitted to the Website; any transmission is at your own risk. Once we have received your information, we will use strict procedures and security features to try to prevent unauthorized access.<br>5.4 We use all reasonable efforts not to disclose, use, or collect Personal Data from children under 13 years of age. If you believe your child has provided us with any Personal Data by registering on the Website, please contact us at&nbsp;<a href=\"mailto:info@ngolaad.com\">info@ngolaad.com</a></p>\n<p>&nbsp;</p>\n<p><strong>6. YOUR RIGHTS</strong></p>\n<p>6.1 You have the right to ask us not to process your Personal Data for marketing purposes. We will usually inform you (before collecting your data) if we intend to use your Data for such purposes or if we intend to disclose your information to any third party for such purposes. You can exercise your right to prevent such processing by checking certain boxes in the account area where you can control your Data options and where required on the forms we use to collect your data. You can also exercise the right at any time by contacting us using the contact details set out in the terms of use to request your information or to exercise your right to remove your data.<br>6.2 The Website may from time to time, contain links to and from the sites of our partner networks, advertisers, and affiliates. If you follow a link to any of these websites, please note that these websites have their own privacy policies and that we do not accept any responsibility or liability for these policies. Please check these policies before you submit any Personal Data to these websites.<br>6.3 Please refer to&nbsp;<a href=\"https://www.ico.co.uk/\" target=\"_blank\" rel=\"noopener\">www.ico.co.uk</a>&nbsp;for further information about your rights under the Act. You have the right to receive a copy of the information we hold about you by sending a request via our portal or in writing to us using the contact details set out in the terms of use.</p>\n<p>&nbsp;</p>\n<p><strong>7. RETENTION POLICY</strong></p>\n<p>Personal data will be held for the period to interact with you for a maximum of 5 years. After the set time frame, your consent will be sought to continue holding your information. However, if we do not hear back from you our default position is to anonymize any identifiable information past its retention policy where consent was not provided to continue holding the information.</p>\n<p>&nbsp;</p>\n<p><strong>8. COOKIES</strong></p>\n<p>8.1 The Website uses cookies to function and distinguish you from other users of the Website. This helps us to provide you with a good experience when you browse the Website and also allows us to improve. For detailed information on the cookies we use and the purposes for which we use them see our Cookie policy [LINK].<br>8.2 For more information about cookies and how they are used please refer to&nbsp;<a href=\"https://ico.org.uk/for-the-public/online/cookies\" target=\"_blank\" rel=\"noopener\">https://ico.org.uk/for-the-public/online/cookies</a></p>\n<p>&nbsp;</p>\n<p><strong>9. CHANGES TO OUR PRIVACY POLICY</strong></p>\n<p>Any changes we make to our privacy policy in the future will be posted on this page and, where appropriate, notified to you by e-mail. Please check back frequently to see any updates or changes to our privacy policy. &nbsp;</p>','2024-02-10 14:59:29',1);
/*!40000 ALTER TABLE `privacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `imageCover` text NOT NULL,
  `content` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Managed Services','managed-service','uploads/2024-02-19T22:18:39.273Z-banks-and-managed-services.webp','<p>Our Managed Service offer a structured methodology to provide the rigour and process needed to optimise business operations and eliminate waste. &nbsp;So if you&rsquo;re looking to improve operations and achieve goals on time and within budget, Ngolaad will deliver the support you need. Our team of highly skilled and experienced business analysts, project managers and PMO analysts/officers specializes in analysing and interpreting complex data to provide actionable insights, delivering complex projects and setting up and managing project office. &nbsp;</p>\n<p>&nbsp;</p>\n<p><strong>Our services include:</strong></p>\n<p>&nbsp;</p>\n<p>&bull; &nbsp; &nbsp;Project Management Office Setup</p>\n<p>In today\'s ever changing work environment, corporate Project Management Officer (PMO) is expected to deliver business outcomes, yet are often lacking the administrative foundational governance, agile delivery frameworks, and modern orjects leads required to deliver required value. At Ngolaad our PMO Model helps our clients enjoy their project journey by priotising their project portifolio of investments.</p>\n<p><br>&bull; &nbsp; &nbsp;Software Development</p>\n<p>Our team of experts manages the entire software development lifecycle, from planning and design to deployment and maintenance. We help companies optimize their project timelines and enhance the quality and performance of their finished products. This crucial service will help you to streamline your operations, enhance productivity, and boost revenue. We handle the technical details while you can focus on your core competencies.&nbsp;</p>\n<p>&nbsp;</p>\n<p>&bull; &nbsp; &nbsp;Business/Target Operating Model Definition and Implementation</p>\n<p>We provide targeted services. We understand your business pain-points and undertake collaborative design thinking sessions to map out desired value propositions, alongside taking an iterative approach to design the perfect bespoke TOM that is right for your organisation. We don\'t stop there, we also place significant importance on creating a roadmap that enables you to implement the change.</p>\n<p>&nbsp;</p>\n<p>&bull; &nbsp; &nbsp;Business Process Transformation</p>\n<p>We apply our diverse stack of tools and accelerators in a fit-for-purpose method to generate meaningful business impact and insights. We identify the problem statement upfront by capturing the real customer/user experience at critical moments of truth before delving deeper with our design thinking approach. Design thinking employs unique and creative techniques which yield guaranteed results. Once the problem statement is clear, we measure, benchmark and design processes so they are ready to transform and bring in more efficiency and effectiveness and optimise customer and staff experiences. Our process is supported by an insightful and lean change management approach.</p>\n<p>&nbsp;</p>\n<p>&bull; &nbsp; &nbsp;Project Management</p>\n<p>Our model provides access to project professionals, resources and tools at a flexible and predictable cost. Our services portfolio offers a true end-to-end service, from IT Technical Advisory, Business Analysis Services and PMO Services through to Programme &amp; Project Delivery.&nbsp;<br>We are experienced across multiple technology solutions, sectors and industries, and we work on all types of projects and programmes such as Business Change, Transformation, Infrastructure, Digital and IT Project Delivery.</p>\n<p>&nbsp;</p>\n<p>&bull; &nbsp; &nbsp;Staff Training &amp; Development&nbsp;</p>\n<p>A Full Range Of Services To Support Your Learning And Development Strategy. As your learning partner, we offer a complete and flexible suite of managed services that are aligned with your L &amp; D strategy and designed to support your ever-evolving business needs. Our services include Full Training Administration and Logistics Management, Custom Content Design &amp; Development, Learning Delivery &amp; Learning Measurement &amp; Evaluation.</p>\n<p>&nbsp;</p>\n<p>&bull; &nbsp; &nbsp;Risk Assessment and Management</p>\n<p>We help you manage your reputation and relationship with your clients through risk identification, assessment and management in different areas.</p>\n<p>&nbsp;</p>\n<p>For further information, please&nbsp;<strong><a href=\"../contact-us\">Contact Us</a>.</strong></p>','2024-02-10 15:41:55',1),(2,'Consulting','consulting','uploads/2024-02-10T21:08:25.299Z-consulting.jpeg','<p>Delivering tailored solution to our client\'s business strategy and model. Every business faces unique and complex challenges. Successful businesses navigate and grow through these changes.</p>\n<p>Challenges are specific and solutions do not translate perfectly from one business to another, which is why we provide fully customised approach to professional services. A differentiated approach relevant to your challenges and meet your unique needs.</p>\n<p>&nbsp;</p>\n<p>We are truly different. We have grown our practice around brightest people with varied backgrounds in global businesses. We have successfully completed multiple projects across a wide range of sectors. &nbsp;</p>\n<p>&nbsp;</p>\n<p>We are content led people, who bring real life experience and look for the right approach for you, not us.&nbsp; We work with you, using tried and tested methods developed from years of hands-on experience to deliver efficient and consistent results. Our credentials demonstrate the breadth of our expertise across a full range of services including financial and working capital, technology, operations and leadership, people and culture.</p>\n<p>&nbsp;</p>\n<p><a href=\"../../../contact-us\"><strong>Book a Consultation</strong></a></p>\n<p>&nbsp;</p>\n<p><strong><img src=\"https://www.businessknowhow.com/uploads/consulting-business.jpg\" alt=\"Business Consulting\"></strong></p>\n<p>&nbsp;</p>','2024-02-10 16:08:25',1),(3,'Training & Mentoring','training-mentoring','uploads/2024-02-10T21:27:59.080Z-Trainning.webp','<p>Our training package has been carefully created by our experts by identifying the skills gap in the job market and ensuring that our clients are equipped with those skills</p>\n<ul>\n<li>We also provide practical work experience to enable you achieve your aspired success</li>\n<li>Our innovative solutions will work best for you from inception up to interview</li>\n<li>Each client&rsquo;s journey will be supported by a personal mentor with real expertise and experience</li>\n<li>We provide affordable development and training solutions to up-skill organisation workforce</li>\n<li>We support clients&rsquo; career goals from conception to successful achievement<br><br></li>\n</ul>\n<p>Click <a href=\"../courses\"><strong>here</strong> </a>&nbsp;to view our courses or <a href=\"../contact-us\"><strong>here</strong></a> to contact us.</p>\n<p><img src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD//gA7Q1JFQVRPUjogZ2QtanBlZyB2MS4wICh1c2luZyBJSkcgSlBFRyB2NjIpLCBxdWFsaXR5ID0gNzUK/9sAQwAIBgYHBgUIBwcHCQkICgwUDQwLCwwZEhMPFB0aHx4dGhwcICQuJyAiLCMcHCg3KSwwMTQ0NB8nOT04MjwuMzQy/9sAQwEJCQkMCwwYDQ0YMiEcITIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIy/8AAEQgBTwJkAwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A9/ooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACikooAWiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKSloAKKKKACiiigAooooAKKKKACiiigAoopKAFooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkpaKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK5nxL450rwrdRW9/HdPJKm9fJQMMZx3Irpq8c+NUWNQ0qX1idf1H+NY4icoU3KJ6eUYWlisXGjV2d/wAjcf4zaCPuWOot9UQf+zVA/wAadMH3NKu2+rqK8WorzfrlXufaLhvL19l/ez2FvjXb/wAGiy/jOP8ACoH+Nb/waKv4zf8A1q8lopfW63c0XD2XL/l3+L/zPU3+NV6fuaPbj6yk/wBK9Z0u8/tD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4U4U0U4UFDqKKKYC0UUUAFFFFABRRRQAlFFFACUhpaSgBDTadSUDG0tGKUCkMKKKWgQlJiloxQA0ikxTqTFIYmKWjFLQAU4UUUxBSUtFIBppKcaKAG0tFLQAlLRS4oAKWiigApKWigQ2ilooASloxS0AJRS0lACUUUUrDEopcUUAFFGKWgApaSlpiEopaSgBKKKWgBKWiigApKWigBKTFLRikAlFLijFACUtFLQISilpKYCGkNOpKYDaSnUYpCG4oxS0tACCnCkp1MYoFLSCnUxi0UUUALRSUtABRRRQAUUUUAFJS0lABTadSUANopTSUDEopaKACiilpAJRS0lACUUtJigAopaKACloooAKKKKAEpMU6ikA3FGKWigApaKKAClpKWmIKSlpKACiiigAooopALSUtFADaKWigBMUUtJQAUUtFABS0UUAJRS0lACUUtFABRRRTAKKKKQCUUtJQAUUUUAFFFFABRRRTAKSlooENoxS0UAJiilooASlFFLQAopaQUtMYoooooABS0lLQAUUUUAFFFFABSUtJQAUhpaQ0AJRRRQMKKKKADFFFFAgooopDCkpaKACiiigAoopaBBRRRQAlFLSUDCiiloASilooEFFLRQAlFLRQAlFFFABRRS0AJRS0UAJRRRSAKKKKACiiloASilopgJRS0UAJRRRQAUUUUAFJS0UAJRS0UAJRS0lABRS0UAJRS0lACUUuKKAEpKdSYoEJS0UYoAKKWloAKKKXFMYUUUUAFLSUtABRRRQB//Z\" width=\"436\" height=\"239\">&nbsp;</p>','2024-02-10 16:27:59',1);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_events`
--

DROP TABLE IF EXISTS `site_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `eventName` varchar(100) NOT NULL,
  `eventDate` varchar(100) DEFAULT NULL,
  `content` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_events`
--

LOCK TABLES `site_events` WRITE;
/*!40000 ALTER TABLE `site_events` DISABLE KEYS */;
INSERT INTO `site_events` VALUES (1,'Business Analysis Training','2024-07-20','Save the date and contact us to be part of the next cohort. Please visit \'Our Courses\' for further information','2024-02-11 09:46:05',1),(3,'Project Management Training','2024-06-01','Currently ongoing','2024-02-11 09:46:36',1),(5,'Business Analysis Training','2024-06-01','Currently ongoing','2024-03-19 12:42:55',1),(6,'Project Management Training','2024-07-20','Save the date and contact us to be part of the next cohort. Please visit \'Our Courses\' for further information','2024-06-26 03:56:46',1);
/*!40000 ALTER TABLE `site_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `avatarUrl` varchar(500) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `bio` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Ngozi .B','uploads/2024-05-18T22:58:57.979Z-1-9687 2.jpg','test@gmail.com','PM/BA Lead','This is a test ','2024-02-11 09:40:08',1),(2,'Jay .M','uploads/2024-02-11T14:41:49.716Z-user-10.png','jeme.monehin@ngolaad.com','Senior Business Analyst','This is a test','2024-02-11 09:41:51',1),(3,'Victor .F','uploads/2024-03-16T06:50:24.862Z-10211761.jpg','jekong@gmail.com','Senior Developer','This is a test','2024-02-11 09:42:34',1),(5,'Ola. A','uploads/2024-05-18T23:00:58.919Z-ab14d79e-bef5-4b57-821b-7c81822907bd.jpg','ola.adeyemo@ngolaad.com','Senior Systems Business Analyst','This is a test','2024-02-11 09:45:11',1);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms`
--

LOCK TABLES `terms` WRITE;
/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
INSERT INTO `terms` VALUES (1,'<p><strong>1. </strong><strong>APPLICATION OF TERMS</strong></p>\n<p>1.1&nbsp; &nbsp; &nbsp;By using this website, you confirm that you accept these terms of use and that you agree to comply with them.</p>\n<p>1.2&nbsp; &nbsp; &nbsp;Please read this page carefully. If you do not agree with the contents of these terms of use, do not utilize this website.</p>\n<p>1.3&nbsp; &nbsp; &nbsp; You are also responsible for ensuring that all persons who access our website through your internet connection are aware of these terms of use and other applicable terms and conditions, and that they comply with them.</p>\n<p>&nbsp;</p>\n<p><strong>2. </strong><strong>OTHER TERMS THAT MAY APPLY TO YOU&nbsp;</strong></p>\n<p>2.1 &nbsp;&nbsp;&nbsp; These terms of use refer to the following additional terms, which also apply to your use of this website:</p>\n<p>(a)&nbsp;&nbsp;&nbsp; Our Privacy Policy, which sets out the terms on which we process any personal data we collect from you, or that you provide to us. By using this website, you consent to such processing and you warrant that all data provided by you is accurate. Please see our privacy policy.</p>\n<p>(b)&nbsp;&nbsp;&nbsp; Our Cookie Policy, which sets out information about the cookies on our website. Please see our cookies policy.</p>\n<p>&nbsp;</p>\n<p><strong>3 </strong><strong>CHANGES TO THESE TERMS&nbsp;</strong></p>\n<p>3.1 &nbsp;&nbsp;&nbsp; We amend these terms of use from time to time. Every time you wish to use the website, please check these terms of use to ensure that you understand the terms that apply at that time.</p>\n<p>3.2 &nbsp;&nbsp; If you continue to use the website after any changes have been made, you will be taken to accept our amended terms.</p>\n<p>&nbsp;</p>\n<p><strong>4. </strong><strong>CHANGES TO THE WEBSITE, SUSPENSION AND WITHDRAWAL</strong></p>\n<p>4.1&nbsp;&nbsp;&nbsp; We may update or amend this website from time to time and any changes will become effective immediately. We will try to give you reasonable notice of any major changes.</p>\n<p>4.2 &nbsp;&nbsp; This website is made available free of charge. As such, we do not guarantee that the website, or any content on it, will always be available or be uninterrupted.</p>\n<p>4.3 &nbsp;&nbsp; We may suspend or withdraw or restrict the availability of all or any part of the website for business and operational reasons. We will try to give you reasonable notice of any suspension or withdrawal.</p>\n<p>&nbsp;</p>\n<p><strong>5. </strong><strong>&nbsp;ACCOUNT DETAILS&nbsp;</strong></p>\n<p>5.1 &nbsp;&nbsp;&nbsp; If you choose, or you are provided with, a user identification code, password or any other piece of information as part of our security procedures, you must treat such information as confidential. You must not disclose it to any third party. You agree that all activities in relation to your account are your responsibility.</p>\n<p>5.2 &nbsp;&nbsp; We have the right to disable any user identification code or password, whether chosen by you or allocated by us, at any time, if in our reasonable opinion you have failed to comply with any of the provisions of these terms of use.</p>\n<p>5.3&nbsp;&nbsp;&nbsp; If you know or suspect that anyone other than you know your user identification code or password or any other breach of security, you must promptly notify us using the details set out in condition</p>\n<p>&nbsp;</p>\n<p><strong>6. </strong><strong>USE OF THE WEBSITE AND OWNERSHIP</strong></p>\n<p>6.1 &nbsp;&nbsp; You may only use the website for the purposes contemplated by these terms of use and your own personal, domestic, private use.</p>\n<p>6.2 &nbsp;&nbsp; We are the owners (or the licensees) of all intellectual property rights in the website (including any copyright, trademark, design right and database right), and the material published on it. Those works are protected by copyright laws and treaties around the world. All such rights are reserved.</p>\n<p>6.3 &nbsp;&nbsp; We grant to you, a limited, non-exclusive, royalty-free license to access the website from a single computer or mobile device at any one time, subject to these terms of use. You grant us a non-exclusive, perpetual, irrevocable, royalty-free license to use any material that you post on the website in accordance with these terms of use.</p>\n<p>6.4 &nbsp; You may print off one copy, and may download extracts, of any page(s) from the website for your personal use and you may draw the attention of others within your organization to content posted on the website.</p>\n<p>6.5 &nbsp;&nbsp; You must not modify the paper or digital copies of any materials you have printed off or downloaded in any way, and you must not use any illustrations, photographs, video or audio sequences or any graphics separately from any accompanying text.</p>\n<p>6.6 &nbsp;&nbsp; Our status (and that of any identified contributors) as the authors of content on our website must always be acknowledged.</p>\n<p>6.7 &nbsp;&nbsp; You must not use any part of the content on the website for commercial purposes without obtaining a license to do so from us or our licensors.</p>\n<p>&nbsp;</p>\n<p><strong>7</strong><strong>.&nbsp;&nbsp;&nbsp; LINKING</strong></p>\n<p>7.1&nbsp;&nbsp;&nbsp; Where the website contains links to other websites and resources provided by third parties, these links are provided for your information only. Such links should not be interpreted as approval by us of those linked websites or information you may obtain from them. We have no control over the contents of those websites or resources.</p>\n<p>7.2&nbsp;&nbsp;&nbsp; You may link to any page on the website, provided you do so in a way that is fair and legal and does not damage our reputation or take advantage of it.</p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>8</strong><strong>.&nbsp;&nbsp;&nbsp; MONITORING&nbsp;</strong></p>\n<p>8.1&nbsp;&nbsp;&nbsp; We may electronically monitor areas of the website and may disclose any content, records, or electronic communication of any kind:</p>\n<p>(a)&nbsp;&nbsp;&nbsp; To satisfy any law, regulation, or government request;</p>\n<p>(b)&nbsp;&nbsp;&nbsp; If such disclosure is necessary or appropriate to operate the website; or</p>\n<p>(c)&nbsp;&nbsp;&nbsp; To protect our rights or property or the rights of the users, sponsors, providers, or licensors.</p>\n<p>&nbsp;</p>\n<p><strong>9</strong><strong>.&nbsp;&nbsp;&nbsp; VIRUSES AND MISUSE&nbsp;</strong></p>\n<p>9.1&nbsp;&nbsp;&nbsp; We do not guarantee that the website will be secure or free from bugs or viruses.</p>\n<p>9.2&nbsp;&nbsp;&nbsp; You are responsible for configuring your information technology, computer programs and platform to access our website. You should use your own virus protection software.</p>\n<p>9.3&nbsp;&nbsp;&nbsp; You must not:</p>\n<p>(a)&nbsp;&nbsp;&nbsp; misuse the website by knowingly introducing viruses, Trojans, worms, logic bombs or other material that is malicious or technologically harmful;</p>\n<p>(b)&nbsp;&nbsp;&nbsp; attempt to gain unauthorized access to the website, the server on which the website is stored or any server, computer or database connected to the website;</p>\n<p>(c)&nbsp;&nbsp;&nbsp; attack our website via a denial-of-service attack or a distributed denial-of-service attack.</p>\n<p>9.4&nbsp;&nbsp;&nbsp; By breaching condition 9, you would commit a criminal offense under the Computer Misuse Act 1990. We will report any such breach to the relevant law enforcement authorities and we will co-operate with those authorities by disclosing your identity to them. In the event of such a breach, your right to use the website will cease immediately.</p>\n<p>&nbsp;</p>\n<p><strong>1</strong><strong>0</strong><strong>.&nbsp;&nbsp;&nbsp; CHOICE OF LAW AND JURISDICTION</strong></p>\n<p>10.1&nbsp;&nbsp;&nbsp; These terms of use, their subject matter, their formation and your use of the Website are governed by English law.</p>\n<p>10.2&nbsp;&nbsp;&nbsp; You and us agree that the courts of England and Wales will have exclusive jurisdiction.</p>','2024-02-10 14:59:44',1);
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (3,'Anabelle','.W','As a startup business, I needed help implementing my ideas, Ngolaad patiently worked with me in defining my operating model and documenting all business processes. I recommend Ngolaad to start up businesses. ','2024-01-30 11:54:13',1),(4,'Pete','.O','The training provided was indeed value for money. The quality, attention and information provided gave me the confidence to succeed in my first role as a Business Analyst. I recommend Ngolaad for high quality training. ','2024-02-07 14:27:01',1),(6,'Jay','.M','I recently completed the Business Analysis training program with Ngolaad. The instructors were not only experts but also passionate about sharing their insights. The curriculum was comprehensive. Practical exercises & project made the learning experience engaging and insightful. The support provided by the team was exceptional. Thanks to this training, I now feel confident.','2024-02-08 14:16:46',1),(7,'Ellie','.S','I needed a change in career and wanted to become a Business Analyst. I have used other consultancy firms but Ngolaad was by far the best. They provide quality over quantity and that was the first thing that made me take on the course with them. I don\'t do well in classroom setting of lots of people. They do the opposite. It\'s refreshing and made me eager to learn.','2024-02-08 15:02:35',1),(8,'Ada','.N','Before I found Ngolaad, I attended training somewhere else but I didn’t understand anything at all. Ngolaad\'s training curriculum is like years of learning summarised which equips you to start your career as a Business Analyst without prior knowledge. My favourite part is the mentoring & support you get during and after the training. I have now started my career as a Business Analyst. Thank you Ngolaad. I highly recommend!','2024-03-19 19:46:59',1);
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vision`
--

DROP TABLE IF EXISTS `vision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vision` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vision`
--

LOCK TABLES `vision` WRITE;
/*!40000 ALTER TABLE `vision` DISABLE KEYS */;
INSERT INTO `vision` VALUES (1,'<p>To be the Epitome of Excellence, the go to choice for sustainable change delivery.</p>\n<p><img src=\"https://media.licdn.com/dms/image/C5112AQEn0v5B9PcWZw/article-cover_image-shrink_600_2000/0/1562826741550?e=2147483647&amp;v=beta&amp;t=EI6hA9lme0qoI4hhELyE8H9N5doTHYTeSumJ8W-UYuM\" alt=\"Ever Struggle to Write a Good Vision Statement?\" width=\"323\" height=\"129\"></p>','2024-02-10 14:59:01',1);
/*!40000 ALTER TABLE `vision` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-25  8:06:36
