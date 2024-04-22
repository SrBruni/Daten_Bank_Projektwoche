-- Miniwelt Projektwoche
-- Authoren Bruni, Zumpe
-- Datum: 15.04.24

CREATE TABLE angestellte (
	kuerzel VARCHAR(4) PRIMARY KEY 
		NOT NULL,
	a_vorname VARCHAR (50)
		NOT NULL,
	a_nachname VARCHAR (50)
		NOT NULL
);

CREATE TABLE schuelerInnen(
	sus_id INTEGER PRIMARY KEY,
	sus_vorname 	VARCHAR,
	sus_nachname 	VARCHAR,
	Jahrgangsstufe 	INTEGER,
	profilnummer 	INTEGER,
	Klassennumer  	INTEGER 
);

CREATE TABLE projekt(
	pnummer INTEGER PRIMARY KEY,
	ptitel	VARCHAR(100),
	pleitung VARCHAR (4) not null references angestellte(kuerzel),
	passitent integer references schuelerInnen(sus_id)
);

CREATE TABLE findet_statt(
	von_tageszeit TIME, 
	bis_tageszeit TIME, 
	wochentag VARCHAR(10),
	check (wochentag in ('montag', 'dienstag', 'mittwoch', 'donnerstag', 'freitag')),
	raum_oder_ort VARCHAR(50)
);

CREATE TABLE nimmt_teil(
	pnummer 		INTEGER	REFERENCES projekt, 
	sus_vorname 	VARCHAR REFERENCES schuelerInnen,
	sus_nachname 	VARCHAR REFERENCES schuelerInnen,
	idnummer 		INTEGER REFERENCES schuelerInnen
);




