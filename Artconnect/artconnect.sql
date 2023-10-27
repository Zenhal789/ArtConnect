/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 8.0.31 : Database - artconnect
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`artconnect` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `artconnect`;

/*Table structure for table `artapp_artist` */

DROP TABLE IF EXISTS `artapp_artist`;

CREATE TABLE `artapp_artist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Firstname` varchar(10) NOT NULL,
  `Lastname` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `CATEGORY_id` bigint NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Artapp_artist_CATEGORY_id_cb996d34` (`CATEGORY_id`),
  KEY `Artapp_artist_LOGIN_id_02450f1a` (`LOGIN_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `artapp_artist` */

insert  into `artapp_artist`(`id`,`Firstname`,`Lastname`,`email`,`photo`,`dob`,`gender`,`phone`,`CATEGORY_id`,`LOGIN_id`) values 
(11,'Muhammed','Zenhal','Zenhalzenu@gmail.com','/media/20230922-190736.jpg','2001-02-11','Male','8135201254',2,18),
(12,'raj ','rajan','rj@gmail.com','/media/20230922-190841.jpg','2001-02-20','Male','8523698745',1,19),
(13,'Fidha','Fiddha','fd@gmail.com','/media/20230924-124136.jpg','2001-05-05','Female','7854219865',5,23),
(15,'Harifa','riffa','harifa2003@gmail.com','/media/20230926-121258.jpg','2003-01-01','Female','8925614235',4,36),
(16,'Ahad','Ahad','ahd@gmail.com','/media/20230930-155627.jpg','11-05-2002','Male','8255369875',1,43),
(18,'sbuBUS','SKAAA','SS@gmail.com','/media/20231019-101915.jpg','19/10/2023','Male','0813888719',3,47);

/*Table structure for table `artapp_category` */

DROP TABLE IF EXISTS `artapp_category`;

