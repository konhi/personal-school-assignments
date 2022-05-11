<?php
    $conn = mysqli_connect('127.0.0.1', 'root', '', 'p05') or die("BLAD polaczenia");

    /* Wyświetla tabelę z wypożyczeniami */
    function wyswietlWypozyczenia($conn) {
        $zapytanie = mysqli_query($conn, "SELECT ksiazki.tytul, ksiazki.autor, wypozyczenia.data_wypozyczenia, uczniowie.imie, uczniowie.nazwisko from wypozyczenia, ksiazki, uczniowie WHERE wypozyczenia.id_ksiazki = ksiazki.id AND wypozyczenia.id_ucznia = uczniowie.id;");

        if (mysqli_num_rows($zapytanie) > 0) {
            echo("<table border=1>");
            echo("<tr><td>Tytuł</td><td>Autor</td><td>Data wypożyczenia</td><td>Imię</td><td>Nazwisko</td><td></td></tr>");
    
            while ($row = mysqli_fetch_assoc($zapytanie)) {
                echo("<tr>");
                echo("<td>".$row["tytul"]."</td>");
                echo("<td>".$row["autor"]."</td>");
                echo("<td>".$row["data_wypozyczenia"]."</td>");
                echo("<td>".$row["imie"]."</td>");
                echo("<td>".$row["nazwisko"]."</td>");
                echo("<td><button>Zwróć</button></td>");

                echo("</tr>");
            }
    
            echo("</table>");
        } else {
            echo("Brak wypożyczeń");
        }
    }

    /* Usuwa książkę z tabeli wypożyczeń i tworzy nowy wpis historyczny */
    function zwrocKsiazke($conn, $id_wypozyczenia) {
        

        // Stwórz wpis historyczny
        // $zapytanie = mysqli_query($conn, "INSERT INTO `historia` (`id`, `id_ucznia`, `id_ksiazki`, `data_wypozyczenia`, `data_zwrotu`) VALUES (NULL, '{$id_wypozyczenia}', {$id_ksiazki}, NULL, CURRENT_TIMESTAMP())");
    }

    wyswietlWypozyczenia($conn);


    mysqli_close($conn);
?>