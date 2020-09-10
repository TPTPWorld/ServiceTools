#------------------------------------------------------------------------------
# FILE: Makefile
# AUTHOR: Yury Puzis
#------------------------------------------------------------------------------

CC = g++
#----Set TPTP_HOME if not already imported from environment
TPTP_HOME ?= /home/tptp
JDIR = $(TPTP_HOME)/ServiceTools/JJParser/
CFLAGS = -Wall -g -I$(JDIR) -static

JJ_HDR = $(JDIR)ListStatistics.o $(JDIR)List.o $(JDIR)Examine.o $(JDIR)Modify.o $(JDIR)Tree.o $(JDIR)TreeStatistics.o $(JDIR)ParseTPTP.o $(JDIR)ParseTSTP.o $(JDIR)PrintTSTP.o $(JDIR)Parsing.o $(JDIR)Signature.o $(JDIR)Tokenizer.o $(JDIR)Utilities.o $(JDIR)FileUtilities.o $(JDIR)PrintDFG.o $(JDIR)PrintOtter.o $(JDIR)PrintKIF.o $(JDIR)PrintXML.o $(JDIR)PrintSUMO.o $(JDIR)Interpret.o $(JDIR)Compare.o $(JJPARSER)/Statistics.o

all: prophet

prophet: $(JJ_HDR) prophet.o relevance.o isodata.o
	$(CC) $(CFLAGS) -Wno-deprecated -o prophet $(JJ_HDR) prophet.o relevance.o isodata.o

prophet.o: prophet.C $(JJ_HDR)
	$(CC) $(CFLAGS) -c prophet.C

isodata.o: isodata.h isodata.C
	$(CC) $(CFLAGS) -c isodata.C

relevance.o: relevance.h relevance.C isodata.h $(JJ_HDR)
	$(CC) $(CFLAGS) -c relevance.C

clean:
	rm -f *.o *~ $(JDIR)*.o

lc:
	wc -l *.C *.h *.pl
