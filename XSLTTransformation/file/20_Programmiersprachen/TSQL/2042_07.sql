DROP XML SCHEMA COLLECTION EmpList
GO
CREATE XML SCHEMA COLLECTION EmpList AS
N'<?xml version="1.0" standalone="yes"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"  elementFormDefault="qualified">
  <xs:element name="Emp">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="Emp-ID" type="xs:string"/>
        <xs:element name="Title" type="xs:string"/>
        <xs:element name="BirthDate" type="xs:string"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="Emp-List">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="Emp" maxOccurs="unbounded"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>'
GO
-- Typisiertes XML erstellen
DECLARE @empListXML xml (EmpList);
SET @empListXML = ( 
SELECT EmployeeID AS [Emp-ID],
       Title,
       BirthDate
  FROM HumanResources.Employee
 WHERE EmployeeID < 5
   FOR XML PATH('Emp'), ROOT('Emp-List'))
-- Typumwandlung
SELECT @empListXML.query('for $A in /Emp-List/Emp
 return 
  element Employee {
	element ID { $A/Emp-ID  cast as xs:int? },
	element BirthDate { $A/BirthDate cast as xs:dateTime? }
   }') as Result