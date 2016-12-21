CREATE DATABASE `user` /*!40100 DEFAULT CHARACTER SET utf8 */;


CREATE TABLE `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) DEFAULT NULL,
  `facility` varchar(200) DEFAULT NULL,
  `admitdate` date DEFAULT NULL,
  `dischargedate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;


CREATE TABLE `userlogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Firstname` varchar(200) NOT NULL,
  `Lastname` varchar(200) DEFAULT NULL,
  `Email` varchar(200) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `Facility` varchar(200) NOT NULL,
  `Role` enum('Admin','Clerk') NOT NULL,
  `Status` enum('Active','Deactive') NOT NULL,
  `Deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
