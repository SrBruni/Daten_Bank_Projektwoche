-- Miniwelt Projektwoche
-- Authoren Bruni, Zumpe
-- Datum: 11.06.24
-- Funktion: Füllt die Tabellen der Datenbank Projektwoche mit DAten aus verschiedenen csv-Daeien
-- ACHTUNG: die csv Dateien müssen in dem Verzeichnis liegen von dem aus PSQL gestartet wurde
-- CSV HAEDER bedeutet, dass die erste Zeile der CDV Datei ignoriert wird

--  einfuegen von 39 Angestellte aus der angestellte aus der csv Datei
\COPY angestellte				FROM 'angestellte.csv'		DELIMITER ',' CSV HEADER;

-- einfuegen von 120 SchulerInnen aus der Jahrgangänge 1 bis 10 der csv Datei
-- es gibt also 30 SchuelerInnen pro Jahrgang
-- pro Jahrgang gibt es zwei Profile (1 und 2)
-- Pro Profil gibt es eine oder zwei Klassen, d.h. in Jahrgang 7 gibt es die drei Klassen 711,712,721
 
\COPY schuelerInnen 			FROM 'schuelerInnen.csv' 	DELIMITER ',' CSV HEADER;

-- einfuegen von 11 Projekten nach dem Schema pNummer, pTitel, pMaxTeilnehmer 
-- alle Projekte finden mindestens an allen 5 Wochentagen statt
-- die Start und Endzeit sowie der Projektort kann an den Tagen variieren
-- manche Projekte werden in zwei verschieden Niveaustufen angeboten (1 = Anfänger, 2 = Fortgeschrittene)
-- Projekte können auch Fahrten sein

INSERT INTO projekt VALUES (default, 'Roboter programmieren',15,'Wir bauen und programmieren verschiedene Roboter. Keine Vorerfahrung notwendig'); 
INSERT INTO projekt VALUES (default, 'Upcycling: Kreative Ideen für alte Dinge',12,'Bringt euer altes Zeug mit. Wir machen was Schönes, was Praktisches oder etwas Lustiges daraus');
INSERT INTO projekt VALUES (default, 'Filmproduktion von Kurzfilmen', 17);
INSERT INTO projekt VALUES (default, 'Kochen und Backen: Kulinarische Experimente',25);
INSERT INTO projekt VALUES (default, 'Theaterworkshop: Schauspiel und Improvisation',20);
INSERT INTO projekt VALUES (default, 'Diskutieren und Argumentieren',24);
INSERT INTO projekt VALUES (default, 'Gartenteich anlegen',28);
INSERT INTO projekt VALUES (default, 'Neue Sportarten kennenlernen',23);
INSERT INTO projekt VALUES (default, 'Gemeinsam musizieren',23);
INSERT INTO projekt VALUES (default, 'Abschlussfahrt der Klasse 1012',12);
INSERT INTO projekt VALUES (default, 'Abschlussfahrt der Klasse 1021',12);
-- weitere mögliche Projekte
--INSERT INTO projekt VALUES (default, 'Roboter Programmieren 2',15);
--INSERT INTO projekt VALUES (default, 'Gemeinsam musizieren 2',23);
--INSERT INTO projekt VALUES (default, 'Neue Sportarten kennenlernen 2',23);
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

