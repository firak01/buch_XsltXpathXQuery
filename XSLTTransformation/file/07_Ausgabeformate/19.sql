CREATE OR REPLACE PACKAGE pck_Unternehmen AS
 -- Datentypen
 TYPE texte IS TABLE OF VARCHAR2(200)
  INDEX BY BINARY_INTEGER;
   
 -- Funktionen
 FUNCTION LiefereUnternehmen(b_UNr IN NUMBER)
 RETURN VARCHAR2;
 FUNCTION LiefereUnternehmen(b_UName IN VARCHAR2)
 RETURN texte;
 
 -- Prozeduren
 PROCEDURE CollAusgabe (
  coll IN texte );
END pck_Unternehmen;