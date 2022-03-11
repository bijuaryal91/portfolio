-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2022 at 05:40 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `bookingId` int(11) NOT NULL,
  `staffId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `roomNo` int(11) DEFAULT NULL,
  `cin` varchar(255) NOT NULL,
  `cout` varchar(255) NOT NULL,
  `bookedDate` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `idType` varchar(255) NOT NULL,
  `idNo` varchar(255) NOT NULL,
  `issueDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customermanage`
--

CREATE TABLE `customermanage` (
  `staffId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `addingDate` varchar(255) NOT NULL,
  `updateDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomNo` int(11) NOT NULL,
  `roomType` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roommanage`
--

CREATE TABLE `roommanage` (
  `staffId` int(11) NOT NULL,
  `roomNo` int(11) NOT NULL,
  `addingDate` varchar(255) NOT NULL,
  `updateDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bookingId`),
  ADD KEY `customerId` (`customerId`),
  ADD KEY `roomNo` (`roomNo`),
  ADD KEY `staffId` (`staffId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customermanage`
--
ALTER TABLE `customermanage`
  ADD PRIMARY KEY (`staffId`,`customerId`),
  ADD KEY `customerId` (`customerId`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomNo`);

--
-- Indexes for table `roommanage`
--
ALTER TABLE `roommanage`
  ADD PRIMARY KEY (`staffId`,`roomNo`),
  ADD KEY `roomNo` (`roomNo`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`roomNo`) REFERENCES `room` (`roomNo`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`staffId`) REFERENCES `staff` (`id`);

--
-- Constraints for table `customermanage`
--
ALTER TABLE `customermanage`
  ADD CONSTRAINT `customermanage_ibfk_1` FOREIGN KEY (`staffId`) REFERENCES `staff` (`id`),
  ADD CONSTRAINT `customermanage_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`);

--
-- Constraints for table `roommanage`
--
ALTER TABLE `roommanage`
  ADD CONSTRAINT `roommanage_ibfk_1` FOREIGN KEY (`staffId`) REFERENCES `staff` (`id`),
  ADD CONSTRAINT `roommanage_ibfk_2` FOREIGN KEY (`roomNo`) REFERENCES `room` (`roomNo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
