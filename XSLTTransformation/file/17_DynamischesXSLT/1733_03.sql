CREATE OR REPLACE FUNCTION "SCOTT".getXSLT  (
 berichtsnr IN "SCOTT"."BERICHT"."B_NR"%TYPE)
 RETURN "SYS"."XMLTYPE"
IS
 -- Zwischenspeicher Rückgabewert
 v_XSLT VARCHAR2(32767);
 -- Cursor für Rückgabedaten
 CURSOR c_XSLT IS
  SELECT X_XSLT
    FROM "SCOTT"."XMLPAKET" xp
         INNER JOIN "SCOTT"."BERICHT_ZU_XMLPAKET" bzx
      ON xp."X_NR" = bzx."X_NR"
         INNER JOIN "SCOTT"."BERICHT" b
      ON b."B_NR" = bzx."B_NR"
   WHERE b."B_NR" = berichtsnr;
BEGIN
 -- Dokumentbeginn
 v_XSLT := '<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8"
indent="yes"/>';
 -- Auslesen des Cursors
 FOR x_daten IN c_XSLT LOOP
  v_XSLT := v_XSLT || x_daten.x_xslt.getClobVal();
 END LOOP;
 -- Dokumentschluss
 v_XSLT := v_XSLT || '</xsl:stylesheet>';
 -- Rückgabe
 RETURN XMLType(v_XSLT);
END getXSLT;