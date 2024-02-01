-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2022 at 05:02 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `al_waseet`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_payment` (IN `money` DECIMAL(10,2), IN `pay_id` INT, IN `date` DATE, IN `time` TIME, IN `ad_id` INT, IN `cus_id` INT)  INSERT INTO payment (amount, id, date, time, advertisementid, customerid)
VALUE (money, pay_id, date, time, ad_id, cus_id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `adtype_` (IN `type_id` INT, IN `length_` INT, IN `wordco` INT, IN `VALU` DECIMAL(10,2))  insert INTO ad_type (id, length, value, wordscount) 
VALUES (type_id, length_, VALU, wordco)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_payment` (IN `c_id` INT)  SELECT payment.ID, payment.amount, payment.date, payment.time, customer.FirstName, customer.LastName, advertisement.name, advertisement.genre
FROM payment
INNER JOIN customer ON payment.customerID = customer.ID
INNER JOIN advertisement ON payment.advertisementID = advertisement.ID
WHERE customerID = c_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `make_ad` (IN `adname` VARCHAR(255), IN `gen` VARCHAR(255), IN `d` DATE, IN `ad_id` INT, IN `adtype` INT)  insert INTO advertisement (name, genre, date, id, ad_type_id)
VALUES (adname, gen, d, ad_id, adtype)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_customeraddress` (IN `cus_id` INT, IN `ncity` VARCHAR(255), IN `bnumber` VARCHAR(255), IN `stname` VARCHAR(255))  UPDATE customer_address
SET city = ncity, buildingnumber = bnumber, streetname = stname
WHERE customerid = cus_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_customerphone` (IN `cus_id` INT, IN `phonenum` INT)  UPDATE customer_phone
SET phone = phonenum
WHERE customerid = cus_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_useremail` (IN `cus_id` INT, IN `em` VARCHAR(255))  UPDATE customer
SET email = em
WHERE id = cus_id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `advertisement`
--

CREATE TABLE `advertisement` (
  `ID` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `date` date NOT NULL,
  `genre` varchar(255) NOT NULL,
  `ad_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `advertisement`
--

INSERT INTO `advertisement` (`ID`, `name`, `date`, `genre`, `ad_type_id`) VALUES
(1005, 'ipsuem', '2022-08-01', 'political', 101),
(1006, 'bingo', '2022-08-06', 'sport', 102),
(1007, 'cancer', '2022-08-15', 'health', 103),
(1008, 'recent', '2022-08-09', 'news', 104),
(1051, 'test', '2022-09-01', 'fashion', 500);

-- --------------------------------------------------------

--
-- Table structure for table `ad_type`
--

CREATE TABLE `ad_type` (
  `ID` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `WordsCount` int(11) NOT NULL,
  `value` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ad_type`
--

INSERT INTO `ad_type` (`ID`, `length`, `WordsCount`, `value`) VALUES
(101, 10, 120, '12.50'),
(102, 8, 80, '8.50'),
(103, 7, 70, '7.50'),
(104, 5, 50, '5.50'),
(500, 10, 100, '9.75');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `SSN` int(11) NOT NULL,
  `DOB` date NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `FirstName`, `LastName`, `SSN`, `DOB`, `Email`) VALUES
(12, 'mohammed', 'samer', 101019, '1988-07-12', 'm.s@gmail.com'),
(13, 'safaa', 'jbouri', 101014, '1999-02-04', 'safaa.jbouri@gmail.com'),
(14, 'jihad', 'qut', 101016, '2001-07-24', 'jihad.qutteineh@gmail.com'),
(15, 'ahmad', 'saleh', 101010, '2000-12-25', 'ahmad.saleh@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `customerID` int(11) NOT NULL,
  `country` varchar(150) NOT NULL,
  `city` varchar(150) NOT NULL,
  `StreetName` varchar(200) NOT NULL,
  `BuildingNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`customerID`, `country`, `city`, `StreetName`, `BuildingNumber`) VALUES
(12, 'Jordan', 'Amman', 'gardens st.', 23),
(12, 'Jordan', 'Zarqa', 'army street', 19),
(13, 'Jordan', 'Amman', 'university st.', 1),
(14, 'Jordan', 'Aqaba', 'atallah suhaimat st', 90),
(15, 'Jordan', 'Amman', 'mecca st.', 12),
(15, 'Jordan', 'Irbid', 'madina st.', 15);

-- --------------------------------------------------------

