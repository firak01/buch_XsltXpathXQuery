SET SERVEROUTPUT ON;
DECLARE

-- Teilnehmermenge
CURSOR c_Anmelder IS
SELECT TN_Vorname, TN_Nachname
  FROM teilnehmer
  SAMPLE (0.55);

-- Datensatztyp für Teilnehmer
TYPE ds_Teilnehmer IS RECORD (
 TN_Vorname  teilnehmer.TN_VOrname%TYPE,
 TN_Nachname teilnehmer.TN_Nachname%TYPE
);

-- Datensätze
v_Angemeldete ds_Teilnehmer;
v_Wartende    ds_Teilnehmer;  
BEGIN
 OPEN c_Anmelder;
 -- Buchungen
 LOOP
  FETCH c_ANmelder INTO v_Angemeldete;
  EXIT WHEN c_ANmelder%NOTFOUND OR c_Anmelder%ROWCOUNT = 6;
  DBMS_OUTPUT.PUT_LINE(v_Angemeldete.TN_Nachname);
 END LOOP;
 -- Warteliste
 IF c_Anmelder%FOUND 
  THEN DBMS_OUTPUT.PUT_LINE('--------------');
       LOOP
        FETCH c_ANmelder INTO v_Wartende;
        EXIT WHEN c_ANmelder%NOTFOUND OR c_Anmelder%ROWCOUNT = 6;
        DBMS_OUTPUT.PUT_LINE(v_Wartende.TN_Nachname);        
       END LOOP;
 END IF;
 CLOSE c_Anmelder;
END;