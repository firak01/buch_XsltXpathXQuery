SET SERVEROUTPUT ON;
<<Block1>>
DECLARE
 -- Datensatz
 v_UDaten unternehmen%ROWTYPE;
 -- Dateihandle
 Handle UTL_FILE.FILE_TYPE; 
 Text VARCHAR2(32767);
 
 -- Cursorvariablentyp
 TYPE cv_Unternehmen IS REF CURSOR;
 -- Cursorvariable
 c_Unternehmen cv_Unternehmen;
 -- SQL
 v_SQL VARCHAR2(2000) := 'SELECT * FROM unternehmen ';
 v_Bedingung VARCHAR2(200) := 'WHERE U_Stadt = ''Gelsenkirchen''';      
BEGIN
 -- ÷ffnen
 OPEN c_Unternehmen
  FOR v_SQL || v_Bedingung;
 Handle := UTL_FILE.FOPEN('c:\OraText', 'meldungen.txt', 'W'); 
 
 LOOP 
  
  FETCH c_Unternehmen INTO v_UDaten;
  EXIT WHEN c_Unternehmen%NOTFOUND;
  -- Fallunterscheidung STADTNAME
  
  CASE
   WHEN v_UDaten.U_Stadt IN ('Dortmund', 'Bochum')
    THEN v_UDaten.U_Stadt := v_UDaten.U_Stadt || ' (Ost)';
  ELSE
   v_UDaten.U_Stadt := v_UDaten.U_Stadt || ' (West)';
  END CASE;
  
  Text := c_Unternehmen%ROWCOUNT || '.) ' || v_UDaten.U_name || ' ' || v_UDaten.U_Branche || ' in ' || v_UDaten.U_Stadt;
 
   -- Schreiben
   UTL_FILE.PUT_LINE(Handle, Text);
 END LOOP;
   

  -- Schlieﬂen
  UTL_FILE.FCLOSE(Handle);  
  CLOSE c_Unternehmen;
END Block1;