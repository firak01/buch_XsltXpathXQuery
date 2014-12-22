SET LONG 200000;
SELECT XMLElement("Anruf", XMLAttributes(A_Nr AS "Nr", A_Typ AS "Typ"),
        XMLForest(A_Beginn AS "Beginn",
                  A_Dauer AS "Dauer",
                  A_Preis AS "Preis"),
        XMLElement("Tarif", XMLAttributes(T_NR AS "Nr"), T_Name),
        XMLElement("Von", XMLAttributes(A_Von AS "Nr"),
         XMLForest(PVonNachname || ', ' || PVonVorname AS "Name",
                   PVonStadt AS "Stadt")),
        XMLElement("Nach", XMLAttributes(A_Nach AS "Nr"),
         XMLForest(PNachNachname || ', ' || PNachVorname AS "Name",
                   PNachStadt AS "Stadt"))) AS XML
  FROM (
SELECT a.A_Nr,
       a.A_Typ,
       a.A_Von,
       a.A_Nach,
       TO_CHAR(a.A_Beginn, 'dd.mm.yy hh:mm:ss') AS A_Beginn,
       a.A_Dauer,
       a.A_Preis,
       t.T_Nr,
       t.T_Name,
       (SELECT P_vorname
          FROM scott_pkunde p
         WHERE a.a_von = p.p_nr
           AND a.a_typ = 'p') as PVonVorname,
       (SELECT P_nachname
          FROM scott_pkunde p
         WHERE a.a_von = p.p_nr
           AND a.a_typ = 'p') as PVonNachname,
       (SELECT P_Stadt
          FROM scott_pkunde p
         WHERE a.a_von = p.p_nr
           AND a.a_typ = 'p') as PVonStadt,                        
       (SELECT P_vorname
          FROM scott_pkunde p
         WHERE a.a_nach = p.p_nr
           AND a.a_typ = 'p') as PNachVorname,
       (SELECT P_nachname
          FROM scott_pkunde p
         WHERE a.a_nach = p.p_nr
           AND a.a_typ = 'p') as PNachNachname,
       (SELECT P_Stadt
          FROM scott_pkunde p
         WHERE a.a_nach = p.p_nr
           AND a.a_typ = 'p') as PNachStadt            
  FROM scott_anruf a INNER JOIN scott_pkunde
    ON scott_pkunde.p_nr = a.a_von  
                     INNER JOIN scott_tarif t
    ON a.A_TNr = t.T_Nr            
 WHERE a.A_Nr IN (4897, 4899, 4880, 4871, 4828)
   AND a.A_Typ = 'p');
   
SELECT XMLElement("Anruf", XMLAttributes(A_Nr AS "Nr", A_Typ AS "Typ"),
        XMLForest(A_Beginn AS "Beginn",
                  A_Dauer AS "Dauer",
                  A_Preis AS "Preis"),
        XMLElement("Tarif", XMLAttributes(T_NR AS "Nr"), T_Name),
        XMLElement("Von", XMLAttributes(A_Von AS "Nr"),
         XMLForest(Gvonname AS "Name",
                   GVonStadt AS "Stadt")),
        XMLElement("Nach", XMLAttributes(A_Nach AS "Nr"),
         XMLForest(Gnachname AS "Name",
                   GNachStadt AS "Stadt"))) AS XML
  FROM (
SELECT a.A_Nr,
       a.A_Typ,
       a.A_Von,
       a.A_Nach,
       TO_CHAR(a.A_Beginn, 'dd.mm.yy hh:mm:ss') AS A_Beginn,
       a.A_Dauer,
       a.A_Preis,
       t.T_Nr,
       t.T_Name,
       (SELECT G_name
          FROM scott_gkunde g
         WHERE a.a_von = g.g_nr
           AND a.a_typ = 'g') as GVonname,
       (SELECT G_Stadt
          FROM scott_gkunde g
         WHERE a.a_von = g.g_nr
           AND a.a_typ = 'g') as GVonStadt,                        
       (SELECT G_name
          FROM scott_gkunde g
         WHERE a.a_nach = g.g_nr
           AND a.a_typ = 'g') as GNachname,
       (SELECT G_Stadt
          FROM scott_gkunde g
         WHERE a.a_nach = g.g_nr
           AND a.a_typ = 'g') as GNachStadt            
  FROM scott_anruf a INNER JOIN scott_gkunde
    ON scott_gkunde.g_nr = a.a_von  
                     INNER JOIN scott_tarif t
    ON a.A_TNr = t.T_Nr            
 WHERE a.A_Nr IN (4897, 4899, 4880, 4871, 4828)
   AND a.A_Typ = 'g');   