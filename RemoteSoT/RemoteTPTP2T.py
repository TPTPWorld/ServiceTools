#!/usr/local/bin/python3
#--------------------------------------------------------------------------------------------------
import sys,requests,getopt
from typing import List, Tuple

TPTP2TFormReplyURL = "https://www.tptp.org/cgi-bin/TPTP2TFormReply"

USAGE = f"Usage: RemoteSOT <options> [<File name>]\n \
    <options> are ...\n \
    -v              --version    - print version information\n \
    -h --help       --help       - print this help\n \
    -q <quietness>  --quiet      - control amount of output\n \
    -p <print>      --print      - pp (problems), ps (solutions), pps (both)\n \
    -d '<domains>'  --domains    - list of domains in ''s\n \
    -f <form>       --form       - THF,TH1,TH0,TXF,TX1,TX0,TFF,TF1,TF0,FOF,CNF\n \
    -r <min>-<max>  --rating     - Min and Max in the range 0.00 to 1.00\n"

VERSION = f"{sys.argv[0]} version 1.0.0"

DEFAULT_URL_PARAMETERS = {
    "NoHTML": (None, '1'),
    "QuietnessOption1": (None, '-q2'),
    "PrintFlag1": (None, '-pps'),
    "Domains": (None,'X9X'),
    "Form": (None,'ANY')
    }
#--------------------------------------------------------------------------------------------------
def parseCommandLine(args: List[str]):

    urlParameters = DEFAULT_URL_PARAMETERS

    options, arguments = getopt.getopt(
#----Arguments
        args,
#----Short option definitions
        'vhq:p:d:f:r:',
#----Long option definitions
        ["version", "help", "quiet=", "print=", "domains=", "form=", "rating=" ])

    for option, parameter in options:
#DEBUG        print(f"Option is ==={option}=== Parameter is ==={parameter}===")
        if option in ("-v", "--version"):
            print(VERSION)
            sys.exit()
        if option in ("-h", "--help"):
            print(USAGE)
            sys.exit()
#    -q<quietness>   --quiet      - control amount of output\n \
        if option in ("-q", "--quiet"):
            urlParameters["QuietnessOption1"] = (None, '-q'+parameter)
        if option in ("-p", "--print"):
            urlParameters["PrintFlag1"] = (None, '-p'+parameter)
        if option in ("-d", "--domains"):
            urlParameters["Domains"] = (None, 'Domains '+parameter)
        if option in ("-f", "--form"):
            urlParameters["Form"] = (None, parameter)
        if option in ("-r", "--rating"):
            urlParameters["Rating"] = (None, 'Rating__')
            minMax = parameter.split("-")
            if len(minMax) != 2:
                print(USAGE)
                sys.exit()
            urlParameters["Rating1"] = (None, minMax[0])
            urlParameters["Rating2"] = (None, minMax[1])

    return urlParameters
#--------------------------------------------------------------------------------------------------
def main() -> None:

    args = sys.argv[1:]
    if not args:
        print(USAGE)
        sys.exit()
    urlParameters = parseCommandLine(args)

#DEBUG    print(urlParameters)
    requestResult = requests.post(TPTP2TFormReplyURL,files=urlParameters)
    print(requestResult.text)
#--------------------------------------------------------------------------------------------------
if __name__ == '__main__':
    main()
#--------------------------------------------------------------------------------------------------
