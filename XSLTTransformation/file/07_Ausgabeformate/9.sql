SET SERVEROUTPUT ON;
DECLARE
-- Ausnahme
e_KursVoll EXCEPTION;

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
 
 <<Block2>>
 DECLARE
 BEGIN
 -- Buchungen
 LOOP
  FETCH c_ANmelder INTO v_Angemeldete;
  EXIT WHEN c_ANmelder%NOTFOUND;
  
  -- Auslösen der Ausnahme
  IF  c_Anmelder%ROWCOUNT = 6
   THEN RAISE e_KursVoll;
  END IF;

  DBMS_OUTPUT.PUT_LINE(v_Angemeldete.TN_Nachname);
 END LOOP;
 
 EXCEPTION
  WHEN e_KursVoll
   THEN DBMS_OUTPUT.PUT_LINE('--------------');
 END Block2;
 
 LOOP
   FETCH c_ANmelder INTO v_Wartende;
   EXIT WHEN c_ANmelder%NOTFOUND OR c_Anmelder%ROWCOUNT = 6;
   DBMS_OUTPUT.PUT_LINE(v_Wartende.TN_Nachname);        
 END LOOP;
 CLOSE c_Anmelder;
END;