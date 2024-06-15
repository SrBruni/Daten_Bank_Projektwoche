<!DOCTYPE html>
<html lang="de">
<link rel="stylesheet" type="text/css" href="projektwoche_style.css" />  
<form action="angest_2.php" method="post">
  <body>
	<h1>Suche nach einem Projekt</h1>
  <h2> Suche nach Lehrern und ihren Projekte </h2>
  <input type="hidden" name="sent" value="1" />
  <table>
    <tr>
		<!-- Dropdown-Menü für die Projektauswahl -->
        <select name="projektname">
        <option value="">Wählen Sie ein Projekt</option>
			<?php
				$con = new PDO('pgsql:host=localhost;dbname=projektwoche', 'lewein', 'niewel');
                $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
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
		
  <!--     <td> Lehrer Nachname: </td>
      <td> <input type="text" name="Nachname" size="25" /> </td>
    </tr>
    <tr>
      <td> Projekt: </td>
      <td> <input type="text" name="Projekt" size="25" /> </td>
    </tr> -->
    <tr>
    
      <td style= "background-color: white"> <input type="submit" value="Ubersicht anzeigen" style="width: 250px; height: 50px; font-size: 18px; margin-bottom:20px; margin-left:80px; font-weight: bold">
      </td>
    </tr>
  </table>
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
