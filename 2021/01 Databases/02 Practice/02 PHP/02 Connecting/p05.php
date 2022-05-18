<?php
    $conn = mysqli_connect('127.0.0.1', 'root', '', 'p05') or die("BLAD polaczenia");

    if(isset($_GET['zwrocKsiazke']))
    {
        zwrocKsiazke($conn, $_GET['zwrocKsiazke']);
    }

    /* Wyświetla tabelę z wypożyczeniami */
    function wyswietlWypozyczenia($conn) {
        $zapytanie = mysqli_query($conn, "SELECT ksiazki.id, ksiazki.tytul, ksiazki.autor, wypozyczenia.data_wypozyczenia, uczniowie.imie, uczniowie.nazwisko from wypozyczenia, ksiazki, uczniowie WHERE wypozyczenia.id_ksiazki = ksiazki.id AND wypozyczenia.id_ucznia = uczniowie.id AND wypozyczenia.data_zwrotu IS NULL;");

        if (mysqli_num_rows($zapytanie) > 0) {
            echo("<form action='' method='get'>");
            echo("<table border=1>");
            echo("<tr><td>Tytuł</td><td>Autor</td><td>Data wypożyczenia</td><td>Imię</td><td>Nazwisko</td><td></td></tr>");
    
            while ($row = mysqli_fetch_assoc($zapytanie)) {
                echo("<tr>");
                echo("<td>".$row["tytul"]."</td>");
                echo("<td>".$row["autor"]."</td>");
                echo("<td>".$row["data_wypozyczenia"]."</td>");
                echo("<td>".$row["imie"]."</td>");
                echo("<td>".$row["nazwisko"]."</td>");
                echo("<td><button type='submit' name='zwrocKsiazke' value='{$row["id"]}'>Zwróć</button></td>");

                echo("</tr>");
            }
    
            echo("</table>");
        } else {
            echo("Brak wypożyczeń");
        }

        echo("</form>");

    }

    /* Aktualizuje date wypożyczenia (żeby nie było null) */
    function zwrocKsiazke($conn, $id_wypozyczenia) {
        $zapytanie = mysqli_query($conn, "UPDATE wypozyczenia SET wypozyczenia.data_zwrotu = CURRENT_TIMESTAMP() WHERE wypozyczenia.id = {$id_wypozyczenia};");

        echo("LOG: Zwrocono ksiazke: UPDATE wypozyczenia SET wypozyczenia.data_zwrotu = CURRENT_TIMESTAMP() WHERE wypozyczenia.id = {$id_wypozyczenia};");
    }

    zwrocKsiazke($conn, 5);

    wyswietlWypozyczenia($conn);


    mysqli_close($conn);
?>