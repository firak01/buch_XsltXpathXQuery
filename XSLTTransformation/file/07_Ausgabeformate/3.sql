DECLARE
 v_Zahl NUMBER(2) := 1;
BEGIN
 <<ZahlenVon1Bis99>>
 LOOP
  DBMS_OUTPUT.PUT_LINE(v_Zahl);
  v_Zahl := v_Zahl + 1;
  EXIT WHEN v_Zahl = 99;
 END LOOP;
 
 WHILE v_Zahl > 1 LOOP
  DBMS_OUTPUT.PUT_LINE(v_Zahl);
  v_Zahl := v_Zahl - 1;
  EXIT WHEN v_Zahl = 50;
 END LOOP;
 
 FOR v_Zaehler IN 1..100 LOOP
  DBMS_OUTPUT.PUT_LINE(v_Zahl);
  EXIT WHEN v_Zahl = 50; 
 END LOOP;
END; 