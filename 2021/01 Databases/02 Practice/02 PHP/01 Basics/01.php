<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <table border="1 ">
        <tr>
        <?php
            for ($i = 1; $i <= 50; $i++ ) {
                echo "<tr>";

                for ($j = 1; $j <= 10; $j++ ) {
                    echo "<td>{$i}_{$j}</td>";

                }

                echo "</tr>";
            }
        ?>
        </tr>
    </table>

</body>
</html>