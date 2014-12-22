SET LONG 20000;
SELECT XMLELEMENT("Tarif", XMLATTRIBUTES(T_Nr AS "Nr", T_Typ AS "Typ"),
        XMLELEMENT("Name", T_Name), 
        XMLELEMENT("Umsatz", ROUND(SUM(A_Preis)/100,2)) AS Umsatz
  FROM scott_tarif LEFT OUTER JOIN scott_anruf
    ON scott_tarif.T_Nr = scott_anruf.A_TNr
 WHERE T_Guevon >= '01.01.03'
   AND T_Typ IN ('g', 'p')
 GROUP BY T_Name, T_Nr, T_Typ;