INSERT INTO nimmt_teil VALUES (1,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (2,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (3,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (4,5,'teilnehmer');
INSERT INTO nimmt_teil VALUES (5,4,'assistent');
INSERT INTO nimmt_teil VALUES (6,6,'teilnehmer');
INSERT INTO nimmt_teil VALUES (7,6,'teilnehmer');
INSERT INTO nimmt_teil VALUES (8,4,'teilnehmer');
INSERT INTO nimmt_teil VALUES (9,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (10,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (11,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (12,3,'assistent');
INSERT INTO nimmt_teil VALUES (13,8,'teilnehmer');
INSERT INTO nimmt_teil VALUES (14,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (15,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (16,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (17,9,'teilnehmer');
INSERT INTO nimmt_teil VALUES (18,9,'teilnehmer');
INSERT INTO nimmt_teil VALUES (19,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (20,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (21,5,'teilnehmer');
INSERT INTO nimmt_teil VALUES (22,7,'assistent');
INSERT INTO nimmt_teil VALUES (23,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (24,8,'assistent');
INSERT INTO nimmt_teil VALUES (25,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (26,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (27,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (28,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (29,9,'assistent');
-- INSERT INTO nimmt_teil VALUES (30,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (31,6,'teilnehmer');
INSERT INTO nimmt_teil VALUES (32,2,'assistent');
INSERT INTO nimmt_teil VALUES (33,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (34,6,'teilnehmer');
INSERT INTO nimmt_teil VALUES (35,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (36,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (37,8,'teilnehmer');
INSERT INTO nimmt_teil VALUES (38,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (39,2,'assistent');
INSERT INTO nimmt_teil VALUES (40,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (41,4,'teilnehmer');
INSERT INTO nimmt_teil VALUES (42,8,'teilnehmer');
INSERT INTO nimmt_teil VALUES (43,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (44,9,'teilnehmer');
INSERT INTO nimmt_teil VALUES (45,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (46,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (47,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (48,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (49,6,'assistent');
-- INSERT INTO nimmt_teil VALUES (50,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (51,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (52,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (53,8,'teilnehmer');
INSERT INTO nimmt_teil VALUES (54,7,'assistent');
INSERT INTO nimmt_teil VALUES (55,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (56,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (57,5,'teilnehmer');
INSERT INTO nimmt_teil VALUES (58,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (59,9,'assistent');
INSERT INTO nimmt_teil VALUES (60,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (61,5,'teilnehmer');
INSERT INTO nimmt_teil VALUES (62,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (63,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (64,6,'teilnehmer');
INSERT INTO nimmt_teil VALUES (65,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (66,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (67,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (68,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (69,5,'assistent');
-- INSERT INTO nimmt_teil VALUES (70,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (71,9,'teilnehmer');
INSERT INTO nimmt_teil VALUES (72,4,'teilnehmer');
INSERT INTO nimmt_teil VALUES (73,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (74,6,'teilnehmer');
INSERT INTO nimmt_teil VALUES (75,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (76,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (77,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (78,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (79,1,'assistent');
INSERT INTO nimmt_teil VALUES (80,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (81,8,'teilnehmer');
INSERT INTO nimmt_teil VALUES (82,4,'teilnehmer');
INSERT INTO nimmt_teil VALUES (83,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (84,6,'teilnehmer');
INSERT INTO nimmt_teil VALUES (85,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (86,3,'teilnehmer');
-- INSERT INTO nimmt_teil VALUES (87,4,'teilnehmer');
INSERT INTO nimmt_teil VALUES (88,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (89,4,'assistent');
INSERT INTO nimmt_teil VALUES (90,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (91,5,'teilnehmer');
INSERT INTO nimmt_teil VALUES (92,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (93,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (94,6,'assistent');
INSERT INTO nimmt_teil VALUES (95,2,'teilnehmer');
-- INSERT INTO nimmt_teil VALUES (96,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (97,6,'teilnehmer');
INSERT INTO nimmt_teil VALUES (98,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (99,4,'teilnehmer');
INSERT INTO nimmt_teil VALUES (100,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (101,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (102,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (103,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (104,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (105,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (106,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (107,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (108,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (109,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (110,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (111,11,'teilnehmer');
INSERT INTO nimmt_teil VALUES (112,11,'teilnehmer');
INSERT INTO nimmt_teil VALUES (113,11,'teilnehmer');
INSERT INTO nimmt_teil VALUES (114,11,'assistent');
INSERT INTO nimmt_teil VALUES (115,11,'teilnehmer');
INSERT INTO nimmt_teil VALUES (116,11,'teilnehmer');
INSERT INTO nimmt_teil VALUES (117,11,'teilnehmer');
INSERT INTO nimmt_teil VALUES (118,11,'teilnehmer');
INSERT INTO nimmt_teil VALUES (119,11,'teilnehmer');
INSERT INTO nimmt_teil VALUES (120,11,'teilnehmer');
-- DIES ist ein Versuch, die Zuweiseung von schuelerInnen zu Projekten zu verweigern, falls die maximale Anzahl der Teilnehmenden überschitten ist
--WITH Teilnehmer_Anzahl AS (
--    SELECT pNummer, COUNT(*) AS Anzahl_Teilnehmer
--    FROM nimmt_teil
--   GROUP BY pNummer
--)
--INSERT INTO nimmt_teil (sID, pNummer, rolle)
--SELECT :sID, :pNummer, :rolle
--FROM Teilnehmer_Anzahl
--WHERE pNummer = :pNummer
--AND Anzahl_Teilnehmer < (SELECT pMaxTeilnehmer FROM projekt);





-- einige Angestellte werden als Projektleitungen Projekten zugewiesen nach dem Schema: angestellte(aKuerzel), pNummer
-- jedes Projekt muss mindestens eine Leitung haben
-- nicht jede(r) Angestellte muss eine Leitung übernehmen. Sie können auch Projekte "mitleiten" (siehe unten)
INSERT INTO leitet VALUES ('Schu',1);
INSERT INTO leitet VALUES ('Hof',2);
INSERT INTO leitet VALUES ('Schul',3);
INSERT INTO leitet VALUES ('Fis',4);
INSERT INTO leitet VALUES ('Isi',5);
INSERT INTO leitet VALUES ('Leh',6);
INSERT INTO leitet VALUES ('Koch',7);
INSERT INTO leitet VALUES ('Lim',8);
INSERT INTO leitet VALUES ('Merk',9);
INSERT INTO leitet VALUES ('Schud',10);
INSERT INTO leitet Values ('Broe',11);

-- einige Angestellte werden als Mitleitende Projektnummer zugewiesen nach dem Schema: angestellte(aKuerzel), pNummer

INSERT INTO leitet_mit VALUES ('Wagn',1);
INSERT INTO leitet_mit VALUES ('Schm',11);
INSERT INTO leitet_mit VALUES ('Schus',3);
INSERT INTO leitet_mit VALUES ('Hf',4);
INSERT INTO leitet_mit VALUES ('Mei',1);
INSERT INTO leitet_mit VALUES ('Mül',6);
INSERT INTO leitet_mit VALUES ('Hf',7);
INSERT INTO leitet_mit VALUES ('Bra',8);
INSERT INTO leitet_mit VALUES ('Brau',4);
INSERT INTO leitet_mit VALUES ('Wagros',7);
INSERT INTO leitet_mit VALUES ('Schud',8);
INSERT INTO leitet_mit VALUES ('Ri',10);
INSERT INTO leitet_mit VALUES ('Merk',11);
INSERT INTO leitet_mit VALUES ('Lehm',10);
INSERT INTO leitet_mit VALUES ('vP',2);

-- es werden verschieden Orte festgelegt
-- Das Schulgebäude hat 3 Stockwerke mit jeweils 12 Räumen, von denen nicht alle im System auftauchen (Materialräume. Lehrerzimmer)

INSERT INTO raum_oder_ort VALUES ('002',25,'25 PCs');
INSERT INTO raum_oder_ort VALUES ('003 Werkstatt',24);
INSERT INTO raum_oder_ort VALUES ('004',17);
INSERT INTO raum_oder_ort VALUES ('005');
INSERT INTO raum_oder_ort VALUES ('007');
INSERT INTO raum_oder_ort VALUES ('009');
INSERT INTO raum_oder_ort VALUES ('010');
INSERT INTO raum_oder_ort VALUES ('012');
INSERT INTO raum_oder_ort VALUES ('101',24);
INSERT INTO raum_oder_ort VALUES ('104',17);
INSERT INTO raum_oder_ort VALUES ('105');
INSERT INTO raum_oder_ort VALUES ('107');
INSERT INTO raum_oder_ort VALUES ('109');
INSERT INTO raum_oder_ort VALUES ('110');
INSERT INTO raum_oder_ort VALUES ('112');
INSERT INTO raum_oder_ort VALUES ('201',24);
INSERT INTO raum_oder_ort VALUES ('204',17);
INSERT INTO raum_oder_ort VALUES ('205');
INSERT INTO raum_oder_ort VALUES ('207');
INSERT INTO raum_oder_ort VALUES ('209');
INSERT INTO raum_oder_ort VALUES ('210');
INSERT INTO raum_oder_ort VALUES ('212');
INSERT INTO raum_oder_ort VALUES ('301');
INSERT INTO raum_oder_ort VALUES ('304');
INSERT INTO raum_oder_ort VALUES ('305');
INSERT INTO raum_oder_ort VALUES ('307');
INSERT INTO raum_oder_ort VALUES ('309');
INSERT INTO raum_oder_ort VALUES ('310');
INSERT INTO raum_oder_ort VALUES ('312');
INSERT INTO raum_oder_ort VALUES ('302 Schulkueche',20);
INSERT INTO raum_oder_ort VALUES ('313 Aula');
INSERT INTO raum_oder_ort VALUES ('Schulgarten');
INSERT INTO raum_oder_ort VALUES ('Sportplatz');
INSERT INTO raum_oder_ort VALUES ('Turnhalle');
INSERT INTO raum_oder_ort VALUES ('Schulhof');
--Orte außerhalb der Schule
INSERT INTO raum_oder_ort VALUES ('Tempelhofer Feld');
INSERT INTO raum_oder_ort VALUES ('Schwarzwald');
INSERT INTO raum_oder_ort VALUES ('Hamburg');

-- es wird nacheinander jeder pNummer ein Datum/Tag mit Start und Endzeit sowie einem Ort zugewiesen
-- unsere Projektwoche findet beispielhaft vom Montag 2024-06-23 bis (maximal) Sonntag 2024-06-29
-- Projekte auch an mehreren Orten stattfinden
-- Orte und Zeiten für die Projekte...
--'1 Roboter programmieren' 
INSERT INTO findet_statt VALUES (1,'2024-06-23','8:00:00','14:00:00','004');
INSERT INTO findet_statt VALUES (1,'2024-06-24','8:00:00','14:00:00','004');
INSERT INTO findet_statt VALUES (1,'2024-06-25','8:00:00','14:00:00','004');
INSERT INTO findet_statt VALUES (1,'2024-06-26','8:00:00','14:00:00','004');
INSERT INTO findet_statt VALUES (1,'2024-06-27','9:00:00','14:00:00','004');
--'2 Upcycling: Kreative Ideen für alte Dinge',12);
INSERT INTO findet_statt VALUES (2,'2024-06-23','8:00:00','14:00:00','104');
INSERT INTO findet_statt VALUES (2,'2024-06-24','8:00:00','13:00:00','104');
INSERT INTO findet_statt VALUES (2,'2024-06-25','8:00:00','13:00:00','104');
INSERT INTO findet_statt VALUES (2,'2024-06-26','8:00:00','13:00:00','104');
INSERT INTO findet_statt VALUES (2,'2024-06-27','8:00:00','14:00:00','104');
--'Filmproduktion von Kurzfilmen', 17);
INSERT INTO findet_statt VALUES (3,'2024-06-23','8:00:00','13:00:00','209');
INSERT INTO findet_statt VALUES (3,'2024-06-24','8:00:00','13:00:00','Schulgarten');
INSERT INTO findet_statt VALUES (3,'2024-06-25','8:00:00','13:00:00','Schulhof');
INSERT INTO findet_statt VALUES (3,'2024-06-26','8:00:00','13:00:00','209');
INSERT INTO findet_statt VALUES (3,'2024-06-27','8:00:00','14:00:00','209');
--'Kochen und Backen: Kulinarische Experimente',25)
INSERT INTO findet_statt VALUES (4,'2024-06-23','8:00:00','15:00:00','302 Schulkueche');
INSERT INTO findet_statt VALUES (4,'2024-06-24','8:00:00','15:00:00','302 Schulkueche');
INSERT INTO findet_statt VALUES (4,'2024-06-25','10:00:00','15:00:00','302 Schulkueche');
INSERT INTO findet_statt VALUES (4,'2024-06-26','9:00:00','15:00:00','302 Schulkueche');
INSERT INTO findet_statt VALUES (4,'2024-06-27','9:00:00','14:00:00','Schulhof');
-- Theaterworkshop: Schauspiel und Improvisation',20);
INSERT INTO findet_statt VALUES (5,'2024-06-23','8:00:00','13:00:00','313 Aula');
INSERT INTO findet_statt VALUES (5,'2024-06-24','8:00:00','13:00:00','313 Aula');
INSERT INTO findet_statt VALUES (5,'2024-06-25','8:00:00','13:00:00','313 Aula');
INSERT INTO findet_statt VALUES (5,'2024-06-26','8:00:00','13:00:00','313 Aula');
INSERT INTO findet_statt VALUES (5,'2024-06-27','8:00:00','14:00:00','313 Aula');
--'Diskutieren und Argumentieren',24);
INSERT INTO findet_statt VALUES (6,'2024-06-23','8:00:00','13:00:00','209');
INSERT INTO findet_statt VALUES (6,'2024-06-24','8:00:00','13:00:00','209');
INSERT INTO findet_statt VALUES (6,'2024-06-25','8:00:00','13:00:00','209');
INSERT INTO findet_statt VALUES (6,'2024-06-26','8:00:00','13:00:00','209');
INSERT INTO findet_statt VALUES (6,'2024-06-27','8:00:00','14:00:00','Schulhof');
-- Gartenteich anlegen',28);
INSERT INTO findet_statt VALUES (7,'2024-06-23','8:30:00','13:00:00','Schulgarten');
INSERT INTO findet_statt VALUES (7,'2024-06-24','8:30:00','13:00:00','Schulgarten');
INSERT INTO findet_statt VALUES (7,'2024-06-25','8:30:00','13:00:00','Schulgarten');
INSERT INTO findet_statt VALUES (7,'2024-06-26','8:30:00','16:00:00','Schulgarten');
INSERT INTO findet_statt VALUES (7,'2024-06-27','8:00:00','14:00:00','Schulgarten');
-- Neue Sportarten kennenlernen',23);
INSERT INTO findet_statt VALUES (8,'2024-06-23','8:00:00','13:00:00','Sportplatz');
INSERT INTO findet_statt VALUES (8,'2024-06-24','8:00:00','13:00:00','Sportplatz');
INSERT INTO findet_statt VALUES (8,'2024-06-25','8:00:00','16:00:00','Turnhalle');
INSERT INTO findet_statt VALUES (8,'2024-06-26','8:00:00','16:00:00','Tempelhofer Feld');
INSERT INTO findet_statt VALUES (8,'2024-06-27','9:00:00','14:00:00','Schulhof');
-- Gemeinsam musizieren',23);
INSERT INTO findet_statt VALUES (9,'2024-06-23','11:00:00','13:00:00','210');
INSERT INTO findet_statt VALUES (9,'2024-06-24','11:00:00','13:00:00','210');
INSERT INTO findet_statt VALUES (9,'2024-06-25','16:00:00','20:00:00','210');
INSERT INTO findet_statt VALUES (9,'2024-06-26','14:00:00','19:00:00','Schulhof');
INSERT INTO findet_statt VALUES (9,'2024-06-27','11:00:00','21:00:00','Schulhof');
--'Abschlussfahrt der Klasse 1011',18);
INSERT INTO findet_statt VALUES (10,'2024-06-23','8:00:00','13:00:00','Hamburg');
INSERT INTO findet_statt VALUES (10,'2024-06-24','8:00:00','13:00:00','Hamburg');
INSERT INTO findet_statt VALUES (10,'2024-06-25','8:00:00','13:00:00','Hamburg');
INSERT INTO findet_statt VALUES (10,'2024-06-26','8:00:00','13:00:00','Hamburg');
INSERT INTO findet_statt VALUES (10,'2024-06-27','8:00:00','14:00:00','Hamburg');
INSERT INTO findet_statt VALUES (10,'2024-06-28','8:00:00','14:00:00','Hamburg');
--'Abschlussfahrt der Klasse 1021',23);
INSERT INTO findet_statt VALUES (11,'2024-06-23','8:00:00','13:00:00','Schwarzwald');
INSERT INTO findet_statt VALUES (11,'2024-06-24','8:00:00','13:00:00','Schwarzwald');
INSERT INTO findet_statt VALUES (11,'2024-06-25','8:00:00','13:00:00','Schwarzwald');
INSERT INTO findet_statt VALUES (11,'2024-06-26','8:00:00','13:00:00','Schwarzwald');
INSERT INTO findet_statt VALUES (11,'2024-06-27','8:00:00','14:00:00','Schwarzwald');
INSERT INTO findet_statt VALUES (11,'2024-06-28','8:00:00','14:00:00','Schwarzwald');













