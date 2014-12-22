SET SERVEROUTPUT ON;
<<Block1>>
DECLARE
 -- Wertaufnahme
 v_UName    unternehmen.U_Name%TYPE;
 v_UBranche unternehmen.U_Branche%TYPE;
 v_UStadt   unternehmen.U_Stadt%TYPE;
 -- Bindevariablen
 b_UNr unternehmen.U_Nr%TYPE := 78;

 Text VARCHAR2(32767);
BEGIN
 SELECT U_Name, U_Branche, U_Stadt
   INTO v_UName, v_UBranche, v_UStadt
   FROM unternehmen;
  
  -- Fallunterscheidung STADTNAME
  CASE
   WHEN v_UStadt IN ('Dortmund', 'Bochum')
    THEN v_UStadt := v_UStadt || ' (Ostregion)';
  ELSE
   v_UStadt := v_UStadt || ' (Westregion)';
  END CASE;
  
  Text := v_Uname || ' ' || v_UBranche || ' in ' || v_UStadt;
  
  <<Block2>>
  DECLARE
    -- Dateihandle
    Handle UTL_FILE.FILE_TYPE;
  BEGIN
   -- ÷ffnen
   Handle := UTL_FILE.FOPEN('c:\OraText', 'meldungen.txt', 'W');
   -- Schreiben
   UTL_FILE.PUT_LINE(Handle, Text);
   -- Schlieﬂen
   UTL_FILE.FCLOSE(Handle);
   ------------------------------------------
   -- ÷ffnen
   Handle := UTL_FILE.FOPEN('c:\OraText', 'meldungen.txt', 'R');      
   -- Lesen
   Text := 'dooferTExt';
   UTL_FILE.GET_LINE(Handle, Text);
   DBMS_OUTPUT.PUT_LINE(Text);
   -- Schlieﬂen
   UTL_FILE.FCLOSE(Handle);
  END Block2;
EXCEPTION
 WHEN TOO_MANY_ROWS
  THEN DBMS_OUTPUT.PUT_LINE('Zuviele Reihen. Cursor benutzen.');
END Block1;