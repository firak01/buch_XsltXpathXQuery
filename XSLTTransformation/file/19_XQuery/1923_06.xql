xquery version "1.0";
<Ergebnis xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  {
    for $t in //Tarif
    let $p := //Posten
    where every $t-item in $t satisfies $t-item[@T_Nr = $p/@T_Nr]
    return  $t
   }
</Ergebnis>
(: Ergebnis
<Ergebnis xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <Tarif T_Nr="2" T_Name="Mittagspause" T_GueBis="30.06.03"/>
  <Tarif T_Nr="3" T_Name="Abendessen" T_GueBis="30.06.03"/>
  <Tarif T_Nr="4" T_Name="Mondschein1" T_GueBis="30.06.03"/>
  <Tarif T_Nr="7" T_Name="Schicht1" T_GueBis="31.12.03"/>
  <Tarif T_Nr="8" T_Name="Schicht2" T_GueBis="31.12.03"/>
  <Tarif T_Nr="10" T_Name="Nachtschicht2" T_GueBis="31.12.03"/>
</Ergebnis>
:)