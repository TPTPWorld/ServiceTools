//=============================================================================
import java.io.*;
import java.util.*;
import gnu.getopt.LongOpt;
import gnu.getopt.Getopt;
import HTTPClient.*;
//-----------------------------------------------------------------------------
public class RemoteSOT {
//-----------------------------------------------------------------------------
    private static Scanner keyboard = new Scanner(System.in);
//----Note, using www.tptp.org does not work
    private static String SystemOnTPTPFormReplyURL = 
"http://www.cs.miami.edu/~tptp/cgi-bin/SystemOnTPTPFormReply";
    private static String SystemOnTPTPFormMakerURL = 
"http://www.cs.miami.edu/~tptp/cgi-bin/SystemOnTPTP";
//-----------------------------------------------------------------------------
    public static void main(String args[]){

        int intOption;
        char option;
        Hashtable Options = new Hashtable();
        Hashtable URLParameters = new Hashtable();
        File tempFile;
        BufferedWriter fileHandle;
        String line;

        URLParameters.put("NoHTML",new Integer(1));
        URLParameters.put("QuietFlag","-q2");
        URLParameters.put("SubmitButton","RunParallel");
        URLParameters.put("ProblemSource","UPLOAD");
        URLParameters.put("AutoModeTimeLimit",new Integer(300));
        URLParameters.put("AutoMode","-cE");
        URLParameters.put("AutoModeSystemsLimit",new Integer(3));
        URLParameters.put("X2TPTP","");

//----Get format and transform options if specified
        Getopt g = new Getopt("RemoteSOT",args,"hwq:t:c:l:s:o:p:a:");
        while((intOption = g.getopt()) != -1) {
            option = (char)intOption;
            if (Options.containsKey(String.valueOf(option))) {
                Options.remove(String.valueOf(option));
            }
            if (option == 'h') {
                System.out.println(
"Usage: java RemoteSOT <options> [<File name>]");
                System.out.println("<options> are ...");
                System.out.println("-h            - print this help");
                System.out.println("-w            - list available ATP systems");
                System.out.println("-q<quietness> - control amount of output");
                System.out.println("-t<timelimit> - CPU time limit for system");
                System.out.println("-c<automode>  - one of N, E, S");
                System.out.println("-l<syslimit>  - maximal systems for automode");
                System.out.println("-s<system>    - specified system to use");
                System.out.println("-o TPTP       - TPTP format output");
                System.out.println("-p<filename>  - TPTP problem name");
                System.out.println("<File name>   - if not TPTP problem");
                return;
            }
            if (option == 'w') {
                Options.put(String.valueOf(option),"");
            } else {
                Options.put(String.valueOf(option),g.getOptarg());
            }
//DEBUG System.out.println(option + " is ==" + Options.get(String.valueOf(option)) + "==");
        }

//----Transfer from Options to URLParameters
//----What systems flag
        if (Options.containsKey("w")) {
            URLParameters.put("SubmitButton","ListSystems");
            URLParameters.remove("AutoMode");
            URLParameters.remove("AutoModeTimeLimit");
            URLParameters.remove("AutoModeSystemsLimit");
            URLParameters.remove("ProblemSource");
        }
//----Quiet flag
        if (Options.containsKey("q")) {
            URLParameters.put("QuietFlag","-q" + Options.get("q"));
        }
//----Time limit
        if (Options.containsKey("t")) {
            URLParameters.put("AutoModeTimeLimit",Options.get("t"));
        }
//----Automode
        if (Options.containsKey("c")) {
            URLParameters.put("AutoMode","-c" + Options.get("c"));
        }
//----Systems limit
        if (Options.containsKey("l")) {
            URLParameters.put("AutoModeSystemsLimit",Options.get("l"));
        }
//----Selected system. Do after time limit as it gets moved across
        if (Options.containsKey("s")) {
            URLParameters.put("SubmitButton","RunSelectedSystems");
            URLParameters.put("System___" + Options.get("s"),Options.get("s"));
            URLParameters.put("TimeLimit___" + Options.get("s"),
URLParameters.get("AutoModeTimeLimit"));
            URLParameters.remove("AutoMode");
            URLParameters.remove("AutoModeTimeLimit");
            URLParameters.remove("AutoModeSystemsLimit");
        }
//----TSTP format output request
        if (Options.containsKey("o") && Options.get("o").equals("TPTP")) {
            URLParameters.put("X2TPTP","-S");    
        }
//----TPTP file name
        if (Options.containsKey("p")) {
            URLParameters.put("ProblemSource","TPTP");
            URLParameters.put("TPTPProblem",(String)Options.get("p"));
        }
//----Password
        if (Options.containsKey("a")) {
            URLParameters.put("CPUPassword",Options.get("a"));
        }

//----Get single file name
        if (URLParameters.containsKey("ProblemSource") &&
URLParameters.get("ProblemSource").equals("UPLOAD")) {
            if (args.length > g.getOptind() && 
!args[g.getOptind()].equals("--")) {
                URLParameters.put("UPLOADProblem",args[g.getOptind()]);
            } else {
//----Read from stdin
                try {
//----Create temporary file.
                    tempFile = File.createTempFile("RemoteSOT", ".p",
new File("/tmp"));
//----Delete temp file when program exits.
                    tempFile.deleteOnExit();
//----Write to temp file
                    fileHandle = new BufferedWriter(new FileWriter(tempFile));
                    while (keyboard.hasNext()) {
                        line = keyboard.nextLine();
                        fileHandle.write(line + "\n");
                    }
                    fileHandle.close();
// STRANGE WHY DO I HAVE TO ADD /tmp/ ON THE FRONT
                    URLParameters.put("UPLOADProblem","/tmp/" + tempFile.getName());
                } catch (IOException e) {
                    System.out.println("ERROR: Cannot create temporary file " + 
e.getMessage());
                }
            }
        }

        try {
//----Set up the uri according to the action attribute
            URI documentURI = new URI(SystemOnTPTPFormMakerURL);
            URI formURI = new URI(documentURI,SystemOnTPTPFormReplyURL);
            HTTPConnection connection = new HTTPConnection(formURI);

            NVPair[] files = new NVPair[1];
            NVPair[] options = new NVPair[20];
            NVPair[] headers  = new NVPair[1];
            byte[] formData;

            Iterator keyValueIterator;
            keyValueIterator = URLParameters.keySet().iterator();
            int optNumber = 0;
            while (keyValueIterator.hasNext()) {
                Object keyValue = keyValueIterator.next();
//----For the file upload, use file
                if (keyValue.toString().equals("UPLOADProblem")) {
                    files[0] = new NVPair("UPLOADProblem",
URLParameters.get(keyValue).toString());
                } else {
                    options[optNumber] = new NVPair(keyValue.toString(),
URLParameters.get(keyValue).toString());
                    optNumber++;
                }
            }
            formData = Codecs.mpFormDataEncode(options,files,headers);

//----POST the form data, as indicated by the method attribute
            HTTPResponse response = connection.Post(formURI.getPathAndQuery(),
formData,headers);
            if (response.getStatusCode() >= 300) {
                System.err.println("Received Error: "+response.getReasonLine());
                System.err.println(response.getText());
            } else {
                System.out.println(response.getText());
            }
        } catch (Exception ioe) {
            System.err.println("Exception: " + ioe.getMessage());
        }
    }
//-----------------------------------------------------------------------------
    private static String readTextFile(String fileName)  {

        BufferedReader fromBufferedReader;
        String fileContent;
        String line;

        try {
            fromBufferedReader = new BufferedReader(new FileReader(fileName));
            fileContent = "";
            while ((line = fromBufferedReader.readLine()) != null) {
                fileContent += line;
            }
            fromBufferedReader.close();
            return(fileContent);
        } catch (Exception e) {
            System.out.println("ERROR: Cannot upload " + fileName);
            return("");
        }
    }
//-----------------------------------------------------------------------------
}
//=============================================================================

