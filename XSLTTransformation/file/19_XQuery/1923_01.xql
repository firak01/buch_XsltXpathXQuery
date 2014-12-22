xquery version "1.0";
<Ergebnis>
  {
    for $t in //Tarif
    where $t/@T_GueBis = "30.06.03"
      and $t/@T_Nr <= 5 
    order by $t/@T_Name
    return
        <Tarif>
            { $t/@T_Name }
            { $t/@T_GueBis }
        </Tarif>
  }
</Ergebnis>
(: Ergebnis
<Ergebnis>
  <Tarif T_Name="Abendessen" T_GueBis="30.06.03"/>
  <Tarif T_Name="Frühstück" T_GueBis="30.06.03"/>
  <Tarif T_Name="Mittagspause" T_GueBis="30.06.03"/>
  <Tarif T_Name="Mondschein1" T_GueBis="30.06.03"/>
  <Tarif T_Name="Mondschein2" T_GueBis="30.06.03"/>
</Ergebnis>
:)
