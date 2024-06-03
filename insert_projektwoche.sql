-- Miniwelt Projektwoche
-- Authoren Bruni, Zumpe
-- Datum: 27.05.24
-- Funktion: Füllt die Tabellen der Datenbank Projektwoche mit DAten aus verschiedenen csv-Daeien
-- ACHTUNG: die csv Dateien müssen in dem Verzeichnis liegen von dem aus PSQL gestartet wurde
-- CSV HAEDER bedeutet, dass die erste Zeile der CDV Datei ignoriert wird

--  einfuegen von 39 Angestellte aus der angestellte aus der csv Datei
\COPY angestellte				FROM 'angestellte.csv'		DELIMITER ',' CSV HEADER;

-- einfuegen von 130 Schulerinnenaus der csv Datei
\COPY schuelerInnen 			FROM 'schuelerInnen.csv' 	DELIMITER ',' CSV HEADER;

-- einfuegen von 12 Projekten nach dem Schema pNummer, pTitel, pMaxTeilnehmer 
-- Projekte können auch Kursfahrten sein!!

INSERT INTO projekt VALUES (default, 'Roboter programmieren',15); 
INSERT INTO projekt VALUES (default, 'Upcycling: Kreative Ideen für alte Dinge',12);
INSERT INTO projekt VALUES (default, 'Filmproduktion von Kurzfilmen', 17);
INSERT INTO projekt VALUES (default, 'Kochen und Backen: Kulinarische Experimente',25);
INSERT INTO projekt VALUES (default, 'Theaterworkshop: Schauspiel und Improvisation',20);
INSERT INTO projekt VALUES (default, 'Diskutieren und Argumentieren',24);
INSERT INTO projekt VALUES (default, 'DIY: Handwerken und Basteln',28);
INSERT INTO projekt VALUES (default, 'Neue Sportarten kennenlernen',23);
INSERT INTO projekt VALUES (default, 'Gemeinsam musizieren',23);
INSERT INTO projekt VALUES (default, 'Kursfahrt nach Rom',18);
INSERT INTO projekt VALUES (default, 'Kursfahrt nach London',23);
INSERT INTO projekt VALUES (default, 'Kursfahrt nach Paris',23);
--INSERT INTO projekt VALUES (default, 'Brettspielentwicklung: Spiele erfinden',25);
--INSERT INTO projekt VALUES (default, 'Malen und Zeichnen',23);
--INSERT INTO projekt VALUES (default, 'Fotografieworkshop: Die Welt durch die Linse sehen',25);
--INSERT INTO projekt VALUES (default, 'Tanzkurs: Bewegung und Rhythmus',18);
--INSERT INTO projekt VALUES (default, 'Experimente in der Chemie: Spaß am Forschen',19);
--INSERT INTO projekt VALUES (default, 'Computeranimation: Digitale Welten erschaffen',12);
--INSERT INTO projekt VALUES (default, 'Instrumentalensemble: Musik machen im Team',19);
--INSERT INTO projekt VALUES (default, 'Filmproduktion: Kurzfilme drehen',20);
--INSERT INTO projekt VALUES (default, 'Escape Room selber bauen',22);
--INSERT INTO projekt VALUES (default, 'Keramikwerkstatt: Töpfern und Gestalten',23);

-- alle 130 SuS werden mindestens einem Projekt zugewiesen nach dem Schema: sID, pNummer, rolle
WITH Teilnehmer_Anzahl AS (
    SELECT pNummer, COUNT(*) AS Anzahl_Teilnehmer
    FROM nimmt_teil
    GROUP BY pNummer
)
INSERT INTO nimmt_teil (sID, pNummer, rolle)
SELECT :sID, :pNummer, :rolle
FROM Teilnehmer_Anzahl
WHERE pNummer = :pNummer
AND Anzahl_Teilnehmer < (SELECT pMaxTeilnehmer FROM projekt);




