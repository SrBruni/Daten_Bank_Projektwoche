<!DOCTYPE html>
<html lang="de">
	<body>
		<?php
		try {
			
		$con = new PDO ('pgsql:host=localhost;dbname=lewein',
											'lewein','niewel');
		$profs = $con->prepare("SELECT name, rang, raum
								FROM professoren
								WHERE name = :pname");
		$profs->execute(
			array (':pname' => 'Sokrates')
			);
		foreach ($profs as $row) {
			echo "Name: " . $row['name'] . "<br/>" .
				"Rang: " . $row['rang'] . "<br/>" .
				"Raum: " . $row['raum'] . "<br/>";
		
		} 
		$con = null;
		} catch (PDOException $err) {
				echo "Fehler: " . htmlspecialchars($err->getMessage ());
			}
		?>
	</body>
</html>
