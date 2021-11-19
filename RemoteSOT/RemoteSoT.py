#!/usr/local/bin/python3
#--------------------------------------------------------------------------------------------------
import sys,requests,getopt
from typing import List, Tuple

SystemOnTPTPFormReplyURL = "http://www.tptp.org/cgi-bin/SystemOnTPTPFormReply"

USAGE = f"Usage: RemoteSOT <options> [<File name>]\n \
    <options> are ...\n \
    -v              --version    - print version information\n \
    -h --help       --help       - print this help\n \
    -w[<status>]    --what       - list available ATP systems\n \
    -rr             --recommend  - recommend ATP systems at level\n \
    -r<type><level> --report     - report type (i,c,s,t) at level (0,2)\n \
    -q<quietness>   --quiet      - control amount of output\n \
    -t<timelimit>   --time-limit - CPU time limit for system\n \
    -c<automode>    --auto       - one of N, E, S\n \
    -l<syslimit>    --limit      - maximal systems for automode\n \
    -s<system>      --system     - specified system to use\n \
    -f              --force      - force use of inappropriate system\n \
    -S              --tstp       - TSTP format output\n \
    -p<filename>    --problem    - TPTP problem name\n \
    -y<proxy:port>  --proxy      - use this proxy:port\n \
    <File name>                  - if not TPTP problem (-- for stdin)"
VERSION = f"{sys.argv[0]} version 1.0.0"

DEFAULT_URL_PARAMETERS = {
    "NoHTML": (None, '1'),
    "QuietFlag": (None, '-q1'),
    "SubmitButton": (None,'RunParallel'),
    "AutoMode": (None,'-cE'),
    "AutoModeSystemsLimit": (None,'3'),
    "AutoModeTimeLimit": (None,'300'),
    "X2TPTP": (None,''),
    "ProblemSource": (None,'UPLOAD')
    }
#--------------------------------------------------------------------------------------------------
def runRemoteSoT(urlParameters):

    print(urlParameters)

    requestResult = requests.post(SystemOnTPTPFormReplyURL,files=urlParameters)
    print(requestResult.text)
#--------------------------------------------------------------------------------------------------
def parseCommandLine(args: List[str]):

    urlParameters = DEFAULT_URL_PARAMETERS

    options, arguments = getopt.getopt(
#----Arguments
        args,
#----Short option definitions
        'vhfw:mr:q:t:c:l:s:SPp:a:y:',
#----Long option definitions
        ["version", "help", "what", "recommend", "report", "quiet", "time-limit", "auto", \
"limit", "system", "force", "tstp", "problem", "proxy" ])

    for option, parameter in options:
        print(f"Option is {option} Parameter is {parameter}")
        if option in ("-v", "--version"):
            print(VERSION)
            sys.exit()
        if option in ("-h", "--help"):
            print(USAGE)
            sys.exit()
        if option in ("-w", "--what"):
            urlParameters["SubmitButton"] = (None, 'ListSystems')
            if parameter:
                urlParameters["ListStatus"] = (None, 'parameter')
            else:
                urlParameters["ListStatus"] = (None, 'READY')
            del urlParameters['AutoMode']
            del urlParameters['AutoModeSystemsLimit']
            del urlParameters['AutoModeTimeLimit']
            urlParameters['ProblemSource'] = (None, 'TPTP')
        if option in ("-m", "--recommend"):
            urlParameters["SubmitButton"] = (None, 'RecommendSystems')
            urlParameters["ReportFlag"] = (None, '-q0')
#    -r<type><level> --report     - report type (i,c,s,t) at level (0,2)\n \
        if option in ("-r", "--report"):
            if parameter:
                if parameter == 'i':
                    urlParameters["SystemInfo"] = (None, '1')
                elif parameter == 'c':
                    urlParameters["Completeness"] = (None, '1')
                elif parameter == 's':
                    urlParameters["Soundness"] = (None, '1')
                elif parameter == 't':
                    urlParameters["TSTPData"] = (None, '')
#TOFIX
                urlParameters["ReportFlag"] = (None, '-q0')
            else:
                print(USAGE)
                sys.exit()
            del urlParameters['AutoMode']
            del urlParameters['AutoModeSystemsLimit']
            del urlParameters['AutoModeTimeLimit']
#    -q<quietness>   --quiet      - control amount of output\n \
        if option in ("-q", "--quiet"):
            if parameter:
                urlParameters["QuietFlag"] = (None, '-q'+parameter)
            else:
                print(USAGE)
                sys.exit()
#    -t<timelimit>   --time-limit - CPU time limit for system\n \
        if option in ("-t", "--time-limit"):
            if parameter:
                urlParameters["AutoModeTimeLimit"] = (None, parameter)
            else:
                print(USAGE)
                sys.exit()
#    -c<automode>    --auto       - one of N, E, S\n \
        if option in ("-c", "--auto"):
            if parameter:
                urlParameters["AutoMode"] = (None, '-c'+parameter)
            else:
                print(USAGE)
                sys.exit()
#    -l<syslimit>    --limit      - maximal systems for automode\n \
        if option in ("-l", "--limit"):
            if parameter:
                urlParameters["AutoModeSystemsLimit"] = (None, parameter)
            else:
                print(USAGE)
                sys.exit()
#    -s<system>      --system     - specified system to use\n \
        if option in ("-s", "--system"):
            if parameter:
                urlParameters["SubmitButton"] = (None, 'RunSelectedSystems')
                urlParameters["System___"+parameter] = (None, parameter)
                urlParameters["TimeLimit___"+parameter] = (None, urlParameters["AutoModeTimeLimit"])
            else:
                print(USAGE)
                sys.exit()
            del urlParameters['AutoMode']
            del urlParameters['AutoModeSystemsLimit']
            del urlParameters['AutoModeTimeLimit']
#    -f              --force      - force use of inappropriate system\n \
        if option in ("-f", "--force"):
            urlParameters["ForceSystem"] = (None, '-force')
#    -S              --tstp       - TSTP format output\n \
        if option in ("-S", "--tstp"):
            urlParameters["X2TPTP"] = (None, '-S')
#    -p<filename>    --problem    - TPTP problem name\n \
        if option in ("-p", "--problem"):
            if parameter:
                urlParameters["ProblemSource"] = (None, 'TPTP')
                urlParameters["TPTPProblem"] = (None, parameter)
            else:
                print(USAGE)
                sys.exit()
#    -y<proxy:port>  --proxy      - use this proxy:port\n \
        if option in ("-y", "--proxy"):
            if parameter:
#TODO not used yet
                ProxyAndPort = parameter
            else:
                print(USAGE)
                sys.exit()
#    <File name>                  - if not TPTP problem (-- for stdin)"
    if urlParameters["ProblemSource"][0] == 'UPLOAD':
        if arguments:
            urlParameters["UPLOADProblem"] = (None, arguments[0])
            print(f"The file is {urlParameters['UPLOADProblem']}")
        else:
            print(USAGE)
            sys.exit()

    return urlParameters
#--------------------------------------------------------------------------------------------------
def main() -> None:

    args = sys.argv[1:]
    if not args:
        print(USAGE)
        sys.exit()
    urlParameters = parseCommandLine(args)

    runRemoteSoT(urlParameters)
#--------------------------------------------------------------------------------------------------
if __name__ == '__main__':
    main()
#--------------------------------------------------------------------------------------------------
