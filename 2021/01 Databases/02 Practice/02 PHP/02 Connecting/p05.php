<?php
    $conn = mysqli_connect('127.0.0.1', 'root', '', 'p05') or die("BLAD polaczenia");


    function zwrocKsiazke($conn, $id_wypozyczenia) {
        $zapytanie = mysqli_query($conn, "DELETE FROM wypozyczenia WHERE wypozyczenia.id = {$id_wypozyczenia};");
    }

    /* Wyświetla tabelę z wypożyczeniami */
    function wyswietlWypozyczenia($conn) {
        $zapytanie = mysqli_query($conn, "SELECT wypozyczenia.id, ksiazki.tytul, ksiazki.autor, wypozyczenia.data_wypozyczenia, uczniowie.imie, uczniowie.nazwisko from wypozyczenia, ksiazki, uczniowie WHERE wypozyczenia.id_ksiazki = ksiazki.id AND wypozyczenia.id_ucznia = uczniowie.id AND wypozyczenia.data_zwrotu IS NULL;");

        if (mysqli_num_rows($zapytanie) > 0) {
            echo("<form action='' method='post'>");
            echo("<table border=1>");
            echo("<tr><td>Tytuł</td><td>Autor</td><td>Data wypożyczenia</td><td>Imię</td><td>Nazwisko</td><td></td></tr>");
    
            while ($row = mysqli_fetch_assoc($zapytanie)) {
                echo("<tr>");
                echo("<td>".$row["tytul"]."</td>");
                echo("<td>".$row["autor"]."</td>");
                echo("<td>".$row["data_wypozyczenia"]."</td>");
                echo("<td>".$row["imie"]."</td>");
                echo("<td>".$row["nazwisko"]."</td>");
                echo("<td><button type='submit' name='id_wypozyczenia' value='{$row["id"]}'>Zwróć</button></td>");

                echo("</tr>");
            }
    
            echo("</table>");
        } else {
            echo("Brak wypożyczeń");
        }

        echo("</form>");
    }

    /* Wyświela tabelę z książkami */
    function wyswietlKsiazki($conn) {
        $zapytanie = mysqli_query($conn, "SELECT ksiazki.id, ksiazki.autor, ksiazki.tytul FROM ksiazki WHERE ksiazki.id NOT IN(SELECT wypozyczenia.id_ksiazki from wypozyczenia);");

        if (mysqli_num_rows($zapytanie) > 0) {
            echo("<form action='' method='post'>");
            echo("<table border=1>");
            echo("<tr><td></td><td>Tytuł</td><td>Autor</td></tr>");
    
            while ($row = mysqli_fetch_assoc($zapytanie)) {
                echo("<tr>");
                echo("<td><input name='id_ksiazki[]' value='{$row["id"]}' type='checkbox'/></td>");
                echo("<td>".$row["tytul"]."</td>");
                echo("<td>".$row["autor"]."</td>");

                echo("</tr>");
            }
    
            echo("</table>");

            wyswietlUczniow($conn);
        } else {
            echo("Brak wolnych książek");
        }

        echo("</form>");
    }

    /* Wyświetla listę wyboru uczniów */
    function wyswietlUczniow($conn) {
        $zapytanie = mysqli_query($conn, "SELECT id, CONCAT(uczniowie.imie, ' ', uczniowie.nazwisko) as 'nazwa' FROM uczniowie;");

        if (mysqli_num_rows($zapytanie) > 0) {
            echo("<select name='id_ucznia'>");

            while ($row = mysqli_fetch_assoc($zapytanie)) {
                echo("<option value='{$row["id"]}'>{$row['nazwa']}</option>");
            }

            echo("</select>");
            echo("<button type='submit' name='id_uczen'>Wypożycz</button>");
        } else {
            echo("Brak uczniów");
        }
    }

    function wypozyczKsiazki($conn, $id_uczen, $id_ksiazki) {
        $zapytanie = mysqli_query($conn, "INSERT INTO `wypozyczenia` (`id`, `id_ksiazki`, `id_ucznia`, `data_wypozyczenia`, `data_zwrotu`) VALUES (NULL, '{$id_ksiazki}', '{$id_uczen}', CURRENT_TIMESTAMP(), NULL);");
    }


    if (isset($_POST['id_wypozyczenia'])) {
        zwrocKsiazke($conn, $_POST["id_wypozyczenia"]);
    }

    if (isset($_POST['id_ucznia']) && isset($_POST['id_ucznia'])) {
        foreach ($_POST['id_ksiazki'] as $id) {
            wypozyczKsiazki($conn, $_POST['id_ucznia'], $id);
        }
    }

    wyswietlWypozyczenia($conn);
    wyswietlKsiazki($conn);

    mysqli_close($conn);
?>
