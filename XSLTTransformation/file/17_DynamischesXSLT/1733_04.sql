CREATE OR REPLACE FUNCTION "SCOTT".getXMLSchema  (
 berichtsnr IN "SCOTT"."BERICHT"."B_NR"%TYPE)
 RETURN "SYS"."XMLTYPE"
IS
 -- Zwischenspeicher Rückgabewert
 v_XMLSchema VARCHAR2(32767);
 -- Cursor für Rückgabedaten
 CURSOR c_XMLSchema IS
  SELECT X_XMLSchema
    FROM "SCOTT"."XMLPAKET" xp
         INNER JOIN "SCOTT"."BERICHT_ZU_XMLPAKET" bzx
      ON xp."X_NR" = bzx."X_NR"
         INNER JOIN "SCOTT"."BERICHT" b
      ON b."B_NR" = bzx."B_NR"
   WHERE b."B_NR" = berichtsnr;
 -- Text
 v_Text VARCHAR2(32767);
BEGIN
 -- Dokumentbeginn
 v_XMLSchema := '<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified">';
 SELECT "B_WURZEL" 
   INTO v_Text
   FROM "SCOTT"."BERICHT"
  WHERE "B_NR" = berichtsnr;
 v_XMLSchema := v_XMLSchema || v_Text;
 -- Auslesen des Cursors
 FOR x_daten IN c_XMLSchema LOOP
  v_XMLSchema := v_XMLSchema || x_daten.x_XMLSchema.getClobVal();
 END LOOP;
 -- Dokumentschluss
 v_XMLSchema := v_XMLSchema || '</xs:schema>';
 -- Rückgabe
 RETURN XMLType(v_XMLSchema);
END getXMLSchema;