package xpath;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

 
public class MyXPathParserFGL {
	/* Aus dem TryOut Projekt übernommener Parser */
	
		public void MyXPathPaserFGL(){		
		}
		
		public boolean startIt(String[] args) {
			boolean bReturn = false;
			
			main:{
			try{	
				System.out.println("################################################");
				System.out.println("###       MyXPathParserFGL - neuer Lauf      ###");
				
				//Parameterübergabe (z.B. für ein gepacktes .jar - File
				String stemp = "Kein Verzeichnis mit den zur parsenden Dateien als Parameter angegeben";
				if(args==null) throw new Exception(stemp + " (args null).");
				if(args.length==0) throw new Exception(stemp + " (0).");
				if(args[0].equals("") || args[0]==null) throw new Exception(stemp + " (null)");
				
				stemp = "Keine zu parsende Datei angeben";
				if(args.length==1) throw new Exception(stemp + " (1).");
				if(args[1].equals("") || args[1]==null) throw new Exception(stemp + " (null)");
				
				stemp = "Kein beschreibender Ausdruck für das Ziel der Verarbeitung angegeben";
				if(args.length==2) throw new Exception(stemp + " (2).");
				if(args[2].equals("") || args[2]==null) throw new Exception(stemp + " (null)");
				
				stemp = "Keine XPath Ausdruck angeben";
				if(args.length==3) throw new Exception(stemp + " (3).");
				if(args[3].equals("") || args[3]==null) throw new Exception(stemp + " (null)");
				
				//Die Verzeichnisse dürfen maximal mit einem Leerzeichen versehen sein!
				String sBaseDirectory = new String("");
				String sFileName = new String("");
				String sExpressionDesc = new String("");
				String sXPathExpression = new String("");
				ArrayList<String> listasXPathExpression = new ArrayList();
				int iArgCount = -1;
				for(String s : args){
					iArgCount++;
					switch (iArgCount){
					case 0:
						sBaseDirectory = s;						
						break;
					case 1:
						sFileName = s;
						break;
					case 2:
						sExpressionDesc = s;
						break;
					default:
						sXPathExpression = s;
						listasXPathExpression.add(sXPathExpression);
						break;						
					}					
				}
			
			//########################################################
			//+++ Zuerst ein DOM-Document
			//1. DocumentBuilder Objekt
			DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = null;
			try{
				builder = builderFactory.newDocumentBuilder();
			}catch(ParserConfigurationException e){
				e.printStackTrace();
			}
			
			//2. Document Objekt
			System.out.println("Verarbeite Dokument: '" + sBaseDirectory + File.separator + sFileName + "'");
			Document document = null;			
			document = builder.parse(new FileInputStream(sBaseDirectory + File.separator + sFileName));
			
			//Alternative: XML String parsen, wäre so:
			//String sXml = "....";
			//document = builder.parse(new ByteArrayInputStream(xml.getBytes()));
			
			
			//3. Array aus den herausgefilterten Übergabeparametern bauen
			String[] saExpression = new String[listasXPathExpression.size()];
			saExpression = listasXPathExpression.toArray(saExpression);
			
						
			//Ziel ist es zuerst über Lokalisierungen zu einem Knoten zu gelangen.
			//An der "letzen" Lokalisierung angekommen, wird dann auch eine NodeList geholt
			System.out.println("Ausgabeziel: " + sExpressionDesc);
			
			XPath xPath=null;
			Node node=null;
			Node nodenew = null;		
			NodeList nodeList = null;
			int icounter=0;		
			
			//TODO: Das schreit nach Rekursion...
			Node nodeSub = null;
			NodeList nodeSubList = null;
			int icounterSub = 0;
			for(String expression : saExpression){
				sXPathExpression = expression; //Merke sXPathExpression steht auch ausserhalb der Schleife zur Verfügung und wird der letzte Ausdruck sein.		
				System.out.println("Expression: '" + expression + "'");
				xPath = XPathFactory.newInstance().newXPath();
				
				//FGL: Ein etwas (!) 'generischerer' Ansatz, d.h. von dem ausgwählten Ausdruck unabhängiger.
				//read an xml node using xpath
				//Beim 1. Durchlaufen der Schleife vom Dokument ausgehen.
				//Beim Weiteren Durchlaufen der Schleife von den zuvor lokalisierten Knoten ausgehen.
				if(node==null){
					System.out.println("Noch kein Node vorhanden. evaluiere vom Dokument aus.");
					nodenew = (Node) xPath.compile(expression).evaluate(document, XPathConstants.NODE);
				}else{
					//nodenew = (Node) xPath.compile(expression).evaluate(node, XPathConstants.NODE);
					
					//read an nodelist using xpath
					System.out.println("Node vorhanden. evaluiere von diesem Node aus.");
					nodeList = (NodeList) xPath.compile(sXPathExpression).evaluate(node, XPathConstants.NODESET);					
				}
				node = nodenew;
				
				if(nodeList!=null){
					icounter=0;
					for(int i = 0 ; i < nodeList.getLength(); i++){
						//System.out.println(i+1 + ". Unterknoten des Knotens: '" + nodeList.item(i).getFirstChild().getNodeValue() + "'");
						System.out.println(i+1 + ". Unterknoten des Knotens: '" + nodeList.item(i).getParentNode().getNodeName() + "'");
						nodeSub = nodeList.item(i);
						
						
						//+++ 
						//Wie bei nodelist==null
						//Wenn ein Stringwert zurückkommt, liefere diesen, ansonsten den Node-Wert (FGL-Erweiterung). Beachte die null-Überprüfung ist absichtlich so von der Reihenfolge her.		
						if(null != nodeSub && null != nodeSub.getNodeValue()){
							System.out.println("NodeSub - 'Name:Wert' | '" + nodeSub.getNodeName() +  ":" + nodeSub.getNodeValue() + "'");																					
						}else{
							if(nodeSub==null){
								String sValue = xPath.compile(expression).evaluate(document);
								System.out.println("NodeSub-Teil-Document evaluierung: String - Wert: '" + sValue + "'" );
							}else{
								System.out.println("NodeSub - 'Name:NULLwert' | '" + nodeSub.getNodeName() + "'");
								
								
								//read a String Value
								//Beim 1. Durchlaufen der Schleife vom Dokument ausgehen.
								//Beim Weiteren Durchlaufen der Schleife von den zuvor lokalisierten Knoten ausgehen.
								
								//TODO GOON: Ist diese erneute evaluierung nicht quatsch, man müsste eher nodeSub.getValue verwenden
								String sValue = xPath.compile(expression).evaluate(nodeSub);
								
								//Das gibt dann den String wert aller unterknoten aus...
								System.out.println("NodeSub-Teil-NodeSub evaluierung: String - Wert: '" + sValue + "'" );
							}
						}		
						
						
						
						if(nodeSub.getNodeType() == Node.ELEMENT_NODE){
							icounter++;
							System.out.println( icounter + ". Wert (" + i+1 + ". Knoten, Knotentname) | " + nodeList.item(i).getNodeName());
							
							//TODO GOON: Hier neu die Nodeliste ALLER Unterknoten holen
							//           theoretisch wäre das dann der Fall für die nächste Expression.
							//           Zum Code siehe unten die Verarbeitung ausserhalb der Schleife.
							nodeSubList = nodeSub.getChildNodes();
							icounterSub=0;
							for(int iSub = 0 ; nodeSubList != null && i < nodeSubList.getLength(); i++){					
								Node nodeSubSub = nodeSubList.item(i);
								if(nodeSubSub.getNodeType() == Node.ELEMENT_NODE){
									icounterSub++;
									System.out.println( "..... " + icounterSub + ". Wert (" + iSub+1 + ". Knoten, Knotentname:Wert erster Kindknoten) | " + nodeSubList.item(i).getNodeName() + " : " + nodeSubSub.getFirstChild().getNodeValue());
								}
							}
								
						}else{
							icounter++;
							System.out.println( icounter + ". Wert (" + i+1 + ". Knoten, Knotentname:Wert erster Kindknoten) | " + nodeList.item(i).getNodeName() + " : " + nodeSub.getFirstChild().getNodeValue());
						}
					}
				}else{

				
				
				//Wenn ein Stringwert zurückkommt, liefere diesen, ansonsten den Node-Wert (FGL-Erweiterung). Beachte die null-Überprüfung ist absichtlich so von der Reihenfolge her.		
//				if(null != node && null != node.getNodeValue()){
//					System.out.println("Node - Wert: '" + node.getNodeValue() + "'");
//				}else{
//					
//					//read a String Value
//					//Beim 1. Durchlaufen der Schleife vom Dokument ausgehen.
//					//Beim Weiteren Durchlaufen der Schleife von den zuvor lokalisierten Knoten ausgehen.
//					if(node==null){
//					String sValue = xPath.compile(expression).evaluate(document);
//					System.out.println("String - Wert: '" + sValue + "'" );
//					}else{
//						String sValue = xPath.compile(expression).evaluate(node);
//						System.out.println("String - Wert: '" + sValue + "'" );
//					}
//				}	
				if(saExpression.length>=2){
					System.out.println("Suche nach der Knotenliste erst ab der 2. Expression");				
				}else{
					System.out.println("Keine weitere Knotenliste gefunden.");
				}
				}//end if nodeList!= null
			}//end for expression
			
			if(xPath==null){
				bReturn = true;
				break main;
			}
			
			
			
			
			//XPath xPath = XPathFactory.newInstance().newXPath();
//Wann ist das sinnvoll????					
//			if(node==null){
//			 nodeList = (NodeList) xPath.compile(sXPathExpression).evaluate(document, XPathConstants.NODESET);
//			}else{
//				nodeList = (NodeList) xPath.compile(sXPathExpression).evaluate(node, XPathConstants.NODESET);
//			}
//			for(int i = 0 ; i < nodeList.getLength(); i++){
//				System.out.println(i+1 + ". Wert, erster Kindknoten: '" + nodeList.item(i).getFirstChild().getNodeValue() + "'");
//			}
			
			//TODO GOON Diese NodeList Verarbeitung wurde noch oben in die Schleife genommen.
			//          Was passiert, wenn es nur 1 XPath - Ausdruck gibt???
//			if(node!=null){
//				nodeList = node.getChildNodes();
//				icounter=0;
//					for(int i = 0 ; nodeList != null && i < nodeList.getLength(); i++){					
//						Node nodeSub = nodeList.item(i);
//						if(nodeSub.getNodeType() == Node.ELEMENT_NODE){
//							icounter++;
//							System.out.println( icounter + ". Wert (" + i+1 + ". Knoten, Knotentname:Wert erster Kindknoten) | " + nodeList.item(i).getNodeName() + " : " + nodeSub.getFirstChild().getNodeValue());
//						}
//					}
//				}
				bReturn = true;								
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (SAXException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace(System.err);				
			}
		}//end main:
			return bReturn;
		}

}
