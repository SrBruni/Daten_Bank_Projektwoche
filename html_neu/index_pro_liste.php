<!DOCTYPE html>
<html lang="de">
<link rel="stylesheet" type="text/css" href="projektwoche_style.css" />  
<head>
    <meta charset="UTF-8">
    <title>Projektauswahl</title>
</head>
<body>
    <h1>Projektauswahl für Teilnehmerliste</h1>

    <form action="liste_erstellen_projekt.php" method="post">
        <label for="projektname">Erstellen sie eine Teilnehmerliste für das Projekt:</label>
        <select id="projektname" name="projektname" required>
            <option value="">Bitte wählen...</option>
            <?php
            // Verbindung zur Datenbank herstellen
            try {
                $con = new PDO('pgsql:host=localhost;dbname=projektwoche', 'lewein', 'niewel');
                $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                // Projektnamen aus der Datenbank abrufen
                $projektname_query = $con->query("SELECT ptitel FROM projekt");
                while ($row = $projektname_query->fetch(PDO::FETCH_ASSOC)) {
                    // Optionen für das Dropdown-Menü erstellen
                    echo "<option value='" . htmlspecialchars($row['ptitel']) . "'>" . htmlspecialchars($row['ptitel']) . "</option>";
                }
            } catch (PDOException $e) {
                echo "Fehler: " . htmlspecialchars($e->getMessage());
                die();
            }
            ?>
        </select>
        <br><br>
        <tr>
        <input type="submit" value="Teilnehmerliste anzeigen" style="width: 250px; height: 50px; font-size: 18px; margin-bottom:20px; font-weight: bold">
		</td>
		</tr>
		<br><br> 
   </form>
<tfoot>
            <tr>
                <td colspan="2">
					<style="padding-left: 50px; padding-top: 20px;">
                    <input type="button" value="Zurück" onclick="history.back()" style="width: 200px; height: 40px; font-size: 18px;">
                </td>
            </tr>
        </tfoot>
</body>
</html>
