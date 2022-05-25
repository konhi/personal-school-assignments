<?php
    $conn = mysqli_connect('127.0.0.1', 'root', '', 'p05') or die("BLAD polaczenia");

    /* Wyświetla tabelę z wypożyczeniami */
    function wyswietlWypozyczenia($conn) {
        $zapytanie = mysqli_query($conn, "SELECT wypozyczenia.id, ksiazki.tytul, ksiazki.autor, wypozyczenia.data_wypozyczenia, uczniowie.imie, uczniowie.nazwisko from wypozyczenia, ksiazki, uczniowie WHERE wypozyczenia.id_ksiazki = ksiazki.id AND wypozyczenia.id_ucznia = uczniowie.id AND wypozyczenia.data_zwrotu IS NULL;");

        if (mysqli_num_rows($zapytanie) > 0) {
            echo("<form action='p05-zwroc.php' method='post'>");
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
        $zapytanie = mysqli_query($conn, "SELECT ksiazki.autor, ksiazki.tytul FROM ksiazki WHERE ksiazki.id NOT IN(SELECT wypozyczenia.id_ksiazki from wypozyczenia);");

        if (mysqli_num_rows($zapytanie) > 0) {
            echo("<form action='' method='post'>");
            echo("<table border=1>");
            echo("<tr><td></td><td>Tytuł</td><td>Autor</td></tr>");
    
            while ($row = mysqli_fetch_assoc($zapytanie)) {
                echo("<tr>");
                echo("<td><input type='checkbox'/></td>");
                echo("<td>".$row["tytul"]."</td>");
                echo("<td>".$row["autor"]."</td>");
                // echo("<td><button type='submit' name='id_wypozyczenia' value='{$row["id"]}'>Zwróć</button></td>");

                echo("</tr>");
            }
    
            echo("</table>");
        } else {
            echo("Brak wolnych książek");
        }

        wyswietlUczniow($conn);

        echo("</form>");
    }

    /* Wyświetla listę wyboru uczniów */
    function wyswietlUczniow($conn) {
        $zapytanie = mysqli_query($conn, "SELECT CONCAT(uczniowie.imie, ' ', uczniowie.nazwisko) as 'nazwa' FROM uczniowie;");

        if (mysqli_num_rows($zapytanie) > 0) {
            echo("<select>");

            while ($row = mysqli_fetch_assoc($zapytanie)) {
                echo("<option>{$row['nazwa']}</option>");
            }

            echo("</select>");

            echo("<button type='submit' name='uczen'>Wypożycz</button>");
        } else {
            echo("Brak uczniów");
        }
    }

    wyswietlWypozyczenia($conn);
    wyswietlKsiazki($conn);


    mysqli_close($conn);

    /* <?php
$conn = mysqli_connect('127.0.0.1', 'root', '', 'p05') or die("BLAD polaczenia");

function zwrocKsiazke($conn, $id_wypozyczenia) {
    $zapytanie = mysqli_query($conn, "DELETE FROM wypozyczenia WHERE wypozyczenia.id = {$id_wypozyczenia};");

}

zwrocKsiazke($conn, $_POST["id_wypozyczenia"]);

mysqli_close($conn);

?> */
?>
