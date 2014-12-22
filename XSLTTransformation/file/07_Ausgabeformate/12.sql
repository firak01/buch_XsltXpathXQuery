DECLARE
 v_MaxTNr termin.t_Nr%TYPE;
 TYPE KursNummer IS TABLE OF termin.K_Nr%TYPE
  INDEX BY BINARY_INTEGER;
 v_KNr KursNummer;  -- Terminnummern
 TYPE t_Zeit IS VARRAY(3) OF NUMBER(7);
 Zeit t_Zeit := t_Zeit(1,2,3);  -- Messwerte
BEGIN
 SELECT MAX(T_Nr) INTO v_MaxTNr FROM termin;
 -- Übergabe per Schleife
 Zeit(1) := DBMS_UTILITY.GET_TIME;
 FOR zaehler IN 1..2000 LOOP
  INSERT INTO termin
   VALUES (v_MaxTnr+Zaehler, 1025096, '17.03.2004', '19.03.2004', 'Elmshorn');
 END LOOP;
 Zeit(2) := DBMS_UTILITY.GET_TIME;
 
 -- Übergabe per Mengenübertragung
 SELECT MAX(T_Nr) INTO v_MaxTNr FROM termin;
 FOR zaehler IN 1..2000 LOOP
  v_KNr(zaehler) := v_MaxTNr + zaehler;
 END LOOP;
 
 FORALL zaehler IN 1..2000 SAVE EXCEPTIONS
  INSERT INTO termin
   VALUES (v_Knr(zaehler), 1025096, '17.03.2004', '19.03.2004', 'Elmshorn');
   
 Zeit(3) := DBMS_UTILITY.GET_TIME; 
 
 FOR zaehler IN 1..2000 LOOP
  IF SQL%BULK_ROWCOUNT(zaehler) = 0
   THEN DBMS_OUTPUT.PUT_LINE('Fehler');
  END IF;
  
 END LOOP;
 DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
 DBMS_OUTPUT.PUT_LINE(SQL%BULK_EXCEPTIONS.COUNT);
 ROLLBACK;
 
 DBMS_OUTPUT.PUT_LINE(TO_CHAR(Zeit(2)-Zeit(1)));
 DBMS_OUTPUT.PUT_LINE(TO_CHAR(Zeit(3)-Zeit(2)));
END;