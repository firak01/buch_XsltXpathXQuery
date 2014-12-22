xquery version "1.0";
<Ergebnis xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  {
    for $p1 in //Posten
    let $p2 := //Posten[ @R_Nr = $p1 / @R_Nr]
    where count($p2) = 1
    return  $p1 
   }
</Ergebnis>
(: Ergebnis
<Ergebnis xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <Posten P_Nr="544" R_Nr="113" P_Summe="1.42" T_Nr="2"/>
</Ergebnis>
:)