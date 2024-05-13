-- Miniwelt Projektwoche
-- Authoren Bruni, Zumpe
-- Datum: 15.04.24
-- Funktion: Füllt die Tabellen der Datenbank Projektwoche mit DAten aus verschiedenen csv-Daeien
-- ACHTUNG: die csv Dateien müssen in dem Verzeichnis liegen von dem aus PSQL gestartet wurde
-- CSV HAEDER bedeutet, dass die erste Zeile der CDV Datei ignoriert wird

--  einfuegen von 39 Angestellte aus der angestellte aus der csv Datei
\COPY angestellte				FROM 'angestellte.csv'		DELIMITER ',' CSV HEADER;
-- einfuegen von 130 Schulerinnenaus der csv Datei
\COPY schuelerInnen 			FROM 'schuelerInnen.csv' 	DELIMITER ',' CSV HEADER;
-- pNummer, pTitel, pMaxTeilnehmer (12 Projekte)
INSERT INTO projekt VALUES (default, 'Roboter programmieren',15); 
INSERT INTO projekt VALUES (default, 'Malen und Zeichnen',12);
INSERT INTO projekt VALUES (default, 'Programmierung einer eigenen Website', 17);
INSERT INTO projekt VALUES (default, 'Kochen und Backen: Kulinarische Experimenten',25);
INSERT INTO projekt VALUES (default, 'Theaterworkshop: Schauspiel und Improvisation',20);
INSERT INTO projekt VALUES (default, 'Raketenbau: Abenteuer im Weltall',24);
INSERT INTO projekt VALUES (default, 'DIY: Handwerken und Basteln',28);
INSERT INTO projekt VALUES (default, 'Roboterfußballturnier',23);
INSERT INTO projekt VALUES (default, 'Chorprojekt: Gemeinsam Singen',23);
INSERT INTO projekt VALUES (default, 'Filmproduktion: Kurzfilme drehen',18);
INSERT INTO projekt VALUES (default, 'Gartenprojekt: Pflanzen und Pflegen',23);
INSERT INTO projekt VALUES (default, 'Diskutieren und Argumentieren',23);
--INSERT INTO projekt VALUES (default, 'Brettspielentwicklung: Spiele erfinden',25);
--INSERT INTO projekt VALUES (default, 'Upcycling: Kreative Ideen für alte Dinge',23);
--INSERT INTO projekt VALUES (default, 'Fotografieworkshop: Die Welt durch die Linse sehen',25);
--INSERT INTO projekt VALUES (default, 'Tanzkurs: Bewegung und Rhythmus',18);
--INSERT INTO projekt VALUES (default, 'Experimente in der Chemie: Spaß am Forschen',19);
--INSERT INTO projekt VALUES (default, 'Computeranimation: Digitale Welten erschaffen',12);
--INSERT INTO projekt VALUES (default, 'Instrumentalensemble: Musik machen im Team',19);
--INSERT INTO projekt VALUES (default, 'Filmproduktion: Kurzfilme drehen',20);
--INSERT INTO projekt VALUES (default, 'Escape Room selber bauen',22);
--INSERT INTO projekt VALUES (default, 'Keramikwerkstatt: Töpfern und Gestalten',23);
-- sID, pNummer, rolle
INSERT INTO nimmt_teil VALUES (1,1,'assistent');
INSERT INTO nimmt_teil VALUES (2,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (3,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (4,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (5,1,'assistent');
INSERT INTO nimmt_teil VALUES (6,6,'assistent');
INSERT INTO nimmt_teil VALUES (7,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (8,1,'assistent');
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
INSERT INTO nimmt_teil VALUES (72,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (73,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (74,6,'assistent');
INSERT INTO nimmt_teil VALUES (75,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (76,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (77,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (78,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (79,1,'assistent');
INSERT INTO nimmt_teil VALUES (80,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (81,11,'teilnehmer');
INSERT INTO nimmt_teil VALUES (82,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (83,1,'teilnehmer');
INSERT INTO nimmt_teil VALUES (84,6,'assistent');
INSERT INTO nimmt_teil VALUES (85,2,'teilnehmer');
INSERT INTO nimmt_teil VALUES (86,3,'teilnehmer');
INSERT INTO nimmt_teil VALUES (87,10,'teilnehmer');
INSERT INTO nimmt_teil VALUES (88,7,'teilnehmer');
INSERT INTO nimmt_teil VALUES (89,1,'assistent');





-- angestellte(aKuerzel), pNummer
INSERT INTO leitet VALUES ('Schu',1);
INSERT INTO leitet VALUES ('Hof',2);
INSERT INTO leitet VALUES ('Schul',3);
INSERT INTO leitet VALUES ('Fis',4);
INSERT INTO leitet VALUES ('Wol',5);
INSERT INTO leitet VALUES ('Leh',1);
INSERT INTO leitet VALUES ('Hof',2);
INSERT INTO leitet VALUES ('Lim',3);
INSERT INTO leitet VALUES ('Hoff',4);
INSERT INTO leitet VALUES ('Sch',5);

INSERT INTO leitet_mit VALUES ('Ber',2);
INSERT INTO leitet_mit VALUES ('Schm',2);
INSERT INTO leitet_mit VALUES ('Schus',2);
INSERT INTO leitet_mit VALUES ('Hf',2);
INSERT INTO leitet_mit VALUES ('Mei',2);
INSERT INTO leitet_mit VALUES ('Mül',2);


