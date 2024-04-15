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
	sid SERIAL,
	vorname VARCHAR(50),
	nachname VARCHAR(50),
	Klasse INTEGER,
	Klassennumer VARCHAR(5)
) ;
