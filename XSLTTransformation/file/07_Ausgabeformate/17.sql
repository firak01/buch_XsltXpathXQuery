DECLARE

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
 RETURN VARCHAR2
 IS
  -- SQL-Variablen
 v_SQLCols VARCHAR2(200) := 'SELECT * FROM unternehmen ';
 v_SQLW2   VARCHAR2(200) := 'WHERE U_Name = ''' || b_UName || '''';
 text VARCHAR2(500);
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
    text := text || v_UDaten_T(i).U_Strasse || ' ';
   END LOOP;
   RETURN text;
 END LiefereUnternehmen;
  
BEGIN
 DBMS_OUTPUT.PUT_LINE(LIefereUnternehmen(15));
 DBMS_OUTPUT.PUT_LINE(LIefereUnternehmen('Privatbank Essen'));
END;