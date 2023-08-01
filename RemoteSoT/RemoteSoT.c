//-------------------------------------------------------------------------------------------------
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <math.h>
#include <curl/curl.h>

#include "DataTypes.h"
#include "Utilities.h"
#include "FileUtilities.h"
#include "PrintTSTP.h"
#include "SystemOnTPTP.h"

#include "RemoteSoT.h"
//-------------------------------------------------------------------------------------------------
// DEFAULT_URL_PARAMETERS = {
//     "NoHTML": (None, '1'),
//     "QuietFlag": (None, '-q1'),
//     "SubmitButton": (None,'RunParallel'),
//     "AutoMode": (None,'-cE'),
//     "AutoModeSystemsLimit": (None,'3'),
//     "AutoModeTimeLimit": (None,'300'),
//     "X2TPTP": (None,''),
//     "ProblemSource": (None,'UPLOAD')
//     }
// //-------------------------------------------------------------------------------------------------
// int ProcessCommandLine(int argc,char * argv[],OptionsType * OptionValues) {
// 
//     int OptionChar;
// 
// //----Options for processing
//     OptionValues->Quietness = 1;
// //----What to do
//     OptionValues->SubmitButton = "
// 
//     while ((OptionChar = getopt(argc,argv,"hvq:ws:t:"))
// != -1) {
//         switch (OptionChar) {
// //----Options for processing
//             case 'q':
//                 OptionValues->Quietness = atoi(optarg);
//                 break;
// 
// //-------------------------------------------------------------------------------------------------
//         if option in ("-v", "--version"):
//             print(VERSION)
//             sys.exit()
//         if option in ("-h", "--help"):
//             print(USAGE)
//             sys.exit()
//         if option in ("-w", "--what"):
//             urlParameters["SubmitButton"] = (None, 'ListSystems')
//             if option == "--what":
//                 urlParameters["ListStatus"] = (None, parameter)
//             else:
//                 urlParameters["ListStatus"] = (None, 'READY')
//             del urlParameters['AutoMode']
//             del urlParameters['AutoModeSystemsLimit']
//             del urlParameters['AutoModeTimeLimit']
// //---Remove expectation of a file parameter
//             urlParameters['ProblemSource'] = (None, 'TPTP')
//         if option in ("-q", "--quiet"):
//             urlParameters["QuietFlag"] = (None, '-q'+parameter)
//         if option in ("-t", "--time-limit"):
//             urlParameters["AutoModeTimeLimit"] = (None, parameter)
//         if option in ("-s", "--system"):
//             urlParameters["SubmitButton"] = (None, 'RunSelectedSystems')
//             urlParameters["System___"+parameter] = (None, parameter)
//             urlParameters["TimeLimit___"+parameter] = (None, urlParameters["AutoModeTimeLimit"][1])
//             del urlParameters['AutoMode']
//             del urlParameters['AutoModeSystemsLimit']
//             del urlParameters['AutoModeTimeLimit']
//     -f              --force      - force use of inappropriate system\n
//         if option in ("-f", "--force"):
//             urlParameters["ForceSystem"] = (None, '-force')
//     -S              --tstp       - TSTP format output\n
//         if option in ("-S", "--tstp"):
//             urlParameters["X2TPTP"] = (None, '-S')
//     -p<filename>    --problem    - TPTP problem name\n
//         if option in ("-p", "--problem"):
//             urlParameters["ProblemSource"] = (None, 'TPTP')
//             urlParameters["TPTPProblem"] = (None, parameter)
//     <File name>                  - if not TPTP problem (-- for stdin)"
//     if urlParameters["ProblemSource"][1] == 'UPLOAD':
//         if arguments:
//             urlParameters["UPLOADProblem"] = open(arguments[0], 'r')
//         else:
//             print(USAGE)
//             sys.exit()
// 
//     return urlParameters
//-------------------------------------------------------------------------------------------------
size_t ReadCallback(void *TheReturnedData,size_t ElementSize,size_t NumberOfElements,
void *UserMemory) {

    printf("%s",(char *)TheReturnedData);

    return(0);
}
//-------------------------------------------------------------------------------------------------
int main(int argc,char * argv[]) {

    OptionsType OptionValues;
    CURL *CurlHandle;
    CURLcode CurlResult;
 
//    if (!ProcessCommandLine(argc,argv,&OptionValues)) {
//        QPRINTF(OptionValues,4)("ERROR: Invalid command line arguments\n");
//        exit(EXIT_FAILURE);
//    }
      OptionValues.Quietness = 1;

    curl_global_init(CURL_GLOBAL_ALL);
    CurlResult = 0;
    // ReturnInto.TheMemory = (char *)Malloc(1);
    // ReturnInto.Size = 0;
    if ((CurlHandle = curl_easy_init()) != NULL) {
        curl_easy_setopt(CurlHandle,CURLOPT_URL,SYSTEMONTPTP_FORMREPLY_URL);
        curl_easy_setopt(CurlHandle,CURLOPT_WRITEFUNCTION,ReadCallback);
        curl_easy_setopt(CurlHandle,CURLOPT_WRITEDATA,NULL);
        curl_easy_setopt(CurlHandle,CURLOPT_USERAGENT,"libcurl-agent/1.0");
        curl_easy_setopt(CurlHandle,CURLOPT_POSTFIELDS,"SubmitButton=ListSystems");
        CurlResult = curl_easy_perform(CurlHandle);
        if (CurlResult != CURLE_OK) {
            QPRINTF(OptionValues,4)("ERROR: curl failed: %s\n",curl_easy_strerror(CurlResult));
        }
        curl_easy_cleanup(CurlHandle);
    }
    curl_global_cleanup();
    // Free((void **)&(ReturnInto.TheMemory));
    if (CurlResult != CURLE_OK) {
        exit(EXIT_FAILURE);
    } else {
        return(EXIT_SUCCESS);
    }
}
//-------------------------------------------------------------------------------------------------
