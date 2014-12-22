SET LONG 200000;
SELECT XMLElement("Rechnungsliste", XMLAgg(XMLElement("Rechnung",
         XMLATTRIBUTES(r.R_Nr AS "R_Nr",
                       R_Datum AS "R_Datum",
                       ROUND(SUM(P_Summe)/100,2) AS "R_Summe")))) AS XML
  FROM scott_rechnung r INNER JOIN scott_posten p
    ON r.R_nr = p.R_Nr
  WHERE r.r_nr IN (7,8,9, 115, 113, 114)
  GROUP BY r.R_Nr, R_Datum;
  
SELECT XMLElement("Postenliste", XMLAgg(XMLElement("Posten",
         XMLATTRIBUTES(P_Nr AS "P_Nr",
                       R_Nr  AS "R_Nr",
                       ROUND(P_Summe/100,2) AS "P_Summe",
                       T_Nr AS "T_Nr")))) AS XML
  FROM scott_posten
  WHERE r_nr IN (9,8,7, 115, 113, 114)
    AND P_Summe IS NOT NULL
    AND P_Summe != 0;

SELECT XMLElement("Tarifliste", XMLAgg(XMLElement("Tarif",
         XMLATTRIBUTES(T_Nr AS "T_Nr",
                       T_Name  AS "T_Name",
                       t_GueBis AS "T_GueBis")))) AS XML
  FROM scott_tarif
 WHERE EXTRACT(YEAR FROM t_GueBis) = 2003
   AND EXTRACT(MONTH FROM t_GueBIs) <= 12;    