--
-- Stand-in structure for view `customer_info`
-- (See below for the actual view)
--
CREATE TABLE `customer_info` (
`ID` int(11)
,`FirstName` varchar(255)
,`LastName` varchar(255)
,`SSN` int(11)
,`DOB` date
,`Email` varchar(100)
,`phone` varchar(150)
,`country` varchar(150)
,`city` varchar(150)
,`StreetName` varchar(200)
,`BuildingNumber` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `customer_phone`
--

CREATE TABLE `customer_phone` (
  `customerID` int(11) NOT NULL,
  `phone` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_phone`
--

INSERT INTO `customer_phone` (`customerID`, `phone`) VALUES
(12, '787167515'),
(12, '797167511'),
(13, '775512345'),
(14, '775131234'),
(15, '791122222');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `ID` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `customerID` int(11) DEFAULT NULL,
  `advertisementID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`ID`, `date`, `time`, `amount`, `customerID`, `advertisementID`) VALUES
(90, '2022-08-16', '19:30:10', '13.50', 15, 1005),
(91, '2022-08-14', '20:46:01', '9.50', 12, 1006),
(92, '2022-08-13', '11:49:15', '8.50', 13, 1007),
(93, '2022-08-02', '15:20:25', '6.50', 14, 1008);

-- --------------------------------------------------------

--
-- Stand-in structure for view `payment_history`
-- (See below for the actual view)
--
CREATE TABLE `payment_history` (
`ID` int(11)
,`amount` decimal(10,2)
,`date` date
,`time` time
,`FirstName` varchar(255)
,`LastName` varchar(255)
,`name` varchar(150)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `service_usage`
-- (See below for the actual view)
--
CREATE TABLE `service_usage` (
`ID` int(11)
,`date` date
,`amount` decimal(10,2)
,`FirstName` varchar(255)
,`LastName` varchar(255)
,`genre` varchar(255)
,`name` varchar(150)
,`length` int(11)
,`WordsCount` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `customer_info`
--
DROP TABLE IF EXISTS `customer_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customer_info`  AS SELECT `customer`.`ID` AS `ID`, `customer`.`FirstName` AS `FirstName`, `customer`.`LastName` AS `LastName`, `customer`.`SSN` AS `SSN`, `customer`.`DOB` AS `DOB`, `customer`.`Email` AS `Email`, `customer_phone`.`phone` AS `phone`, `customer_address`.`country` AS `country`, `customer_address`.`city` AS `city`, `customer_address`.`StreetName` AS `StreetName`, `customer_address`.`BuildingNumber` AS `BuildingNumber` FROM ((`customer` left join `customer_phone` on(`customer_phone`.`customerID` = `customer`.`ID`)) left join `customer_address` on(`customer_address`.`customerID` = `customer`.`ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `payment_history`
--
DROP TABLE IF EXISTS `payment_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `payment_history`  AS SELECT `payment`.`ID` AS `ID`, `payment`.`amount` AS `amount`, `payment`.`date` AS `date`, `payment`.`time` AS `time`, `customer`.`FirstName` AS `FirstName`, `customer`.`LastName` AS `LastName`, `advertisement`.`name` AS `name` FROM ((`payment` join `customer` on(`payment`.`customerID` = `customer`.`ID`)) join `advertisement` on(`payment`.`advertisementID` = `advertisement`.`ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `service_usage`
--
DROP TABLE IF EXISTS `service_usage`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `service_usage`  AS SELECT `payment`.`ID` AS `ID`, `payment`.`date` AS `date`, `payment`.`amount` AS `amount`, `customer`.`FirstName` AS `FirstName`, `customer`.`LastName` AS `LastName`, `advertisement`.`genre` AS `genre`, `advertisement`.`name` AS `name`, `ad_type`.`length` AS `length`, `ad_type`.`WordsCount` AS `WordsCount` FROM (((`payment` join `customer` on(`payment`.`customerID` = `customer`.`ID`)) join `advertisement` on(`payment`.`advertisementID` = `advertisement`.`ID`)) join `ad_type` on(`advertisement`.`ad_type_id` = `ad_type`.`ID`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_ad_type_id` (`ad_type_id`);

--
-- Indexes for table `ad_type`
--
ALTER TABLE `ad_type`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `SSN` (`SSN`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`customerID`,`country`,`city`,`StreetName`,`BuildingNumber`);

--
-- Indexes for table `customer_phone`
--
ALTER TABLE `customer_phone`
  ADD PRIMARY KEY (`customerID`,`phone`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_advertisementID` (`advertisementID`),
  ADD KEY `FK_customer_ID` (`customerID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD CONSTRAINT `FK_ad_type_id` FOREIGN KEY (`ad_type_id`) REFERENCES `ad_type` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `FK_customer_address` FOREIGN KEY (`customerID`) REFERENCES `customer` (`ID`) ON UPDATE CASCADE;

--
-- Constraints for table `customer_phone`
--
ALTER TABLE `customer_phone`
  ADD CONSTRAINT `FK_customer_phone` FOREIGN KEY (`customerID`) REFERENCES `customer` (`ID`) ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_advertisementID` FOREIGN KEY (`advertisementID`) REFERENCES `advertisement` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_customer_ID` FOREIGN KEY (`customerID`) REFERENCES `customer` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
