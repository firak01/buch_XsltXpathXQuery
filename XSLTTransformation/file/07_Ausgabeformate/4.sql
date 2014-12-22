SET SERVEROUTPUT ON;
<<Block1>>
DECLARE
 -- Cursor
 CURSOR c_Unternehmen 
  (b_UStadt unternehmen.U_Stadt%TYPE := 'Dortmund',
   b_UPLZ   unternehmen.U_PLZ%TYPE)
 IS
  SELECT *
   FROM unternehmen
  WHERE U_Stadt = b_UStadt
    AND U_PLZ >= b_UPLZ;
   
 -- Datensatz
 v_UDaten unternehmen%ROWTYPE;
 -- Dateihandle
 Handle UTL_FILE.FILE_TYPE; 
 Text VARCHAR2(32767);
BEGIN
 -- ÷ffnen
 OPEN c_Unternehmen(b_UPLZ => 44000);
 Handle := UTL_FILE.FOPEN('c:\OraText', 'meldungen.txt', 'W'); 
 
 LOOP 
  EXIT WHEN c_Unternehmen%NOTFOUND;
  FETCH c_Unternehmen INTO v_UDaten;
  
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