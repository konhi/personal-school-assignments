-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2021 at 09:49 AM
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
-- Database: `z01`
--

-- --------------------------------------------------------

--
-- Table structure for table `daty`
--

CREATE TABLE `daty` (
  `id_ksiazki` int(11) NOT NULL,
  `id_wypozyczajacego` int(11) NOT NULL,
  `data_wypozyczenia` datetime NOT NULL,
  `data_zwrotu` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `daty`
--

INSERT INTO `daty` (`id_ksiazki`, `id_wypozyczajacego`, `data_wypozyczenia`, `data_zwrotu`) VALUES
(1, 1, '2021-01-25 09:39:43', '2021-01-25 07:39:43'),
(1, 2, '2021-01-14 15:42:25', '2021-01-22 17:11:36'),
(2, 3, '2021-01-08 15:43:17', '2021-01-25 18:45:04'),
(2, 2, '2021-01-08 17:44:04', '2021-01-27 05:44:04'),
(1, 1, '2021-01-28 00:59:40', '2021-01-21 15:44:19'),
(2, 3, '2021-01-21 21:44:37', '2021-01-14 01:44:37'),
(2, 2, '2021-01-08 09:45:05', '2021-01-25 23:45:05'),
(3, 2, '2021-01-16 09:46:53', '2021-01-08 00:46:53'),
(3, 1, '2021-01-08 21:27:06', '0000-00-00 00:00:00'),
(1, 3, '2021-01-22 09:47:18', '2021-01-25 10:47:18'),
(1, 1, '2021-01-06 14:47:31', '2021-01-25 15:47:31');

-- --------------------------------------------------------

--
-- Table structure for table `ksiazki`
--

CREATE TABLE `ksiazki` (
  `Id_ksiazki` int(11) NOT NULL,
  `Autor` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `Wydawnictwo` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `Rok_wydania` year(4) NOT NULL,
  `Liczba_stron` int(11) NOT NULL,
  `Id_wypozyczajacego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `ksiazki`
--

INSERT INTO `ksiazki` (`Id_ksiazki`, `Autor`, `Wydawnictwo`, `Rok_wydania`, `Liczba_stron`, `Id_wypozyczajacego`) VALUES
(1, 'Jan Kowalski', 'Czerwony', 1999, 123, 0),
(2, 'Jan Kowalski', 'Czerwony', 1999, 123, 1),
(3, 'Adam Nowak', 'Niebieski', 2000, 139, 2),
(4, 'Jan Nowak', 'Zielony', 2005, 543, 3);

-- --------------------------------------------------------

--
-- Table structure for table `uczniowie`
--

CREATE TABLE `uczniowie` (
  `Id_ucznia` int(11) NOT NULL,
  `Nazwisko` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `Imie` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `Klasa` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `Telefon` varchar(64) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `uczniowie`
--

INSERT INTO `uczniowie` (`Id_ucznia`, `Nazwisko`, `Imie`, `Klasa`, `Telefon`) VALUES
(1, 'Szymański', 'Jan', '1Tc', '432859123'),
(2, 'Szymański', 'Jan', '1Tc', '453123754'),
(3, 'Szymański', 'Adam', '1Te', '342756123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`Id_ksiazki`,`Id_wypozyczajacego`);

--
-- Indexes for table `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`Id_ucznia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ksiazki`
--
ALTER TABLE `ksiazki`
  MODIFY `Id_ksiazki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `uczniowie`
--
ALTER TABLE `uczniowie`
  MODIFY `Id_ucznia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
