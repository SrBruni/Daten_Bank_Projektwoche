-- Miniwelt Projektwoche
-- Authoren Bruni, Zumpe
-- Datum: 06.05.24

CREATE TABLE angestellte (
	kuerzel VARCHAR(4) PRIMARY KEY,
	a_vorname VARCHAR 
		NOT NULL,
	a_nachname VARCHAR 
		NOT NULL
);

CREATE TABLE schuelerInnen(
	sus_id INTEGER PRIMARY KEY,
	sus_vorname VARCHAR
		NOT NULL,
	sus_nachname VARCHAR
		NOT NULL,
	Jahrgangsstufe 	INTEGER
		NOT NULL,
	profilnummer 	INTEGER
		NOT NULL,
	Klassennumer  	INTEGER
		NOT NULL 
);

CREATE TABLE projekt(
	pnummer INTEGER PRIMARY KEY UNIQUE, 
	ptitel	VARCHAR UNIQUE,
	pleitung VARCHAR (4) not null references angestellte(kuerzel),
	passitent integer references schuelerInnen(sus_id)
	
	--CONSTRAINT projektnummer UNIQUE (pnummer)
);

CREATE TABLE findet_statt(
	von_tageszeit TIME, 
	bis_tageszeit TIME, 
	wochentag VARCHAR,
	check (wochentag in ('montag', 'dienstag', 'mittwoch', 'donnerstag', 'freitag')),
	raum_oder_ort VARCHAR
);

CREATE TABLE nimmt_teil(
	pnummer 		integer references projekt(pnummer),
	sus_id			integer references schuelerInnen
);


