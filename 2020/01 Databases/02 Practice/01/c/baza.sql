-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2021 at 09:29 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `z01c`
--

-- --------------------------------------------------------

--
-- Table structure for table `nauczyciele`
--

CREATE TABLE `nauczyciele` (
  `NauczycielID` int(11) NOT NULL,
  `NazwiskoImie` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Wyksztalcenie` text COLLATE utf8mb4_polish_ci NOT NULL,
  `StazPracy` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Telefon` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Mail` text COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oceny`
--

CREATE TABLE `oceny` (
  `OcenaID` int(11) NOT NULL,
  `UczenID` int(11) NOT NULL,
  `PrzedmiotID` int(11) NOT NULL,
  `NauczycielID` int(11) NOT NULL,
  `OcenaDefID` int(11) NOT NULL,
  `Data` datetime NOT NULL,
  `Godzina` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ocenydefinicje`
--

CREATE TABLE `ocenydefinicje` (
  `OcenaDefID` int(11) NOT NULL,
  `NazwaPelna` text COLLATE utf8mb4_polish_ci NOT NULL,
  `NazwaSkrot` text COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `przedmioty`
--

CREATE TABLE `przedmioty` (
  `PrzedmiotID` int(11) NOT NULL,
  `NazwaPelna` varchar(64) COLLATE utf8mb4_polish_ci NOT NULL,
  `NazwaSkrot` varchar(16) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uczniowie`
--

CREATE TABLE `uczniowie` (
  `UczenID` int(11) NOT NULL,
  `NazwiskoImie` text COLLATE utf8mb4_polish_ci NOT NULL,
  `DataUr` datetime NOT NULL,
  `MiejsceUr` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Kod` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Miejscowosc` text COLLATE utf8mb4_polish_ci NOT NULL,
  `UlicaNr` text COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nauczyciele`
--
ALTER TABLE `nauczyciele`
  ADD PRIMARY KEY (`NauczycielID`);

--
-- Indexes for table `oceny`
--
ALTER TABLE `oceny`
  ADD PRIMARY KEY (`OcenaID`,`UczenID`,`PrzedmiotID`,`NauczycielID`,`OcenaDefID`),
  ADD KEY `UczenID` (`UczenID`),
  ADD KEY `PrzedmiotID` (`PrzedmiotID`),
  ADD KEY `NauczycielID` (`NauczycielID`),
  ADD KEY `OcenaDefID` (`OcenaDefID`);

--
-- Indexes for table `ocenydefinicje`
--
ALTER TABLE `ocenydefinicje`
  ADD PRIMARY KEY (`OcenaDefID`);

--
-- Indexes for table `przedmioty`
--
ALTER TABLE `przedmioty`
  ADD PRIMARY KEY (`PrzedmiotID`);

--
-- Indexes for table `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`UczenID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nauczyciele`
--
ALTER TABLE `nauczyciele`
  MODIFY `NauczycielID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oceny`
--
ALTER TABLE `oceny`
  MODIFY `OcenaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `przedmioty`
--
ALTER TABLE `przedmioty`
  MODIFY `PrzedmiotID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uczniowie`
--
ALTER TABLE `uczniowie`
  MODIFY `UczenID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `oceny`
--
ALTER TABLE `oceny`
  ADD CONSTRAINT `oceny_ibfk_1` FOREIGN KEY (`UczenID`) REFERENCES `uczniowie` (`UczenID`),
  ADD CONSTRAINT `oceny_ibfk_2` FOREIGN KEY (`PrzedmiotID`) REFERENCES `przedmioty` (`PrzedmiotID`),
  ADD CONSTRAINT `oceny_ibfk_3` FOREIGN KEY (`NauczycielID`) REFERENCES `nauczyciele` (`NauczycielID`),
  ADD CONSTRAINT `oceny_ibfk_4` FOREIGN KEY (`OcenaDefID`) REFERENCES `ocenydefinicje` (`OcenaDefID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
