<?php
    $conn = mysqli_connect('127.0.0.1', 'root', '', 'biblioteka') or die("BLAD polaczenia");

    if (isset($_POST["imie"]) && isset($_POST["nazwisko"])) {
        $query = "INSERT INTO autorzy (imie, nazwisko) VALUES ('${$_POST["imie"]}', ${$_POST["nazwisko"]})"
    }

    mysqli_close($conn);
?>

<form action="p04.php" method="POST">
    Imie: <input type="text" name="imie"><br>
    Nazwisko: <input type="text" name="nazwisko"><br>
    <input type="submit" value="zapisz">
</form>