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

import java.util.Properties;


public class Query {

	String parameter;	

	public Query(String queryfile, String file, String outfile){
		new Query(queryfile,file,outfile,null);
	}

	public Query(String queryfile, String file, String outfile, String param){

		this.parameter = param;

	try{	

	
	FileInputStream fns = new FileInputStream(queryfile);
	byte[] dta = new byte[fns.available()];
	fns.read(dta);
	
	String qry = new String(dta);

	FileInputStream fins = new FileInputStream(file);
	byte[] data = new byte[fins.available()];
	fins.read(data);

	FileOutputStream fout = new FileOutputStream(outfile);

		fout.write(QResult(data, qry, parameter));
		fout.flush();
		fout.close();

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
	        props.setProperty(OutputKeys.METHOD, "text");

		ByteArrayOutputStream jack = new ByteArrayOutputStream();

	        exp.run(dynamicContext, new StreamResult(jack), props);

		return jack.toByteArray();


    	}

	public static void main(String[] qubits){
if(qubits.length==3){
		new Query(qubits[0],qubits[1],qubits[2]);
} else {
		new Query(qubits[0],qubits[1],qubits[2],qubits[3]);
}

	}
     }
