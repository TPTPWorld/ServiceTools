//=============================================================================
import java.io.*;
import java.util.*;
import gnu.getopt.LongOpt;
import gnu.getopt.Getopt;
import java.net.*;
//-----------------------------------------------------------------------------
public class RemoteSOT {
//-----------------------------------------------------------------------------
    private static String SystemOnTPTPFormReplyURL = 
"http://www.cs.miami.edu/~tptp/cgi-bin/SystemOnTPTPFormReply";
//-----------------------------------------------------------------------------
    public static void main(String args[]){

        int intOption;
        char option;
        Hashtable Options = new Hashtable();
        Hashtable URLParameters = new Hashtable();

        URLParameters.put("NoHTML",new Integer(1));
        URLParameters.put("QuietFlag","-q2");
        URLParameters.put("SubmitButton","RunParallel");
        URLParameters.put("ProblemSource","TPTP");
        URLParameters.put("AutoModeTimeLimit",new Integer(300));
        URLParameters.put("AutoMode","-cE");
        URLParameters.put("AutoModeSystemsLimit",new Integer(3));
        URLParameters.put("X2TPTP","");

//----Get format and transform options if specified
        Getopt g = new Getopt("RemoteSOT",args,"wc:q:t:s:p:l:u:o:");
        while((intOption = g.getopt()) != -1) {
            option = (char)intOption;
            if (Options.containsKey(String.valueOf(option))) {
                Options.remove(String.valueOf(option));
            }
            if (option == 'w') {
                Options.put(String.valueOf(option),"");
            } else {
                Options.put(String.valueOf(option),g.getOptarg());
            }
//DEBUG System.out.println(option + " is ==" + Options.get(String.valueOf(option)) + "==");
        }

//----Transfer from Options to URLParameters
//----Quiet flag
        if (Options.containsKey("q")) {
            URLParameters.put("QuietFlag","-q" + Options.get("q"));
        }
//----What systems flag
        if (Options.containsKey("w")) {
            URLParameters.put("SubmitButton","ListSystems");
            URLParameters.remove("AutoMode");
            URLParameters.remove("AutoModeTimeLimit");
            URLParameters.remove("AutoModeSystemsLimit");
            URLParameters.remove("ProblemSource");
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
        if (Options.containsKey("o")) {
            if (Options.get("o").equals("TPTP")) {
                URLParameters.put("X2TPTP","-S");    
            }
        }
//----Password
        if (Options.containsKey("p")) {
            URLParameters.put("CPUPassword",Options.get("p"));
        }
//----Upload file name
        if (Options.containsKey("u")) {
            URLParameters.put("ProblemSource","UPLOAD");
            URLParameters.put("UPLOADProblem",readTextFile((String)Options.get("u")));
        }

//----Get single file name
        if (URLParameters.containsKey("ProblemSource")) {
            if (URLParameters.get("ProblemSource").equals("TPTP")) {
                if (args.length > g.getOptind()) {
                    URLParameters.put("TPTPProblem",args[g.getOptind()]);
                } else {
                    //die //----
                }
            }
        }

        try {
            URL url;
            URLConnection urlConn;
            DataOutputStream printout;
            DataInputStream input;
            String content = "";
            String replyLine;
            Iterator keyValueIterator;

            url = new URL(SystemOnTPTPFormReplyURL);
      
//----URL connection channel.
            urlConn = url.openConnection();
//----Let the run-time system (RTS) know that we want input.
            urlConn.setDoInput (true);
//----Let the RTS know that we want to do output.
            urlConn.setDoOutput (true);
//----No caching, we want the real thing.
            urlConn.setUseCaches (false);
//----Specify the content type.
            urlConn.setRequestProperty("Content-Type",
"application/x-www-form-urlencoded");

//----Send POST output.
            printout = new DataOutputStream (urlConn.getOutputStream ());
            keyValueIterator = URLParameters.keySet().iterator();
            while (keyValueIterator.hasNext()) {
                Object keyValue = keyValueIterator.next();
                content += URLEncoder.encode(keyValue.toString(),"UTF-8") + 
"=" + URLEncoder.encode(URLParameters.get(keyValue).toString(),"UTF-8") + "&";
            }
//DEBUG System.out.println("URL content ===" + content + "===");

            printout.writeBytes (content);
            printout.flush ();
            printout.close ();
      
//----Get response data.
            input = new DataInputStream (urlConn.getInputStream ());
//System.out.println("this is the data input stream");
            while (null != ((replyLine = input.readLine()))) {
                System.out.println(replyLine);
            }
//System.out.println("done reciving");
            input.close ();
        } catch (IOException ioe) {
            System.err.println("IOException: " + ioe.getMessage());
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

