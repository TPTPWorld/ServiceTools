#------------------------------------------------------------------------------
# FILE: Makefile
# AUTHOR: Yury Puzis
#------------------------------------------------------------------------------

CC = g++
#MAINDIR	= ..
MAINDIR	= /home/graph/tptp/
JDIR	= $(MAINDIR)/ServiceTools/JJParser/
CDIR    = ../common/
CFLAGS = -Wall -g -I$(JDIR) -static

JJ_HDR = $(JDIR)ListStatistics.o $(JDIR)List.o $(JDIR)Examine.o $(JDIR)Modify.o $(JDIR)Tree.o $(JDIR)TreeStatistics.o $(JDIR)ParseTPTP.o $(JDIR)ParseTSTP.o $(JDIR)PrintTSTP.o $(JDIR)Parsing.o $(JDIR)Signature.o $(JDIR)Tokenizer.o $(JDIR)Utilities.o $(JDIR)FileUtilities.o $(JDIR)PrintDFG.o $(JDIR)PrintOtter.o $(JDIR)PrintKIF.o $(JDIR)PrintXML.o $(JDIR)PrintSUMO.o $(JDIR)Interpret.o $(JDIR)Compare.o

all: discover

discover: $(JJ_HDR) agint.o discover.o
	$(CC) $(CFLAGS) -Wno-deprecated -o $@ $(JJ_HDR) agint.o discover.o

ftest: $(JJ_HDR) agint.o ftest.o
	$(CC) $(CFLAGS) -Wno-deprecated -o $@ $(JJ_HDR) agint.o ftest.o

stest: $(JJ_HDR) agint.o stest.o
	$(CC) $(CFLAGS) -Wno-deprecated -o $@ $(JJ_HDR) agint.o stest.o

agint.o: agint.h agint.C $(JJ_HDR)
	$(CC) $(CFLAGS) -Wno-deprecated -c agint.C

stest.o: stest.C
	$(CC) $(CFLAGS) -Wno-deprecated -c stest.C

ftest.o: ftest.C
	$(CC) $(CFLAGS) -Wno-deprecated -c ftest.C

discover.o: discover.C
	$(CC) $(CFLAGS) -Wno-deprecated -c discover.C

clean:
	rm -f *.o *~ $(JDIR)*.o

lc:
	wc -l *.C *.H *.h
