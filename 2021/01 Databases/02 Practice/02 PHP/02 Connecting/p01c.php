<?php
    $conn = new PDO('mysql:host=127.0.0.1;dbname=cw01', 'root', '') or die("BLAD polaczenia");

    echo("JEST polaczenie");

    $conn = null;
?>