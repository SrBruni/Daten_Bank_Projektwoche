-- Miniwelt Projektwoche
-- Authoren Bruni, Zumpe
-- Funktion: erzeugt die Tabellen für die Datenbank Projektwoche
-- Stand: 11.06.24
-- COMMENT ON Table angestellte IS 'ProjektwochenDB';

CREATE TABLE angestellte (aKuerzel VARCHAR PRIMARY KEY NOT NULL, aVorname VARCHAR NOT NULL, aNachname VARCHAR NOT NULL );

CREATE TABLE schuelerInnen (sID INTEGER PRIMARY KEY, sVorname VARCHAR NOT NULL, sNachname VARCHAR NOT NULL, sJahrgangsstufe INTEGER CHECK (sJahrgangsstufe BETWEEN 7 AND 10), sProfilnummer INTEGER CHECK (sProfilnummer BETWEEN 1 AND 3), sKlassennummer INTEGER CHECK (sKlassennummer BETWEEN 0 AND 3) );

CREATE TABLE projekt (pNummer INTEGER PRIMARY KEY, pTitel VARCHAR unique, pMaxPers INTEGER CHECK (pMaxPers BETWEEN 5 AND 70) not null, pBeschreibung VARCHAR(1000) );

CREATE TABLE nimmt_teil (sID INTEGER REFERENCES schuelerInnen(sID), pNummer INTEGER REFERENCES projekt(pNummer), rolle varchar CHECK (rolle in ('assistent','teilnehmer')), PRIMARY KEY (sID, pNummer) );

CREATE TABLE leitet (Leitung VARCHAR REFERENCES angestellte(aKuerzel) not null, pNummer INTEGER REFERENCES projekt(pNummer) not null, PRIMARY KEY (Leitung, pNummer) );

CREATE TABLE leitet_mit (Mitleitungen VARCHAR REFERENCES angestellte(aKuerzel) not null, pNummer INTEGER REFERENCES projekt(pNummer) not null, PRIMARY KEY (Mitleitungen, pNummer) );

CREATE TABLE raum_oder_ort (oBezeichnung VARCHAR primary key, oMaxPlaetze INTEGER, oAusstattung VARCHAR );

CREATE TABLE findet_statt ( pNummer INTEGER REFERENCES projekt not null, datum DATETIME, von_tageszeit TIME DEFAULT '09:00:00', bis_tageszeit TIME DEFAULT '15:00:00', ort VARCHAR REFERENCES raum_oder_ort(oBezeichnung) not null, PRIMARY KEY (pNummer,datum) );

