-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2023 at 09:56 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankon`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `firstName` varchar(10) NOT NULL,
  `lastName` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phoneNumber` int(14) NOT NULL,
  `dateOfOpening` varchar(10) NOT NULL,
  `email` varchar(40) NOT NULL,
  `pin` varchar(5) NOT NULL,
  `accountNumber` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`firstName`, `lastName`, `address`, `phoneNumber`, `dateOfOpening`, `email`, `pin`, `accountNumber`) VALUES
('Tasin', 'Khan', 'Uttara, Dhaka, Dhaka, Bangladesh, 1230', 1631380297, '25/10/2023', 'tasin.khan@northsouth.edu', '12345', 12345678),
('Rafifa', 'Jahir', 'MirpurDhakaDhaka1235Bangladesh', 1752156873, '25/10/2023', 'rafifa@gmail.com', '54321', 16982455);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Name` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phoneNumber` int(14) DEFAULT NULL,
  `accountNumber` int(8) NOT NULL,
  `Quantity` varchar(10) DEFAULT NULL,
  `Type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Name`, `Email`, `address`, `phoneNumber`, `accountNumber`, `Quantity`, `Type`) VALUES
('Rifah_Anjum', 'rifah.anjum@example.com', '27-Paltan', 277677, 12345678, '1', 'Personal');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`accountNumber`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`accountNumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--
-- Indexes for table `fraudAlerts`
--
CREATE TABLE fraud_alerts (
  accountNumber INT NOT NULL,
  date DATETIME NOT NULL,
  time TIME NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  from_account VARCHAR(255) NOT NULL,
  to_account VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  PRIMARY KEY (accountNumber)
);
INSERT INTO fraud_alerts (date, time, amount, from_account, to_account, country)
VALUES
  ('2023-10-26', '10:00:00', '1000.00', '1234567890', '9876543210', 'United States'),
  ('2023-10-26', '11:00:00', '500.00', '0987654321', '1234567890', 'Canada'),
  ('2023-10-26', '12:00:00', '250.00', '2345678901', '1098765432', 'Bnagladesh'),
  ('2023-10-26', '13:00:00', '100.00', '3456789012', '2109876543', 'Australia'),
  ('2023-10-26', '14:00:00', '50.00', '4567890123', '3210987654', 'Germany');
