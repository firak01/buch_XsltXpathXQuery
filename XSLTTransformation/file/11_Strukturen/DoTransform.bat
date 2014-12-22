@echo off

AltovaXSLT2 -xsl C:\Dokumente und Einstellungen\Skulschus\Desktop\Buch_XSLT\Einsatz\Uebungen\1_Strukturen\MapTo212_03.xslt -xml C:\Dokumente und Einstellungen\Skulschus\Desktop\Buch_XSLT\Einsatz\Uebungen\1_Strukturen\212_01.xml -out C:\Dokumente und Einstellungen\Skulschus\Desktop\Buch_XSLT\Einsatz\Uebungen\1_Strukturen\212_03.xml  %*
IF ERRORLEVEL 1 EXIT/B %ERRORLEVEL%
