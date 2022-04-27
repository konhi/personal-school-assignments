SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `nauczyciele` (
  `NauczycielID` int(11) NOT NULL,
  `NazwiskoImie` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `Wyksztalcenie` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `StazPracy` time NOT NULL,
  `Telefon` varchar(15) COLLATE utf8_polish_ci NOT NULL,
  `Mail` varchar(64) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE `oceny` (
  `OcenaID` int(11) NOT NULL,
  `UczenID` int(11) NOT NULL,
  `PrzedmiotID` int(11) NOT NULL,
  `NauczycielID` int(11) NOT NULL,
  `OcenaDefID` int(11) NOT NULL,
  `Data` date NOT NULL,
  `Godzina` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE `ocenydefinicje` (
  `OcenyDefID` int(11) NOT NULL,
  `NazwaPelna` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `NazwaSkrot` varchar(2) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE `przedmioty` (
  `PrzedmiotID` int(11) NOT NULL,
  `NazwaPelna` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `NazwaSkrot` varchar(16) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE `uczniowie` (
  `UczenID` int(11) NOT NULL,
  `NazwiskoImie` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `DataUr` date NOT NULL,
  `MiejsceUr` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `Kod` varchar(6) COLLATE utf8_polish_ci NOT NULL,
  `Miejscowosc` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `UlicaNr` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;


ALTER TABLE `nauczyciele`
  ADD PRIMARY KEY (`NauczycielID`);

ALTER TABLE `oceny`
  ADD PRIMARY KEY (`OcenaID`),
  ADD UNIQUE KEY `UczenID` (`UczenID`,`PrzedmiotID`,`NauczycielID`,`OcenaDefID`);

ALTER TABLE `ocenydefinicje`
  ADD PRIMARY KEY (`OcenyDefID`);

ALTER TABLE `przedmioty`
  ADD PRIMARY KEY (`PrzedmiotID`);

ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`UczenID`);


ALTER TABLE `nauczyciele`
  MODIFY `NauczycielID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `oceny`
  MODIFY `OcenaID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `ocenydefinicje`
  MODIFY `OcenyDefID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `przedmioty`
  MODIFY `PrzedmiotID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `uczniowie`
  MODIFY `UczenID` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `uczniowie`
  ADD CONSTRAINT `uczniowie_ibfk_1` FOREIGN KEY (`UczenID`) REFERENCES `oceny` (`UczenID`);
  ADD CONSTRAINT `uczniowie_ibfk_1` FOREIGN KEY (`PrzedmiotID`) REFERENCES `oceny` (`PrzedmiotID`);
  ADD CONSTRAINT `uczniowie_ibfk_1` FOREIGN KEY (`NauczycielID`) REFERENCES `oceny` (`NauczycielID`);
  ADD CONSTRAINT `uczniowie_ibfk_1` FOREIGN KEY (`OcenaDefID`) REFERENCES `oceny` (`OcenaDefID`);
COMMIT;
