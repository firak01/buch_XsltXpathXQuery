DECLARE
 -- BIndevariablen
 b_UNr unternehmen.U_Nr%TYPE := 72;
 b_UName unternehmen.U_Name%TYPE; -- := 'Privatbank Essen';
 
 -- SQL-Variablen
 v_SQLCols VARCHAR2(200) := 'SELECT * FROM unternehmen ';
 v_SQLW1   VARCHAR2(200) := 'WHERE U_Nr = ' || b_UNr;
 v_SQLW2   VARCHAR2(200) := 'WHERE U_Name = ''' || b_UName || '''';
 
 -- Cursorvariable
 TYPE unternehmen_ref IS REF CURSOR;
 cv_unternehmen unternehmen_ref;
 
 -- Datensatz
 v_UDaten unternehmen%ROWTYPE;
 
 -- Collection
 TYPE t_Unternehmen IS TABLE OF v_UDaten%TYPE
  INDEX BY BINARY_INTEGER;
 v_UDaten_t t_Unternehmen;
 
BEGIN
 -- 1. Fall: b_UNr
 IF b_UNr IS NOT NULL AND b_UName IS NULL
  THEN EXECUTE IMMEDIATE v_SQLCols || v_SQLW1 INTO v_UDaten;
  DBMS_OUTPUT.PUT_LINE(v_UDaten.U_Strasse);
 -- 2. Fall: b_Uname
 ELSIF b_Uname IS NOT NULL AND b_UNr IS NULL
  THEN
   OPEN cv_unternehmen FOR v_SQLCOls || v_SQLW2;
   FETCH cv_unternehmen BULK COLLECT INTO v_UDaten_t;
   CLOSE cv_unternehmen;
   FOR i IN v_UDaten_t.FIRST..v_UDaten_t.LAST LOOP
    DBMS_OUTPUT.PUT_LINE(v_UDaten_T(i).U_Strasse);
   END LOOP;
 -- 3. Fall: Fehler
 ELSE
  DBMS_OUTPUT.PUT_LINE('Nur einen Parameter mit Wert angeben.');
 END IF;
END;