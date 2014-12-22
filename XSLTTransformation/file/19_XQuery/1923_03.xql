xquery version "1.0";
<Ergebnis xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  {
    for $t in //Tarif
    where empty(//Posten[@T_Nr = $t/@T_Nr])
    return
        <Tarif>{ $t /@*}</Tarif>
  }
</Ergebnis>
(: Ergebnis
<Ergebnis xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <Tarif T_Nr="1" T_Name="Frühstück" T_GueBis="30.06.03"/>
  <Tarif T_Nr="5" T_Name="Mondschein2" T_GueBis="30.06.03"/>
  <Tarif T_Nr="6" T_Name="Extern" T_GueBis="30.06.03"/>
  <Tarif T_Nr="9" T_Name="Nachtschicht1" T_GueBis="31.12.03"/>
  <Tarif T_Nr="11" T_Name="Extern" T_GueBis="31.12.03"/>
  <Tarif T_Nr="12" T_Name="Frühstück" T_GueBis="31.12.03"/>
  <Tarif T_Nr="13" T_Name="Mittagspause" T_GueBis="31.12.03"/>
  <Tarif T_Nr="14" T_Name="Abendessen" T_GueBis="31.12.03"/>
  <Tarif T_Nr="15" T_Name="Mondschein1" T_GueBis="31.12.03"/>
  <Tarif T_Nr="16" T_Name="Mondschein2" T_GueBis="31.12.03"/>
  <Tarif T_Nr="17" T_Name="Extern" T_GueBis="31.12.03"/>
</Ergebnis>
:)