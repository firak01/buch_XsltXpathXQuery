SET LONG 20000;
SELECT XMLElement("Tarifliste",
         XMLAgg(XMLELEMENT("Tarif",
                  XMLELEMENT("Nr", T_Nr),
                  XMLELEMENT("Name", T_Name)))) AS Text
  FROM scott_tarif 
   WHERE t_typ = 'p'
     AND t_guebis <= '31.12.2004';