-- Miniwelt Projektwoche
-- Authoren Bruni, Zumpe
-- Funktion: erzeugt die Tabellen für die Datenbank Projektwoche
-- Stand: 27.05.24

CREATE TABLE angestellte (
	aKuerzel		VARCHAR		PRIMARY KEY 	NOT NULL,
	aVorname 		VARCHAR		NOT NULL,
	aNachname 		VARCHAR		NOT NULL
);
COMMENT ON Table angestellte IS 'ProjektwochenDB';

CREATE TABLE schuelerInnen(
	sID 			SERIAL 		PRIMARY KEY,
	sVorname 		VARCHAR,
	sNachname 		VARCHAR,
	sJahrgangsstufe INTEGER,
	sProfilnummer 	INTEGER,
	sKlassennumer  	INTEGER 
);
COMMENT ON Table schuelerInnen IS 'ProjektwochenDB';

CREATE TABLE projekt(
	pNummer 		serial 		PRIMARY KEY,
	pTitel			VARCHAR		unique,
	pMaxTeilnehmer	integer		NOT NULL
);
COMMENT ON Table projekt IS 'ProjektwochenDB';

CREATE TABLE nimmt_teil (	
	sID				INTEGER 		REFERENCES schuelerInnen,
	pNummer			INTEGER		 	REFERENCES projekt,
	rolle			varchar			CHECK (rolle in ('assistent','teilnehmer'))
);

CREATE TABLE leitet(
	Leitung 		VARCHAR			REFERENCES angestellte(aKuerzel)	not null,
	pNummer			INTEGER			REFERENCES projekt					not null
);


CREATE TABLE leitet_mit (
	leitung2 		VARCHAR			REFERENCES angestellte(aKuerzel)	not null,
	pNummer			INTEGER 		REFERENCES projekt					not null
);

CREATE TABLE raum_oder_ort (
	oBezeichnung		VARCHAR 	primary key 						UNIQUE,
	oMaxPlaetze			INTEGER,
	oAusstattung		VARCHAR
);

CREATE TABLE findet_statt(
	pNummer			serial		REFERENCES projekt					not null,
	datum			DATE,
	von_tageszeit 	TIME, 
	bis_tageszeit 	TIME, 
	ort 			VARCHAR	 		REFERENCES raum_oder_ort(oBezeichnung)
);

-- 
