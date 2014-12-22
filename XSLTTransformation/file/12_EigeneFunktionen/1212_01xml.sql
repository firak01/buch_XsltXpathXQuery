SET LONG 200000;
SELECT XMLElement("Tarif",
        XMLElement("Name", XMLAttributes(t.T_Nr AS "Nr", t_typ AS "Typ"), 
                   T_Name),
        XMLElement("Gueltigkeit",
          XMLForest(T_GueVon AS "Von",
                    T_GueBis AS "Bis")),
        XMLElement("Uhrzeit",
          XMLForest(T_Beginn AS "Von",
                    T_Ende AS "Bis")),
        XMLElement("Preis", T_Preis),
        XMLElement("Umsatz",
          XMLForest(TO_CHAR(SUM(P_Summe)/100, '999G999D99') AS "Summe",
                    COUNT(R_Nr) AS "Kunden",
                    TO_CHAR(ROUND((SUM(P_Summe)/100) / COUNT(R_Nr),4), '999G999D99') AS "Durchschnitt"))) AS XML
  FROM scott_tarif t INNER JOIN scott_posten p
    ON t.t_nr = p.t_nr
 GROUP BY T_Name, t.T_Nr, T_GueVon, T_GueBis, T_Beginn, T_Ende, T_Preis, T_Typ;