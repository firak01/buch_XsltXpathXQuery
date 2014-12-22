SET LONG 200000;
SELECT Stadt,
       Beginn,
       sum(dauer) AS Dauer,
       sum(umsatz) AS Umsatz
 FROM (
SELECT P_Stadt AS Stadt,
       TO_CHAR(a.A_Beginn, 'YYYY-MM-DD.hh:mm:ss') AS Beginn,
       a_dauer AS Dauer,
       a_preis AS Umsatz
  FROM scott_pkunde p INNER JOIN scott_anruf a
    ON p.p_nr = a.a_von
 WHERE a_Typ = 'p'
   AND a_beginn BETWEEN '01.06.1903' AND '05.08.1905'
   AND p_stadt IN ('Duisburg', 'Bochum', 'Dortmund'))
 GROUP BY Stadt, Beginn;