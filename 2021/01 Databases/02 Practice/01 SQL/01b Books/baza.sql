-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 17 Lis 2021, 12:07
-- Wersja serwera: 10.1.36-MariaDB
-- Wersja PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cw01b`
--
CREATE DATABASE IF NOT EXISTS `cw01b` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `cw01b`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `klient_id` int(11) NOT NULL,
  `nazwisko_imie` varchar(256) COLLATE utf8mb4_polish_ci NOT NULL,
  `adres` varchar(256) COLLATE utf8mb4_polish_ci NOT NULL,
  `miejscowosc` varchar(256) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `isbn` varchar(13) COLLATE utf8mb4_polish_ci NOT NULL,
  `autor` varchar(256) COLLATE utf8mb4_polish_ci NOT NULL,
  `tytul` varchar(256) COLLATE utf8mb4_polish_ci NOT NULL,
  `cena` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki_zamowienia`
--

CREATE TABLE `ksiazki_zamowienia` (
  `zamowienie_id` int(11) NOT NULL,
  `isbn` varchar(13) COLLATE utf8mb4_polish_ci NOT NULL,
  `ilosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `recenzje_ksiazek`
--

CREATE TABLE `recenzje_ksiazek` (
  `isbn` varchar(13) COLLATE utf8mb4_polish_ci NOT NULL,
  `recenzja` text COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `zamowienie_id` int(11) NOT NULL,
  `klient_id` int(11) NOT NULL,
  `wartosc` decimal(15,2) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`klient_id`);

--
-- Indeksy dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`isbn`);

--
-- Indeksy dla tabeli `ksiazki_zamowienia`
--
ALTER TABLE `ksiazki_zamowienia`
  ADD PRIMARY KEY (`zamowienie_id`),
  ADD KEY `isbn` (`isbn`);

--
-- Indeksy dla tabeli `recenzje_ksiazek`
--
ALTER TABLE `recenzje_ksiazek`
  ADD KEY `isbn` (`isbn`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`zamowienie_id`),
  ADD KEY `klient_id` (`klient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `klient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `ksiazki_zamowienia`
--
ALTER TABLE `ksiazki_zamowienia`
  MODIFY `zamowienie_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `zamowienie_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD CONSTRAINT `klienci_ibfk_1` FOREIGN KEY (`klient_id`) REFERENCES `zamowienia` (`klient_id`);

--
-- Ograniczenia dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD CONSTRAINT `ksiazki_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `recenzje_ksiazek` (`isbn`);

--
-- Ograniczenia dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `zamowienia_ibfk_1` FOREIGN KEY (`zamowienie_id`) REFERENCES `ksiazki_zamowienia` (`zamowienie_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
