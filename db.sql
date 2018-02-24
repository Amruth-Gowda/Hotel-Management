/*
SQLyog Ultimate v8.55 
MySQL - 5.1.36-community : Database - hotel_management
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hotel_management` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hotel_management`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `admin_email` varchar(200) DEFAULT NULL,
  `admin_password` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`admin_email`,`admin_password`) values ('admin@gmail.com','admin');

/*Table structure for table `food_items` */

DROP TABLE IF EXISTS `food_items`;

CREATE TABLE `food_items` (
  `food_id` int(11) NOT NULL AUTO_INCREMENT,
  `food_name` varchar(200) DEFAULT NULL,
  `food_price` int(11) DEFAULT NULL,
  `food_type` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `food_items` */

insert  into `food_items`(`food_id`,`food_name`,`food_price`,`food_type`) values (1,'Idli',10,'Breakfast'),(2,'Dosa',15,'Breakfast'),(3,'Upma',25,'Breakfast'),(4,'Pongal',25,'Breakfast'),(5,'South Indian Meals',100,'Lunch');

/*Table structure for table `order_table` */

DROP TABLE IF EXISTS `order_table`;

CREATE TABLE `order_table` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `food_id` int(11) DEFAULT NULL,
  `food_price` double DEFAULT NULL,
  `food_quantity` int(11) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `ordered_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `FK_order_table_user_id` (`user_id`),
  KEY `FK_order_table_foo_id` (`food_id`),
  CONSTRAINT `FK_order_table_foo_id` FOREIGN KEY (`food_id`) REFERENCES `food_items` (`food_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_order_table_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `order_table` */

insert  into `order_table`(`order_id`,`user_id`,`food_id`,`food_price`,`food_quantity`,`total_price`,`ordered_time`) values (8,5,1,10,3,30,'2018-02-21 18:39:38'),(9,5,3,25,3,75,'2018-02-21 18:39:38'),(10,5,5,100,5,500,'2018-02-21 18:39:38'),(11,5,1,10,4,40,'2018-02-21 18:58:33'),(12,5,2,15,5,75,'2018-02-21 18:58:33'),(13,5,3,25,4,100,'2018-02-21 18:58:33'),(14,5,4,25,4,100,'2018-02-21 18:58:33'),(15,5,5,100,4,400,'2018-02-21 18:58:33'),(16,5,1,10,1,10,'2018-02-21 18:58:47'),(17,5,2,15,1,15,'2018-02-21 18:58:47'),(18,5,3,25,1,25,'2018-02-21 18:58:47');

/*Table structure for table `room_booking` */

DROP TABLE IF EXISTS `room_booking`;

CREATE TABLE `room_booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `total_days` int(11) DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `FK_room_booking_room_id` (`room_id`),
  KEY `FK_room_booking_user_id` (`user_id`),
  CONSTRAINT `FK_room_booking_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_room_booking_room_id` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `room_booking` */

insert  into `room_booking`(`booking_id`,`room_id`,`user_id`,`from_date`,`to_date`,`total_days`) values (10,1,5,'2018-02-08','2018-02-15',7);

/*Table structure for table `rooms` */

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_description` varchar(500) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `room_status` varchar(20) DEFAULT 'unbooked',
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `rooms` */

insert  into `rooms`(`room_id`,`room_description`,`price`,`room_status`) values (1,'Luxury Sweet',1000,'booked'),(2,'semi luxury room',750,'unbooked'),(3,'room',500,'unbooked');

/*Table structure for table `user_details` */

DROP TABLE IF EXISTS `user_details`;

CREATE TABLE `user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(200) DEFAULT NULL,
  `user_email` varchar(200) DEFAULT NULL,
  `user_password` varchar(200) DEFAULT NULL,
  `user_mobile_number` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `user_details` */

insert  into `user_details`(`user_id`,`user_name`,`user_email`,`user_password`,`user_mobile_number`) values (5,'User1','user1@gmail.com','user1','985546564'),(6,'Chethan','c@gmail.com','c','89746546546');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
