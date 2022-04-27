<?php
    $conn = new mysqli('127.0.0.1', 'root', '', 'biblioteka') or die("BLAD polaczenia");

    $query = "SELECT * FROM kategorie";
    $result = $conn->query($query);


    if ($result->num_rows > 0) {
        echo("<table border=1>");
        echo("<tr><td>id</td><td>nazwa</td></tr>");

        while ($row = $result->fetch_assoc()) {
            echo("<tr>");
            echo("<td>".$row["kid"]."</td>");
            echo("<td>".$row["nazwa"]."</td>");
            echo("</tr>");
        }

        echo("</table>");
    } else {
        echo("0 results");
    }

    $conn->close()
?>