INSERT INTO nimmt_teil VALUES (1,1,'assistent');
INSERT INTO nimmt_teil VALUES (2,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (3,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (4,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (5,1,'assistent');
INSERT INTO nimmt_teil VALUES (6,6,'assistent');
INSERT INTO nimmt_teil VALUES (7,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (8,4,'assistent');
INSERT INTO nimmt_teil VALUES (9,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (10,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (11,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (12,1,'assistent');
INSERT INTO nimmt_teil VALUES (13,8,'teilnehmer');
INSERT INTO nimmt_teil VALUES (14,1,'assistent');
INSERT INTO nimmt_teil VALUES (15,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (16,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (17,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (18,12,'teilnehmer');
INSERT INTO nimmt_teil VALUES (19,2,'assistent');
INSERT INTO nimmt_teil VALUES (20,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (21,5,'teilnehmer');
INSERT INTO nimmt_teil VALUES (22,1,'assistent');
INSERT INTO nimmt_teil VALUES (23,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (24,8,'assistent');
INSERT INTO nimmt_teil VALUES (25,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (26,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (27,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (28,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (29,9,'assistent');
INSERT INTO nimmt_teil VALUES (30,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (31,6,'teilnehmer');
INSERT INTO nimmt_teil VALUES (32,11,'assistent');
INSERT INTO nimmt_teil VALUES (33,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (34,6,'assistent');
INSERT INTO nimmt_teil VALUES (35,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (36,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (37,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (38,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (39,2,'assistent');
INSERT INTO nimmt_teil VALUES (40,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (41,4,'teilnehmer');
INSERT INTO nimmt_teil VALUES (42,8,'teilnehmer');
INSERT INTO nimmt_teil VALUES (43,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (44,1,'assistent');
INSERT INTO nimmt_teil VALUES (45,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (46,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (47,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (48,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (49,6,'assistent');
INSERT INTO nimmt_teil VALUES (50,11,'teilnehmer');
INSERT INTO nimmt_teil VALUES (51,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (52,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (53,8,'teilnehmer');
INSERT INTO nimmt_teil VALUES (54,1,'assistent');
INSERT INTO nimmt_teil VALUES (55,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (56,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (57,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (58,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (59,9,'assistent');
INSERT INTO nimmt_teil VALUES (60,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (61,11,'teilnehmer');
INSERT INTO nimmt_teil VALUES (62,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (63,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (64,6,'assistent');
INSERT INTO nimmt_teil VALUES (65,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (66,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (67,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (68,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (69,1,'assistent');
INSERT INTO nimmt_teil VALUES (70,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (71,11,'teilnehmer');
INSERT INTO nimmt_teil VALUES (72,4,'teilnehmer');
INSERT INTO nimmt_teil VALUES (73,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (74,6,'assistent');
INSERT INTO nimmt_teil VALUES (75,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (76,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (77,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (78,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (79,1,'assistent');
INSERT INTO nimmt_teil VALUES (80,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (81,11,'teilnehmer');
INSERT INTO nimmt_teil VALUES (82,4,'teilnehmer');
INSERT INTO nimmt_teil VALUES (83,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (84,6,'assistent');
INSERT INTO nimmt_teil VALUES (85,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (86,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (87,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (88,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (89,1,'assistent');
INSERT INTO nimmt_teil VALUES (90,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (91,11,'teilnehmer');
INSERT INTO nimmt_teil VALUES (92,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (93,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (94,6,'assistent');
INSERT INTO nimmt_teil VALUES (95,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (96,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (97,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (98,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (99,1,'assistent');
INSERT INTO nimmt_teil VALUES (100,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (101,11,'teilnehmer');
INSERT INTO nimmt_teil VALUES (102,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (103,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (104,6,'assistent');
INSERT INTO nimmt_teil VALUES (105,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (106,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (107,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (108,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (109,1,'assistent');
INSERT INTO nimmt_teil VALUES (110,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (111,11,'teilnehmer');
INSERT INTO nimmt_teil VALUES (112,4,'teilnehmer');
INSERT INTO nimmt_teil VALUES (113,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (114,6,'assistent');
INSERT INTO nimmt_teil VALUES (115,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (116,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (117,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (118,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (119,1,'assistent');
INSERT INTO nimmt_teil VALUES (120,7,'teilnehmer');


-- einige Angestellte werden als Projektleitungen Projekten zugewiesen nach dem Schema: angestellte(aKuerzel), pNummer
-- jedes Projekt muss mindestens eine Leitung haben
-- nicht jede(r) Angestellte muss eine Leitung übernehmen. Sie können auch Projekte "mitleiten"
INSERT INTO leitet VALUES ('Schu',1);
INSERT INTO leitet VALUES ('Hof',2);
INSERT INTO leitet VALUES ('Schul',3);
INSERT INTO leitet VALUES ('Fis',4);
INSERT INTO leitet VALUES ('Wol',5);
INSERT INTO leitet VALUES ('Leh',6);
INSERT INTO leitet VALUES ('Hof',7);
INSERT INTO leitet VALUES ('Lim',8);
INSERT INTO leitet VALUES ('Hoff',9);
INSERT INTO leitet VALUES ('Sch',10);

-- einige Angestellte werden als Mitleitende Projektnummer zugewiesen nach dem Schema: angestellte(aKuerzel), pNummer

INSERT INTO leitet_mit VALUES ('Ber',2);
INSERT INTO leitet_mit VALUES ('Schm',5);
INSERT INTO leitet_mit VALUES ('Schus',10);
INSERT INTO leitet_mit VALUES ('Hf',4);
INSERT INTO leitet_mit VALUES ('Mei',6);
INSERT INTO leitet_mit VALUES ('Mül',1);

-- es werden verschieden Orte festgelegt
-- die Anzahl der Ort muss nicht mit den Projekten übereinstimmen, da Projekte auch an mehreren Orten teilen
INSERT INTO raum_oder_ort VALUES ('004');
INSERT INTO raum_oder_ort VALUES ('413');
INSERT INTO raum_oder_ort VALUES ('Schulkueche');
INSERT INTO raum_oder_ort VALUES ('Tempelhofer Feld');
INSERT INTO raum_oder_ort VALUES ('Schulgarten');
INSERT INTO raum_oder_ort VALUES ('Sportplatz');
INSERT INTO raum_oder_ort VALUES ('Aula');
INSERT INTO raum_oder_ort VALUES ('224');
INSERT INTO raum_oder_ort VALUES ('123');
INSERT INTO raum_oder_ort VALUES ('223');

-- es wird nacheinander jeder pNummer ein Datum/Tag mit Start und Endzeit sowie einem Ort zugewiesen
-- unsere Projektwoche findet beispielhaft vom Montag 2024-06-23 bis (maximal) Sonntag 2024-06-29


INSERT INTO findet_statt VALUES (1,'2024-06-23','8:00:00','14:00:00','004');
INSERT INTO findet_statt VALUES (1,'2024-06-24','8:00:00','14:00:00','004');
INSERT INTO findet_statt VALUES (1,'2024-06-25','8:00:00','14:00:00','004');
INSERT INTO findet_statt VALUES (1,'2024-06-26','8:00:00','14:00:00','004');
INSERT INTO findet_statt VALUES (1,'2024-06-27','9:00:00','14:00:00','004');

INSERT INTO findet_statt VALUES (2,'2024-06-23','8:00:00','13:00:00','224');
INSERT INTO findet_statt VALUES (2,'2024-06-24','8:00:00','13:00:00','224');
INSERT INTO findet_statt VALUES (2,'2024-06-25','8:00:00','13:00:00','224');
INSERT INTO findet_statt VALUES (2,'2024-06-26','8:00:00','13:00:00','224');
INSERT INTO findet_statt VALUES (2,'2024-06-27','8:00:00','14:00:00','224');

INSERT INTO findet_statt VALUES (3,'2024-06-23','8:00:00','13:00:00','413');
INSERT INTO findet_statt VALUES (3,'2024-06-24','8:00:00','13:00:00','413');
INSERT INTO findet_statt VALUES (3,'2024-06-25','8:00:00','13:00:00','413');
INSERT INTO findet_statt VALUES (3,'2024-06-26','8:00:00','13:00:00','413');
INSERT INTO findet_statt VALUES (3,'2024-06-27','8:00:00','14:00:00','413');

INSERT INTO findet_statt VALUES (4,'2024-06-23','8:00:00','13:00:00','Schulkueche');
INSERT INTO findet_statt VALUES (4,'2024-06-24','8:00:00','13:00:00','Schulkueche');
INSERT INTO findet_statt VALUES (4,'2024-06-25','8:00:00','13:00:00','Schulkueche');
INSERT INTO findet_statt VALUES (4,'2024-06-26','8:00:00','13:00:00','Schulkueche');
INSERT INTO findet_statt VALUES (4,'2024-06-27','8:00:00','14:00:00','Schulkueche');

INSERT INTO findet_statt VALUES (5,'2024-06-23','8:00:00','13:00:00','Aula');
INSERT INTO findet_statt VALUES (5,'2024-06-24','8:00:00','13:00:00','Aula');
INSERT INTO findet_statt VALUES (5,'2024-06-25','8:00:00','13:00:00','Aula');
INSERT INTO findet_statt VALUES (5,'2024-06-26','8:00:00','13:00:00','Aula');
INSERT INTO findet_statt VALUES (5,'2024-06-27','8:00:00','14:00:00','Aula');

INSERT INTO findet_statt VALUES (6,'2024-06-23','8:00:00','13:00:00','224');
INSERT INTO findet_statt VALUES (6,'2024-06-24','8:00:00','13:00:00','224');
INSERT INTO findet_statt VALUES (6,'2024-06-25','8:00:00','13:00:00','224');
INSERT INTO findet_statt VALUES (6,'2024-06-26','8:00:00','13:00:00','224');
INSERT INTO findet_statt VALUES (6,'2024-06-27','8:00:00','14:00:00','224');

INSERT INTO findet_statt VALUES (7,'2024-06-23','8:00:00','13:00:00','123');
INSERT INTO findet_statt VALUES (7,'2024-06-24','8:00:00','13:00:00','123');
INSERT INTO findet_statt VALUES (7,'2024-06-25','8:00:00','13:00:00','123');
INSERT INTO findet_statt VALUES (7,'2024-06-26','8:00:00','13:00:00','123');
INSERT INTO findet_statt VALUES (7,'2024-06-27','8:00:00','14:00:00','123');

INSERT INTO findet_statt VALUES (8,'2024-06-23','8:00:00','13:00:00','Sportplatz');
INSERT INTO findet_statt VALUES (8,'2024-06-24','8:00:00','13:00:00','Sportplatz');
INSERT INTO findet_statt VALUES (8,'2024-06-25','8:00:00','13:00:00','Sportplatz');
INSERT INTO findet_statt VALUES (8,'2024-06-26','8:00:00','13:00:00','Sportplatz');
INSERT INTO findet_statt VALUES (8,'2024-06-27','8:00:00','14:00:00','Sportplatz');

INSERT INTO findet_statt VALUES (9,'2024-06-23','8:00:00','13:00:00','224');
INSERT INTO findet_statt VALUES (9,'2024-06-24','8:00:00','13:00:00','224');
INSERT INTO findet_statt VALUES (9,'2024-06-25','8:00:00','13:00:00','224');
INSERT INTO findet_statt VALUES (9,'2024-06-26','8:00:00','13:00:00','224');
INSERT INTO findet_statt VALUES (9,'2024-06-27','8:00:00','14:00:00','224');
