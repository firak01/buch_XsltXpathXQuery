SET SERVEROUTPUT ON;
DECLARE
-- Ausnahme
e_KursVoll EXCEPTION;

-- Datensatztyp für Teilnehmer
TYPE ds_Teilnehmer IS RECORD (
 TN_Vorname  teilnehmer.TN_VOrname%TYPE,
 TN_Nachname teilnehmer.TN_Nachname%TYPE
);
-- Tabellentyp
TYPE t_Teilnehmer IS TABLE OF ds_Teilnehmer
 INDEX BY BINARY_INTEGER;
 
-- Collections
v_Teilnehmer t_Teilnehmer;
v_Warteliste t_Teilnehmer;

-- Teilnehmermenge
CURSOR c_Anmelder IS
SELECT TN_Vorname, TN_Nachname
  FROM teilnehmer
  SAMPLE (0.55);


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

  v_Teilnehmer(c_Anmelder%ROWCOUNT) := v_Angemeldete;
 END LOOP;
 
 EXCEPTION
  WHEN e_KursVoll
   THEN DBMS_OUTPUT.PUT_LINE('--------------');
 END Block2;
 
 LOOP
   FETCH c_ANmelder INTO v_Wartende;
   EXIT WHEN c_ANmelder%NOTFOUND OR c_Anmelder%ROWCOUNT = 6;
   v_Warteliste(c_Anmelder%ROWCOUNT) := v_Wartende;        
 END LOOP;
 CLOSE c_Anmelder;
 
 FOR i IN v_Teilnehmer.FIRST..v_Teilnehmer.LAST LOOP
  DBMS_OUTPUT.PUT_LINE(v_Teilnehmer(i).TN_VOrname);
 END LOOP;
 
 IF v_Warteliste.COUNT > 0
  THEN
   FOR i IN v_Warteliste.FIRST..v_Warteliste.LAST LOOP
    DBMS_OUTPUT.PUT_LINE(v_Warteliste(i).TN_Nachname);
   END LOOP; 
 END IF;
END;