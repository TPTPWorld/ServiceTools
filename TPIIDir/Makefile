#----Set TPTP_HOME if not already imported from environment
TPTP_HOME ?= /home/tptp
JJPARSER = $(TPTP_HOME)/ServiceTools/JJParser

CC = gcc
#---- -I/usr/include/x86_64-linux-gnu for bits/libc-header-start.h and curl/curl.h
CFLAGS = -Wall -Wformat-overflow=0 -I/usr/include/x86_64-linux-gnu -I$(JJPARSER) -D TPTP_HOME=\"$(TPTP_HOME)\"
LFLAGS = -lcurl -lm -L/usr/lib/x86_64-linux-gnu

OBJS = $(JJPARSER)/ListStatistics.o $(JJPARSER)/List.o $(JJPARSER)/Examine.o $(JJPARSER)/Modify.o $(JJPARSER)/Tree.o $(JJPARSER)/TreeStatistics.o $(JJPARSER)/ParseTPTP.o $(JJPARSER)/ParseTSTP.o $(JJPARSER)/PrintTSTP.o $(JJPARSER)/Parsing.o $(JJPARSER)/Signature.o $(JJPARSER)/Tokenizer.o $(JJPARSER)/Utilities.o $(JJPARSER)/Compare.o $(JJPARSER)/Interpret.o $(JJPARSER)/PrintXML.o $(JJPARSER)/PrintSMT2.o $(JJPARSER)/PrintDFG.o $(JJPARSER)/PrintOtter.o $(JJPARSER)/PrintKIF.o $(JJPARSER)/PrintSUMO.o $(JJPARSER)/PrintLP.o $(JJPARSER)/PrintDK.o $(JJPARSER)/FileUtilities.o $(JJPARSER)/SystemOnTPTP.o $(JJPARSER)/Statistics.o

all: TPII

install: all
	mv TPII $(TPTP_HOME)/ServiceTools/TPII

TPII: $(OBJS) TPII.o
	$(CC) $(CFLAGS) -O6 -o $@ $(OBJS) TPII.o $(LFLAGS)

.c.o:
	$(CC) $(CFLAGS) -c -o $*.o $*.c

clean:
	rm -f *.o TPII
