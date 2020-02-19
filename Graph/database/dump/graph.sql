/*
SQLyog Community v12.4.3 (64 bit)
MySQL - 5.1.33-community : Database - graph
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`graph` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `graph`;

/*Table structure for table `bar_chart` */

DROP TABLE IF EXISTS `bar_chart`;

CREATE TABLE `bar_chart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `series` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `bar_chart` */

insert  into `bar_chart`(`id`,`category`,`series`) values 
(1,'java',10),
(2,'cpp',20),
(3,'c',15),
(4,'python',42);

/*Table structure for table `line_chart` */

DROP TABLE IF EXISTS `line_chart`;

CREATE TABLE `line_chart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `series` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `line_chart` */

insert  into `line_chart`(`id`,`category`,`series`) values 
(1,'Java',20),
(2,'dotnet',30),
(3,'c',15),
(4,'c++',50),
(5,'python',10);

/*Table structure for table `multi_line` */

DROP TABLE IF EXISTS `multi_line`;

CREATE TABLE `multi_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `subscribers` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `multi_line` */

insert  into `multi_line`(`id`,`name`,`year`,`subscribers`) values 
(1,'india','2019','2'),
(2,'india','2019','6'),
(3,'india','2019','7'),
(4,'india','2019','9'),
(5,'india','2019','4'),
(6,'nepal','2019','1'),
(7,'nepal','2019','3'),
(8,'nepal','2019','6'),
(9,'nepal','2019','10'),
(10,'nepal','2019','1'),
(11,'nepal','2019','10');

/*Table structure for table `pie_chart` */

DROP TABLE IF EXISTS `pie_chart`;

CREATE TABLE `pie_chart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `yaxis` int(11) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `pie_chart` */

insert  into `pie_chart`(`id`,`name`,`yaxis`,`year`) values 
(1,'excelent',60,NULL),
(2,'pass',30,NULL),
(3,'fail',10,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
