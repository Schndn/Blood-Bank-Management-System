-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2020 at 09:00 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blood1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Id` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Id`, `Username`, `Password`) VALUES
(1, 'melisa', 'melisa'),
(2, 'anup', 'anup');

-- --------------------------------------------------------

--
-- Table structure for table `contactform`
--

CREATE TABLE `contactform` (
  `Id` int(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `Message` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contactform`
--

INSERT INTO `contactform` (`Id`, `Name`, `Email`, `Subject`, `Message`) VALUES
(1, 'Mero name', 'mero@gmail.com', 'blood', 'hello'),
(2, 'krisha', 'krisha@gmail.com', 'bank', 'blood');

-- --------------------------------------------------------

--
-- Table structure for table `donorreg`
--

CREATE TABLE `donorreg` (
  `Id` int(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Gender` varchar(23) NOT NULL,
  `Phone` varchar(100) NOT NULL,
  `BloodGroup` varchar(50) NOT NULL,
  `Donationdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `donorreg`
--

INSERT INTO `donorreg` (`Id`, `Name`, `Address`, `Email`, `Gender`, `Phone`, `BloodGroup`, `Donationdate`) VALUES
(2, 'a', 'a', 'a', 'male', '12', 'A+', '2019-03-12'),
(3, 'ram', 'kathmandu', 'ram@gmail.com', 'male', '21311', 'AB+', '2018-10-10'),
(4, 'java1', 'kathmandu', 'java1@gmail.com', 'male', '12', 'A-', '2018-04-10'),
(5, 'java1', 'butwal', 'java1@gmail.com', 'female', '5446', 'B-', '2019-10-15'),
(6, 'gita', 'butwal', 'gita@gmail.com', 'female', '42433', 'B-', '2019-04-06'),
(7, 'hari', 'kathmandu', 'hari@gmail.com', 'male', '567098', 'AB-', '2019-10-29'),
(8, 'shamin', 'pokhara', 'shamin@gmail.com', 'female', '984633', 'A+', '2019-10-02'),
(9, 'Bishal nepal', 'bhaktapur', 'bishal@gmail.com', 'male', '56667778', 'A+', '2019-12-29'),
(10, 'java', 'kathmandu', 'java@gmail.com', 'male', '223232', 'B+', '2007-11-18'),
(11, 'java', 'pokhara', 'java@gmail.com', 'male', '324', 'A+', '2019-12-17'),
(12, 'Anup Maharjan', 'adfad', 'abc@gmail.com', 'male', '56789', 'A+', '2020-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `Id` int(50) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Feedback` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`Id`, `Title`, `Feedback`) VALUES
(1, 'blood', 'fxbfbfb'),
(2, 'blood', 'dvdfv'),
(3, 'blood', 'dvdfv'),
(4, 'fyfu', 'ygfututff8\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `Id` int(23) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Noticedate` date NOT NULL,
  `Notice` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`Id`, `Title`, `Noticedate`, `Notice`) VALUES
(3, 'blood donation', '0000-00-00', 'at kathmandu'),
(4, 'hvjh', '0000-00-00', 'fjfkc'),
(5, '', '0000-00-00', ''),
(6, 'blood donation camp', '2019-12-10', 'blood donation camp will be held in baneshwor infront of maiti cafe'),
(7, 'blood donation camp', '2020-01-01', 'blood donation program will be held in baneshwor infront of maiti cafe nepal.'),
(8, 'bb', '2019-12-31', 'sscscsdc');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`id`, `Name`, `Password`, `Email`, `Address`, `Gender`, `Phone`) VALUES
(1, 'Anup Maharjan', 'ANUP', 'anup@gmail.com', 'Kathmandu', 'male', 123456789),
(2, 'melisa', 'melody', 'melody@gmail.com', '', '', 0),
(3, 'MelisaSherchan', 'meli', 'meli@gmail.com', 'pokhara', 'Female', 23456789);

-- --------------------------------------------------------

--
-- Table structure for table `seekerform`
--

CREATE TABLE `seekerform` (
  `Id` int(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Gender` varchar(23) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `BloodGroup` varchar(50) NOT NULL,
  `Requesteddate` date NOT NULL,
  `Received` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seekerform`
--

INSERT INTO `seekerform` (`Id`, `Name`, `Address`, `Gender`, `Phone`, `BloodGroup`, `Requesteddate`, `Received`) VALUES
(1, 'melisa', 'kathmandu', 'male', '2123', 'A+', '2019-10-24', 1),
(2, 'melisa', 'werfg', 'male', '23', 'A+', '2019-10-25', 0),
(3, 'shyam', 'butwal', 'male', 'shyam@gmail.com', 'AB+', '2019-10-30', 0),
(4, 'anup', 'kathmandu', 'male', '23434', 'B-', '2019-12-17', 0),
(5, 'java', 'kathmandu', 'male', '23434', 'A-', '2019-12-30', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Phone` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id`, `Name`, `Email`, `Password`, `Address`, `Gender`, `Phone`) VALUES
(1, 'java', 'java@gmail.com', 'java', 'Bhaktapur', 'male', 456789),
(8, 'Name', '123@456.com', 'qwe', '0', '', 0),
(9, 'java1', 'java1@gmail.com', 'java1', '0', '', 0),
(10, 'gita', 'gita@gmail.com', 'gita', '0', '', 0),
(11, 'shamin', 'shamin@gmail.com', 'shamin', '0', '', 0),
(12, 'krisha', 'krisha@gmail.com', 'krisha', '0', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `contactform`
--
ALTER TABLE `contactform`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `donorreg`
--
ALTER TABLE `donorreg`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seekerform`
--
ALTER TABLE `seekerform`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contactform`
--
ALTER TABLE `contactform`
  MODIFY `Id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `donorreg`
--
ALTER TABLE `donorreg`
  MODIFY `Id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `Id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `Id` int(23) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seekerform`
--
ALTER TABLE `seekerform`
  MODIFY `Id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
