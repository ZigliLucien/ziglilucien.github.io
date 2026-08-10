package Kravchuk;
import java.net.*;
import java.io.*;
import java.util.*;


public class KravServer  { 
    //Class

    ServerSocket ss;
    KravConnection Terry;

    public KravServer(int port,String propFile) throws IOException {
        ss = new ServerSocket(port);
	System.out.println("Starting server on port "+port);    
try{        while ( true ){ 
      Terry = new KravConnection( ss.accept(),propFile );
      Terry.start();
}}catch (IOException ioe){System.exit(0);}

    }
    public static void main(String [] qubits) throws Exception{
	
	int port = Integer.parseInt(qubits[0]);
	String pFile = qubits[1];
	           new KravServer(port,pFile);
  }

}

class KravConnection extends Thread{
    //Class Connection

    static final String [] domains   =
	 {"192.168.3","131.230.179","131.230.109","208.235.12"};
	//{"131.230.179","131.230.109","208.235.12"};

        Socket client; boolean acceptflag,fileflag;

    static FileInputStream fis;         
    static PrintWriter pout;

static		String request;

static	     OutputStream out;  
static	     BufferedReader in;

          String propertiesFile;
static    String datafile;
static    String stringProcessFile;
static    String sortFile;
 
    static Properties fileinfo = new Properties();

    static Commands runapp;

    KravConnection ( Socket client,String _propertiesFile ) throws SocketException {
        this.client = client;
        setPriority( NORM_PRIORITY - 1 );
        this.propertiesFile = _propertiesFile;

try{
	    InputStream infile = new FileInputStream(propertiesFile);

	    fileinfo.load(infile);
	    datafile = fileinfo.getProperty("datafile");
	    stringProcessFile = fileinfo.getProperty("stringProcessFile");
	    sortFile = fileinfo.getProperty("sortFile");
           } catch (Exception e){}
        
}


public boolean check (Socket clnt, String addrr) throws IOException{

     String checkinetdom;

        checkinetdom  = addrr.substring(1+addrr.indexOf("/"),addrr.lastIndexOf("."));

        acceptflag = false; 
	
	    for ( int i=0;i< domains.length;i++) {
		if (checkinetdom.equals(domains[i])){ System.out.println("OK domain");
                acceptflag = true;}
		    }
	    return acceptflag;
	} 



    public void run(){
	//run

        InetAddress addrss = client.getInetAddress();
	String addr        = addrss.toString();

	System.out.println("Connected to "+addr);
 
       try{
	   // try Out
	                 out = client.getOutputStream();
                        pout = new PrintWriter( 
                new OutputStreamWriter(out), true );

                           in = new BufferedReader( 
                new InputStreamReader(client.getInputStream()) );

 System.out.print((new Date()).toString()+" ");
			    if (!check(client,addr)) {
				// if(ok){
System.out.println("Address unaccepted.");
pout.println("Not Available.");
               client.close();
} else {
    // ELSE

                  request = in.readLine();

            StringTokenizer st = new StringTokenizer( request );

            if ( (st.countTokens() >= 2) && st.nextToken().equals("GET") ) {
		// Start GET

		request = st.nextToken() ; 
                   
		  if (request.endsWith("/")){
		      request = request.substring(0,request.lastIndexOf("/"));
		  }

                System.out.println("REQUEST: "+request);

                     // get file           

		    if(request.indexOf("?")>0){
			//Process QUERY_STRING

		runapp = new Commands(request);

		if( runapp !=null) {
                 runapp.go(runapp.which); 

                 if(runapp.result != null){
		     pout.println(runapp.result);         
           }
		}

		     //
	 
		    } else if(request.indexOf(".")>0){

           fis = new FileInputStream ( request );	

	   byte data[] = new byte[fis.available()];

	                   fis.read(data);
		           out.write( data );
	                   out.flush(); 

		    } else { 
 pout.println("<a href=/Kravchuk/Introduction.html> Go Here </a>");
		    }


	    }	

               client.close();
	    
            }  
    } catch(Exception e3){} 
}





static void doAuthenticate(){
pout.println("<html>\n<body>");
pout.println("<h1> Welcome to the Kravchuk Web Area </h1>");
pout.println("What's the next number in this series?<p> ");                   
pout.println("1,2,4,44, ...");
pout.println("<form method=get>");
pout.println("<input value=\"?\">");	 
pout.println("<input type=submit name=logos value=GO>");
pout.println("</form>");   
pout.println("<pre>\n\n\n\n\n</pre>");
pout.println("<form action=get>");
pout.println("<input size=23 name=logo value=\"Kravchuk or Krawtchouk?\">");
pout.println("<input type=submit value=GO>");
pout.println("</form>");
pout.println("<a href=\"Kravchuk/index.html\" Kravchuk Site </a>");

pout.println("</body>\n</html>");
}
}


