SET LONG 20000;
SELECT XMLElement("Rechnungen",
        XMLAgg(XMLELEMENT("Rechnung", XMLATTRIBUTES(R_Nr AS "Nr", '20' || TO_CHAR(R_Datum, 'YY-MM-DD') AS "Datum"),
        XMLELEMENT("Total", TO_CHAR(R_Summe/100, '99.99')),
        XMLELEMENT("Kunde", XMLATTRIBUTES(R_Typ AS "Typ", R_KNr AS "Nr"),
          XMLELEMENT("Name", XMLATTRIBUTES(P_Anrede AS "Anrede"),
           XMLELEMENT("Vorname", P_Vorname),
           XMLELEMENT("Nachname", P_Nachname)),
           XMLELEMENT("Adresse",
            XMLELEMENT("Strasse", P_Strasse),
            XMLELEMENT("PLZ", P_PLZ),
            XMLELEMENT("Stadt", P_Stadt))),
         XMLElement("Postenliste",
          XMLAgg(XMLELEMENT("Posten", XMLATTRIBUTES(scott_posten.P_Nr AS "Nr", R_Nr AS "RefNr"),
                              XMLELEMENT("Tarif", T_Name),
                              XMLELEMENT("Einzeln", TO_CHAR(P_Summe/100, '99.99')))))))) AS Text
  FROM scott_rechnung NATURAL JOIN scott_posten NATURAL JOIN scott_tarif
                INNER JOIN scott_pkunde
                ON scott_pkunde.P_Nr = scott_rechnung.R_KNr
 WHERE scott_pkunde.p_nr IN (1257, 895)
   AND r_typ = 'p'
   AND r_datum = '31.12.1904'
   AND P_Summe > 0
 GROUP BY R_Nr, R_Datum, R_Typ, R_KNr, P_Anrede, P_Vorname, P_Nachname, P_Strasse, P_PLZ, P_Stadt, R_Summe;