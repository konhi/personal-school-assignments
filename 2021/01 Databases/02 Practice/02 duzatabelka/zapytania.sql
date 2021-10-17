-- Wyświetl wszystkie rekordy gdzie cena jest większa od 32765

SELECT
    *
FROM
    `duzatabelka`
WHERE
    cena > 32765

-- Wyświetl wszystkie rekordy gdzie cena mieści się pomiędzy 20000 a 20010 - wynik posortuj wg kolumny kod
SELECT
    *
FROM
    `duzatabelka`
WHERE
    cena BETWEEN 20000 AND 20010
ORDER BY
    kod

-- Wyświetl 10 rekordów zaczynając od rekordu nr 20 gdzie cena mieści się pomiędzy 20000 a 20010 - wynik posortuj wg kolumny kod
SELECT
    *
FROM
    `duzatabelka`
WHERE
    id >= 20 AND cena BETWEEN 20000 AND 20010
ORDER BY
    kod
LIMIT 10

-- Wylicz średnią z kolumny cena
SELECT
    AVG(cena)
FROM
    `duzatabelka`


-- Wyświetl wszystkie rekordy gdzie cena jest powyżej średniej ceny (wszystkich rekordów) oraz w polu opis znajduje się fraza "receitei
SELECT
    *
FROM
    `duzatabelka`
WHERE
    cena > (
    SELECT
        AVG(cena)
    FROM
        `duzatabelka`
) AND opis LIKE "%recetei%"