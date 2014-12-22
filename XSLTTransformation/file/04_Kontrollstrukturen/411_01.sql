SET LONG 200000;
SELECT XMLElement("Verbrauch",
        XMLElement("Tarif",
         XMLForest(t_name AS "Name",
                   t_preis AS "Preis",
                   t_typ AS "Typ")),
         XMLElement("Umsatz",
          XMLForest(TO_CHAR(ROUND(SUM(a_preis)/100,2), '999G999D99') AS "Summe",
                    SUM(a_dauer) AS "Dauer")),
         XMLElement("Zeit",
          XMLForest(EXTRACT(MONTH FROM a_beginn) AS "Monat",
                    EXTRACT(YEAR FROM a_beginn) AS "Jahr"))) AS XML
  FROM scott_anruf NATURAL JOIN scott_tarif
 GROUP BY T_Name, t_preis, t_Typ,EXTRACT(MONTH FROM a_beginn), EXTRACT(YEAR FROM a_beginn)
 ORDER BY  EXTRACT(YEAR FROM a_beginn), EXTRACT(MONTH FROM a_beginn);