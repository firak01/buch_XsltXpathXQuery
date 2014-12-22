SET LONG 200000;
SELECT XMLElement("Monat",
         XMLForest("Monat" AS "Datum",
                   "Pro-Kopf-Umsatz" AS "Pro-Kopf-Umsatz",
                   "Kunden" AS "Kunden"),        
          XMLElement("Tarifliste",
           XMLAgg(XMLElement("Tarif",
                  XMLForest ("Tarif-Name" AS "Name",
                             "Umsatz" AS "Umsatz")))))  AS XML
FROM (
SELECT "Umsatz",
       "Tarif-Name",
       "Monat",
       ROUND(Preis  / (SELECT COUNT(A_Von) 
                   FROM scott_anruf a2
                  WHERE TO_CHAR(a_Beginn, 'MM.YY')
                        = daten."Monat"),4)  AS "Pro-Kopf-Umsatz",
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
 ORDER BY TO_CHAR(a1.A_Beginn, 'MM.YY')) daten 
 GROUP BY Preis, daten."Monat", "Monat", "Umsatz", "Tarif-Name") daten2
 GROUP BY "Monat", "Pro-Kopf-Umsatz", "Kunden";