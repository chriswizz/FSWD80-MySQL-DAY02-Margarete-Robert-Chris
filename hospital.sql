-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2019 at 04:23 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--
CREATE DATABASE IF NOT EXISTS `hospital` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `hospital`;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_ID` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `spec` varchar(55) DEFAULT NULL,
  `fk_intervention_ID` int(11) NOT NULL,
  `fk_unit_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_ID`, `name`, `spec`, `fk_intervention_ID`, `fk_unit_ID`) VALUES
(1, 'Pocahontas', 'internist', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `health_center`
--

CREATE TABLE `health_center` (
  `center_ID` int(11) NOT NULL,
  `fk_patient_ID` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `health_center`
--

INSERT INTO `health_center` (`center_ID`, `fk_patient_ID`, `name`, `address`) VALUES
(11111, 12345, 'Wiener Health Center', 'Kettenbrucken Straße 13., 1050 Wien');

-- --------------------------------------------------------

--
-- Table structure for table `intervention`
--

CREATE TABLE `intervention` (
  `intervention_ID` int(11) NOT NULL,
  `date_of_intervention` date DEFAULT NULL,
  `symptom` varchar(100) DEFAULT NULL,
  `treatment` varchar(100) DEFAULT NULL,
  `fk_doctor_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `intervention`
--

INSERT INTO `intervention` (`intervention_ID`, `date_of_intervention`, `symptom`, `treatment`, `fk_doctor_ID`) VALUES
(12345, '2019-11-05', 'stomach', 'ibumetin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_ID` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `social_sec_num` int(11) DEFAULT NULL,
  `date_of_admission` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_ID`, `first_name`, `last_name`, `birth_date`, `social_sec_num`, `date_of_admission`) VALUES
(12345, 'John', 'Smith', '1989-06-17', 1122170689, '2019-11-05'),
(12346, 'Christian', 'DiCaprio', '1992-09-08', 1212080992, '2019-11-04');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `unit_ID` int(11) NOT NULL,
  `fk_center_ID` int(11) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `fk_doctor_ID` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`unit_ID`, `fk_center_ID`, `name`, `fk_doctor_ID`) VALUES
(1, 11111, 'Serri', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_ID`),
  ADD KEY `fk_unit_ID` (`fk_unit_ID`);

--
-- Indexes for table `health_center`
--
ALTER TABLE `health_center`
  ADD PRIMARY KEY (`center_ID`),
  ADD KEY `fk_patient_ID` (`fk_patient_ID`);

--
-- Indexes for table `intervention`
--
ALTER TABLE `intervention`
  ADD PRIMARY KEY (`intervention_ID`),
  ADD KEY `fk_doctor_ID` (`fk_doctor_ID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_ID`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_ID`),
  ADD KEY `fk_center_ID` (`fk_center_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`fk_unit_ID`) REFERENCES `unit` (`unit_ID`);

--
-- Constraints for table `health_center`
--
ALTER TABLE `health_center`
  ADD CONSTRAINT `health_center_ibfk_1` FOREIGN KEY (`fk_patient_ID`) REFERENCES `patient` (`patient_ID`);

--
-- Constraints for table `intervention`
--
ALTER TABLE `intervention`
  ADD CONSTRAINT `intervention_ibfk_1` FOREIGN KEY (`fk_doctor_ID`) REFERENCES `doctor` (`doctor_ID`);

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`fk_center_ID`) REFERENCES `health_center` (`center_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
