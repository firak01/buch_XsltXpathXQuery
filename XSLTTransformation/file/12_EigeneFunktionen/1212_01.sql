SELECT T_Name, t.T_Nr, T_GueVon, T_GueBis, T_Beginn, T_Ende, T_Preis, T_Typ,
       TO_CHAR(SUM(P_Summe)/100, '999G999D99') AS Summe,
       COUNT(R_Nr) AS Kunden,
       ROUND((SUM(P_Summe)/100) / COUNT(R_Nr),4) AS Durchschnitt
  FROM scott_tarif t INNER JOIN scott_posten p
    ON t.t_nr = p.t_nr
 GROUP BY T_Name, t.T_Nr, T_GueVon, T_GueBis, T_Beginn, T_Ende, T_Preis, T_Typ;