<!DOCTYPE html>
<html lang="de">

<head>
   <link rel="stylesheet" type="text/css" href="projektwoche_style.css" /> 
    <title>Teilnehmerliste</title>
</head>
<body>
    <h1>Teilnehmerliste für Projekt</h1>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (isset($_POST['projektname']) && !empty($_POST['projektname'])) {
            $projektname = $_POST['projektname'];

            try {
                // Verbindung zur Datenbank herstellen
                $con = new PDO('pgsql:host=localhost;dbname=projektwoche', 'lewein', 'niewel');
                $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                // Projektnummer abrufen
                $stmt_projekt = $con->prepare("SELECT pnummer FROM projekt WHERE ptitel = :projektname");
                $stmt_projekt->bindParam(':projektname', $projektname);
                $stmt_projekt->execute();
                $row_projekt = $stmt_projekt->fetch(PDO::FETCH_ASSOC);
                $pnummer = $row_projekt['pnummer'];

                // Teilnehmerdaten abrufen
                $stmt_teilnehmer = $con->prepare("SELECT s.svorname, s.snachname, s.sjahrgangsstufe, s.sprofilnummer, s.sklassennummer
                                                FROM schuelerinnen s
                                                INNER JOIN nimmt_teil n ON s.sid = n.sid
                                                WHERE n.pnummer = :pnummer AND n.rolle = 'teilnehmer'");
                $stmt_teilnehmer->bindParam(':pnummer', $pnummer);
                $stmt_teilnehmer->execute();

                // Tabelle zur Anzeige der Teilnehmerliste erstellen
                echo "<table border='1'>
                        <tr>
                            <th>Nr.</th>
                            <th>Vorname</th>
                            <th>Nachname</th>
                            <th>Jahrgangsstufe</th>
                            <th>Profilnummer</th>
                            <th>Klassennummer</th>
                        </tr>";

          // Teilnehmerdaten ausgeben
				$rownummer = 1;
				while ($row_teilnehmer = $stmt_teilnehmer->fetch(PDO::FETCH_ASSOC)) {
				echo "<tr>";
				echo "<td>" . $rownummer . "</td>"; // Fortlaufende Nummer
				echo "<td>" . htmlspecialchars($row_teilnehmer['svorname']) . "</td>";
				echo "<td>" . htmlspecialchars($row_teilnehmer['snachname']) . "</td>";
				echo "<td>" . htmlspecialchars($row_teilnehmer['sjahrgangsstufe']) . "</td>";
				echo "<td>" . htmlspecialchars($row_teilnehmer['sprofilnummer']) . "</td>";
				echo "<td>" . htmlspecialchars($row_teilnehmer['sklassennummer']) . "</td>";
				echo "</tr>";
				$rownummer++;
}


                echo "</table>";

            } catch (PDOException $e) {
                echo "Fehler: " . htmlspecialchars($e->getMessage());
                die();
            }
        } else {
            echo "<p>Bitte wählen Sie ein Projekt aus.</p>";
        }
    }
    ?>
    <tfoot>
            <tr>
                <td colspan="2">
					<div class="button-container">
                    <input type="button" value="Zurück" onclick="history.back()">
                    </div>
                </td>
            </tr>
        </tfoot>

</body>
</html>
