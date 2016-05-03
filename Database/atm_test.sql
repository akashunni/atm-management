-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2016 at 07:55 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atm_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `atm_logs`
--

CREATE TABLE `atm_logs` (
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Card_No` bigint(16) NOT NULL,
  `Amount` int(10) NOT NULL,
  `Type` varchar(10) NOT NULL,
  `Status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `atm_logs`
--

INSERT INTO `atm_logs` (`Timestamp`, `Card_No`, `Amount`, `Type`, `Status`) VALUES
('2016-04-07 12:38:46', 1111222211112222, 10, 'Deposit', 'Success'),
('2016-04-07 12:38:52', 1111222211112222, 100, 'Withdraw', 'Success'),
('2016-04-07 12:54:16', 1111222211112222, 6, 'Transfer', 'Failed'),
('2016-04-07 12:54:52', 1111222211112222, 22, 'Transfer', 'Failed'),
('2016-04-07 12:56:56', 1111222211112222, 1111, 'Transfer', 'Success'),
('2016-04-07 13:02:03', 1111222211112222, 100, 'Transfer', 'Success'),
('2016-04-07 13:11:27', 1111222211112222, 1234, 'Transfer', 'Success'),
('2016-04-07 13:13:22', 1111222211112222, 1111, 'Transfer', 'Failed'),
('2016-04-07 13:29:45', 1111222211112222, 1234, 'Transfer', 'Success'),
('2016-04-07 13:32:36', 1111222211112222, 1000, 'Transfer', 'Success'),
('2016-04-07 13:55:04', 1111222211112222, 1000, 'Transfer', 'Failed'),
('2016-04-07 13:55:42', 1111222211112222, 1000, 'Transfer', 'Failed'),
('2016-04-07 13:56:26', 1111222211112222, 1000, 'Transfer', 'Success'),
('2016-04-07 13:59:12', 1111222211112222, 1000, 'Transfer', 'Failed'),
('2016-04-07 14:01:35', 1111222211112222, 1000, 'Transfer', 'Failed'),
('2016-04-07 14:02:26', 1111222211112222, 1000, 'Transfer', 'Failed'),
('2016-04-07 14:06:41', 1111222211112222, 1000, 'Transfer', 'Failed'),
('2016-04-07 14:07:07', 1111222211112222, 1024, 'Transfer', 'Failed'),
('2016-04-07 14:07:40', 1111222211112222, 1000, 'Transfer', 'Success'),
('2016-04-07 16:48:15', 2048102420481024, 1000, 'Withdraw', 'Success'),
('2016-04-07 16:48:29', 2048102420481024, 500, 'Transfer', 'Success');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `Bank_ID` int(10) NOT NULL,
  `Bank_Name` varchar(20) NOT NULL,
  `Balance` int(10) NOT NULL DEFAULT '10000000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`Bank_ID`, `Bank_Name`, `Balance`) VALUES
(1024, 'SBI MNNIT', 100000),
(2048, 'VIJAYA BANK MNNIT', 99000);

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `Card_no` bigint(16) NOT NULL,
  `pin` int(4) NOT NULL,
  `Expiry` date NOT NULL,
  `CVV` int(3) NOT NULL,
  `Type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`Card_no`, `pin`, `Expiry`, `CVV`, `Type`) VALUES
(1024204810242048, 1024, '2017-01-03', 999, 'VISA'),
(1111222211112222, 1111, '2018-03-28', 121, 'VISA'),
(2048102420481024, 2222, '2017-04-12', 911, 'MASTERCARD'),
(2222111122221111, 2222, '2019-07-15', 200, 'VISA'),
(5555444455554444, 5555, '2019-12-20', 124, 'MASTERCARD');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Bank_ID` int(10) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Card_no` bigint(16) NOT NULL,
  `Balance` int(10) NOT NULL,
  `mobile` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Bank_ID`, `Username`, `Card_no`, `Balance`, `mobile`) VALUES
(1024, 'Akash', 1024204810242048, 0, 9910242048),
(1024, 'Sushant', 1111222211112222, 12500, 99111222222),
(2048, 'Swadesh', 2048102420481024, 1500, 9920481024),
(2048, 'Shakti', 2222111122221111, 0, 9922221111),
(1024, 'Anil', 5555444455554444, 0, 9955554444);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atm_logs`
--
ALTER TABLE `atm_logs`
  ADD PRIMARY KEY (`Timestamp`,`Card_No`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`Bank_ID`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`Card_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Card_no`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