CREATE TABLE `artapp_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `artapp_category` */

insert  into `artapp_category`(`id`,`category_name`) values 
(1,'Illustrator'),
(2,'Painter'),
(3,'Digital Artist'),
(4,'Graphic Designer'),
(5,'Sculptor'),
(6,'Drawing'),
(9,'jndkjnd');

/*Table structure for table `artapp_complaint` */

DROP TABLE IF EXISTS `artapp_complaint`;

CREATE TABLE `artapp_complaint` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(30) NOT NULL,
  `reply` varchar(200) NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Artapp_complaint_USER_id_fee819d9` (`USER_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `artapp_complaint` */

insert  into `artapp_complaint`(`id`,`complaint`,`date`,`status`,`reply`,`USER_id`) values 
(1,'please improve quality of products','2023-09-27','replied','done',5),
(2,'please improve delivery speed','2023-09-27','replied','sorry for the inconvenience caused to you and i\'ll look after that',8),
(3,'damaged product','2023-09-27','replied','please share more information of your product inorder to assist you',6),
(4,'delivery is taking too long','2023-09-29','replied','sorry for the inconvenience caused to uh and please share delivery details inorder to assist you',9),
(5,'bad','2023-10-06','replied','ok',6);

/*Table structure for table `artapp_deliveryboy` */

DROP TABLE IF EXISTS `artapp_deliveryboy`;

CREATE TABLE `artapp_deliveryboy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Firstname` varchar(10) NOT NULL,
  `Lastname` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `location` varchar(10) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Artapp_deliveryboy_LOGIN_id_716c269e` (`LOGIN_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `artapp_deliveryboy` */

insert  into `artapp_deliveryboy`(`id`,`Firstname`,`Lastname`,`email`,`location`,`dob`,`gender`,`phone`,`LOGIN_id`) values 
(8,'Ijaz','ahmed','ijz@gmail.com','Kochi','1998-02-08','Male','8520213658',32),
(9,'Zayan','Zayan','Zayan@gmail.com','Calicut','2000-02-02','Male','8796325412',33),
(10,'Muhammed','Faiz','mfy@gmail.com','Calicut','1998-02-12','Male','7854692154',34),
(11,'Ihsan','Ihsan','ihsan@gmail.com','Trivandrum','22-10-1997','Male','7985632563',44),
(13,'akalala','aa','aa@gmail.com','Thrissur','2000-02-02','Male','5624871523',48);

/*Table structure for table `artapp_feedback` */

DROP TABLE IF EXISTS `artapp_feedback`;

CREATE TABLE `artapp_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` varchar(300) NOT NULL,
  `date` date NOT NULL,
  `reply` varchar(500) NOT NULL,
  `USER_id` bigint NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Artapp_feedback_USER_id_4298e077` (`USER_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `artapp_feedback` */

insert  into `artapp_feedback`(`id`,`feedback`,`date`,`reply`,`USER_id`,`status`) values 
(1,'Improve the security of  your website','2023-09-27','Dear lulu,\r\n\r\nThank you for your valuable feedback on our website\'s security. We take your concerns seriously. Our team is actively addressing potential vulnerabilities, enhancing encryption, and considering a bug bounty program. Your input is appreciated as we work to ensure a secure online environment.',5,''),
(2,'please add new features to this website','2023-09-27','Dear Tessa,\r\n\r\nThank you for your feature suggestions. We\'re excited to let you know that we\'re moving forward with implementing new features. Stay tuned for updates in the coming week. Your feedback is invaluable in shaping our platform\'s future.',8,''),
(3,'Art Connect stood out with its captivating use of color and texture.Your website is easy to navigate','2023-09-27','Dear Steve,Thank you for your kind words about Art Connect. We\'re thrilled to hear that you found our use of color and texture captivating and that our website is easy to navigate. Your feedback is truly appreciated',6,''),
(7,'its okayy','2023-10-06','ok',9,'replied'),
(5,'nice','2023-10-06','okkk',6,''),
(6,'gooood','2023-10-06','thank you',6,'replied'),
(8,'very bad ','2023-10-06','',5,'pending');

/*Table structure for table `artapp_login` */

DROP TABLE IF EXISTS `artapp_login`;

CREATE TABLE `artapp_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `usertype` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `artapp_login` */

insert  into `artapp_login`(`id`,`username`,`password`,`usertype`) values 
(1,'admin','Admin@789','admin'),
(23,'Fidha','Fidha@123','artist'),
(37,'Hiba','hiba','user'),
(21,'steve','steve','user'),
(20,'lulu','lulu','user'),
(18,'Muhammed','Zenhal','artist'),
(19,'raj','raj1','artist'),
(36,'Harifa','riffa','artist'),
(34,'Muhammed','Feiz','deliveryboy'),
(35,'Tessa','Tessa@123','user'),
(33,'Zayan','Zayan','deliveryboy'),
(32,'Ijaz','Ijaz@123','deliveryboy'),
(41,'amina','amina','user'),
(42,'Ashik','Ashik','user'),
(43,'Ahad','Ahad','artist'),
(44,'Ihsan','Ihsan','deliveryboy'),
(45,'asssdkjajk','aaaaaa','artist'),
(46,'qqqq','wwqq','deliveryboy'),
(47,'sbuBUS','SKAAA','artist'),
(48,'akalala','aa','deliveryboy');

/*Table structure for table `artapp_message` */

DROP TABLE IF EXISTS `artapp_message`;

CREATE TABLE `artapp_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` varchar(500) NOT NULL,
  `date` datetime(6) NOT NULL,
  `user` varchar(100) NOT NULL,
  `room` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `artapp_message` */

insert  into `artapp_message`(`id`,`value`,`date`,`user`,`room`) values 
(1,'hi','2023-09-24 12:54:02.939222','Zenhal','1'),
(2,'hii i\'m hisham','2023-09-24 12:57:43.237785','Hisham','5'),
(3,'i\'m technician','2023-09-24 12:57:56.280482','Muhammed','5'),
(4,'hy','2023-09-24 12:58:48.049399','Muhammed','5'),
(5,'hello','2023-09-24 12:59:04.033601','Hisham','5'),
(6,'hi','2023-09-24 13:19:45.214560','Muhammed','1'),
(7,'are u busy?','2023-09-24 13:19:52.483224','Muhammed','1'),
(8,'good','2023-09-24 13:19:58.601119','Muhammed','1'),
(9,'how r uh?','2023-09-24 13:20:59.522662','Muhammed','1'),
(10,'good','2023-09-24 13:25:34.514943','admin','1'),
(11,'ok','2023-09-24 13:33:43.659446','admin','1'),
(12,'yes','2023-09-24 13:33:49.074033','admin','1'),
(13,'eh','2023-09-24 13:34:23.596866','admin','1'),
(14,'hyyyy','2023-09-24 13:35:31.669153','admin','1'),
(15,'bye','2023-09-24 13:42:02.304119','admin','1'),
(16,'hi','2023-09-24 13:42:47.853360','admin','7'),
(17,'hello','2023-09-24 13:42:54.151558','admin','7'),
(18,'how r uh?','2023-09-24 13:46:30.414187','admin','7'),
(19,'good','2023-09-24 13:46:38.933115','admin','7'),
(20,'good','2023-09-24 13:50:06.605588','Zenhal','3'),
(21,'hii','2023-09-25 08:43:27.736869','tessa','8'),
(22,'how r uh?','2023-09-25 08:43:35.051812','tessa','8'),
(23,'hi i\'m hisham','2023-09-26 14:58:33.527351','Hisham','9'),
(24,'i\'m harifa','2023-09-26 14:58:44.556122','Harifa','9'),
(25,'hello','2023-10-03 12:14:58.983832','admin','2'),
(26,'hi','2023-10-03 18:48:50.761105','admin','2'),
(27,'ok','2023-10-03 18:50:21.069616','admin','2'),
(28,'good','2023-10-03 18:55:18.081229','admin','2'),
(29,'hello','2023-10-03 19:24:52.174423','admin','1'),
(30,'hii','2023-10-03 19:24:58.868581','admin','1'),
(31,'good','2023-10-03 19:26:32.178591','admin','1'),
(32,'hii','2023-10-03 19:30:15.645441','admin','1'),
(33,'hi','2023-10-03 19:39:13.149230','admin','3'),
(34,'how r uh?','2023-10-03 19:39:20.137643','admin','3'),
(35,'ok','2023-10-03 19:42:28.040752','admin','1'),
(36,'hi','2023-10-03 19:44:34.499157','tessa','10'),
(37,'good','2023-10-03 19:45:55.067964','tessa','10'),
(38,'good','2023-10-03 19:47:24.461497','fidha','10'),
(39,'ok','2023-10-03 19:47:35.501558','tessa','10'),
(40,'hii','2023-10-03 19:51:33.909303','rifa','10'),
(41,'hello','2023-10-03 19:51:46.408616','tessa','10'),
(42,'how r uh?','2023-10-04 11:58:42.427665','admin','1'),
(43,'hello','2023-10-04 12:12:48.155340','admin','2'),
(44,'hi','2023-10-04 12:32:16.620721','fidha','1'),
(45,'hello','2023-10-04 12:32:29.992898','fidha','1'),
(46,'how r uh?','2023-10-04 12:32:38.919749','admin','1'),
(47,'hii','2023-10-04 12:36:13.630036','Muhammed','3'),
(48,'good','2023-10-04 12:36:18.270133','Muhammed','3'),
(49,'hi','2023-10-04 12:49:30.008009','Muhammed','1'),
(50,'hii','2023-10-04 13:01:56.819910','Muhammed','1'),
(51,'good','2023-10-04 13:04:49.270009','Muhammed','1'),
(52,'ok','2023-10-04 13:06:13.456677','Muhammed','1'),
(53,'hi','2023-10-04 13:12:44.739871','Muhammed','1'),
(54,'good','2023-10-04 13:13:01.688223','Muhammed','1'),
(55,'how r uh?','2023-10-04 13:15:01.182659','Muhammed','1'),
(56,'hi','2023-10-04 13:16:39.984627','Muhammed','1'),
(57,'hii','2023-10-04 13:18:48.720119','Muhammed','1'),
(58,'hello','2023-10-04 13:18:56.732897','Muhammed','1'),
(59,'hi','2023-10-04 13:20:19.958670','Muhammed','1'),
(60,'how r uh?','2023-10-04 13:23:00.642824','Muhammed','1'),
(61,'hi','2023-10-04 13:24:18.327205','Muhammed','1'),
(62,'hello','2023-10-04 13:26:10.081282','Muhammed','1'),
(63,'ok','2023-10-04 13:26:40.311754','Muhammed','1'),
(64,'hi','2023-10-04 13:28:31.911432','Muhammed','1'),
(65,'hello','2023-10-04 13:29:48.078783','Muhammed','1'),
(66,'how r uh?','2023-10-04 13:30:07.866645','Muhammed','1'),
(67,'hi','2023-10-04 13:31:00.362555','Muhammed','1'),
(68,'hi','2023-10-04 13:32:00.750337','Muhammed','1'),
(69,'good','2023-10-04 13:32:11.283562','Muhammed','1'),
(70,'how r uh?','2023-10-04 13:33:19.632984','Muhammed','1'),
(71,'hello','2023-10-04 13:34:36.690209','Muhammed','1'),
(72,'how r uh?','2023-10-04 13:35:59.960128','Muhammed','1'),
(73,'good','2023-10-04 13:37:15.424825','mm','1'),
(74,'hi','2023-10-04 13:51:39.800569','mm','1'),
(75,'hiii','2023-10-04 13:58:28.634627','km','6'),
(76,'jjj','2023-10-04 13:58:34.570957','km','6'),
(77,'ddddd','2023-10-04 13:58:37.068223','km','6'),
(78,'ssss','2023-10-04 13:58:39.480415','km','6'),
(79,'hyyyy','2023-10-04 14:12:04.655135','admin','2'),
(80,'hi','2023-10-06 14:08:01.624583','zzz','11'),
(81,'how r uh?','2023-10-06 14:08:07.594594','aaa','11'),
(82,'k','2023-10-06 14:08:16.329851','zzz','11'),
(83,'hello','2023-10-06 14:08:23.580997','aaa','11'),
(84,'hii','2023-10-19 10:26:40.345837','steve','12'),
(85,'hello','2023-10-19 10:26:49.539349','Muhammed','12');

/*Table structure for table `artapp_product` */

DROP TABLE IF EXISTS `artapp_product`;

CREATE TABLE `artapp_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(100) NOT NULL,
  `ARTIST_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Artapp_product_ARTIST_id_0461df39` (`ARTIST_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `artapp_product` */

insert  into `artapp_product`(`id`,`name`,`description`,`price`,`image`,`ARTIST_id`) values 
(14,'Bird art','vector beautiful watercolor blue peacock',2400.00,'/media/20230926-144049.jpg',11),
(13,'Jefferys Café Blend: Cafe art','This image features Café Jefferys, showcasing a coffee cup, a stylish bag, and a paper menu. It captures the café\'s inviting atmosphere and the promise of a delightful coffee experience	',2000.00,'/media/20230926-143837.jpg',15),
(12,'Autumn walk (2020) Oil Painting','Oil painting on Canvas One of a kind artwork(unframed) Ready to hang Signed on the front Style: Impressionistic Subject: Landscapes, sea and sky		',10000.00,'/media/20230926-151440.jpg',12),
(11,'sculpture painting','The artwork once completely dry is hard as stone.High resistance to external pressure (Similar to wall properties).The volume achieved almost gives a realistic feel to the blooming flowers',1500.00,'/media/20230926-143357.jpg',13),
(16,'asssaaa','sssss',200.00,'/media/20231019-102413.jpg',11);

/*Table structure for table `artapp_purchase` */

DROP TABLE IF EXISTS `artapp_purchase`;

CREATE TABLE `artapp_purchase` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `purchase_date` date NOT NULL,
  `quantity` int unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `card_number` varchar(16) NOT NULL,
  `expiration_date` date NOT NULL,
  `cvv` varchar(3) NOT NULL,
  `address` varchar(100) NOT NULL,
  `status` varchar(30) NOT NULL,
  `ARTIST_id` bigint NOT NULL,
  `BUYER_id` bigint NOT NULL,
  `PRODUCT_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Artapp_purchase_ARTIST_id_4ee72071` (`ARTIST_id`),
  KEY `Artapp_purchase_BUYER_id_1eaa67ea` (`BUYER_id`),
  KEY `Artapp_purchase_PRODUCT_id_95f97dea` (`PRODUCT_id`),
  CONSTRAINT `artapp_purchase_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `artapp_purchase` */

insert  into `artapp_purchase`(`id`,`purchase_date`,`quantity`,`price`,`card_number`,`expiration_date`,`cvv`,`address`,`status`,`ARTIST_id`,`BUYER_id`,`PRODUCT_id`) values 
(10,'2023-02-01',1,1500.00,'220211256539','2030-01-01','888','998Q\r\nHeathrow\r\nLondon','Delivered',13,8,11),
(11,'2023-05-13',3,6000.00,'520236854203','2032-02-07','975','3QA\r\nParis\r\nLondon','Delivered',15,9,13),
(12,'2023-12-22',1,2000.00,'963202548952','2036-12-07','741','654S\r\nHeathrow\r\nLondon','Delivered',15,5,13),
(8,'2023-02-20',1,2400.00,'521023658520','2045-02-10','220','765A\r\nLos angeles\r\nUSA','Delivered',11,5,14),
(9,'2023-02-05',2,20000.00,'987521025479','2055-01-02','120','876B\r\nWashington\r\nUSA','Delivered',12,6,12),
(13,'2023-09-10',1,2400.00,'89826354781','2036-02-01','223','210A\r\nLos Santos\r\nUSA','Delivered',11,8,14),
(15,'2000-02-10',1,1000.00,'852145236589','2035-12-02','111','dcdcdc','Delivered',11,6,14);

/*Table structure for table `artapp_rating` */

DROP TABLE IF EXISTS `artapp_rating`;

CREATE TABLE `artapp_rating` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `rate` int NOT NULL,
  `comments` varchar(80) NOT NULL,
  `ARTIST_id` bigint NOT NULL,
  `PRODUCT_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Artapp_rating_ARTIST_id_2c6fc137` (`ARTIST_id`),
  KEY `Artapp_rating_PRODUCT_id_6e9d2135` (`PRODUCT_id`),
  KEY `Artapp_rating_USER_id_8366082e` (`USER_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `artapp_rating` */

insert  into `artapp_rating`(`id`,`date`,`rate`,`comments`,`ARTIST_id`,`PRODUCT_id`,`USER_id`) values 
(1,'2023-09-29',4,'decent product and delivery is on time',13,11,8),
(2,'2023-09-29',5,'awesome product',15,13,5),
(3,'2023-09-29',3,'average quality and takes too long for delivery',12,12,6),
(5,'2023-09-29',4,'okay',15,13,9),
(6,'2023-09-29',1,'very bad',11,14,5),
(7,'2023-09-29',5,'very nice painting and just delivered the product in one day',11,14,8),
(8,'2023-10-06',5,'good',11,14,6),
(9,'2023-10-19',1,'bad',11,14,6);

/*Table structure for table `artapp_room` */

DROP TABLE IF EXISTS `artapp_room`;

CREATE TABLE `artapp_room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `artapp_room` */

insert  into `artapp_room`(`id`,`name`) values 
(1,'Alexa'),
(2,'django'),
(3,'Dell'),
(4,'45'),
(5,'Technician'),
(6,'ll'),
(7,'zen'),
(8,'rr'),
(9,'chat1'),
(10,'fd'),
(11,'qqq'),
(12,'aaaa');

/*Table structure for table `artapp_user` */

DROP TABLE IF EXISTS `artapp_user`;

CREATE TABLE `artapp_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Firstname` varchar(10) NOT NULL,
  `Lastname` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Artapp_user_LOGIN_id_67b371b4` (`LOGIN_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `artapp_user` */

insert  into `artapp_user`(`id`,`Firstname`,`Lastname`,`email`,`photo`,`dob`,`gender`,`phone`,`LOGIN_id`) values 
(5,'Lulu','rafi','lulurafi@gmail.com','/media/20230927-102222.jpg','2000-02-25','Female','8123549786',20),
(6,'steve','john','steve@gmail.com','/media/20230922-195409.jpg','1999-02-10','Male','7854692152',21),
(8,'Tessa','Tessa','tessa@gmail.com','/media/20230925-084159.jpg','1999-01-02','Female','7521589634',35),
(9,'Hiba','hiba','hiba@gmail.com','/media/20230926-123408.jpg','2003-06-10','Female','9653259874',37);

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add artist',7,'add_artist'),
(26,'Can change artist',7,'change_artist'),
(27,'Can delete artist',7,'delete_artist'),
(28,'Can view artist',7,'view_artist'),
(29,'Can add category',8,'add_category'),
(30,'Can change category',8,'change_category'),
(31,'Can delete category',8,'delete_category'),
(32,'Can view category',8,'view_category'),
(33,'Can add login',9,'add_login'),
(34,'Can change login',9,'change_login'),
(35,'Can delete login',9,'delete_login'),
(36,'Can view login',9,'view_login'),
(37,'Can add message',10,'add_message'),
(38,'Can change message',10,'change_message'),
(39,'Can delete message',10,'delete_message'),
(40,'Can view message',10,'view_message'),
(41,'Can add product',11,'add_product'),
(42,'Can change product',11,'change_product'),
(43,'Can delete product',11,'delete_product'),
(44,'Can view product',11,'view_product'),
(45,'Can add room',12,'add_room'),
(46,'Can change room',12,'change_room'),
(47,'Can delete room',12,'delete_room'),
(48,'Can view room',12,'view_room'),
(49,'Can add user',13,'add_user'),
(50,'Can change user',13,'change_user'),
(51,'Can delete user',13,'delete_user'),
(52,'Can view user',13,'view_user'),
(53,'Can add rating',14,'add_rating'),
(54,'Can change rating',14,'change_rating'),
(55,'Can delete rating',14,'delete_rating'),
(56,'Can view rating',14,'view_rating'),
(57,'Can add purchase',15,'add_purchase'),
(58,'Can change purchase',15,'change_purchase'),
(59,'Can delete purchase',15,'delete_purchase'),
(60,'Can view purchase',15,'view_purchase'),
(61,'Can add feedback',16,'add_feedback'),
(62,'Can change feedback',16,'change_feedback'),
(63,'Can delete feedback',16,'delete_feedback'),
(64,'Can view feedback',16,'view_feedback'),
(65,'Can add deliveryboy',17,'add_deliveryboy'),
(66,'Can change deliveryboy',17,'change_deliveryboy'),
(67,'Can delete deliveryboy',17,'delete_deliveryboy'),
(68,'Can view deliveryboy',17,'view_deliveryboy'),
(69,'Can add complaint',18,'add_complaint'),
(70,'Can change complaint',18,'change_complaint'),
(71,'Can delete complaint',18,'delete_complaint'),
(72,'Can view complaint',18,'view_complaint');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(2,'auth','permission'),
(3,'auth','group'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session'),
(7,'Artapp','artist'),
(8,'Artapp','category'),
(9,'Artapp','login'),
(10,'Artapp','message'),
(11,'Artapp','product'),
(12,'Artapp','room'),
(13,'Artapp','user'),
(14,'Artapp','rating'),
(15,'Artapp','purchase'),
(16,'Artapp','feedback'),
(17,'Artapp','deliveryboy'),
(18,'Artapp','complaint');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'Artapp','0001_initial','2023-09-29 10:09:34.394081'),
(2,'contenttypes','0001_initial','2023-09-29 10:09:34.440864'),
(3,'auth','0001_initial','2023-09-29 10:09:35.045128'),
(4,'admin','0001_initial','2023-09-29 10:09:35.218783'),
(5,'admin','0002_logentry_remove_auto_add','2023-09-29 10:09:35.230746'),
(6,'admin','0003_logentry_add_action_flag_choices','2023-09-29 10:09:35.241748'),
(7,'contenttypes','0002_remove_content_type_name','2023-09-29 10:09:35.352066'),
(8,'auth','0002_alter_permission_name_max_length','2023-09-29 10:09:35.391778'),
(9,'auth','0003_alter_user_email_max_length','2023-09-29 10:09:35.449843'),
(10,'auth','0004_alter_user_username_opts','2023-09-29 10:09:35.466814'),
(11,'auth','0005_alter_user_last_login_null','2023-09-29 10:09:35.511779'),
(12,'auth','0006_require_contenttypes_0002','2023-09-29 10:09:35.515786'),
(13,'auth','0007_alter_validators_add_error_messages','2023-09-29 10:09:35.532772'),
(14,'auth','0008_alter_user_username_max_length','2023-09-29 10:09:35.580761'),
(15,'auth','0009_alter_user_last_name_max_length','2023-09-29 10:09:35.623223'),
(16,'auth','0010_alter_group_name_max_length','2023-09-29 10:09:35.677226'),
(17,'auth','0011_update_proxy_permissions','2023-09-29 10:09:35.724262'),
(18,'auth','0012_alter_user_first_name_max_length','2023-09-29 10:09:35.787275'),
(19,'sessions','0001_initial','2023-09-29 10:09:35.830222'),
(20,'Artapp','0002_alter_complaint_complaint_alter_complaint_reply','2023-09-29 10:20:08.777265'),
(21,'Artapp','0003_alter_product_name','2023-09-29 12:19:26.558053'),
(22,'Artapp','0004_alter_rating_rate','2023-09-29 12:59:43.104989'),
(23,'Artapp','0005_alter_rating_rate','2023-09-29 13:39:32.617558'),
(24,'Artapp','0006_remove_product_login','2023-10-06 08:25:20.780251'),
(25,'Artapp','0007_feedback_status_alter_purchase_expiration_date','2023-10-06 10:26:49.169674');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('cx8pqd7281afxld5acvp0n3rm5cxzqgf','eyJsaWQiOjIzfQ:1qmCvK:K9RAAQqE_6UczVIq47lggWFnEpbLsi90YXkGxsa5030','2023-10-13 12:48:50.401736'),
('w1anvtj16th6yqfnxtr00n8ic0yctwi3','eyJsaWQiOjIxfQ:1qtL4r:2hYDzr8MtclrKVkZA4iQfGfiAN6ziRASPLUbnQQpCC8','2023-11-02 04:56:09.266528'),
('4k8f4zxv86lgkp6g65abysy3u55gw4iq','eyJsaWQiOjIzfQ:1qmDOI:slek7j46UnnmvBwFqrIOn8ynuCmLeAyrI9K0q8FGAEs','2023-10-13 13:18:46.681030'),
('5q5mo8tu7rrvpcv5z2hmm72leb11rg5c','eyJsaWQiOjMyfQ:1qmSFI:YjwS1kCtb9xhryBLHrtQcox9iXX7w0pVlTFGi4pC3MU','2023-10-14 05:10:28.982634'),
('0yfr58oo5dlxdprk72lqfjy1mrudp4n4','eyJsaWQiOjQxfQ:1qmVtX:HISM_Ma4Q913PhlMNm0d9jFTbKmGYK-9AK2GMiOdjPM','2023-10-14 09:04:15.842295'),
('a0g9jsq95m6g97mdti6nzsszzhezqym4','eyJsaWQiOjF9:1qnCxq:2JdnvuXFfXXByv5dZCxqV9Y9cm7eQjLfVBG6a4XcpWc','2023-10-16 07:03:34.503560'),
('4d7ex3f17askawl5p8zjgc454bmnhym8','eyJsaWQiOjF9:1qnI2N:WvcHDLZAG6gghAMz235cMnffjxZBcHQpn1rUDJZOLow','2023-10-16 12:28:35.764974'),
('ofr3kdqxoycqx8yjhvmyuz2pq37a2yda','eyJsaWQiOjIzfQ:1qnICP:cy4CwbahUeMTwZsQffiEfZr6KzXEkUQpfAYB3Qql14c','2023-10-16 12:38:57.248560'),
('d02rp9b42bxm07tqikafys99anpqapk0','eyJsaWQiOjIzfQ:1qnJtF:7GdkhDxMnK022VjSBEibc_WuDqyAhv62sdSgIJInJvo','2023-10-16 14:27:17.730726'),
('4bu0j4g272ruuvkgd5poct2s70zuywva','eyJsaWQiOjIzfQ:1qnTmd:QwsxcnK6vkwfXy9CwpwT_r7qhlxSbh-Jmop_9cMdgc0','2023-10-17 01:01:07.675851'),
('76dymvaepinu0vcsz8xt3ixqs1y6pijm','eyJsaWQiOjM1fQ:1qnv2O:9eLdM9tZa38ChlcwfpzbYRbThjYRY7oCnnQEugychfU','2023-10-18 06:07:12.197709'),
('dbskvwfc1efy49gvhlykvdpcsgoq69p0','eyJsaWQiOjM1fQ:1qnw03:1WxrFdz_KMxTAW2nYUz7_iBAT920VmYDdOtw3MxBZXA','2023-10-18 07:08:51.778739'),
('5hw4syz2fe556wbp38hfbtmkpiq2baoz','eyJsaWQiOjM1fQ:1qo1Qa:ClkqIZcNvki977pSXD8mGDNNSw9JB9yNThkWPGhrKK4','2023-10-18 12:56:36.268178'),
('hbedvoixq76y88zgfjn7471mlz7jra2i','eyJsaWQiOjM1fQ:1qoEdA:5TU6c4L39VcEwZ1j6DmS93KKI86TGUpqBPec-nHTACk','2023-10-19 03:02:28.745875'),
('eqyqro72exu08ag721jipiq8gmuzc4p8','eyJsaWQiOjIzfQ:1qoEg5:QQDRRX49sl4QyIkVWmO3ykBwt7K9-sEdiPWuoJj30yI','2023-10-19 03:05:29.897306'),
('ocrz2u6wkvd9a1kqbqoew476thz942lv','eyJsaWQiOjF9:1qojJw:ESrLCu67mK_bFlwaBFz2ZMJONbvtwe4aaRZzAefwumQ','2023-10-20 11:48:40.140697'),
('0w9ptl26hq7d57ke2xken7rwap1xq4jv','eyJsaWQiOjF9:1qoius:jjIiKSFX81CT4N-0T4G9g2cNF8CjS2eXIq5FA5cicio','2023-10-20 11:22:46.060564'),
('ywmxx47fmy1iwmgqpp8a84voe9otr95q','eyJsaWQiOjF9:1qojRo:JeVbwvjJxbOFjT5W_nMgUWvsrCZQoXLrzt1I-mpCsac','2023-10-20 11:56:48.724658'),
('kxc2jzmqgsnwves72y37p1tvo900sbo2','eyJsaWQiOjF9:1qokbB:bXeSUG7zE8iHE5CrENZqHCwvizkiyL49eVpPJSkBpqg','2023-10-20 13:10:33.713111'),
('1vjdfd1zfa9h1whlgmc9hpfp62pej7z0','eyJsaWQiOjMyfQ:1qtL9A:SBvI3j9ruz1Vxojtza9zZXEHar1fpAT4eG5SUpAMPJI','2023-11-02 05:00:36.939657');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
