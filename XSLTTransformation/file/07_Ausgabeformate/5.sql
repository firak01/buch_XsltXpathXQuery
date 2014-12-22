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
   
 -- Dateihandle
 Handle UTL_FILE.FILE_TYPE; 
 Text VARCHAR2(32767);
BEGIN

 Handle := UTL_FILE.FOPEN('c:\OraText', 'meldungen.txt', 'W'); 
 
 FOR v_UDaten IN c_UNternehmen(b_UPLZ => 44000) LOOP
  
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

END Block1;