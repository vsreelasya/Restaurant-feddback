-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2015 at 05:18 AM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `Coupon_code` int(11) NOT NULL,
  `Resta_id` int(11) NOT NULL,
  `Ema_id` varchar(20) NOT NULL,
  `Date` date NOT NULL,
  `Discount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`Coupon_code`, `Resta_id`, `Ema_id`, `Date`, `Discount`) VALUES
(123, 1, 'svllbhnn@memphis.edu', '2015-01-09', 50),
(234, 2, 'sowmyamedapati1@gmai', '2014-04-03', 30),
(345, 6, 'ruchiruchi@gmail.com', '2014-05-06', 10),
(567, 3, 'sbegum@gmail.com', '2015-06-07', 20);

-- --------------------------------------------------------

--
-- Table structure for table `cusine`
--

CREATE TABLE `cusine` (
  `Cusine_id` int(11) NOT NULL,
  `Name` enum('American','chinese','French','Indian','Italian','Mediterranean','Mexican','Thai','Vietnamese') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cusine`
--

INSERT INTO `cusine` (`Cusine_id`, `Name`) VALUES
(1, 'American'),
(2, 'American'),
(3, 'chinese'),
(4, 'chinese'),
(5, 'French'),
(6, 'French'),
(7, 'Italian'),
(8, 'Italian'),
(9, ''),
(10, ''),
(11, 'Mediterranean'),
(12, ''),
(13, 'Mexican'),
(14, 'Mexican'),
(15, 'Thai'),
(16, 'Vietnamese');

-- --------------------------------------------------------

--
-- Table structure for table `cusine_preference`
--

