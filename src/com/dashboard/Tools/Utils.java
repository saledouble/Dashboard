package com.dashboard.Tools;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerFactoryConfigurationError;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathFactory;
import static javax.xml.xpath.XPathConstants.*;

//import org.jsoup.Jsoup;
//import org.jsoup.nodes.Element;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;

public class Utils {
	
	/**
	 * update content of OriginalXML.xml
	 * @param str
	 */
	public static void updateXMLFile(String str){
		PrintWriter writer;
		try {
			
			writer = new PrintWriter("src/com/dashboard/model/OriginalXML.xml", "UTF-8");
			writer.print(str);
			writer.close();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
		}
	}
	
//	/**
//	 * remove all child nodes of the node
//	 * @param node
//	 */
//	public static void removeChilds(Node node) {
//	    while (node.hasChildNodes())
//	        node.removeChild(node.getFirstChild());
//	}
	
	/**
	 * get the table node from OriginalXML file
	 * and replace old table node in the TextResult.html
	 * @param tableOrder
	 */
	public static String updateHtmlFile(String tableOrder){

		try {

			InputSource xml = new InputSource("src/dataQuery/view/OriginalXML.xml");
			// get the table node from originalXML file
			XPath xpath = XPathFactory.newInstance()
					.newXPath();
			Node node = (Node) xpath.evaluate("//table-wrap[label = '"+ tableOrder 
					+"' ]", xml, NODE);	    
	    
			String newNode = convertNodetoString(node);
			
//			// add the table node into html file
//			File input = new File("src/dataQuery/view/TextResult.html");
//			org.jsoup.nodes.Document doc = Jsoup.parse(input, "UTF-8");
//			
//			for( Element element : doc.select("table-wrap"))
//			{
//			    element.remove();
//			}
//			
//			doc.body().append(newNode);
//
//			printInFile(input, doc);
			
			return newNode;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
		
	}
	
	private static String convertNodetoString(Node node){
		StringWriter writer = new StringWriter();
		Transformer transformer;
		try {
			transformer = TransformerFactory.newInstance().newTransformer();
			transformer.transform(new DOMSource(node), new StreamResult(writer));
			String newNode = writer.toString();
			newNode = newNode.substring(38);
			/////test
			//System.out.println("Node: " + newNode);
							
			return newNode;
		} catch (TransformerConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerFactoryConfigurationError e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (TransformerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	
//	/**
//	 * add the table node to html file
//	 * @param file
//	 * @param doc
//	 */
//	private static void printInFile(File file, org.jsoup.nodes.Document doc){
//		
//		PrintWriter writer;
//		try {
//			writer = new PrintWriter(file,"UTF-8");
//			writer.write(doc.html() ) ;
//			writer.flush();
//			writer.close();
//			
//		} catch (FileNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
	
}
