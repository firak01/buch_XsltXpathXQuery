xquery version "1.0";
<Ergebnis xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  {
    for $t in //Tarif
    let $p := //Posten[@T_Nr = $t/@T_Nr],
         $r := //Rechnung[@R_Nr = $p/@R_Nr]
    return 
        <Tarif>{ $t /@* }
          <Rechnungsliste>{$r}</Rechnungsliste> 
        </Tarif>
   }
</Ergebnis>
(: Ergebnis
<Ergebnis xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <Tarif T_Nr="1" T_Name="Frühstück" T_GueBis="30.06.03">
    <Rechnungsliste/>
  </Tarif>
  <Tarif T_Nr="2" T_Name="Mittagspause" T_GueBis="30.06.03">
    <Rechnungsliste>
      <Rechnung R_Nr="7" R_Datum="31.03.03" R_Summe="8.61"/>
      <Rechnung R_Nr="8" R_Datum="31.03.03" R_Summe="5.85"/>
      <Rechnung R_Nr="9" R_Datum="31.03.03" R_Summe="4.69"/>
      <Rechnung R_Nr="113" R_Datum="31.05.03" R_Summe="1.42"/>
      <Rechnung R_Nr="114" R_Datum="31.05.03" R_Summe="4.57"/>
      <Rechnung R_Nr="115" R_Datum="31.05.03" R_Summe="19.16"/>
    </Rechnungsliste>
  </Tarif>
  <Tarif T_Nr="3" T_Name="Abendessen" T_GueBis="30.06.03">
    <Rechnungsliste>
      <Rechnung R_Nr="7" R_Datum="31.03.03" R_Summe="8.61"/>
      <Rechnung R_Nr="8" R_Datum="31.03.03" R_Summe="5.85"/>
      <Rechnung R_Nr="9" R_Datum="31.03.03" R_Summe="4.69"/>
      <Rechnung R_Nr="114" R_Datum="31.05.03" R_Summe="4.57"/>
      <Rechnung R_Nr="115" R_Datum="31.05.03" R_Summe="19.16"/>
    </Rechnungsliste>
  </Tarif>
  <Tarif T_Nr="4" T_Name="Mondschein1" T_GueBis="30.06.03">
    <Rechnungsliste>
      <Rechnung R_Nr="7" R_Datum="31.03.03" R_Summe="8.61"/>
      <Rechnung R_Nr="8" R_Datum="31.03.03" R_Summe="5.85"/>
      <Rechnung R_Nr="9" R_Datum="31.03.03" R_Summe="4.69"/>
      <Rechnung R_Nr="115" R_Datum="31.05.03" R_Summe="19.16"/>
    </Rechnungsliste>
  </Tarif>
  <Tarif T_Nr="5" T_Name="Mondschein2" T_GueBis="30.06.03">
    <Rechnungsliste/>
  </Tarif>
  <Tarif T_Nr="6" T_Name="Extern" T_GueBis="30.06.03">
    <Rechnungsliste/>
  </Tarif>
  <Tarif T_Nr="7" T_Name="Schicht1" T_GueBis="31.12.03">
    <Rechnungsliste>
      <Rechnung R_Nr="8" R_Datum="31.03.03" R_Summe="5.85"/>
      <Rechnung R_Nr="115" R_Datum="31.05.03" R_Summe="19.16"/>
    </Rechnungsliste>
  </Tarif>
  <Tarif T_Nr="8" T_Name="Schicht2" T_GueBis="31.12.03">
    <Rechnungsliste>
      <Rechnung R_Nr="7" R_Datum="31.03.03" R_Summe="8.61"/>
      <Rechnung R_Nr="8" R_Datum="31.03.03" R_Summe="5.85"/>
      <Rechnung R_Nr="115" R_Datum="31.05.03" R_Summe="19.16"/>
    </Rechnungsliste>
  </Tarif>
  <Tarif T_Nr="9" T_Name="Nachtschicht1" T_GueBis="31.12.03">
    <Rechnungsliste/>
  </Tarif>
  <Tarif T_Nr="10" T_Name="Nachtschicht2" T_GueBis="31.12.03">
    <Rechnungsliste>
      <Rechnung R_Nr="115" R_Datum="31.05.03" R_Summe="19.16"/>
    </Rechnungsliste>
  </Tarif>
  <Tarif T_Nr="11" T_Name="Extern" T_GueBis="31.12.03">
    <Rechnungsliste/>
  </Tarif>
  <Tarif T_Nr="12" T_Name="Frühstück" T_GueBis="31.12.03">
    <Rechnungsliste/>
  </Tarif>
  <Tarif T_Nr="13" T_Name="Mittagspause" T_GueBis="31.12.03">
    <Rechnungsliste/>
  </Tarif>
  <Tarif T_Nr="14" T_Name="Abendessen" T_GueBis="31.12.03">
    <Rechnungsliste/>
  </Tarif>
  <Tarif T_Nr="15" T_Name="Mondschein1" T_GueBis="31.12.03">
    <Rechnungsliste/>
  </Tarif>
  <Tarif T_Nr="16" T_Name="Mondschein2" T_GueBis="31.12.03">
    <Rechnungsliste/>
  </Tarif>
  <Tarif T_Nr="17" T_Name="Extern" T_GueBis="31.12.03">
    <Rechnungsliste/>
  </Tarif>
</Ergebnis>

:)