DECLARE
 b_Monat  NUMBER(2) := 8;
 b_Jahr   NUMBER(4) := 2005;
 b_KNr    termin.K_Nr%TYPE := 1015044;
 v_TZahl  NUMBER(4);
 v_KDauer NUMBER(1);
 v_Beginn DATE;
 v_ENde   DATE;
 v_SQL    VARCHAR2(200);
 v_MaxTNr NUMBER(4);
BEGIN
 SELECT MAX(T_Nr)+1 INTO v_MaxTNr FROM termin;
 
 EXECUTE IMMEDIATE
  'INSERT INTO termin
    VALUES (:1, :2, :3; :4, ''Elmshorn'')
   RETURNING t_Beginn, T_ende INTO :5, :6'
  USING IN v_MaxTNr, b_KNr, '01-'||b_Monat||'-'||b_Jahr, '02-'||b_Monat||'-'||b_Jahr
  RETURNING INTO v_Beginn, v_Ende;
 
 EXECUTE IMMEDIATE 
 'SELECT COUNT(T_Nr), K_Dauer
    FROM kurs NATURAL JOIN termin
   WHERE EXTRACT(YEAR FROM t_Beginn) = :1
     AND EXTRACT(MONTH FROM t_Beginn) = :2
     AND K_NR = :3
   GROUP BY K_Dauer'
 INTO v_TZahl, v_KDauer
 USING IN b_Jahr, b_MOnat, b_KNr;
 
 DBMS_OUTPUT.PUT_LINE(v_TZahl || ' ' || v_KDauer);
END;