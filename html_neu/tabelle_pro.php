<!DOCTYPE html>
<html lang="de">
	<body>
		<?php
		try {
		$con = new PDO ('pgsql:host=localhost;dbname=projektwoche',
											'lewein','niewel');
		$angs = $con -> query ("SELECT avorname, anachname, akuerzel
								  FROM angestellte");
		echo "<table><tr>
				<th>Vorname</th><th>Nachname</th><th>kuerzel</th> 
				</tr>"; // th = table header
		foreach ($angs as $row) {
				echo "<tr>" . //tr tabel row
				"<td>" . $row['avorname'] . "</td>" .
				"<td>" . $row['anachname'] . "</td>" .  // td table data 
				"<td>" . $row['akuerzel'] . "</td>" .
				"</tr>";
		}
		echo "</table>";
		$con = null;
	
		} catch (PDOException $err) {
				echo "Fehler: " . htmlspecialchars($err->getMessage ());
			}
		?>
	</body>
</html>
