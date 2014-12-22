-- XML-Variable erstellen
DECLARE @productXML xml, @idoc int
-- XML abrufen
SET @productXML = (
SELECT ProductNumber AS "P-Nr", 
       Name          AS "Name", 
       StandardCost  AS "Prices/Standard",
       ListPrice     AS "Prices/List",
       Size          AS "Details/Size",
       Color         AS "Details/Color"
  FROM Production.Product
 ORDER BY ProductID DESC
FOR XML PATH('Product'), ROOT('Product-List'))
-- Standardzerlegung für alle Zeilen

SELECT @productXML.query('<Aggregate>
  <Mittelwert>{avg(/Product-List/Product/Prices/Standard) }</Mittelwert>
  <Summe>{sum(/Product-List/Product/Prices/Standard)}</Summe> 
  <Anzahl>Produkte:{count(/Product-List/Product)}</Anzahl>
  <Produkteliste-Minimum>{
   for $products in /Product-List/Product
   where $products/Prices/Standard = min(//Standard)
   return $products }</Produkteliste-Minimum>
  <Produktliste-Maximum>{
   for $products in /Product-List/Product
   where $products/Prices/Standard = max(//Standard)
   return $products}</Produktliste-Maximum></Aggregate>
 ') AS [Aggregate]

-- Ergebnis
/*
<Aggregate>
  <Mittelwert>258.602961309524</Mittelwert>
  <Summe>130335.8925</Summe>
  <Anzahl>Produkte:504</Anzahl>
  <Produkteliste-Minimum>
    <Product>
      <P-Nr>RC-0291</P-Nr>
      <Name>Rear Derailleur Cage</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
      <Details>
        <Color>Silver</Color>
      </Details>
    </Product>
    <Product>
      <P-Nr>TP-0923</P-Nr>
      <Name>Tension Pulley</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>TO-2301</P-Nr>
      <Name>Top Tube</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>ST-9828</P-Nr>
      <Name>Seat Tube</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>SS-2985</P-Nr>
      <Name>Seat Stays</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>SR-2098</P-Nr>
      <Name>Steerer</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>SP-2981</P-Nr>
      <Name>Seat Post</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>SM-9087</P-Nr>
      <Name>Stem</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>SL-0931</P-Nr>
      <Name>Seat Lug</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>SK-9283</P-Nr>
      <Name>Spokes</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>SH-9312</P-Nr>
      <Name>HL Shell</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>SH-4562</P-Nr>
      <Name>LL Shell</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>SD-9872</P-Nr>
      <Name>HL Spindle/Axle</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>SD-2342</P-Nr>
      <Name>LL Spindle/Axle</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>RM-T801</P-Nr>
      <Name>Touring Rim</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>RM-R800</P-Nr>
      <Name>HL Road Rim</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>RM-R600</P-Nr>
      <Name>ML Road Rim</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>RM-R436</P-Nr>
      <Name>LL Road Rim</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>RM-M823</P-Nr>
      <Name>HL Mountain Rim</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>RM-M692</P-Nr>
      <Name>ML Mountain Rim</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>RM-M464</P-Nr>
      <Name>LL Mountain Rim</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>RF-9198</P-Nr>
      <Name>Reflector</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>RA-7490</P-Nr>
      <Name>Cone-Shaped Race</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>RA-2345</P-Nr>
      <Name>Cup-Shaped Race</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>PB-6109</P-Nr>
      <Name>Pinch Bolt</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>PA-823Y</P-Nr>
      <Name>Paint - Yellow</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>PA-632U</P-Nr>
      <Name>Paint - Blue</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>PA-529S</P-Nr>
      <Name>Paint - Silver</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>PA-361R</P-Nr>
      <Name>Paint - Red</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>PA-187B</P-Nr>
      <Name>Paint - Black</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>NI-9522</P-Nr>
      <Name>HL Nipple</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>NI-4127</P-Nr>
      <Name>LL Nipple</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>MT-1000</P-Nr>
      <Name>Metal Tread Plate</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>MS-6061</P-Nr>
      <Name>Metal Sheet 1</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>MS-2348</P-Nr>
      <Name>Metal Sheet 6</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>MS-2341</P-Nr>
      <Name>Metal Sheet 5</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>MS-2259</P-Nr>
      <Name>Metal Sheet 4</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>MS-1981</P-Nr>
      <Name>Metal Sheet 7</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>MS-1256</P-Nr>
      <Name>Metal Sheet 3</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>MS-0253</P-Nr>
      <Name>Metal Sheet 2</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>MP-4960</P-Nr>
      <Name>Metal Plate 3</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>MP-2503</P-Nr>
      <Name>Metal Plate 1</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>MP-2066</P-Nr>
      <Name>Metal Plate 2</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>MB-6061</P-Nr>
      <Name>Metal Bar 2</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>MB-2024</P-Nr>
      <Name>Metal Bar 1</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>MA-7075</P-Nr>
      <Name>Metal Angle</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LW-9160</P-Nr>
      <Name>Lock Washer 11</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LW-8000</P-Nr>
      <Name>Lock Washer 3</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LW-7160</P-Nr>
      <Name>Lock Washer 9</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LW-6000</P-Nr>
      <Name>Lock Washer 2</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LW-5800</P-Nr>
      <Name>Lock Washer 12</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LW-5160</P-Nr>
      <Name>Lock Washer 7</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LW-4000</P-Nr>
      <Name>Lock Washer 1</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LW-3800</P-Nr>
      <Name>Lock Washer 8</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LW-3400</P-Nr>
      <Name>Lock Washer 13</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LW-1400</P-Nr>
      <Name>Lock Washer 6</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LW-1201</P-Nr>
      <Name>Lock Washer 10</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LW-1200</P-Nr>
      <Name>Lock Washer 5</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LW-1000</P-Nr>
      <Name>Lock Washer 4</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LR-8520</P-Nr>
      <Name>Lower Head Race</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LR-2398</P-Nr>
      <Name>Lock Ring</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
      <Details>
        <Color>Silver</Color>
      </Details>
    </Product>
    <Product>
      <P-Nr>LN-9161</P-Nr>
      <Name>Lock Nut 18</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-9080</P-Nr>
      <Name>Lock Nut 19</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-8320</P-Nr>
      <Name>Lock Nut 4</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-7162</P-Nr>
      <Name>Lock Nut 15</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-7161</P-Nr>
      <Name>Lock Nut 14</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-6320</P-Nr>
      <Name>Lock Nut 3</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-5818</P-Nr>
      <Name>Lock Nut 21</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-5811</P-Nr>
      <Name>Lock Nut 20</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-5400</P-Nr>
      <Name>Lock Nut 2</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-5162</P-Nr>
      <Name>Lock Nut 11</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-5161</P-Nr>
      <Name>Lock Nut 10</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-4400</P-Nr>
      <Name>Lock Nut 1</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-3824</P-Nr>
      <Name>Lock Nut 13</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-3816</P-Nr>
      <Name>Lock Nut 12</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-3416</P-Nr>
      <Name>Lock Nut 23</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-3410</P-Nr>
      <Name>Lock Nut 22</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-1428</P-Nr>
      <Name>Lock Nut 9</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-1420</P-Nr>
      <Name>Lock Nut 8</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-1224</P-Nr>
      <Name>Lock Nut 7</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-1220</P-Nr>
      <Name>Lock Nut 17</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-1213</P-Nr>
      <Name>Lock Nut 16</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-1032</P-Nr>
      <Name>Lock Nut 6</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LN-1024</P-Nr>
      <Name>Lock Nut 5</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LJ-9161</P-Nr>
      <Name>Thin-Jam Lock Nut 11</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LJ-9080</P-Nr>
      <Name>Thin-Jam Lock Nut 12</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LJ-7162</P-Nr>
      <Name>Thin-Jam Lock Nut 8</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LJ-7161</P-Nr>
      <Name>Thin-Jam Lock Nut 7</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LJ-5818</P-Nr>
      <Name>Thin-Jam Lock Nut 14</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LJ-5811</P-Nr>
      <Name>Thin-Jam Lock Nut 13</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LJ-5162</P-Nr>
      <Name>Thin-Jam Lock Nut 4</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LJ-5161</P-Nr>
      <Name>Thin-Jam Lock Nut 3</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LJ-3824</P-Nr>
      <Name>Thin-Jam Lock Nut 6</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LJ-3816</P-Nr>
      <Name>Thin-Jam Lock Nut 5</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LJ-3416</P-Nr>
      <Name>Thin-Jam Lock Nut 16</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LJ-3410</P-Nr>
      <Name>Thin-Jam Lock Nut 15</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LJ-1428</P-Nr>
      <Name>Thin-Jam Lock Nut 2</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LJ-1420</P-Nr>
      <Name>Thin-Jam Lock Nut 1</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LJ-1220</P-Nr>
      <Name>Thin-Jam Lock Nut 10</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LJ-1213</P-Nr>
      <Name>Thin-Jam Lock Nut 9</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LI-8000</P-Nr>
      <Name>Internal Lock Washer 2</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LI-7160</P-Nr>
      <Name>Internal Lock Washer 8</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LI-6000</P-Nr>
      <Name>Internal Lock Washer 1</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LI-5800</P-Nr>
      <Name>Internal Lock Washer 10</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LI-5160</P-Nr>
      <Name>Internal Lock Washer 6</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LI-3800</P-Nr>
      <Name>Internal Lock Washer 7</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LI-1400</P-Nr>
      <Name>Internal Lock Washer 5</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LI-1201</P-Nr>
      <Name>Internal Lock Washer 9</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LI-1200</P-Nr>
      <Name>Internal Lock Washer 4</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LI-1000</P-Nr>
      <Name>Internal Lock Washer 3</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LE-8000</P-Nr>
      <Name>External Lock Washer 2</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LE-7160</P-Nr>
      <Name>External Lock Washer 8</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LE-6000</P-Nr>
      <Name>External Lock Washer 1</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LE-5160</P-Nr>
      <Name>External Lock Washer 6</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LE-3800</P-Nr>
      <Name>External Lock Washer 7</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LE-1400</P-Nr>
      <Name>External Lock Washer 5</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LE-1201</P-Nr>
      <Name>External Lock Washer 9</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LE-1200</P-Nr>
      <Name>External Lock Washer 4</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>LE-1000</P-Nr>
      <Name>External Lock Washer 3</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>KW-4091</P-Nr>
      <Name>Keyed Washer</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HU-8998</P-Nr>
      <Name>HL Hub</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HU-6280</P-Nr>
      <Name>LL Hub</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HT-8019</P-Nr>
      <Name>Head Tube</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HT-2981</P-Nr>
      <Name>Handlebar Tube</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-9168</P-Nr>
      <Name>Hex Nut 19</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-9161</P-Nr>
      <Name>Hex Nut 18</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-8320</P-Nr>
      <Name>Hex Nut 4</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-7162</P-Nr>
      <Name>Hex Nut 15</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-7161</P-Nr>
      <Name>Hex Nut 14</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-6320</P-Nr>
      <Name>Hex Nut 3</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-5818</P-Nr>
      <Name>Hex Nut 21</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-5811</P-Nr>
      <Name>Hex Nut 20</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-5400</P-Nr>
      <Name>Hex Nut 2</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-5162</P-Nr>
      <Name>Hex Nut 11</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-5161</P-Nr>
      <Name>Hex Nut 10</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-4402</P-Nr>
      <Name>Hex Nut 1</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-3824</P-Nr>
      <Name>Hex Nut 13</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-3816</P-Nr>
      <Name>Hex Nut 12</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-3416</P-Nr>
      <Name>Hex Nut 23</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-3410</P-Nr>
      <Name>Hex Nut 22</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-1428</P-Nr>
      <Name>Hex Nut 9</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-1420</P-Nr>
      <Name>Hex Nut 8</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-1224</P-Nr>
      <Name>Hex Nut 7</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-1220</P-Nr>
      <Name>Hex Nut 17</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-1213</P-Nr>
      <Name>Hex Nut 16</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-1032</P-Nr>
      <Name>Hex Nut 6</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HN-1024</P-Nr>
      <Name>Hex Nut 5</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HJ-9161</P-Nr>
      <Name>Thin-Jam Hex Nut 11</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HJ-9080</P-Nr>
      <Name>Thin-Jam Hex Nut 12</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HJ-7162</P-Nr>
      <Name>Thin-Jam Hex Nut 8</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HJ-7161</P-Nr>
      <Name>Thin-Jam Hex Nut 7</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HJ-5818</P-Nr>
      <Name>Thin-Jam Hex Nut 14</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HJ-5811</P-Nr>
      <Name>Thin-Jam Hex Nut 13</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HJ-5162</P-Nr>
      <Name>Thin-Jam Hex Nut 4</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HJ-5161</P-Nr>
      <Name>Thin-Jam Hex Nut 3</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HJ-3824</P-Nr>
      <Name>Thin-Jam Hex Nut 6</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HJ-3816</P-Nr>
      <Name>Thin-Jam Hex Nut 5</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HJ-3416</P-Nr>
      <Name>Thin-Jam Hex Nut 16</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HJ-3410</P-Nr>
      <Name>Thin-Jam Hex Nut 15</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HJ-1428</P-Nr>
      <Name>Thin-Jam Hex Nut 2</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HJ-1420</P-Nr>
      <Name>Thin-Jam Hex Nut 1</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HJ-1220</P-Nr>
      <Name>Thin-Jam Hex Nut 10</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>HJ-1213</P-Nr>
      <Name>Thin-Jam Hex Nut 9</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>GT-2908</P-Nr>
      <Name>HL Grip Tape</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>GT-1209</P-Nr>
      <Name>ML Grip Tape</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>GT-0820</P-Nr>
      <Name>LL Grip Tape</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>GP-0982</P-Nr>
      <Name>Guide Pulley</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>FL-2301</P-Nr>
      <Name>Front Derailleur Linkage</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
      <Details>
        <Color>Silver</Color>
      </Details>
    </Product>
    <Product>
      <P-Nr>FC-3982</P-Nr>
      <Name>Front Derailleur Cage</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
      <Details>
        <Color>Silver</Color>
      </Details>
    </Product>
    <Product>
      <P-Nr>FC-3654</P-Nr>
      <Name>Fork Crown</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>FW-9160</P-Nr>
      <Name>Flat Washer 7</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>FW-7160</P-Nr>
      <Name>Flat Washer 5</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>FW-5800</P-Nr>
      <Name>Flat Washer 8</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>FW-5160</P-Nr>
      <Name>Flat Washer 3</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>FW-3800</P-Nr>
      <Name>Flat Washer 4</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>FW-3400</P-Nr>
      <Name>Flat Washer 9</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>FW-1400</P-Nr>
      <Name>Flat Washer 2</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>FW-1200</P-Nr>
      <Name>Flat Washer 6</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>FW-1000</P-Nr>
      <Name>Flat Washer 1</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>FH-2981</P-Nr>
      <Name>Freewheel</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
      <Details>
        <Color>Silver</Color>
      </Details>
    </Product>
    <Product>
      <P-Nr>FE-3760</P-Nr>
      <Name>Fork End</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>EC-T209</P-Nr>
      <Name>Touring End Caps</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>EC-R098</P-Nr>
      <Name>Road End Caps</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>EC-M092</P-Nr>
      <Name>Mountain End Caps</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>DT-2377</P-Nr>
      <Name>Down Tube</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>DC-9824</P-Nr>
      <Name>Decal 2</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>DC-8732</P-Nr>
      <Name>Decal 1</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>CS-2812</P-Nr>
      <Name>Chain Stays</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>CR-9981</P-Nr>
      <Name>Crown Race</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>CR-7833</P-Nr>
      <Name>Chainring</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
      <Details>
        <Color>Black</Color>
      </Details>
    </Product>
    <Product>
      <P-Nr>CN-6137</P-Nr>
      <Name>Chainring Nut</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
      <Details>
        <Color>Silver</Color>
      </Details>
    </Product>
    <Product>
      <P-Nr>CB-2903</P-Nr>
      <Name>Chainring Bolts</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
      <Details>
        <Color>Silver</Color>
      </Details>
    </Product>
    <Product>
      <P-Nr>CA-7457</P-Nr>
      <Name>HL Crankarm</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
      <Details>
        <Color>Black</Color>
      </Details>
    </Product>
    <Product>
      <P-Nr>CA-6738</P-Nr>
      <Name>ML Crankarm</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
      <Details>
        <Color>Black</Color>
      </Details>
    </Product>
    <Product>
      <P-Nr>CA-5965</P-Nr>
      <Name>LL Crankarm</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
      <Details>
        <Color>Black</Color>
      </Details>
    </Product>
    <Product>
      <P-Nr>BL-2036</P-Nr>
      <Name>Blade</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>BE-2908</P-Nr>
      <Name>Headset Ball Bearings</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>BE-2349</P-Nr>
      <Name>BB Ball Bearing</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>BA-8327</P-Nr>
      <Name>Bearing Ball</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
    <Product>
      <P-Nr>AR-5381</P-Nr>
      <Name>Adjustable Race</Name>
      <Prices>
        <Standard>0.0000</Standard>
        <List>0.0000</List>
      </Prices>
    </Product>
  </Produkteliste-Minimum>
  <Produktliste-Maximum>
    <Product>
      <P-Nr>BK-R93R-56</P-Nr>
      <Name>Road-150 Red, 56</Name>
      <Prices>
        <Standard>2171.2942</Standard>
        <List>3578.2700</List>
      </Prices>
      <Details>
        <Size>56</Size>
        <Color>Red</Color>
      </Details>
    </Product>
    <Product>
      <P-Nr>BK-R93R-52</P-Nr>
      <Name>Road-150 Red, 52</Name>
      <Prices>
        <Standard>2171.2942</Standard>
        <List>3578.2700</List>
      </Prices>
      <Details>
        <Size>52</Size>
        <Color>Red</Color>
      </Details>
    </Product>
    <Product>
      <P-Nr>BK-R93R-48</P-Nr>
      <Name>Road-150 Red, 48</Name>
      <Prices>
        <Standard>2171.2942</Standard>
        <List>3578.2700</List>
      </Prices>
      <Details>
        <Size>48</Size>
        <Color>Red</Color>
      </Details>
    </Product>
    <Product>
      <P-Nr>BK-R93R-44</P-Nr>
      <Name>Road-150 Red, 44</Name>
      <Prices>
        <Standard>2171.2942</Standard>
        <List>3578.2700</List>
      </Prices>
      <Details>
        <Size>44</Size>
        <Color>Red</Color>
      </Details>
    </Product>
    <Product>
      <P-Nr>BK-R93R-62</P-Nr>
      <Name>Road-150 Red, 62</Name>
      <Prices>
        <Standard>2171.2942</Standard>
        <List>3578.2700</List>
      </Prices>
      <Details>
        <Size>62</Size>
        <Color>Red</Color>
      </Details>
    </Product>
  </Produktliste-Maximum>
</Aggregate>
*/