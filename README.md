Projektwochen Datenbank 

Enstanden ist diese Datenbank im Rahmen des Datebankpraktikums der Lehrerweiterbildung Informatik im Jahr 2024

Die in diesem Verzeichnis und den Unterverzeichnissen liegenden Dateien
beschreiben eine Datenbank zur Organisation einer Projektwoche an einer Schule.

- Im Unterordner doc befindet sich eine Datei, die das Projekt genau beschreibt.
- Im Unterordner modell findet sich Dateien, welche die Entwicklung des ER-Modells zeigen.
	Um das aktuelle ER-Modell der  Datenbank zu verändern, kann die Datei ProjektwochenDBaktuell.erdplus unter 
	https://erdplus.com/standalone importiert werden 
- Im Unterordner relational befindet sich eine Datei mit einigen Anfragen an die Datenbank in Realtionenalgebra
- Im Unterodner SQL finden sich die SQL-Dateien zur Erzeugung, zum Füllen und zum Löschen der
	Datenbank. Die Datenbank wurde mit bzw.für PostgreSQL konzipiert.


Um die Datenbank vom linux terminal aus zu nutzen zu nutzen, können folgende Schritte ausgeführt werden:
 1. In dem Dateinordner wechseln, in dem die 3 SQL-Dateien und die 2 csv-Dateien liegen
 2. PostgreSQL starten: psql
 3. eine neue Datenbank mit dem Namen Projektwoche angelegt werden: CREATE DATABASE projektwoche 
 4. zur neuen Datenbank wechseln \c projektwoche
 5. \i create_projektwoche.sql
 6. \i insert_projektwoche.sql

Um die Datenbank von einem Browser unter Linux zu nutzen, können folgende Schritte ausgeführt werden:
 1. Alle php Dateien in der Ordner /var/www/html kopieren
 2. In der Adresszeile eines Browsers: http://localhost/index_pro_start.php eingeben
 3. Der Navigation folgen

Alternativ kann die DAtenbank auch über andere Software wie pgAdmin oder Adminer genutzt werden.

Viel Spaß beim Nutzen der Datenbank.

Autoren:
Mauro Bruni
Julian Zumpe

Berlin den 17.06.2024
