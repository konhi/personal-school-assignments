-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2021 at 08:57 AM
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
-- Database: `z01b`
--
CREATE DATABASE IF NOT EXISTS `z01b` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `z01b`;

-- --------------------------------------------------------

--
-- Table structure for table `klienci`
--

CREATE TABLE `klienci` (
  `klient_id` int(11) NOT NULL,
  `nazwisko_imie` varchar(64) COLLATE utf8mb4_polish_ci NOT NULL,
  `adres` varchar(64) COLLATE utf8mb4_polish_ci NOT NULL,
  `miejscowosc` varchar(64) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`klient_id`, `nazwisko_imie`, `adres`, `miejscowosc`) VALUES
(1, 'Kowalski Jan', 'ul. Kowalska 1', 'Warszawa'),
(2, 'Adam Nowak', 'ul. Nowacka 2', 'Poznań'),
(3, 'Piekarz Paweł', 'Piekarska 3', 'Kraków');

-- --------------------------------------------------------

--
-- Table structure for table `ksiazki`
--

CREATE TABLE `ksiazki` (
  `isbn` varchar(64) COLLATE utf8mb4_polish_ci NOT NULL,
  `autor` varchar(64) COLLATE utf8mb4_polish_ci NOT NULL,
  `tytul` varchar(64) COLLATE utf8mb4_polish_ci NOT NULL,
  `cena` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `ksiazki`
--

INSERT INTO `ksiazki` (`isbn`, `autor`, `tytul`, `cena`) VALUES
('978-3-598-21501-8', 'Adam Nowak', 'Jak być dobrym człowiekiem', 30),
('978-3-598-21510-0', 'Paweł Piekarz', 'Jak być piekarzem', 21.5),
('978-3-598-21515-5', 'Jan Kowalski', 'Jak być kowalem', 24.5);

-- --------------------------------------------------------

--
-- Table structure for table `ksiazki_zamowione`
--

CREATE TABLE `ksiazki_zamowione` (
  `zamowienie_id` int(11) NOT NULL,
  `isbn` varchar(64) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `ilosc` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `ksiazki_zamowione`
--

INSERT INTO `ksiazki_zamowione` (`zamowienie_id`, `isbn`, `ilosc`) VALUES
(0, '978-3-598-21501-8', 1),
(1, '978-3-598-21510-0', 2),
(2, '978-3-598-21515-5', 3);

-- --------------------------------------------------------

--
-- Table structure for table `recenzje_ksiazek`
--

CREATE TABLE `recenzje_ksiazek` (
  `isbn` varchar(64) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `recenzja` text COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `recenzje_ksiazek`
--

INSERT INTO `recenzje_ksiazek` (`isbn`, `recenzja`) VALUES
('978-3-598-21501-8', 'Dobre.'),
('978-3-598-21510-0', 'Niedobre.'),
('978-3-598-21515-5', 'Niby dobre, ale jednak niedobre.');

-- --------------------------------------------------------

--
-- Table structure for table `zamowienia`
--

CREATE TABLE `zamowienia` (
  `zamowienia_id` int(11) NOT NULL,
  `klient_id` int(11) DEFAULT NULL,
  `wartosc` tinyint(1) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `zamowienia`
--

INSERT INTO `zamowienia` (`zamowienia_id`, `klient_id`, `wartosc`, `data`) VALUES
(1, 3, 1, '2021-02-01'),
(2, 1, 1, '2021-02-17'),
(3, 2, 2, '2021-03-09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`klient_id`);

--
-- Indexes for table `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `isbn` (`isbn`),
  ADD KEY `isbn_2` (`isbn`);

--
-- Indexes for table `ksiazki_zamowione`
--
ALTER TABLE `ksiazki_zamowione`
  ADD PRIMARY KEY (`zamowienie_id`),
  ADD KEY `isbn` (`isbn`);

--
-- Indexes for table `recenzje_ksiazek`
--
ALTER TABLE `recenzje_ksiazek`
  ADD KEY `isbn` (`isbn`);

--
-- Indexes for table `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`zamowienia_id`),
  ADD KEY `klient_id` (`klient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `klient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `zamowienia_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ksiazki_zamowione`
--
ALTER TABLE `ksiazki_zamowione`
  ADD CONSTRAINT `ksiazki_zamowione_ibfk_1` FOREIGN KEY (`zamowienie_id`) REFERENCES `zamowienia` (`zamowienie_id`);
  ADD CONSTRAINT `ksiazki_zamowione_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `ksiazki` (`isbn`);

--
-- Constraints for table `recenzje_ksiazek`
--
ALTER TABLE `recenzje_ksiazek`
  ADD CONSTRAINT `recenzje_ksiazek_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `ksiazki` (`isbn`);

--
-- Constraints for table `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `zamowienia_ibfk_1` FOREIGN KEY (`klient_id`) REFERENCES `klienci` (`klient_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
