import net.sf.saxon.Configuration;
import net.sf.saxon.Controller;
import net.sf.saxon.instruct.UserFunction;

import net.sf.saxon.om.*;
import net.sf.saxon.query.*;

import net.sf.saxon.value.IntegerValue;
import net.sf.saxon.value.Value;

import net.sf.saxon.xpath.XPathEvaluator;
import net.sf.saxon.xpath.XPathException;

import javax.xml.transform.*;
import javax.xml.transform.stream.*;

import java.io.*;

import java.util.*;


public class QueryString {

	String parameter;	
	static String outputMethod;
	static Vector args;

	public QueryString(String queryfile, String file){
		new QueryString(queryfile,file,null);
	}

	public QueryString(String queryfile, String file, String param){

		this.parameter = param;		

	try{	

	
	FileInputStream fns = new FileInputStream(queryfile);
	byte[] dta = new byte[fns.available()];
	fns.read(dta);
	
	FileInputStream fins = new FileInputStream(file);
	byte[] data = new byte[fins.available()];
	fins.read(data);

        System.out.print(new String(QResult(data,new String(dta),param)));

	}catch(Exception e){System.out.println(e.getMessage());}
	    }

	
	    byte[] QResult(byte[] bitty, String query, String para) throws Exception {

	        final Configuration config = new Configuration();
	        final StaticQueryContext sqc = new StaticQueryContext(config);
	        final XQueryExpression exp = sqc.compileQuery(query);

	        final DynamicQueryContext dynamicContext = new DynamicQueryContext(config);
		if(para !=null) dynamicContext.setParameter("value", parameter);
	        dynamicContext.setContextNode(sqc.buildDocument(
		new StreamSource(new ByteArrayInputStream(bitty))));

	        final Properties props = new Properties();
	        props.setProperty(OutputKeys.INDENT, "yes");
	        props.setProperty(OutputKeys.METHOD, outputMethod);

		ByteArrayOutputStream jack = new ByteArrayOutputStream();

	        exp.run(dynamicContext, new StreamResult(jack), props);

		return jack.toByteArray();


    	}

	public static void main(String[] qubits){

	outputMethod = "html";

	int len = qubits.length;

if(len==0) {
	  System.out.println("Usage: queryfile sourcefile optionalParameter");
	  System.out.println("Append -method=(xml|html|text) to specify output type.");
	  System.out.println("Default method is html.");
	  System.exit(0);
	}

	args = new Vector(Arrays.asList(qubits));

	if(qubits[len-1].contains("=")){
		String qq = qubits[len-1];
		outputMethod = qq.substring(qq.indexOf("=")+1);
		args.remove(len-1);							
	}	
if(args.size()==2){
		new QueryString(qubits[0],qubits[1]);
} else {
		new QueryString(qubits[0],qubits[1],qubits[2]);
}

	}
     }
