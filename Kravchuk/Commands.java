package Kravchuk;
import java.io.*;
import java.util.*;

public class Commands {
    //Class

    String cmd;
    String result;

	     String testvalu,objectvalu;
	     String infoline;
	     StringTokenizer info;

             String value;
 
    static final String[] programs = {"Search","Mail","Perl","Java"};

       int which = 100 ;

    Commands(String _cmd) {
	// Constructor

         this.cmd = _cmd;
	 this.result = null;

         parseCmd();
}


    // local methods


    void parseCmd() {
	// parse the request

        	String infoline; 
                String apprun = null;	
		String infotok=null;


		boolean searching =  false;

	    infoline = cmd.substring(cmd.indexOf("?")+1);

			info = new StringTokenizer(infoline,"&");

	    while(info.hasMoreTokens()){
		infotok = info.nextToken();
		 testvalu = infotok.substring(0,infotok.indexOf("="));
		 objectvalu = infotok.substring(infotok.indexOf("=")+1);

		 if(testvalu.equals("Author")) searching = true;

		 if(searching) {
                 if(!objectvalu.equals("All")) {
		     if(value != null) {
			 value += "!"+objectvalu;
		     }else{
		     value = objectvalu; 
		     }
		 }
		 } else {

                 if(!testvalu.equals(objectvalu)) {
		     if(value != null) {
			 value += "!"+objectvalu;
		     }else{
		     value = objectvalu; 
		     }
		 }
	     }
	 }


	    if(value.indexOf("%40")>0) apprun = "Mail";
	    if(searching) apprun = "Search";
	    if(value.indexOf("go%2F")>0) apprun = "Perl";
	    if(value.indexOf("java%2F")>0) apprun = "Java";


	    for(int q=0;q<programs.length;q++){
		if(programs[q].equals(apprun)){
		    this.which = q;
		    break;
		}
	    }
	}

    void go(int whch) throws Exception {

	switch(whch) {

	case(0): searchem(value)          ;break;
	case(1): mailem(value)            ;break;
	case(2): goPerl(value)            ;break;
	case(3): goJava(value)            ;break;
	default: goJJ() ;
	}
    }


    // Application runs

void mailem(String val) throws Exception {

    String name = val.substring(0,val.indexOf("%"));
    String addr = val.substring(val.indexOf("%40")+3);

    String emailaddress = name+"@"+addr;

    PrintWriter mailer = new PrintWriter(new FileWriter("KMail.list",true),true);

    mailer.println(emailaddress);
    mailer.close();

    StringBuffer buffy = new StringBuffer();

buffy.append("<html><body>\n");
buffy.append("<h4>You are now subscribed to our mailing list.</h4>\n");
buffy.append("<a href=\"welcome.htm\"> Back to Kravchuk Welcome </a>\n");
buffy.append("</body></html>");

this.result = buffy.toString();
        }


    ///////////////////////////////////////////////////////////////

void searchem(String val) throws Exception{
    //Search it

    String datafile = KravConnection.datafile;
    String stringProcessFile = KravConnection.stringProcessFile;
    String sortFile = KravConnection.sortFile;

	StringTokenizer valley = new StringTokenizer(val,"!");

	int numtokens = valley.countTokens();

	Traxit[] transforms = new Traxit[numtokens];
        Traxit txresult = null;
 
	if( numtokens>1) {

	for(int q=0;q<numtokens;q++){
	    if(q==0){
 transforms[0] = new Traxit(datafile,stringProcessFile,valley.nextToken());	   
	    } 

if ((q>0) & (q<numtokens-1)){

transforms[q] = 
new Traxit(transforms[q-1].result,stringProcessFile,valley.nextToken(),true);

	    }                

if(q == numtokens-1) {

txresult = 
new Traxit(transforms[q-1].result,sortFile,valley.nextToken().toLowerCase(),true);

}
	}
	} else {

txresult = new Traxit(datafile,sortFile,valley.nextToken().toLowerCase());

	}

	String searchResults = txresult.result;

	if( searchResults != null ) {

this.result =  searchResults;          

	} else {

	    this.result =  "No matches found.";

	}
}

    //////////////////////////////////////////////////////////


     void goPerl(String val){

	 String runfile; String commandargs;

if(value.indexOf("+")>0){
 
runfile = "/Kravchuk/pl/"+value.substring(value.indexOf("go%2F")+5,value.indexOf("+"));
commandargs = value.substring(value.indexOf("+")+1);
commandargs = commandargs.replace('+','\u0020');
runfile += " "+commandargs;

          	        runIt(runfile);
	} else {

runfile = "/Kravchuk/pl/"+value.substring(value.indexOf("go%2F")+5);
          	        runIt(runfile);
                 
    }
     }


     void goJava(String val){

	 String runfile; String commandargs;

if(value.indexOf("+")>0){
 
runfile = 
"/Kravchuk/java/"+value.substring(value.indexOf("java%2F")+7,value.indexOf("+"));

commandargs = value.substring(value.indexOf("+")+1);

commandargs = commandargs.replace('+','\u0020');

runfile += " "+commandargs;

          	        runIt(runfile);
	} else {

runfile = "/Kravchuk/java/"+value.substring(value.indexOf("java%2F")+7);
          	        runIt(runfile);
                 
    }

    }


    void goJJ(){

	runIt("/Kravchuk/java/Test.class");
    }



    // RUN method

public  void runIt(String shellcommand){
               //runIt

try{
               Runtime local = Runtime.getRuntime();
               Process out   =  local.exec(shellcommand);
               DataInputStream infoout = new DataInputStream(out.getInputStream());
               DataInputStream errout = new DataInputStream(out.getErrorStream());
               StringWriter stringout = new StringWriter();

               for (int qq=0;(qq = infoout.read()) != -1;) {
                   stringout.write(qq);
               }
               for (int qq=0;(qq = errout.read()) != -1;) {
                   stringout.write(qq);
               }

               stringout.flush(); stringout.close();

               this.result = stringout.toString();

} catch (Exception e){this.result = e.getMessage();}

 }



}
