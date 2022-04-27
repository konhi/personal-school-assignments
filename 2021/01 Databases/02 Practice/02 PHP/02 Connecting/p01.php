<?php
    $conn = mysqli_connect('127.0.0.1', 'root', '', 'cw01') or die("BLAD polaczenia");

    echo("JEST polaczenie");

    mysqli_close($conn);
?>