CREATE TABLE `cusine_preference` (
  `emai_id` varchar(20) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `Preference` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cusine_preference`
--

INSERT INTO `cusine_preference` (`emai_id`, `cus_id`, `Preference`) VALUES
('ruchiruchi@gmail.com', 4, 6),
('sowmyamedapati1@gmai', 5, 2),
('svllbhnn@memphis.edu', 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `dish`
--

CREATE TABLE `dish` (
  `Dish_id` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Cusine_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dish`
--

INSERT INTO `dish` (`Dish_id`, `Name`, `Cusine_id`) VALUES
(1, 'Pizza', 1),
(2, 'Turkey', 2),
(3, 'Noodles', 3),
(4, 'Fried Rice', 4),
(5, 'Flute', 5),
(6, 'FrenchStick', 6),
(7, 'Breadstick', 7),
(8, 'Olive', 8),
(9, 'Birayni', 9),
(10, 'Sambar', 10),
(11, 'Mossoke', 11),
(12, 'Cassarole', 12),
(13, 'Burrito', 13),
(14, 'Churipo', 14),
(15, 'ShrimpPaste', 15),
(16, 'Springrolls', 16);

-- --------------------------------------------------------

--
-- Table structure for table `dish_preference`
--

CREATE TABLE `dish_preference` (
  `e_id` varchar(20) NOT NULL,
  `dis_id` int(11) NOT NULL,
  `Preference` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dish_preference`
--

INSERT INTO `dish_preference` (`e_id`, `dis_id`, `Preference`) VALUES
('piya@memphis.edu', 3, '1'),
('sbegum@gmail.com', 5, '4'),
('svllbhnn@memphis.edu', 15, '5');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_address`
--

CREATE TABLE `restaurant_address` (
  `Restaurant_id` int(11) NOT NULL,
  `Rest_Address` varchar(45) NOT NULL,
  `Address_id` int(11) NOT NULL,
  `Longitude` float NOT NULL,
  `Latitude` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant_address`
--

INSERT INTO `restaurant_address` (`Restaurant_id`, `Rest_Address`, `Address_id`, `Longitude`, `Latitude`) VALUES
(1, 'Tennesse', 1, 52.2, 45.2),
(2, 'California', 2, 33.4, 89.3),
(3, 'Florida', 3, 18.5, 33.4),
(4, 'Washington', 4, 68.6, 78.5),
(5, 'Atlanta', 5, 28.7, 99.6),
(6, 'Texas', 6, 47.8, 27.7),
(7, 'Newyork', 7, 32.9, 42.8),
(8, 'Newjersey', 8, 80, 30.9),
(9, 'Minesota', 9, 14.1, 21),
(10, 'Musori', 10, 57.2, 55.1);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_cusine`
--

CREATE TABLE `restaurant_cusine` (
  `Restaur_id` int(11) NOT NULL,
  `Cusin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant_cusine`
--

INSERT INTO `restaurant_cusine` (`Restaur_id`, `Cusin_id`) VALUES
(1, 16),
(2, 15),
(3, 14),
(4, 13),
(5, 1),
(6, 3),
(7, 5),
(8, 7),
(9, 9),
(10, 11);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_dish`
--

CREATE TABLE `restaurant_dish` (
  `Re_id` int(11) NOT NULL,
  `di_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant_dish`
--

INSERT INTO `restaurant_dish` (`Re_id`, `di_id`) VALUES
(1, 9),
(2, 2),
(3, 4),
(4, 3),
(5, 8),
(6, 7),
(7, 1),
(8, 12),
(9, 5),
(10, 15);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_table1`
--

CREATE TABLE `restaurant_table1` (
  `Restaurant_id` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `TypeofRestaurant` enum('Ethnic','Fast_Food','Fast_Casual','Casual_Dinning','Family_Style','Fine_Dinning') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant_table1`
--

INSERT INTO `restaurant_table1` (`Restaurant_id`, `Name`, `TypeofRestaurant`) VALUES
(1, 'Mayuri', ''),
(2, 'Bombay House', ''),
(3, 'Taco Bell', 'Fast_Food'),
(4, 'Chick filla', 'Fast_Food'),
(5, 'Dominos', 'Fast_Casual'),
(6, 'Topios', 'Fast_Casual'),
(7, 'Panda', 'Casual_Dinning'),
(8, 'Tigerdinning', 'Casual_Dinning'),
(9, 'Mirchi', 'Family_Style'),
(10, 'Tamrind', '');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `Review_id` int(11) NOT NULL,
  `Em_id` varchar(20) NOT NULL,
  `Rest_id` int(11) NOT NULL,
  `Price` enum('1','2','3','4','5') NOT NULL,
  `Service` enum('1','2','3','4','5') NOT NULL,
  `Food_Quality` enum('1','2','3','4','5') NOT NULL,
  `Ambience` enum('1','2','3','4','5') NOT NULL,
  `Overall_Experience` enum('1','2','3','4','5') NOT NULL,
  `Comment` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`Review_id`, `Em_id`, `Rest_id`, `Price`, `Service`, `Food_Quality`, `Ambience`, `Overall_Experience`, `Comment`) VALUES
(1, 'svllbhnn@memphis.edu', 2, '3', '5', '5', '3', '5', NULL),
(2, 'sowmyamedapati1@gmai', 4, '4', '3', '2', '1', '4', NULL),
(3, 'ruchiruchi@gmail.com', 3, '4', '3', '4', '3', '4', 'avg'),
(4, 'sbegum@gmail.com', 9, '5', '3', '5', '3', '5', NULL),
(5, 'piya@memphis.edu', 5, '2', '4', '2', '3', '4', 'good');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Email_id` varchar(20) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `Address_Street` varchar(45) NOT NULL,
  `Address_State` varchar(45) NOT NULL,
  `Address_Zip` varchar(45) NOT NULL,
  `Longitude` float DEFAULT NULL,
  `Latitude` float DEFAULT NULL,
  `Trusthworthyness` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Any one can be user';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Email_id`, `Name`, `DOB`, `Address_Street`, `Address_State`, `Address_Zip`, `Longitude`, `Latitude`, `Trusthworthyness`) VALUES
('piya@memphis.edu', 'kamrun', '1999-01-05', 'Brister', 'Dallas', '38112', 16.3, 40.9, 3),
('ruchiruchi@gmail.com', 'Ruchi ', '1993-02-03', 'Mynders', 'Memphis', '38111', 40.2, 55.8, 3),
('sbegum@gmail.com', 'Snigdha', '1990-04-04', 'Wilder', 'Florida', '52001', 30.2, 22, 2),
('sowmyamedapati1@gmai', 'Sowmya', '1993-05-06', 'Patterson', 'Memphis', '38111', 70.2, 30.2, 4),
('svllbhnn@memphis.edu', 'Sree', '1994-01-09', 'Mynders', 'Memphis', '38111', 77.7, 50.5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `user_follow`
--

CREATE TABLE `user_follow` (
  `uemail_id` varchar(20) NOT NULL,
  `femail_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_follow`
--

INSERT INTO `user_follow` (`uemail_id`, `femail_id`) VALUES
('ruchiruchi@gmail.com', 'piya@memphis.edu'),
('sowmyamedapati1@gmai', 'sbegum@gmail.com'),
('svllbhnn@memphis.edu', 'ruchiruchi@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`Coupon_code`),
  ADD UNIQUE KEY `Coupon_id_UNIQUE` (`Coupon_code`),
  ADD UNIQUE KEY `Restaurant_id_UNIQUE` (`Resta_id`),
  ADD KEY `Ema_id_idx` (`Ema_id`);

--
-- Indexes for table `cusine`
--
ALTER TABLE `cusine`
  ADD PRIMARY KEY (`Cusine_id`),
  ADD UNIQUE KEY `Cusine_id_UNIQUE` (`Cusine_id`);

--
-- Indexes for table `cusine_preference`
--
ALTER TABLE `cusine_preference`
  ADD PRIMARY KEY (`emai_id`,`cus_id`),
  ADD UNIQUE KEY `emai_id_UNIQUE` (`emai_id`),
  ADD KEY `cus_id_idx` (`cus_id`);

--
-- Indexes for table `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`Dish_id`),
  ADD UNIQUE KEY `Dish_id_UNIQUE` (`Dish_id`),
  ADD UNIQUE KEY `Cusine_id_UNIQUE` (`Cusine_id`);

--
-- Indexes for table `dish_preference`
--
ALTER TABLE `dish_preference`
  ADD PRIMARY KEY (`e_id`,`dis_id`),
  ADD UNIQUE KEY `e_id_UNIQUE` (`e_id`),
  ADD UNIQUE KEY `dis_id_UNIQUE` (`dis_id`);

--
-- Indexes for table `restaurant_address`
--
ALTER TABLE `restaurant_address`
  ADD PRIMARY KEY (`Address_id`),
  ADD UNIQUE KEY `Restaurant_id_UNIQUE` (`Restaurant_id`),
  ADD UNIQUE KEY `Rest_Address_UNIQUE` (`Rest_Address`),
  ADD UNIQUE KEY `Address_State_UNIQUE` (`Address_id`);

--
-- Indexes for table `restaurant_cusine`
--
ALTER TABLE `restaurant_cusine`
  ADD PRIMARY KEY (`Restaur_id`,`Cusin_id`),
  ADD UNIQUE KEY `Restaur_id_UNIQUE` (`Restaur_id`),
  ADD UNIQUE KEY `Cusin_id_UNIQUE` (`Cusin_id`);

--
-- Indexes for table `restaurant_dish`
--
ALTER TABLE `restaurant_dish`
  ADD PRIMARY KEY (`Re_id`,`di_id`),
  ADD UNIQUE KEY `R_id_UNIQUE` (`Re_id`),
  ADD UNIQUE KEY `dis_id_UNIQUE` (`di_id`);

--
-- Indexes for table `restaurant_table1`
--
ALTER TABLE `restaurant_table1`
  ADD PRIMARY KEY (`Restaurant_id`),
  ADD UNIQUE KEY `Restaurant_id_UNIQUE` (`Restaurant_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`Review_id`),
  ADD UNIQUE KEY `Review_id_UNIQUE` (`Review_id`),
  ADD UNIQUE KEY `Email_id_UNIQUE` (`Em_id`),
  ADD UNIQUE KEY `Restaurant_id_UNIQUE` (`Rest_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Email_id`),
  ADD UNIQUE KEY `email_id_UNIQUE` (`Email_id`);

--
-- Indexes for table `user_follow`
--
ALTER TABLE `user_follow`
  ADD PRIMARY KEY (`uemail_id`,`femail_id`),
  ADD UNIQUE KEY `uema_id_UNIQUE` (`uemail_id`),
  ADD UNIQUE KEY `femail_id_UNIQUE` (`femail_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `Review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `Ema_id` FOREIGN KEY (`Ema_id`) REFERENCES `user` (`Email_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Resta_id` FOREIGN KEY (`Resta_id`) REFERENCES `restaurant_table1` (`Restaurant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cusine_preference`
--
ALTER TABLE `cusine_preference`
  ADD CONSTRAINT `cus_id` FOREIGN KEY (`cus_id`) REFERENCES `cusine` (`Cusine_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `emai_id` FOREIGN KEY (`emai_id`) REFERENCES `user` (`Email_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `Cusine_id` FOREIGN KEY (`Cusine_id`) REFERENCES `cusine` (`Cusine_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dish_preference`
--
ALTER TABLE `dish_preference`
  ADD CONSTRAINT `dis_id` FOREIGN KEY (`dis_id`) REFERENCES `dish` (`Dish_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `e_id` FOREIGN KEY (`e_id`) REFERENCES `user` (`Email_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `restaurant_address`
--
ALTER TABLE `restaurant_address`
  ADD CONSTRAINT `Restaurant_id` FOREIGN KEY (`Restaurant_id`) REFERENCES `restaurant_table1` (`Restaurant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `restaurant_cusine`
--
ALTER TABLE `restaurant_cusine`
  ADD CONSTRAINT `Cusin_id` FOREIGN KEY (`Cusin_id`) REFERENCES `cusine` (`Cusine_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Restaur_id` FOREIGN KEY (`Restaur_id`) REFERENCES `restaurant_table1` (`Restaurant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `restaurant_dish`
--
ALTER TABLE `restaurant_dish`
  ADD CONSTRAINT `Re_id` FOREIGN KEY (`Re_id`) REFERENCES `restaurant_table1` (`Restaurant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `di_id` FOREIGN KEY (`di_id`) REFERENCES `dish` (`Dish_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `Em_id` FOREIGN KEY (`Em_id`) REFERENCES `user` (`Email_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Rest_id` FOREIGN KEY (`Review_id`) REFERENCES `restaurant_table1` (`Restaurant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_follow`
--
ALTER TABLE `user_follow`
  ADD CONSTRAINT `femail_id` FOREIGN KEY (`femail_id`) REFERENCES `user` (`Email_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `uemail_id` FOREIGN KEY (`uemail_id`) REFERENCES `user` (`Email_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
