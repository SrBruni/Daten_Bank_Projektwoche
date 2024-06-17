<!DOCTYPE html>
<html lang="de">
<link rel="stylesheet" type="text/css" href="projektwoche_style.css">
<head>
    <meta charset="UTF-8">
    <title>Projekteingabe</title>
    
</head>
<body>
    <form method="post" action="">
        <h2> Suche dir einen Schüler aus </h2>
        <table>
            <tr>
                <td>
                    <!-- Dropdown-Menü für die Schülerauswahl -->
                    <select name="schueler_id">
                        <option value="">Wählen Sie einen Schüler</option>
                        <?php
                        try {
                            // Schülerdaten aus der Datenbank abrufen
                            $con = new PDO('pgsql:host=localhost;dbname=projektwoche', 'lewein', 'niewel');
                            $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                            $schueler = $con->query("SELECT DISTINCT sid, svorname, snachname FROM schuelerinnen ORDER BY snachname");
                            while ($row = $schueler->fetch(PDO::FETCH_ASSOC)) {
                                echo "<option value='" . htmlspecialchars($row['sid']) . "'>" . htmlspecialchars($row['svorname']) . " " . htmlspecialchars($row['snachname']) . "</option>";
                            }
                        } catch (PDOException $e) {
                            echo "Fehler: " . htmlspecialchars($e->getMessage());
                            die();
                        }
                        ?>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <!-- Dropdown-Menü für die Projektauswahl -->
                    <select name="projektname" size="10" onchange="this.form.submit()">
                        <option value="">Wählen Sie ein Projekt</option>
                        <?php
                        try {
                            // Projekttitel aus der Datenbank abrufen
                            $projekte = $con->query("SELECT ptitel FROM projekt");
                            while ($row = $projekte->fetch(PDO::FETCH_ASSOC)) {
                                $selected = isset($_POST['projektname']) && $_POST['projektname'] == $row['ptitel'] ? 'selected' : '';
                                echo "<option value='" . htmlspecialchars($row['ptitel']) . "' $selected>" . htmlspecialchars($row['ptitel']) . "</option>";
                            }
                        } catch (PDOException $e) {
                            echo "Fehler: " . htmlspecialchars($e->getMessage());
                            die();
                        }
                        ?>
                    </select>
                </td>
            </tr>
         
            <tr>
                <td>
                    <h3> Vergessen Sie nicht, sich einzutragen! </h3>
                    <div style="text-align: center; margin-top: 20px;">
                        <input type="submit" name="submit" value="Eintragen" style="width: 250px; height: 50px; font-size: 18px;">
                    </div>
                </td>
            </tr>
        </table>
    </form>

    <?php
    // Prüfen, ob das Formular abgeschickt wurde und ein Schüler ausgewählt wurde
    if (isset($_POST['submit']) && isset($_POST['schueler_id']) && !empty($_POST['schueler_id'])) {
        $schueler_id = $_POST['schueler_id'];
        $projektname = isset($_POST['projektname']) ? $_POST['projektname'] : '';

        try {
            // Projektnummer aus der Datenbank abrufen
            $stmt_projekt = $con->prepare("SELECT pnummer FROM projekt WHERE ptitel = :projektname");
            $stmt_projekt->bindParam(':projektname', $projektname);
            $stmt_projekt->execute();
            $row_projekt = $stmt_projekt->fetch(PDO::FETCH_ASSOC);

            if ($row_projekt) {
                $pnummer = $row_projekt['pnummer']; // Projektnummer

                // Überprüfen, ob der Schüler bereits für das Projekt eingetragen ist
                $stmt_check = $con->prepare("SELECT COUNT(*) as count FROM nimmt_teil WHERE sid = :sid AND pnummer = :pnummer");
                $stmt_check->bindParam(':sid', $schueler_id, PDO::PARAM_INT);
                $stmt_check->bindParam(':pnummer', $pnummer, PDO::PARAM_INT);
                $stmt_check->execute();
                $count = $stmt_check->fetchColumn();

                if ($count == 0) {
                    // Maximale Teilnehmerzahl aus der Datenbank abrufen
                    $stmt_max_teilnehmer = $con->prepare("SELECT pmaxteilnehmer FROM projekt WHERE pnummer = :pnummer");
                    $stmt_max_teilnehmer->bindParam(':pnummer', $pnummer, PDO::PARAM_INT);
                    $stmt_max_teilnehmer->execute();
                    $maxTeilnehmer = $stmt_max_teilnehmer->fetchColumn();

                    // Aktuelle Teilnehmerzahl für das Projekt abrufen
                    $stmt_aktuelle_teilnehmer = $con->prepare("SELECT COUNT(*) as aktuelleTeilnehmer FROM nimmt_teil WHERE pnummer = :pnummer");
                    $stmt_aktuelle_teilnehmer->bindParam(':pnummer', $pnummer, PDO::PARAM_INT);
                    $stmt_aktuelle_teilnehmer->execute();
                    $aktuelleTeilnehmer = $stmt_aktuelle_teilnehmer->fetchColumn();

                    if ($aktuelleTeilnehmer < $maxTeilnehmer) {
                        // Schüler als Teilnehmer eintragen
                        $stmt_insert = $con->prepare("INSERT INTO nimmt_teil (sid, pnummer, rolle) VALUES (:sid, :pnummer, 'teilnehmer')");
                        $stmt_insert->bindParam(':sid', $schueler_id, PDO::PARAM_INT); // Schüler ID als Integer übergeben
                        $stmt_insert->bindParam(':pnummer', $pnummer, PDO::PARAM_INT); // Projektnummer als Integer übergeben
                        if ($stmt_insert->execute()) {
                            echo "<p>Schüler erfolgreich eingetragen!</p>";
                            // Aktualisierte Teilnehmerzahl anzeigen
                            $aktuelleTeilnehmer++;
                            echo "<p>Aktuelle Teilnehmerzahl: " . htmlspecialchars($aktuelleTeilnehmer) . "</p>";

                            // Ausgabe der eingetragenen Daten
                            $stmt_schueler_info = $con->prepare("SELECT svorname, snachname, ptitel FROM schuelerinnen INNER JOIN nimmt_teil ON schuelerinnen.sid = nimmt_teil.sid INNER JOIN projekt ON nimmt_teil.pnummer = projekt.pnummer WHERE schuelerinnen.sid = :sid AND projekt.ptitel = :projektname");
                            $stmt_schueler_info->bindParam(':sid', $schueler_id, PDO::PARAM_INT);
                            $stmt_schueler_info->bindParam(':projektname', $projektname);
                            $stmt_schueler_info->execute();
                            $row_schueler_info = $stmt_schueler_info->fetch(PDO::FETCH_ASSOC);

                            if ($row_schueler_info) {
                                echo "<p>Der Schüler " . htmlspecialchars($row_schueler_info['svorname']) . " " . htmlspecialchars($row_schueler_info['snachname']) . " hat sich für das Projekt " . htmlspecialchars($row_schueler_info['ptitel']) . " eingetragen.</p>";
                            }
                        } else {
                            echo "<p>Fehler beim Eintragen des Schülers.</p>";
                        }
                    } else {
                        echo "<p>Die maximale Teilnehmerzahl für dieses Projekt ist bereits erreicht.</p>";
                    }
                } else {
                    // Hier keine Meldung ausgeben, da noch kein Schüler ausgewählt wurde
                }
            } else {
                // Fehlerfall: Projekt nicht gefunden
                echo "<p>Projekt nicht gefunden.</p>";
            }
        } catch (PDOException $e) {
            // Fehler bei der Datenbankabfrage behandeln
            echo "Fehler: " . htmlspecialchars($e->getMessage());
            die();
        }
    } elseif (isset($_POST['submit']) && isset($_POST['projektname']) && empty($_POST['schueler_id'])) {
        echo "<p>Bitte wählen Sie einen Schüler aus.</p>";
    }
    ?>
    
    <tfoot>
        <tr>
     
                <form action="index_pro_start.php" method="post" name="eintrag">
				<input type="submit" value="Zurück zum Start" style="width: 300px; height: 50px; font-size: 18px;margin-bottom:20px">
				</form>
            </td>
        </tr>
    </tfoot>
</body>
</html>
