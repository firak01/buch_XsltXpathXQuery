SET LONG 20000;

SELECT XMLELEMENT("Erfolg", XMLATTRIBUTES( Stadt AS "Stadt", Monat AS "Monat"),
        XMLELEMENT("Gesamt", Zuwachs),
        XMLELEMENT("Neukunden", Gesamt)) AS Text
FROM ( 
SELECT a.Monat AS Monat,
       (SELECT COUNT(*)
          FROM PKunde c
         WHERE EXTRACT(YEAR FROM c.P_Beginn) = 2003
           AND EXTRACT(MONTH FROM c.P_Beginn) <= a.Monat
           AND a.P_Stadt = c.P_Stadt) AS Zuwachs,
       a.Zahl AS Gesamt,
       P_Stadt AS Stadt
 FROM
(SELECT EXTRACT(MONTH FROM d.P_Beginn) AS Monat,
       COUNT(d.P_Nr) AS Zahl,
       P_Stadt
  FROM PKunde d
 WHERE EXTRACT(YEAR FROM d.P_Beginn) = 2003
 GROUP BY EXTRACT(MONTH FROM d.P_Beginn), P_Stadt) a
 GROUP BY a.Monat, a.Zahl, P_Stadt); 