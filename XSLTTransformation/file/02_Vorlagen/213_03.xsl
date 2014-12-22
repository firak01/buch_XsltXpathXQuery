<?xml version="1.0" encoding="UTF-8"?>
<html version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xsl:output method="html" indent="yes" encoding="ISO-8859-1"/>
  <head>
    <title>
      <xsl:template match="/Text/Gruss">
        <xsl:value-of select="."/>
      </xsl:template>
    </title>
  </head>
  <body>
    <xsl:template match="/Text/Gruss">
      <xsl:value-of select="."/>
    </xsl:template>
  </body>
</html>
