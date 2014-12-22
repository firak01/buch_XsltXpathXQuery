SET LONG 20000000;
SELECT XMLElement("Umsatz-Pro-Stadt", 
        XMLAgg(XMLElement("Umsatz",
         XMLForest(Stadt AS "Stadt",
                   Beginn AS "Beginn",
                   sum(dauer) AS "Dauer",
                   sum(umsatz) AS "Umsatz")))) AS XML
 FROM (
SELECT P_Stadt AS Stadt,
       TO_CHAR(a.A_Beginn, 'YYYY-MM-DD.hh:mm:ss') AS Beginn,
       a_dauer AS Dauer,
       a_preis AS Umsatz
  FROM scott_pkunde p INNER JOIN scott_anruf a
    ON p.p_nr = a.a_von
 WHERE a_Typ = 'p'
   AND a_beginn BETWEEN '01.11.1903' AND '05.02.1905'
   AND p_stadt IN ('Duisburg', 'Bochum'))
 GROUP BY Stadt, Beginn;