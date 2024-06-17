<!DOCTYPE html>
<html lang="de">
	<body>
		<?php
		try {
			
		$con = new PDO ('pgsql:host=localhost;dbname=lewein',
											'lewein','niewel');
		$profs = $con->prepare("SELECT name, rang, raum
								FROM professoren
								WHERE raum < :raum");
		$profs->execute(array(':raum' => 250 ));
		echo "<table><tr>
				<th>Name</th><th>Rang</th><th>Raum</th> 
				</tr>"; // th = table header
		foreach ($profs as $row) {
			echo "<tr>" . //tr tabel row
			"<td> |" . $row['name'] . "</td>" . // td table data 
			"<td> |" . $row['rang'] . "</td>" .
			"<td> |" . $row['raum'] . "</td>" .
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
