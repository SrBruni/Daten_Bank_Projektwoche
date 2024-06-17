<!DOCTYPE html>
<html lang="de">
<form action="index_pro.php" method="post">
<link rel="stylesheet" type="text/css" href="projektwoche_style.css" />
<body>
    </form>
    <?php 
    try {
        $con = new PDO('pgsql:host=localhost;dbname=projektwoche', 'lewein', 'niewel');

        if (isset($_POST['sent'])) {
            //  Hier wird die Bedingung zusammengebastelt
            switch (true) {
                case ($_POST['Nachname'] != "" && $_POST['Projekt'] != ""):
                    $bedingung = "anachname = :Nachname AND ptitel = :Projekt";
                    $array = array('Nachname' => $_POST['Nachname'], 'Projekt' => $_POST['Projekt']);
                    break;
                case ($_POST['Nachname'] == "" && $_POST['Projekt'] != ""):
                    $bedingung = "ptitel = :Projekt";
                    $array = array('Projekt' => $_POST['Projekt']);
                    break;
                case ($_POST['Nachname'] != "" && $_POST['Projekt'] == ""):
                    $bedingung = "anachname = :Nachname";
                    $array = array('Nachname' => $_POST['Nachname']);
                    break;
                default:
                    $bedingung = "TRUE";
                    $array = array(); // Initialize the array for the default case
                    break;
            }
        } else {
            $bedingung = "TRUE";
            $array = array(); // Initialize the array when no form is submitted
        }

        //  Anfrage vorbereiten
        $query = $con->prepare(
            
            "SELECT * 
             FROM projekt NATURAL JOIN
             (SELECT * from leitet, angestellte 
				WHERE akuerzel = leitung) as xyz
             WHERE $bedingung"
        );
        //  Anfragestring mit Werten belegen und Anfrage ausführen
        $query->execute($array);
    } catch (PDOException $e) {
        echo "Fehler: " . htmlspecialchars($e->getMessage());
        die(); // exit
    }
    ?>

    <table>
        <thead>
            <tr>
                <h1 colspan="2">Alle Lehrer und ihre Projekte</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>P. Nr </th>
                <th>Projekttitel</th>
                <th>Leitung</th>
                <th>Max. Teilnehmer</th>
            </tr>
            <?php
            //echo "<table><tr><th>Nummer</th><th>Pojekt</th><th>Leitung</th></tr>";
            foreach ($query as $zeile) {
                echo "<tr>" .
                        "<td>" . htmlspecialchars($zeile['pnummer']) . "</td>" .
                        "<td>" . htmlspecialchars($zeile['ptitel']) . "</td>" .
                        "<td>" . htmlspecialchars($zeile['leitung']) . "</td>" .
                        "<td>" . htmlspecialchars($zeile['pmaxteilnehmer']) . "</td>" .
                     "</tr>";
            }
            echo "</table>";
            $con = null;
            ?>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="2">
                    <input type="button" value="Zurück" onclick="history.back()">
                </td>
            </tr>
        </tfoot>
    </table>
</body>
</html>
