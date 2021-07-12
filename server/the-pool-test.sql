-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.10-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for the-pool-test
CREATE DATABASE IF NOT EXISTS `the-pool-test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `the-pool-test`;

-- Dumping structure for table the-pool-test.confirmed_rides
CREATE TABLE IF NOT EXISTS `confirmed_rides` (
  `confirmation_token` int(11) NOT NULL,
  `bid_id` int(11) NOT NULL,
  PRIMARY KEY (`confirmation_token`),
  UNIQUE KEY `confirmation_token` (`confirmation_token`),
  KEY `confirmed_rides_fk0` (`bid_id`),
  CONSTRAINT `confirmed_rides_fk0` FOREIGN KEY (`bid_id`) REFERENCES `ride_bids` (`bid_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table the-pool-test.rides
CREATE TABLE IF NOT EXISTS `rides` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `rider_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `from_location` varchar(255) NOT NULL,
  `to_location` varchar(255) NOT NULL,
  `event_date` date NOT NULL,
  `event_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `banner` varchar(255) DEFAULT NULL,
  `additional_message` varchar(255) DEFAULT NULL,
  `bid_count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`r_id`),
  UNIQUE KEY `r_id` (`r_id`),
  KEY `rides_fk0` (`rider_id`),
  CONSTRAINT `rides_fk0` FOREIGN KEY (`rider_id`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table the-pool-test.ride_bids
CREATE TABLE IF NOT EXISTS `ride_bids` (
  `bid_id` int(11) NOT NULL AUTO_INCREMENT,
  `bidder_id` int(11) NOT NULL,
  `rider_id` int(11) NOT NULL,
  `bid_message` varchar(255) DEFAULT NULL,
  `confirmed` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`bid_id`),
  UNIQUE KEY `bid_id` (`bid_id`),
  KEY `ride_bids_fk0` (`bidder_id`),
  KEY `ride_bids_fk1` (`rider_id`),
  CONSTRAINT `ride_bids_fk0` FOREIGN KEY (`bidder_id`) REFERENCES `users` (`uid`),
  CONSTRAINT `ride_bids_fk1` FOREIGN KEY (`rider_id`) REFERENCES `rides` (`rider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table the-pool-test.users
CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL,
  `verified` int(1) NOT NULL DEFAULT 1,
  `dob` date NOT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid` (`uid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_no` (`phone_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
