SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Nawiąż połączenie z bazą MySQL i utwórz bazę o nazwie szkola. Zaprojektuj w niej tabele uczen oraz przedmiot. tabela uczen ma mieć następujące pola: imie, nazwisko, data_urodzenia, miejsce_ur, plec, klasa, a tabela przedmiot: id_przedmiotu, nazwa_przedmiotu. Samodzielnie określ typy poszczególnych pól oraz ustaw klucz podstawowy dla każdej z tabel.

CREATE DATABASE IF NOT EXISTS `szkola` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `szkola`;

CREATE TABLE `przedmiot` (
  `id_przedmiotu` int(11) NOT NULL,
  `nazwa_przedmiotu` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;



-- Dodaj tabelę, w której będzie możliwość wpisać ocenę każdemu uczniowi z poszczególnych przedmiotów (tabela nie może zawierać duplikatów danych z innych tabel).

CREATE TABLE `oceny` (
  `id_oceny` int(11) NOT NULL,
  `id_ucznia` int(11) NOT NULL,
  `id_przedmiotu` int(11) NOT NULL,
  `wartosc` varchar(2) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

INSERT INTO `oceny` (`id_oceny`, `id_ucznia`, `id_przedmiotu`, `wartosc`) VALUES
(1, 1, 1, '1'),
(2, 2, 2, '1'),
(3, 3, 3, '3'),
(4, 4, 4, '4'),
(5, 5, 5, '5');

INSERT INTO `przedmiot` (`id_przedmiotu`, `nazwa_przedmiotu`) VALUES
(1, 'matematyka'),
(2, 'fizyka'),
(3, 'chemia'),
(4, 'geografia'),
(5, 'biologia');

CREATE TABLE `uczen` (
  `imie` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL,
  `nazwisko` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `data_urodzenia` date NOT NULL,
  `miejsce_ur` varchar(255) COLLATE utf8mb4_polish_ci NOT NULL,
  `plec` tinyint(4) NOT NULL COMMENT 'ISO/IEC 5218',
  `klasa` varchar(3) COLLATE utf8mb4_polish_ci NOT NULL,
  `id_ucznia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- Do bazy szkola wprowadź informację o 5 uczniach. Następnie wpisz do tabeli następujące przedmioty: matematyka, fizyka, chemia, geografia, biologia oraz przyporządkuj każdemu uczniowi oceny z tych przedmiotó

INSERT INTO `uczen` (`imie`, `nazwisko`, `data_urodzenia`, `miejsce_ur`, `plec`, `klasa`, `id_ucznia`) VALUES
('Jan', 'Kowalski', '2005-10-01', 'Szczecin', 1, '1Td', 1),
('Adam', 'Nowak', '2006-10-01', 'Nowa Sól', 1, '3Bb', 2),
('Ania', 'Kowalska', '2007-10-01', 'Warszawa', 2, '4Ta', 3),
('Ala', 'Nowak', '2004-10-01', 'Zielona Góra', 2, '2Bb', 4),
('Michał', 'Anioł', '2003-10-02', 'Łódź', 1, '2Bb', 5);


ALTER TABLE `oceny`
  ADD PRIMARY KEY (`id_oceny`),
  ADD KEY `id_ucznia` (`id_ucznia`,`id_przedmiotu`),
  ADD KEY `id_przedmiotu` (`id_przedmiotu`);

ALTER TABLE `przedmiot`
  ADD PRIMARY KEY (`id_przedmiotu`);

ALTER TABLE `uczen`
  ADD PRIMARY KEY (`id_ucznia`);


ALTER TABLE `oceny`
  MODIFY `id_oceny` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `przedmiot`
  MODIFY `id_przedmiotu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

-- Do bazy szkola w tabeli uczen dodaj pole id_ucznia i ustaw je jako klucz główny. Wprowadź wszelkie konieczne poprawki w tabelach

ALTER TABLE `uczen`
  MODIFY `id_ucznia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `oceny`
  ADD CONSTRAINT `oceny_ibfk_1` FOREIGN KEY (`id_przedmiotu`) REFERENCES `przedmiot` (`id_przedmiotu`),
  ADD CONSTRAINT `oceny_ibfk_2` FOREIGN KEY (`id_ucznia`) REFERENCES `uczen` (`id_ucznia`);
COMMIT;