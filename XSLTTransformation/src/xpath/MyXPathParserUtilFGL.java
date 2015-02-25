package xpath;

import org.w3c.dom.Node;

public class MyXPathParserUtilFGL {
	public static String LABEL_DESCRIPTION_SEPARATOR = " | ";
	public static String LABEL_VALUE_SEPARATOR = " : ";
	
	public static String computeNodeDescription(Node objNode){
		return objNode.getNodeName() + "(" + objNode.getNodeType() + ")";
	}
	public static String computeNodeDescriptionLabel(){
		return "Name(Typ)";
	}
	
	
	public static String computeNode4ChildDescription(Node objParentNode){
		return MyXPathParserUtilFGL.computeNodeDescription(objParentNode); //Auch bei der Ausgabe des Kindknotens wg. 4(!)Child... hier den Parentnamen etc angeben.  
	}
	public static String computeNode4ChildDescriptionLabel(){
		return MyXPathParserUtilFGL.computeNodeDescriptionLabel();
	}
	
	
	public static String computeNodeValueDescription(Node objNode){
		String sLabel = MyXPathParserUtilFGL.computeNodeValueDescriptionLabel();
		String sDescr = MyXPathParserUtilFGL.computeNodeDescription(objNode);
		return sLabel + MyXPathParserUtilFGL.LABEL_DESCRIPTION_SEPARATOR + sDescr + MyXPathParserUtilFGL.LABEL_VALUE_SEPARATOR + objNode.getNodeValue(); 	
	}
	public static String computeNodeValueDescriptionLabel(){
		return MyXPathParserUtilFGL.computeNodeDescriptionLabel() + MyXPathParserUtilFGL.LABEL_VALUE_SEPARATOR + "Wert"; 
	}
	
	public static String computeNode4ChildValueDescription(Node objParentNode) {
		String sLabel = MyXPathParserUtilFGL.computeNode4ChildValueDescriptionLabel();
		String sDescr = MyXPathParserUtilFGL.computeNode4ChildDescription(objParentNode);
	
		//Merke: Diese Methode darf nur eingesetzt werden, wenn es sich im einen "Wertknoten" handelt, d.h. es kann keine weiteren Unterknoten mehr geben.
		return sLabel + MyXPathParserUtilFGL.LABEL_DESCRIPTION_SEPARATOR + sDescr + MyXPathParserUtilFGL.LABEL_VALUE_SEPARATOR + objParentNode.getFirstChild().getNodeValue();
	}
	public static String computeNode4ChildValueDescriptionLabel(){
		return MyXPathParserUtilFGL.computeNode4ChildDescriptionLabel() + MyXPathParserUtilFGL.LABEL_VALUE_SEPARATOR + "Kindwert"; 
	}
	
	
	public static String computeLineNode(Node objNode){
		return MyXPathParserUtilFGL.computeNodeDescriptionLabel() + MyXPathParserUtilFGL.LABEL_DESCRIPTION_SEPARATOR + MyXPathParserUtilFGL.computeNodeDescription(objNode);
	}
	public static String computeLineNodeValue(Node objNode){
		return MyXPathParserUtilFGL.computeNodeValueDescriptionLabel() + MyXPathParserUtilFGL.LABEL_DESCRIPTION_SEPARATOR + MyXPathParserUtilFGL.computeNodeValueDescription(objNode);
	}
	public static String computeLineNode4ChildValue(Node objParentNode){
		return MyXPathParserUtilFGL.computeNode4ChildValueDescriptionLabel() + MyXPathParserUtilFGL.LABEL_DESCRIPTION_SEPARATOR + MyXPathParserUtilFGL.computeNode4ChildValueDescription(objParentNode);
	}
	
}
