/* Daten */
INSERT INTO "SCOTT"."BERICHT"
 VALUES (1,
         'Kundenliste',
         XMLType('<xs:element name="Kundenliste" type="KundenlisteType" xmlns:xs="http://www.w3.org/2001/XMLSchema"/>'));

INSERT INTO "SCOTT"."XMLPAKET"
 VALUES (1,
         XMLType('<xs:complexType name="KundenlisteType" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:sequence>
      <xs:element name="Kunde" type="KundeType" maxOccurs="unbounded"/>
    </xs:sequence>
  </xs:complexType>'),
         XMLType('<xsl:template match="/Kundenliste" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <html>
      <head>
        <title>Kundenliste</title>
      </head>
      <body>
        <xsl:apply-templates select="Kunde"/>
      </body>
    </html>
  </xsl:template>'));
INSERT INTO "SCOTT"."XMLPAKET"
 VALUES (2,
         XMLType('<xs:complexType name="KundeType" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:sequence>
      <xs:element name="Name" type="NameType"/>
      <xs:element name="Adresse" type="AdresseType"/>
    </xs:sequence>
    <xs:attribute name="Nr" type="xs:string" use="required"/>
    <xs:attribute name="Anrede" use="required">
      <xs:simpleType>
        <xs:restriction base="xs:token">
          <xs:enumeration value="Herr"/>
          <xs:enumeration value="Frau"/>
        </xs:restriction>
      </xs:simpleType>
    </xs:attribute>
    <xs:attribute name="Beginn" type="xs:string" use="required"/>
  </xs:complexType>'),
         XMLType('<xsl:template match="Kunde" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <p>
      <xsl:value-of select="@Anrede"/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="Name"/>
      <br/>
      <xsl:apply-templates select="Adresse"/>
    </p>
  </xsl:template>'));
INSERT INTO "SCOTT"."XMLPAKET"
 VALUES (3,
         XMLType('<xs:complexType name="AdresseType" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:sequence>
      <xs:element name="Strasse" type="xs:string"/>
      <xs:element name="PLZ" type="xs:int"/>
      <xs:element name="Stadt" type="xs:string"/>
    </xs:sequence>
  </xs:complexType>'),
         XMLType('<xsl:template match="Adresse" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:value-of select="Strasse"/>
    <xsl:text> in </xsl:text>
    <xsl:value-of select="PLZ"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="Stadt"/>
  </xsl:template>'));
INSERT INTO "SCOTT"."XMLPAKET"
 VALUES (4,
         XMLType('<xs:complexType name="NameType" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:sequence>
      <xs:element name="Rufname" type="xs:string"/>
      <xs:element name="Zuname" type="xs:string"/>
    </xs:sequence>
  </xs:complexType>'),
         XMLType('<xsl:template match="Name" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:value-of select="Rufname"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="Zuname"/>
  </xsl:template>'));

INSERT INTO "SCOTT"."BERICHT_ZU_XMLPAKET"
 VALUES (1, 1, 1);
INSERT INTO "SCOTT"."BERICHT_ZU_XMLPAKET"
 VALUES (2, 1, 2);
INSERT INTO "SCOTT"."BERICHT_ZU_XMLPAKET"
 VALUES (3, 1, 3);
INSERT INTO "SCOTT"."BERICHT_ZU_XMLPAKET"
 VALUES (4, 1, 4);