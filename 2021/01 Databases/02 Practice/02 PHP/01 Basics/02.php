<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <form method="GET" action="02.php">

        <select name="texts">
            <?php
            for ($i = 0; $i <= 1000; $i++)
                if ($i == 5) {
                    echo ("<option selected='selected'>text${i}</option>");
                } else {
                    echo ("<option>text${i}</option>");
                }
            ?>
        </select>
        <button type="submit">Wyślij zapytanie</button>

    </form>
</body>

</html>