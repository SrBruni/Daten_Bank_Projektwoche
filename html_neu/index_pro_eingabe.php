<!DOCTYPE html>
<html lang="de">
<head>
    <link rel="stylesheet" type="text/css" href="projektwoche_style.css" />
</head>
<body>
    <h2>Trage ein neues Projekt ein</h2>
    <form action="eingabe_projekt.php" method="post">
        <input type="hidden" name="sent" value="1" />
        <table>
            <tr>
                <td>Projektname:</td>
                <td><input type="text" name="Projektname" size="60" required /></td>
            </tr>
            <tr>
                <td>Max Teilnehmer:</td>
                <td><input type="text" name="MaxTeilnehmer" size="60" required /></td>
            </tr>
            <tr>
                <td>Beschreibung:</td>
                <td><input type="text" name="Beschreibung" size="60" required /></td>
            </tr>
            <tr>
                <td>Leitung:</td>
                <td>
                    <select name="Leitung" required>
                        <option value="">Bitte wählen...</option>
                        <?php
                        try {
                            // Verbindung zur Datenbank herstellen
                            $con = new PDO('pgsql:host=localhost;dbname=projektwoche', 'lewein', 'niewel');
                            $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                            // Kürzel der Angestellten abrufen
                            $query = $con->query("SELECT akuerzel, anachname, avorname FROM angestellte");
                            while ($row = $query->fetch(PDO::FETCH_ASSOC)) {
                                echo "<option value='" . htmlspecialchars($row['akuerzel']) . "'>" . htmlspecialchars($row['akuerzel']) . " - " . htmlspecialchars($row['avorname']) . " " . htmlspecialchars($row['anachname']) . "</option>";
                            }
                        } catch (PDOException $e) {
                            echo "Fehler: " . htmlspecialchars($e->getMessage());
                        }
                        ?>
                    </select>
                </td>
            </tr>
            
            <tr>
                <td></td>
                <td><input type="submit" value="Absenden" style="margin-left: 180px"></td>
            </tr>
        </table>
    </form>
    <form action="index_pro_start.php" method="post" name="eintrag">
        <input type="submit" value="Zurück zum Start" style="width: 300px; height: 50px; font-size: 18px; margin-bottom:20px">
    </form>
</body>
</html>

