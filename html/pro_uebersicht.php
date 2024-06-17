<!DOCTYPE html>
<html lang="de">
<head>
    <link rel="stylesheet" type="text/css" href="projektwoche_style.css" />
</head>
<body>
	<h1>Projektübersicht</h1>

    <?php 
    if ($_SERVER['REQUEST_METHOD'] == 'POST' && !empty($_POST['projektname'])) {
        try {
            $projektname = $_POST['projektname'];
            $con = new PDO('pgsql:host=localhost;dbname=projektwoche', 'lewein', 'niewel');
            $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // Anfrage vorbereiten   --Code erstellt mit Hilfe von chatgpt--
            $query = $con->prepare(
                "SELECT * 
                 FROM projekt NATURAL JOIN
                 (SELECT * from leitet, angestellte 
                 WHERE akuerzel = leitung) as xyz
                 WHERE ptitel = :projektname"
            );

            // Anfragestring mit Werten belegen und Anfrage ausführen 
            $query->bindParam(':projektname', $projektname, PDO::PARAM_STR);
            $query->execute();

            echo "<table>
                    <thead>
                        <tr>
                            <th>P. Nr</th>
                            <th>Projekttitel</th>
                            <th>Leitung</th>
                            <th>Max. Teilnehmer</th>
                            <th>Beschreibung</th>
                        </tr>
                    </thead>
                    <tbody>";

            foreach ($query as $zeile) {
                echo "<tr>" .
                        "<td>" . htmlspecialchars($zeile['pnummer']) . "</td>" .
                        "<td>" . htmlspecialchars($zeile['ptitel']) . "</td>" .
                        "<td>" . htmlspecialchars($zeile['leitung']) . "</td>" .
                        "<td>" . htmlspecialchars($zeile['pmaxpers']) . "</td>" .
                        "<td>" . htmlspecialchars($zeile['pbeschreibung']) . "</td>" .
                     "</tr>";
            }
            echo "  </tbody>
                </table>";

            $con = null;
        } catch (PDOException $e) {
            echo "Fehler: " . htmlspecialchars($e->getMessage());
            die();
        }
    }
    ?>
		<br>
    	<tfoot>
			<tr>
			<input type="button" value="Zurück zu den Projekten" style="width: 300px; height: 50px; font-size: 18px;margin-bottom:20px" onclick="history.back()">
			</form>
        </tr>
      
		<tr>
			<form action="index_pro_start.php" method="post" name="eintrag">
			<input type="submit" value="Zurück zum Start" style="width: 300px; height: 50px; font-size: 18px;margin-bottom:20px">
			</form>
        </tr>
    </tfoot>
</body>
</html>
