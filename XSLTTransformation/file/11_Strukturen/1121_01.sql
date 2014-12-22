SELECT *
FROM (
SELECT "Umsatz",
       "Tarif-Name",
       "Monat",
       Preis  / (SELECT COUNT(A_Von) 
                   FROM scott_anruf a2
                  WHERE TO_CHAR(a_Beginn, 'MM.YY')
                        = daten."Monat")  AS "Pro-Kopf-Umsatz",
      (SELECT COUNT(A_Von) 
         FROM scott_anruf a2
        WHERE TO_CHAR(a_Beginn, 'MM.YY')
                = daten."Monat")  AS "Kunden"                   
  FROM (
SELECT TO_CHAR(SUM(A_Preis/100), '999G999D99') AS "Umsatz",
       SUM(A_Preis/100) AS Preis,
       T_Name AS "Tarif-Name",
       TO_CHAR(a1.A_Beginn, 'MM.YY') AS "Monat"
  FROM scott_tarif t INNER JOIN scott_anruf  a1
    ON t.t_nr = a1.a_tnr
 GROUP BY T_Name, TO_CHAR(a1.A_Beginn, 'MM.YY') 
 ORDER BY TO_CHAR(a1.A_Beginn, 'MM.YY')) daten ) daten2;