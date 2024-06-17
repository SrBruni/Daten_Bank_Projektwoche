<!DOCTYPE html>
<html lang="de">
<head> 
	<link rel="stylesheet" type="text/css" href="projektwoche_style.css" />  
	<title> Projektwoche der LWB-Schule </title>
</head>

<body>

<h1> Willkommen in die Projektwoche!!!</h1>

<h2> Was möchten Sie tun? </h2>
<br>

<form action="index_pro_eingabe.php" method="post" name="eingeben">
  <input type="submit" value="Ein neues Projekt eintragen" style="width: 300x; height: 40px; font-size: 18px; margin-bottom: 20px">
</form>
<br>
<form action="index_pro_suchen.php" method="post" name="lesen">
  <input type="submit" value="Ein Projekt suchen" style="width: 200px; height: 40px; font-size: 18px; margin-bottom: 20px">
</form>
<br>
<form action="auswahl_projekt.php" method="post" name="eintrag">
  <input type="submit" value="Als SchülerIn mich eintragen" style="width: 300px; height: 50px; font-size: 18px;margin-bottom:20px">
</form>
<br>
<form action="index_pro_liste.php" method="post" name="liste">
  <input type="submit" value="Teilnehmerliste erstellen" style="width: 250px; height: 50px; font-size: 18px; margin-bottom: 20px">
</form>
</body>
