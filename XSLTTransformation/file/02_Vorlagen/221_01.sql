SET LONG 200000;
SELECT XMLElement("Kunde",
                   XMLAttributes(P_NR AS "Nr",
                                 P_Anrede AS "Anrede",
                                 P_Beginn AS "Beginn"),
         XMLElement("Name",
           XMLForest(P_Vorname AS "Rufname",
                     P_Nachname AS "Zuname")),
         XMLElement("Adresse",
           XMLForest(P_Strasse AS "Strasse",
                     P_PLZ AS "PLZ",
                     P_Stadt  AS "Stadt"))) AS XML
  FROM scott_pkunde
 WHERE P_Nr BETWEEN 234 AND 239
   AND P_Stadt != 'D?sseldorf';