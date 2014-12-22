DECLARE
 TYPE texte IS TABLE OF VARCHAR2(200)
  INDEX BY BINARY_INTEGER;
 v_Adressen texte;
  
 FUNCTION LiefereUnternehmen(b_UNr IN NUMBER)
 RETURN VARCHAR2
 IS
  -- SQL-Variablen
 v_SQLCols VARCHAR2(200) := 'SELECT * FROM unternehmen ';
 v_SQLW1   VARCHAR2(200) := 'WHERE U_Nr = ' || b_UNr;
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

  EXECUTE IMMEDIATE v_SQLCols || v_SQLW1 INTO v_UDaten;
  RETURN v_UDaten.U_Strasse;

 END LiefereUnternehmen;
 
 FUNCTION LiefereUnternehmen(b_UName IN VARCHAR2)
 RETURN texte
 IS
  -- SQL-Variablen
 v_SQLCols VARCHAR2(200) := 'SELECT * FROM unternehmen ';
 v_SQLW2   VARCHAR2(200) := 'WHERE U_Name = ''' || b_UName || '''';
 v_Adressen texte;
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
   OPEN cv_unternehmen FOR v_SQLCOls || v_SQLW2;
   FETCH cv_unternehmen BULK COLLECT INTO v_UDaten_t;
   CLOSE cv_unternehmen;
   FOR i IN v_UDaten_t.FIRST..v_UDaten_t.LAST LOOP
    v_Adressen(i) := v_UDaten_T(i).U_Strasse || ' ' || v_UDaten_T(i).U_Hausnr;
   END LOOP;
   RETURN v_Adressen;
 END LiefereUnternehmen;
 
 PROCEDURE CollAusgabe (
  coll IN texte )
 IS
 BEGIN
   FOR i IN coll.FIRST..coll.LAST LOOP
    DBMS_OUTPUT.PUT_LINE(coll(i));
   END LOOP;
 END CollAusgabe;
 
BEGIN
 DBMS_OUTPUT.PUT_LINE(LIefereUnternehmen(15));
 v_Adressen := LIefereUnternehmen('Privatbank Essen');
 CollAusgabe(v_Adressen);
 CollAusgabe(LIefereUnternehmen('Privatbank Essen'));
END;