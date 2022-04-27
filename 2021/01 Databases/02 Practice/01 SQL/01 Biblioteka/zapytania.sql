-- Wyświetl zawartość tabeli „ksiazki” tak aby zamiast liczb pojawiły się dane z odpowiednich tabel (autorzy, kategorie).

SELECT
    ksiazki.id,
    ksiazki.tytul,
    CONCAT(
        autorzy.imie,
        " ",
        autorzy.nazwisko
    ) AS "autor",
    kategorie.nazwa
FROM
    ksiazki,
    autorzy,
    kategorie
WHERE
    ksiazki.autor = autorzy.aid AND ksiazki.kategoria = kategorie.kid


-- Zmień zawartość wiersza z tabeli „autorzy” o aid=1 na Andrzej Nowak. Wyświetl zawartość tabeli

UPDATE autorzy SET imie = 'Andrzej', `nazwisko` = 'Nowak' WHERE autorzy.aid = 1 
SELECT * from autorzy