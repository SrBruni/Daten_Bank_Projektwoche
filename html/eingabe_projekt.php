<!DOCTYPE html>
<html lang="de">
<link rel="stylesheet" type="text/css" href="projektwoche_style.css" />  
	
<form action="index_pro_eingabe.php" method="post">
<body>
    </form> <P>
     <?php 
    try {
        $con = new PDO('pgsql:host=localhost;dbname=projektwoche', 'lewein', 'niewel');
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        if (isset($_POST['sent'])) {
            $projektname = $_POST["Projektname"];
            $maxTeilnehmer = $_POST["MaxTeilnehmer"];
            $leitung = $_POST["Leitung"];
            $beschreibung = $_POST["Beschreibung"];
            
            // Eingaben validieren (zum Beispiel auf leere Felder überprüfen)
            if (empty($projektname) || empty($maxTeilnehmer) || empty($leitung) || empty($beschreibung)){
                echo "Bitte alle Felder ausfüllen.";
            } else {
                // SQL-Befehl zum Einfügen der Daten
                $sql = "INSERT INTO projekt (ptitel, pMaxPers, pBeschreibung) VALUES (:projektname, :maxTeilnehmer, :beschreibung)";
                $stmt = $con->prepare($sql);
                $stmt->bindParam(':projektname', $projektname);
                $stmt->bindParam(':maxTeilnehmer', $maxTeilnehmer);
                $stmt->bindParam(':beschreibung', $beschreibung);
                
                if ($stmt->execute()) {
                    // Hole pnummer für die Leitung
                    $stmt = $con->prepare("SELECT pnummer FROM projekt WHERE ptitel = :projektname");
                    $stmt->bindParam(':projektname', $projektname);
                    $stmt->execute();
                    $pNummer = $stmt->fetchColumn();
                    
                    if ($pNummer) {
                        $sql_1 = "INSERT INTO leitet (leitung, pnummer) VALUES (:leitung, :pNummer)";
                        $stmt = $con->prepare($sql_1);
                        $stmt->bindParam(':leitung', $leitung);
                        $stmt->bindParam(':pNummer', $pNummer);
                        if ($stmt->execute()) {
                            echo "Neues Projekt erfolgreich eingetragen!";
                        } else {
                            echo "Fehler beim Einfügen in 'leitet'.";
                        }
                    } else {
                        echo "Fehler: Leitung nicht gefunden.";
                    }
                } else {
                    echo "Fehler: " . $sql . "<br>" . $con->errorInfo()[2];
                }
            }
        }
    } catch (PDOException $e) {
        echo "Fehler: " . htmlspecialchars($e->getMessage());
        die(); // exit
    }
    ?>
    </P>
	<tfoot>
		<tr>
			<td colspan="2">
				<style="padding-left: 50px; padding-top: 20px;">
                <input type="button" value="Zurück" onclick="history.back()" style="width: 200px; height: 40px; font-size: 18px;margin-bottom:20px">
            </td>
        </tr>
		<tr>
			<form action="index_pro_start.php" method="post" name="eintrag">
			<input type="submit" value="Zurück zum Start" style="width: 300px; height: 50px; font-size: 18px;margin-bottom:20px">
			</form>
        </tr>
    </tfoot>
    
</body>

</html>
