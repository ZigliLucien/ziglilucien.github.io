package Kravchuk;
import javax.xml.transform.*;
import javax.xml.transform.stream.*;

import java.io.*;
import java.util.*;
import java.net.*;

import org.xml.sax.*;


public class Traxit {
    //Class

    static String directory;
    String stylefile;    
    String xsl;
    String parameter;
    String result;
    boolean stringer;

    public Traxit(String xml) throws Exception{
	this(xml,null,null,false);
    }

    public Traxit(String xml, String xsl, String _parameter, boolean _stringer)
            throws TransformerException, TransformerConfigurationException,
                   IOException, SAXException, FileNotFoundException {
	//Constructor

	this.stringer = _stringer;
	this.parameter = _parameter; 

	directory = System.getProperty("user.dir");
	 
	if(xsl == null) xsl = getXSL(xml);

          System.out.println("Using style file "+xsl);

        try {
            simpleTrans(xml, xsl);
        } catch (Exception ex) {ex.printStackTrace(); }

	//  System.out.println("\n DONE! \n");
    }

    public Traxit(String xml, String xsl)
	throws Exception {
	this(xml,xsl,null,false);
    }

    public Traxit(String xml, String xsl,String param)
	throws Exception {
	this(xml,xsl,param,false);
    }


    public void simpleTrans(String input, String xslID) throws IOException,TransformerException, TransformerConfigurationException , FileNotFoundException { 

	//Method simpleTrans

	StreamSource xmlin;

	InputStream xslIS = new BufferedInputStream(new FileInputStream(xslID));

	StreamSource ssrc = new StreamSource(xslIS,"file:"+xslID);

        TransformerFactory tfactory = TransformerFactory.newInstance();

        Transformer transformer = tfactory.newTransformer(ssrc);

        transformer.setParameter("value",this.parameter);
	
	if(this.stringer){
	xmlin = new StreamSource(new StringReader(input));
	} else {
	xmlin = new StreamSource(new FileReader(input));
	}

	xmlin.setSystemId("file:"+xslID);

	StringWriter jack = new StringWriter();

        // Transform the source XML to output

        transformer.transform(xmlin, new StreamResult(jack));
	jack.flush();jack.close();

	 this.result = jack.toString();
    }

    String getXSL(String input) throws IOException{

	BufferedReader src = new BufferedReader(new StringReader(input));
	String v; String stylefile=null;

while( (v=src.readLine()) !=null) {
    if (v.indexOf("?xml-stylesheet")>0){
	stylefile = v.substring(v.indexOf("href=")+6,v.lastIndexOf('"'));
	break;}
}

return stylefile;

    }

    public static void main(String args[]) throws Exception{
		if(args.length == 1 ) { new Traxit(args[0]); }
		if(args.length == 2 ) { new Traxit(args[0],args[1]); }
		if(args.length == 3 ) { new Traxit(args[0],args[1],args[2]); }
if(args.length == 4 ) { new Traxit(args[0],args[1],args[2],Boolean.getBoolean(args[3])); }
}

    }


