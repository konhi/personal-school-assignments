-- Wyświetl listę uczniów w układzie alfabetycznym według nazwisk
SELECT * FROM uczen ORDER BY nazwisko;

-- Wyświetl listę uczniów, których nazwiska rozpoczynają się na literę N, a imię kończy się na literę A.
SELECT * FROM uczen WHERE nazwisko LIKE "N%" AND imie LIKE "%A";

-- wyświetl liczbę uczniów istniejących w bazie
SELECT COUNT(*) from uczen;

-- wyświetl ogólną średnią ocen uczniów.
SELECT AVG(wartosc) from oceny;

-- wyświetl imię i nazwisko z najniższą oceną z chemii.
SELECT CONCAT(imie, ' ', nazwisko) AS "Imię i Nazwisko"
FROM uczen
WHERE id_ucznia IN
    (SELECT id_ucznia
     FROM oceny
     WHERE id_przedmiotu =
         (SELECT id_przedmiotu
          FROM przedmiot
          WHERE nazwa_przedmiotu = "chemia" )
       AND wartosc =
         (SELECT MIN(wartosc)
          FROM oceny
          WHERE id_przedmiotu =
              (SELECT id_przedmiotu
               FROM przedmiot
               WHERE nazwa_przedmiotu = "chemia" ) ) );

-- wyświetl tabele z ocenami tak aby rezultat zapytania był jak na przykładzie
SELECT
    CONCAT(uczen.imie, ' ', uczen.nazwisko) AS "Imię i nazwisko",
    przedmiot.nazwa_przedmiotu AS "Przedmiot",
    oceny.wartosc AS "ocena"
FROM
    uczen,
    oceny,
    przedmiot
WHERE
    uczen.id_ucznia = oceny.id_ucznia AND oceny.id_przedmiotu = przedmiot.id_przedmiotu;