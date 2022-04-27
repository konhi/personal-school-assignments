-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2021 at 12:54 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `biblioteka`
--
CREATE DATABASE IF NOT EXISTS `biblioteka` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `biblioteka`;

-- --------------------------------------------------------

--
-- Table structure for table `autorzy`
--

CREATE TABLE `autorzy` (
  `aid` int(11) NOT NULL,
  `imie` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL,
  `nazwisko` varchar(30) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `autorzy`
--

INSERT INTO `autorzy` (`aid`, `imie`, `nazwisko`) VALUES
(1, 'Marek', 'Nowakowski'),
(2, 'Leon', 'Atkinson'),
(3, 'Karol', 'Wierzchołowski'),
(4, 'Twoje imię', 'Twoje Nazwisko');

-- --------------------------------------------------------

--
-- Table structure for table `kategorie`
--

CREATE TABLE `kategorie` (
  `kid` int(11) NOT NULL,
  `nazwa` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `kategorie`
--

INSERT INTO `kategorie` (`kid`, `nazwa`) VALUES
(1, 'PHP'),
(2, 'MySQL'),
(3, 'Bez kategorii');

-- --------------------------------------------------------

--
-- Table structure for table `ksiazki`
--

CREATE TABLE `ksiazki` (
  `id` int(11) NOT NULL,
  `tytul` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `autor` int(11) NOT NULL,
  `kategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `ksiazki`
--

INSERT INTO `ksiazki` (`id`, `tytul`, `autor`, `kategoria`) VALUES
(1, 'PHP Samouczek', 3, 1),
(2, ' MySQL Samouczek', 3, 2),
(3, 'PHP Praktyczne rozwiazania', 1, 1),
(4, 'MYSQL Przewodnik programisty', 2, 2),
(5, 'Klasa 3(a/b)', 4, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autorzy`
--
ALTER TABLE `autorzy`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`kid`);

--
-- Indexes for table `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autorzy`
--
ALTER TABLE `autorzy`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `kid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ksiazki`
--
ALTER TABLE `ksiazki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;
