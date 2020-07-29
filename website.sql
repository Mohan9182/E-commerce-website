-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 29, 2019 at 12:19 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `website`
--

-- --------------------------------------------------------

--
-- Table structure for table `camera_description`
--

DROP TABLE IF EXISTS `camera_description`;
CREATE TABLE IF NOT EXISTS `camera_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `sensor_size` varchar(50) NOT NULL,
  `resolution` varchar(11) NOT NULL,
  `lens` varchar(50) NOT NULL,
  `viewfinder` varchar(50) NOT NULL,
  `shooting_rate` varchar(11) NOT NULL,
  `movies` varchar(11) NOT NULL,
  `user_level` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `camera_description`
--

INSERT INTO `camera_description` (`id`, `type`, `sensor_size`, `resolution`, `lens`, `viewfinder`, `shooting_rate`, `movies`, `user_level`) VALUES
(1, 'Mirrorless', 'Full-frame CMOS', '24.05MP', 'Nikon Z Mount', 'EVF', '12fps', '4K', 'Intermediate/expert');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `price`) VALUES
(1, 'Nikon Z6', 191000),
(2, 'Fujifilm X-T30', 98000),
(3, 'Nikon D850', 209850),
(4, 'Olympus OMD EM10 Mark 3', 65015),
(5, 'Canon EOS Rebel SL2', 39950),
(6, 'Sony A7 III', 145500),
(7, 'Casio G-Shock GRAVITYMASTER', 12995),
(8, 'Michael Kors Bradshaw', 16495),
(9, 'Diesel Analog', 8995),
(10, 'Daniel Wellington Classic Petite', 11199),
(11, 'Fossil Grant', 10995),
(12, 'Armani Exchange Hampton', 13495),
(13, 'Samsung Galaxy S10e', 50900),
(14, 'OnePlus 7 Pro', 48999),
(15, 'LG G7+ Thin Q', 40000),
(16, 'Samsung Galaxy Note 8', 56900),
(17, 'Apple iPhone 8', 57699),
(18, 'Oppo Reno 10X Zoom', 39900);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `address` varchar(120) NOT NULL,
  `pincode` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_items`
--

DROP TABLE IF EXISTS `users_items`;
CREATE TABLE IF NOT EXISTS `users_items` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`item_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Constraints for table `camera_description`
--
ALTER TABLE `camera_description`
  ADD CONSTRAINT `camera_description_ibfk_1` FOREIGN KEY (`id`) REFERENCES `items` (`id`);

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`id`) REFERENCES `items` (`id`);

--
-- Constraints for table `users_items`
--
ALTER TABLE `users_items`
  ADD CONSTRAINT `users_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
