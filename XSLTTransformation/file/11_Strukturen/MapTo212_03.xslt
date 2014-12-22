<?xml version="1.0" encoding="UTF-8"?>
<!--
This file was generated by Altova MapForce 2005

YOU SHOULD NOT MODIFY THIS FILE, BECAUSE IT WILL BE
OVERWRITTEN WHEN YOU RE-RUN CODE GENERATION.

Refer to the Altova MapForce 2005 Documentation for further details.
http://www.altova.com/mapforce
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/10/xpath-functions" exclude-result-prefixes="xs fn">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/Monatsliste">
		<Monatsliste>
			<xsl:attribute name="xsi:noNamespaceSchemaLocation">C:/DOKUME~1/Skulschus/Desktop/Buch_XSLT/Einsatz/Uebungen/1_Strukturen/212_03.xsd</xsl:attribute>
			<xsl:for-each select="Monat">
				<Monat>
					<xsl:for-each select="Datum">
						<Datum>
							<xsl:value-of select="."/>
						</Datum>
					</xsl:for-each>
					<xsl:for-each select="Kunden">
						<Kunden>
							<xsl:value-of select="."/>
						</Kunden>
					</xsl:for-each>
					<xsl:for-each select="Tarifliste">
						<Tarifliste>
							<xsl:for-each select="Tarif">
								<Tarif>
									<Umsatz>
										<xsl:for-each select="Pro-Kopf-Umsatz">
											<Pro-Kopf>
												<xsl:value-of select="."/>
											</Pro-Kopf>
										</xsl:for-each>
										<xsl:for-each select="Umsatz">
											<Gesamt>
												<xsl:value-of select="."/>
											</Gesamt>
										</xsl:for-each>
									</Umsatz>
									<Beschreibung>
										<xsl:for-each select="Name">
											<Name>
												<xsl:value-of select="."/>
											</Name>
										</xsl:for-each>
									</Beschreibung>
								</Tarif>
							</xsl:for-each>
						</Tarifliste>
					</xsl:for-each>
				</Monat>
			</xsl:for-each>
		</Monatsliste>
	</xsl:template>
</xsl:stylesheet>
