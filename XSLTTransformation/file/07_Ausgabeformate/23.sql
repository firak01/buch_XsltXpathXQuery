SET SERVEROUTPUT ON;

DECLARE
 -- SCHNITTSTELLEN
 b_Verzeichnis VARCHAR2(100) := 'c:\OraText';
 b_Datei       VARCHAR2(100) := 'csv.txt';
 b_Tabelle     VARCHAR2(100) := 'telefontarif';
 b_ANzahlSpalten BINARY_INTEGER := 4;
 b_Trenner     VARCHAR2(5) := ',';
 -- INTERN  
 -- Dateihandle
 Text VARCHAR2(32767);
 Handle UTL_FILE.FILE_TYPE;
 Status BINARY_INTEGER;
 v_Daten pck_unternehmen.texte;
 
 -- SQL
 v_sql VARCHAR2(32767); 
 v_Inserts pck_unternehmen.texte;
  
 zaehler BINARY_INTEGER := 1;


BEGIN
 Handle := UTL_FILE.FOPEN(b_Verzeichnis, b_Datei, 'R'); 
 -- Lesen
 LOOP
   UTL_FILE.GET_LINE(Handle, Text, Status);
   
   -- Übertragung
   --DBMS_OUTPUT.PUT_LINE(Text);
   FOR i IN 1..b_AnzahlSpalten LOOP
    v_Daten(zaehler||i) := SUBSTR(b_Trenner|| Text || b_Trenner, 
                            INSTR(b_Trenner|| Text || b_Trenner, b_Trenner, 1, i)+1,
                            (INSTR(b_Trenner|| Text || b_Trenner, b_Trenner , 1, i+1)
                             -INSTR(b_Trenner|| Text || b_Trenner, b_Trenner, 1, i))-1);
   END LOOP;
   zaehler := zaehler + 1;  
 END LOOP;
 
 -- Schließen
 UTL_FILE.FCLOSE(Handle);
  
EXCEPTION
 WHEN NO_DATA_FOUND THEN
   -- Reihen 
   FOR j IN 1..zaehler-1 LOOP
    v_SQL := 'INSERT INTO '
               || b_Tabelle
               || ' VALUES (''';
    -- Spalten
    FOR i IN 1..b_AnzahlSpalten LOOP
     IF i < b_AnzahlSpalten
      THEN v_SQL := v_SQL
                   || v_Daten(j||i) || ''',''';
      ELSE v_SQL := v_SQL
                    || v_Daten(j||i);
     END IF;              
  END LOOP;
   v_SQL := v_SQL || ''') ';
   v_Inserts(j) := v_SQL;
   --DBMS_OUTPUT.PUT_LINE(v_SQL);
 END LOOP;
 
 -- Erfassung in Tabelle
 FOR i IN v_Inserts.FIRST..v_Inserts.LAST LOOP
  DBMS_OUTPUT.PUT_LINE(v_Inserts(i));
  EXECUTE IMMEDIATE v_Inserts(i);
 END LOOP;
 COMMIT;
END;