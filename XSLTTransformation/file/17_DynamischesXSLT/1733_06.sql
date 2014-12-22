/* Erweiterte Struktur */

-- Tabelle XMLDATEN
DROP TABLE "SCOTT"."XMLDATEN";
CREATE TABLE "SCOTT"."XMLDATEN" (
  "XD_NR" NUMBER(10) NOT NULL, 
  "XD_TEXT" "SYS"."XMLTYPE" NOT NULL, 
  CONSTRAINT "XD_Schluessel" PRIMARY KEY("XD_NR")); 

-- Tabelle XMLDATEN
DROP TABLE "SCOTT"."XMLDATEN_ZU_BERICHT";
CREATE TABLE "SCOTT"."XMLDATEN_ZU_BERICHT" (
  "XZB_NR" NUMBER(10) NOT NULL, 
  "XD_NR" NUMBER(10) NOT NULL,
  "B_NR" NUMBER(10) NOT NULL,
  CONSTRAINT "XZB_Schluessel" PRIMARY KEY("XZB_NR"));

/* Datenerfassung */
INSERT INTO "SCOTT"."XMLDATEN"
 VALUES (1,
         XMLType('<Kundenliste>
  <Kunde Nr="235" Anrede="Frau" Beginn="04.10.03">
    <Name>
      <Rufname>Verena</Rufname>
      <Zuname>Fiegert</Zuname>
    </Name>
    <Adresse>
      <Strasse>Universitätsstr. 40</Strasse>
      <PLZ>47051</PLZ>
      <Stadt>Duisburg</Stadt>
    </Adresse>
  </Kunde>
  <Kunde Nr="237" Anrede="Frau" Beginn="16.10.03">
    <Name>
      <Rufname>Christa</Rufname>
      <Zuname>Mengel</Zuname>
    </Name>
    <Adresse>
      <Strasse>Lindemannstr. 79</Strasse>
      <PLZ>44137</PLZ>
      <Stadt>Dortmund</Stadt>
    </Adresse>
  </Kunde>
  <Kunde Nr="238" Anrede="Herr" Beginn="08.10.03">
    <Name>
      <Rufname>Claus-Peter</Rufname>
      <Zuname>Dreske</Zuname>
    </Name>
    <Adresse>
      <Strasse>Kämpchenstr. 28A</Strasse>
      <PLZ>44149</PLZ>
      <Stadt>Dortmund</Stadt>
    </Adresse>
  </Kunde>
  <Kunde Nr="239" Anrede="Herr" Beginn="19.10.03">
    <Name>
      <Rufname>Volker</Rufname>
      <Zuname>Filskowski</Zuname>
    </Name>
    <Adresse>
      <Strasse>Hans-Luther-Allee 23</Strasse>
      <PLZ>45131</PLZ>
      <Stadt>Essen, Ruhr</Stadt>
    </Adresse>
  </Kunde>
</Kundenliste>'));

INSERT INTO "SCOTT"."XMLDATEN_ZU_BERICHT"
 VALUES (1, 1, 1);