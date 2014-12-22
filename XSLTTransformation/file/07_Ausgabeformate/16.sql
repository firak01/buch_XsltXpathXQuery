DECLARE
 -- Schalter
 v_SQLTyp VARCHAR2(1) := 't'; -- Dozent
 
 -- SQL-Variablen
 b_Nr NUMBER(4) := 15;
 
 TYPE SQL_t IS VARRAY(2) OF VARCHAR2(500);
 
 v_SQLCols SQL_t := SQL_t('SELECT D_Anrede, D_Vorname, D_Nachname
                        FROM dozent ',
                     'SELECT TN_Anrede, TN_Vorname, TN_Nachname
                        FROM teilnehmer '   );
 v_SQLWhere SQL_t := SQL_t('WHERE D_Nr = ' || b_Nr,
                      'WHERE TN_Nr = ' || b_Nr); 
                      
 -- Datensatztyp
 TYPE ds_Person IS RECORD (
  Anrede VARCHAR2(40),
  Vorname VARCHAR2(40),
  Nachname VARCHAR2(40)
 ); 
 v_Person ds_Person;                      
BEGIN
 CASE v_SQLTyp
  WHEN 'd'
   THEN EXECUTE IMMEDIATE v_SQLCols(1) || v_SQLWhere(1) INTO v_Person;
  WHEN 't'
   THEN EXECUTE IMMEDIATE v_SQLCols(2) || v_SQLWhere(2) INTO v_Person;
  ELSE
   DBMS_OUTPUT.PUT_LINE('Tab nicht implementiert.');
  END CASE;
  
  IF v_Person.VOrname IS NOT NULL
   THEN DBMS_OUTPUT.PUT_LINE(v_Person.Vorname || ' ' || v_Person.Nachname);
  END IF;
END;