<?php
    $conn = new PDO('mysql:host=127.0.0.1;dbname=biblioteka', 'root', '') or die("BLAD polaczenia");

    $query = "SELECT * FROM kategorie";
    $result = $conn->query($query);


    if ($result->rowCount() > 0) {
        echo("<table border=1>");
        echo("<tr><td>id</td><td>nazwa</td></tr>");

        foreach ($result as $row) {
            echo("<tr>");
            echo("<td>".$row["kid"]."</td>");
            echo("<td>".$row["nazwa"]."</td>");
            echo("</tr>");
        }

        echo("</table>");
    } else {
        echo("0 results");
    }

    $conn = null;
?>