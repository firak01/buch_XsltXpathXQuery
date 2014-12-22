SET LONG 200000;
SELECT XMLElement("Mitarbeiterliste",
        XMLAgg(
         XMLElement("Mitarbeiter",
          XMLElement("Name", XMLAttributes(M_Anrede AS "Anrede"),
           XMLForest(M_Vorname AS "Vorname",
                     M_Nachname AS "Nachname")),
           XMLElement("Funktion", M_Funktion)))) AS XML
  FROM scott_mitarbeiter;
  
-- Ergebnis
/*

<Mitarbeiterliste>
  <Mitarbeiter>
    <Name Anrede="Frau">
      <Vorname>Birte</Vorname>
      <Nachname>Sonnenschein</Nachname>
    </Name>
    <Funktion>Buchhaltung</Funktion>
  </Mitarbeiter>
  <Mitarbeiter>
    <Name Anrede="Frau">
      <Vorname>Susanne</Vorname>
      <Nachname>Rollstein</Nachname>
    </Name>
    <Funktion>Kundenberater</Funktion>
  </Mitarbeiter>
  <Mitarbeiter>
    <Name Anrede="Herr">
      <Vorname>Martin</Vorname>
      <Nachname>Dünn</Nachname>
    </Name>
    <Funktion>Kundenberater</Funktion>
  </Mitarbeiter>
  <Mitarbeiter>
    <Name Anrede="Herr">
      <Vorname>Holger</Vorname>
      <Nachname>Schnellschuss</Nachname>
    </Name>
    <Funktion>Sekretariat</Funktion>
  </Mitarbeiter>
  <Mitarbeiter>
    <Name Anrede="Herr">
      <Vorname>Stefan</Vorname>
      <Nachname>Erdbau</Nachname>
    </Name>
    <Funktion>Sekretariat</Funktion>
  </Mitarbeiter>
  <Mitarbeiter>
    <Name Anrede="Herr">
      <Vorname>Ralf</Vorname>
      <Nachname>Hostell</Nachname>
    </Name>
    <Funktion>Sekretariat</Funktion>
  </Mitarbeiter>
  <Mitarbeiter>
    <Name Anrede="Herr">
      <Vorname>Lars</Vorname>
      <Nachname>Klapp</Nachname>
    </Name>
    <Funktion>Kundenberater</Funktion>
  </Mitarbeiter>
  <Mitarbeiter>
    <Name Anrede="Frau">
      <Vorname>Anja</Vorname>
      <Nachname>Doppelt</Nachname>
    </Name>
    <Funktion>Technik</Funktion>
  </Mitarbeiter>
  <Mitarbeiter>
    <Name Anrede="Herr">
      <Vorname>Reinhard</Vorname>
      <Nachname>Bergluft</Nachname>
    </Name>
    <Funktion>Technik</Funktion>
  </Mitarbeiter>
  <Mitarbeiter>
    <Name Anrede="Herr">
      <Vorname>Marco</Vorname>
      <Nachname>Scheffchen</Nachname>
    </Name>
    <Funktion>Geschäftsführer</Funktion>
  </Mitarbeiter>
  <Mitarbeiter>
    <Name Anrede="Frau">
      <Vorname>Marcus</Vorname>
      <Nachname>Bodensee</Nachname>
    </Name>
    <Funktion>Geschäftsführer</Funktion>
  </Mitarbeiter>
  <Mitarbeiter>
    <Name Anrede="Herr">
      <Vorname>Dirk</Vorname>
      <Nachname>Still</Nachname>
    </Name>
    <Funktion>Technik</Funktion>
  </Mitarbeiter>
  <Mitarbeiter>
    <Name Anrede="Herr">
      <Vorname>Markus</Vorname>
      <Nachname>Bärchen</Nachname>
    </Name>
    <Funktion>Buchhaltung</Funktion>
  </Mitarbeiter>
  <Mitarbeiter>
    <Name Anrede="Herr">
      <Vorname>Nils</Vorname>
      <Nachname>Latz</Nachname>
    </Name>
    <Funktion>Buchhaltung</Funktion>
  </Mitarbeiter>
  <Mitarbeiter>
    <Name Anrede="Frau">
      <Vorname>Kristina</Vorname>
      <Nachname>Gelddreh</Nachname>
    </Name>
    <Funktion>Marketing</Funktion>
  </Mitarbeiter>
  <Mitarbeiter>
    <Name Anrede="Herr">
      <Vorname>Markus</Vorname>
      <Nachname>Feder</Nachname>
    </Name>
    <Funktion>Webseite</Funktion>
  </Mitarbeiter>
  <Mitarbeiter>
    <Name Anrede="Herr">
      <Vorname>Thomas</Vorname>
      <Nachname>Gold</Nachname>
    </Name>
    <Funktion>Marketing</Funktion>
  </Mitarbeiter>
  <Mitarbeiter>
    <Name Anrede="Herr">
      <Vorname>Mischa</Vorname>
      <Nachname>Fingerflink</Nachname>
    </Name>
    <Funktion>Kundenberater</Funktion>
  </Mitarbeiter>
  <Mitarbeiter>
    <Name Anrede="Herr">
      <Vorname>Christian</Vorname>
      <Nachname>Ordinarius</Nachname>
    </Name>
    <Funktion>Kundenberater</Funktion>
  </Mitarbeiter>
  <Mitarbeiter>
    <Name Anrede="Herr">
      <Vorname>Anton</Vorname>
      <Nachname>Ebenhof</Nachname>
    </Name>
    <Funktion>Kundenberater</Funktion>
  </Mitarbeiter>
</Mitarbeiterliste>


*/