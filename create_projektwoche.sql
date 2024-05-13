-- Miniwelt Projektwoche
-- Authoren Bruni, Zumpe
-- Datum/Stand: 13.05.24

CREATE TABLE angestellte (
	akuerzel 		VARCHAR(4) PRIMARY KEY NOT NULL,
	aVorname 		VARCHAR NOT NULL,
	aNachname 		VARCHAR NOT NULL
);

Comment on table angestellte IS 'ProjektwochenDB';


CREATE TABLE schuelerInnen(
	
	sID 			SERIAL PRIMARY KEY,
	sVorname 		VARCHAR NOT NULL,
	sNachname 		VARCHAR NOT NULL,
	sJahrgangsstufe 	INTEGER NOT NULL,
	sProfilnummer 		INTEGER NOT NULL,
	sKlassennumer  		INTEGER NOT NULL 
);

Comment on table schuelerInnen IS 'ProjektwochenDB';


CREATE TABLE projekt(
	pNummer 		SERIAL 	PRIMARY KEY, 
	ptitel			VARCHAR UNIQUE,
	pMaxTeilnehmer  	INTEGER NOT NULL
);

Comment on table projekt IS 'ProjektwochenDB';


CREATE TABLE nimmt_teil(
	sID			INTEGER REFERENCES schuelerInnen, 
	pNummer 		INTEGER REFERENCES projekt(pnummer),
	rolle			VARCHAR,
	CHECK  (rolle in ('assistent', 'teilnehmer'))
);
--trigger einbauen ???
Comment on table nimmt_teil IS 'ProjektwochenDB';


CREATE TABLE leitet (
	leitung 		VARCHAR(4) REFERENCES angestellte(akuerzel),
	pNummer 		INTEGER REFERENCES projekt	
);

Comment on table leitet IS 'ProjektwochenDB';


CREATE TABLE leitet_mit(
	leitung2		VARCHAR REFERENCES angestellte(akuerzel) not null, 
	pNummer 		INTEGER REFERENCES projekt				 not null	
);


Comment on table leitet_mit IS 'ProjektwochenDB';

CREATE TABLE raum_oder_ort(
	bezeichnung		VARCHAR PRIMARY KEY UNIQUE
);

Comment on table raum_oder_ort IS 'ProjektwochenDB';


CREATE TABLE findet_statt(
	von_tageszeit 		TIME, 
	bis_tageszeit 		TIME, 
	wochentag 		VARCHAR check (wochentag in ('montag', 'dienstag', 'mittwoch', 'donnerstag', 'freitag')),
	ort 			VARCHAR REFERENCES raum_oder_ort(bezeichnung)
);

Comment on table findet_statt IS 'ProjektwochenDB';






