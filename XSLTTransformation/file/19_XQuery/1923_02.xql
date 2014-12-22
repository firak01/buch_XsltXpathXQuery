xquery version "1.0";
<Ergebnis xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  {
    for $r in //Rechnung
    let $p := //Posten[@R_Nr = $r/@R_Nr]
    where $r/@R_Summe > 5.25
    return
        <Abrechnung>
            { $r }
            <Postenliste>{ $p }</Postenliste>
        </Abrechnung>
  }
</Ergebnis>
(: Ergebnis
<Ergebnis xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <Abrechnung>
    <Rechnung R_Nr="7" R_Datum="31.03.03" R_Summe="8.61"/>
    <Postenliste>
      <Posten P_Nr="33" R_Nr="7" P_Summe="2.28" T_Nr="2"/>
      <Posten P_Nr="34" R_Nr="7" P_Summe="0.17" T_Nr="3"/>
      <Posten P_Nr="35" R_Nr="7" P_Summe="1.44" T_Nr="4"/>
      <Posten P_Nr="38" R_Nr="7" P_Summe="4.72" T_Nr="8"/>
    </Postenliste>
  </Abrechnung>
  <Abrechnung>
    <Rechnung R_Nr="8" R_Datum="31.03.03" R_Summe="5.85"/>
    <Postenliste>
      <Posten P_Nr="41" R_Nr="8" P_Summe="1.18" T_Nr="2"/>
      <Posten P_Nr="42" R_Nr="8" P_Summe="0.02" T_Nr="3"/>
      <Posten P_Nr="43" R_Nr="8" P_Summe="1.56" T_Nr="4"/>
      <Posten P_Nr="45" R_Nr="8" P_Summe="0.13" T_Nr="7"/>
      <Posten P_Nr="46" R_Nr="8" P_Summe="2.96" T_Nr="8"/>
    </Postenliste>
  </Abrechnung>
  <Abrechnung>
    <Rechnung R_Nr="115" R_Datum="31.05.03" R_Summe="19.16"/>
    <Postenliste>
      <Posten P_Nr="554" R_Nr="115" P_Summe="5.25" T_Nr="2"/>
      <Posten P_Nr="555" R_Nr="115" P_Summe="1.85" T_Nr="3"/>
      <Posten P_Nr="556" R_Nr="115" P_Summe="1.76" T_Nr="4"/>
      <Posten P_Nr="558" R_Nr="115" P_Summe="2.88" T_Nr="7"/>
      <Posten P_Nr="559" R_Nr="115" P_Summe="4.49" T_Nr="8"/>
      <Posten P_Nr="560" R_Nr="115" P_Summe="2.93" T_Nr="10"/>
    </Postenliste>
  </Abrechnung>
</Ergebnis>
:)