-- Miniwelt Projektwoche
-- Authoren Bruni, Zumpe

-- Datum: 15.04.24

CREATE TABLE angestellte (
	Kuerzel VARCHAR(4) PRIMARY KEY 
		NOT NULL,
	Vorname VARCHAR (50)
		NOT NULL,
	Nachname VARCHAR (50)
		NOT NULL
);

CREATE TABLE schuelerInnen(
	sid SERIAL PRIMARY KEY,
	vorname VARCHAR(50),
	nachname VARCHAR(50),
	Jahrgangsstufe INTEGER,
	profilnummer INTEGER,
	Klassennumer  INTEGER 
);

CREATE TABLE projekt(
	pnummer integer PRIMARY KEY,
	ptitel	VARCHAR(100),
	pleitung VARCHAR (4) not null references angestellte(kuerzel),
	passitent serial references schuelerInnen(sid)
);

CREATE TABLE findet_statt(
	von_tageszeit TIME, 
	bis_tageszeit TIME, 
	wochentag VARCHAR(10),
	check (wochentag in ('montag', 'dienstag', 'mittwoch', 'donnerstag', 'freitag')),
	raum_oder_ort VARCHAR(50)
);


