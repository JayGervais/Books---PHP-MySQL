-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: mysql1027.blacksun.ca:3306
-- Generation Time: Mar 28, 2017 at 09:49 AM
-- Server version: 5.5.45
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jaygerva_books`
--

-- --------------------------------------------------------

--
-- Table structure for table `Books`
--

CREATE TABLE IF NOT EXISTS `Books` (
  `ISBN` char(13) NOT NULL,
  `Author` char(50) DEFAULT NULL,
  `Title` char(100) DEFAULT NULL,
  `Price` float(4,2) DEFAULT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Books`
--

INSERT INTO `Books` (`ISBN`, `Author`, `Title`, `Price`) VALUES
('0-672-31509-2', 'Pruitt, et al.', 'Teach Yourself GIMP in 24 Hours', 24.99),
('0-672-31697-8', 'Michael Morgan', 'Java 2 for Professional Developers', 34.99),
('0-672-31745-1', 'Thomas Down', 'Installing Debian GNU/Linux', 24.99),
('0-672-31769-9', 'Thomas Scheck', 'Caldera OpenLinux System Administration Unleashed', 49.99);

-- --------------------------------------------------------

--
-- Table structure for table `Book_Reviews`
--

CREATE TABLE IF NOT EXISTS `Book_Reviews` (
  `ISBN` char(13) NOT NULL,
  `Review` text,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Book_Reviews`
--

INSERT INTO `Book_Reviews` (`ISBN`, `Review`) VALUES
('0-672-31697-8', 'The Morgan books is clearly written and does allot of neato things. The bestest book ever.');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `CustomerID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(50) NOT NULL,
  `Address` char(100) NOT NULL,
  `City` char(30) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `Name`, `Address`, `City`) VALUES
(1, 'Julie Smith', '25 Oak Street', 'Airport West'),
(2, 'Alan Wong', '1/47 Haines Avenue', 'Box Hill'),
(3, 'Michael Arthur', '357 North Road', 'Yarraville');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerID` int(10) unsigned NOT NULL,
  `Amount` float(6,2) DEFAULT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `CustomerID`, `Amount`, `Date`) VALUES
(1, 3, 69.98, '2007-04-02'),
(2, 1, 49.99, '2007-04-15'),
(3, 2, 74.98, '2007-04-19'),
(4, 3, 24.99, '2007-05-01');

-- --------------------------------------------------------

--
-- Table structure for table `Order_Items`
--

CREATE TABLE IF NOT EXISTS `Order_Items` (
  `OrderID` int(10) unsigned NOT NULL,
  `ISBN` char(13) NOT NULL,
  `Quantity` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`OrderID`,`ISBN`),
  KEY `ISBN` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Order_Items`
--

INSERT INTO `Order_Items` (`OrderID`, `ISBN`, `Quantity`) VALUES
(1, '0-672-31697-8', 2),
(2, '0-672-31769-9', 1),
(3, '0-672-31509-2', 1),
(3, '0-672-31769-9', 1),
(4, '0-672-31745-1', 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Book_Reviews`
--
ALTER TABLE `Book_Reviews`
  ADD CONSTRAINT `Book_Reviews_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `Books` (`ISBN`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`customerID`);

--
-- Constraints for table `Order_Items`
--
ALTER TABLE `Order_Items`
  ADD CONSTRAINT `Order_Items_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `Order_Items_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `Books` (`ISBN`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
