package xpath;

import java.io.File;
import java.util.ArrayList;

import parser.MyXPathParserFGL;

public class XPathTest_322_01FGL {

	public static void main(String[] args) {
		//Momentan werden keine Übergabeparameter verarbeitet.
		//Diese Klasse dient der Konfiguration des MyXPathParserFGL.
		try{
			//Eclipse Workspace
			File f = new File("");
		    String sPathEclipse = f.getAbsolutePath();
		    System.out.println("Eclipse absolut path: " + sPathEclipse);
	        //String sPathParent = sPathEclipse.substring(0, sPathEclipse.lastIndexOf(System.getProperty("file.separator")));
	        String sBaseDirectory = sPathEclipse + File.separator + "file" +  File.separator + "03_XPath";
	                 
			//... Ab hier wie bei der Paremterübergabe im fertig gepackten .jar - File...
			if(sBaseDirectory.equals("")) throw new Exception("Kein Verzeichnis mit den .xml Dateien als Parameter angegeben (Leerstring).");		
			System.out.println("Directory to process: '" + sBaseDirectory + "'");
			
			String sFileName = "322_01.xml";
			System.out.println("File to process: '" + sFileName + "'");
			
			
			//############Die Beispiele aus dem Buch hier anwenden (Seite 128)
			//TODO: Der XPathParser müsste sich von einem Ergebnis zu einem anderen Bewegen können,
			//      so dass ein Array von Expressions ausgwertet werden kann. Dabei sind nachfolgende Strings im Array diejenigen, die auf das vorherige Ergebnis angewendet werden.
			//      Hintergrund: Momentan funktionieren von den Beispielen nur diejenigen, die vom Wurzelelement ausgehen!
			
			
			//+++ Nun die XPath - Ausdrücke, Merke: Groß-/Kleinschreibung ist wichtig.
			
			//A) Kind Achse
			//TODO Array für die Variablen verwenden. Bei expression wäre das sogar ein 2 dimensionales Array.
			String expressionDesc01 = "Finde ausgehend vom Wurzelknoten alle Erfolg Elemente im Dokument, beachte die beiden doppelten Doppelpunkte.";			
			String expression01 = "child::Erfolguebersicht/child::Erfolg";
			
			String expressionDesc02 = "Findet ausgehend vom Wurzelelement alle Gesamt-Elemente im Dokument in Dokumentenrichtung.";
			String expression02 = "child::Erfolguebersicht/child::Erfolg/child::Gesamt";
			
			String expressionDesc03 = "Findet ausgehend vom Wurzelelement Gesamt-, Neukunde- und Erfolg-Elemente in Dokumentenrichtung";
			String expression03 = "child::Erfolguebersicht/child::Erfolg/following::*";
			
			//B) Geschwister Achse
			
			String expressionDesc04 = "Findet ausgehend von einem Erfolg-Element die nachfolgenden Erfolg Geschwister.";
			//Merke: Als einzelner String liefert es kein sinnvolles Ergebnis. TODO: Klasse entsprechend anpassen.
			//       Darum wurde der Parser extra um die Array Verarbeitung erweitert.
			String[] expression04 = {"child::Erfolguebersicht/child::Erfolg","following-sibling::Erfolg"};
			
			String expressionDesc05 = "Findet ausgehend von einem Erfolg-Element die vorhergehenden Erfolg Geschwister.";
			String expression05 = "preceding-sibling::Erfolg";
			
			String expressionDesc06 = "Findet ausgehend von einem Erfolg-Element das Erfolguebersicht-Element.";
			String expression06 = "parent::*";
			
			String expressionDesc07 = "Findet ausgehend von einem Gesamt-Element sein Erfolg-Element als Elternelement und das Erfolguebersicht-Element.";
			String expression07 = "ancestor::*";
			
			//C) Nachfahren Achse
			
			String expressionDesc08 = "Findet ausgehend von einem Erfolg-Element die Elemente Gesamt und Neukunden in Dokumentenrichtung.";
			String expression08 = "descendant::*";
			
			String expressionDesc09 = "Findet ausgehend vom Wurzelelement alle Erfolg-Elemente und ihre Kinder.";
			String expression09 = "descendant::*";
			
			String expressionDesc10 = "Findet ausgehend vom Wurzelelement alle Gesamt-Elemente.";
			String expression10 = "descendant::Gesamt";
			
			
			//D) Attribut Achse
			
			String expressionDesc11 = "Findet ausgehend vom Wurzelelement alle Stadt Attribute.";
			String expression11 = "descendant::Erfolg/attribute::Stadt";
			
			String expressionDesc12 = "Findet ausgehend vom Wurzelelement alle Attribute in Erfolg.";
			String expression12 = "descendant::Erfolg/attribute::*";
			
			String expressionDesc13 = "Findet ausgehend von einem Erfolg-element das Attribut Monat in seinem Elternelement.";
			String expression13 = "parent::Erfolg/attribute::Monat";
			
			String expressionDesc14 = "Findet ausgehend von einem Erfolg-Element seine Attribute in Dokumentrichtung.";
			String expression14 = "attribute::*";
	
			
			//######################################
			//Prädikate, stehen in eckigen Klammern, dienen als "Feinsteuerung" der knotenlokalisierung
			//           und können ebenfalls wieder Pfade und Funktionen enthalten.
			//Siehe Buch Seiten 133ff
			//zu Abkürzungen, die hier verwendet werden, siehe buch Seite 129
			
			String expressionDesc15 = "Welche Erfolg-Elemente haben mehr als 10 Neukunden?";
			String expression15 = "//Erfolg[Neukunden>10]"; //Merke: // ist eine Abkürzung für /descendant-or-self::node()
			
			String expressionDesc16 = "Welche Städte in welchem Monat haben mehr als 10 Neukunden?";
			String expression16 = "//Erfolg[Neukunden>10]/attribute::*";
			
			//Todo GOON: Weitere Beispiele aus dem Buch Seite 135ff
			
			String sExpressionDesc = expressionDesc16; //Testfälle sind: 01, 04
			Object sExpression = expression16; //Kein Cast, damit man in der sExpression sowohl einen einfachen Stringa als auch ein Array verarbeiten kann
			
			
			
			//+++++++++++++++++++++++++++++++++++++++++++++++++++
			ArrayList<String> listaArgsForParser = new ArrayList<String>();
			listaArgsForParser.add((String) sBaseDirectory);
			listaArgsForParser.add((String) sFileName);
			listaArgsForParser.add((String) sExpressionDesc);
			
			if(sExpression instanceof String[]){
				for(String s : (String[])sExpression){
					listaArgsForParser.add(s);
				}
			}else{
				listaArgsForParser.add((String) sExpression);				
			}
			/* 			
You can use instanceof.
JLS 15.20.2 Type Comparison Operator instanceof

     RelationalExpression:
        RelationalExpression instanceof ReferenceType

    At run time, the result of the instanceof operator is true if the value of the RelationalExpression is not null and the reference could be cast to the ReferenceType without raising a ClassCastException. Otherwise the result is false.

That means you can do something like this:

Object o = new int[] { 1,2 };
System.out.println(o instanceof int[]); // prints "true"        

You'd have to check if the object is an instanceof boolean[], byte[], short[], char[], int[], long[], float[], double[], or Object[], if you want to detect all array types.

Also, an int[][] is an instanceof Object[], so depending on how you want to handle nested arrays, it can get complicated.

For the toString, java.util.Arrays has a toString(int[]) and other overloads you can use. It also has deepToString(Object[]) for nested arrays.

public String toString(Object arr) {
   if (arr instanceof int[]) {
      return Arrays.toString((int[]) arr);
   } else //...
}

It's going to be very repetitive (but even java.util.Arrays is very repetitive), but that's the way it is in Java with arrays.
See also

    Managing highly repetitive code and documentation in Java
    Java Arrays.equals() returns false for two dimensional arrays.

			 */
						
			String[] argsForParser = new String[listaArgsForParser.size()];
			argsForParser = listaArgsForParser.toArray(argsForParser);
			
			MyXPathParserFGL objParserFGL = new MyXPathParserFGL();		
			objParserFGL.startIt(argsForParser);
			
			
			} catch (Exception e) {
				e.printStackTrace(System.err);
			}

		}

}
