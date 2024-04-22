Dies ist ein Datenbankprojekt im Rahmen des Datenbankpraktikums 2024 der Lehrerweiterbildung Informatik

die Datensätze für die Entitäten schuelerinnen, angestellte und projekte können als csv Datei in die Datenbank kopiert werden.
Die csv-Datei muss dafür natürlich der Struktur der Datenbanktabelle entsprechen:

Hier ein Beispiel für die Entität schuelerinnen
\copy schuelerinnen FROM './SchuelerInnen.csv' DELIMITER ',' CSV HEADER;
