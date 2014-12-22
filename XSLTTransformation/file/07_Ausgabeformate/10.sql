
DECLARE
 -- Datensatztypen --
 TYPE ds_Erfolg IS RECORD (
  Umsatz NUMBER(6),
  TNZahl NUMBER(4)
 );

 TYPE t1 IS TABLE OF ds_Erfolg
  INDEX BY BINARY_INTEGER; 
 TYPE t2 IS TABLE OF t1
  INDEX BY BINARY_INTEGER;
  
-- Datensätze --
v_Erfolg t2;  

-- Collections --
TYPE Zahlen IS TABLE OF NUMBER(20)
 INDEX BY BINARY_INTEGER;
TYPE Texte IS TABLE OF VARCHAR2(30)
 INDEX BY BINARY_INTEGER;

v_Jahre    Zahlen;
v_Bereiche Texte;
-- Komplette Daten
Cursor c_Erfolg IS
SELECT EXTRACT(YEAR FROM B_Datum) AS Jahr,
       K_Bereich AS Bereich,
       COUNT(B_Nr) AS TNZahl,
       SUM(B_Preis) AS Umsatz
  FROM buchung NATURAL JOIN termin
               NATURAL JOIN kurs
 GROUP BY EXTRACT(YEAR FROM B_Datum), K_Bereich
 ORDER BY EXTRACT(YEAR FROM B_Datum), K_Bereich;

CURSOR c_Jahre IS
 SELECT DISTINCT EXTRACT(YEAR FROM B_Datum) AS Jahr
   FROM buchung
  ORDER BY 1;
   
CURSOR c_Bereiche IS
 SELECT DISTINCT K_Bereich AS Bereich
   FROM kurs
  ORDER BY 1;
BEGIN
 -- Datenbeschaffung
 FOR v_JDaten IN c_Jahre LOOP
  v_Jahre(c_Jahre%ROWCOUNT) := v_JDaten.Jahr;
 END LOOP;
 FOR v_BDaten IN c_Bereiche LOOP
  v_Bereiche(c_Bereiche%ROWCOUNT) := v_BDaten.Bereich;
 END LOOP;
 FOR Jahr IN v_Jahre.FIRST..v_Jahre.LAST LOOP
  FOR Bereich IN v_Bereiche.FIRST..v_Bereiche.LAST LOOP
   v_Erfolg(Jahr)(Bereich).Umsatz := 0;
   v_Erfolg(Jahr)(Bereich).TNZahl := 0;
  END LOOP;
 END LOOP;
 
 FOR Jahr IN v_Jahre.FIRST..v_Jahre.LAST LOOP
  FOR Bereich IN v_Bereiche.FIRST..v_Bereiche.LAST LOOP
   FOR v_EDaten IN c_Erfolg LOOP
    IF v_Jahre(Jahr) = v_EDaten.Jahr
       AND v_Bereiche(Bereich) = v_EDaten.Bereich
    THEN 
      v_Erfolg(Jahr)(Bereich).Umsatz := v_EDaten.Umsatz;
      v_Erfolg(Jahr)(Bereich).TNZahl := v_EDaten.TNZahl;
    END IF;
   END LOOP;
   DBMS_OUTPUT.PUT_LINE(Jahr || '|' || Bereich || ' ' || v_Erfolg(Jahr)(Bereich).Umsatz || ' ' || v_Erfolg(Jahr)(Bereich).TNZahl);
  END LOOP;
 END LOOP; 
 
 
END;