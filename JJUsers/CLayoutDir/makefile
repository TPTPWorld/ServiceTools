TPTP_HOME ?= /home/tptp

#---- Main JJParser location
JJPARSER = $(TPTP_HOME)/ServiceTools/JJParser
#---- Local JJParser location
#JJPARSER = ../JJParser

#----Must link static for WWW use. 
CFLAGS = -Wall -I$(JJPARSER) -static
CFLAGS = -Wall -I$(JJPARSER) 
LFLAGS = -lm
CC = g++ -g -Wno-deprecated
FILES = PrintSVG.cpp PrintSVG.h IDNode.cpp IDNode.h IDGraph.h IDGraph.cpp Point.h OSTree.h OSTree.cpp
OBJS = PrintSVG.o IDNode.o IDGraph.o IDEdge.o OSTree.o

JJ_OBJS = $(JJPARSER)/ListStatistics.o $(JJPARSER)/List.o $(JJPARSER)/Examine.o $(JJPARSER)/Modify.o $(JJPARSER)/Tree.o $(JJPARSER)/TreeStatistics.o $(JJPARSER)/ParseTPTP.o $(JJPARSER)/ParseTSTP.o $(JJPARSER)/PrintTSTP.o $(JJPARSER)/Parsing.o $(JJPARSER)/Signature.o $(JJPARSER)/Tokenizer.o $(JJPARSER)/Utilities.o $(JJPARSER)/Compare.o $(JJPARSER)/Interpret.o $(JJPARSER)/PrintXML.o $(JJPARSER)/PrintSMT2.o $(JJPARSER)/PrintDFG.o $(JJPARSER)/PrintOtter.o $(JJPARSER)/PrintKIF.o $(JJPARSER)/PrintSUMO.o $(JJPARSER)/FileUtilities.o $(JJPARSER)/SystemOnTPTP.o $(JJPARSER)/Statistics.o

CLayout: $(OBJS) $(JJ_OBJS) $(FILES) CLayout.o
	$(CC) $(CFLAGS) $(LFLAGS) -o CLayout CLayout.o $(JJ_OBJS) $(OBJS)

CLayout.o: CLayout.cpp $(FILES)
	$(CC) $(CFLAGS) -c CLayout.cpp

PrintSVG.o: PrintSVG.cpp PrintSVG.h
	$(CC) $(CFLAGS) -c PrintSVG.cpp

IDGraph.o: IDGraph.h IDGraph.cpp IDNode.h IDNode.cpp OSTree.h OSTree.cpp
	$(CC) $(CFLAGS) -c IDGraph.cpp

IDNode.o: IDNode.h IDNode.cpp PrintSVG.h PrintSVG.cpp OSTree.h OSTree.cpp
	$(CC) $(CFLAGS) -c IDNode.cpp

IDEdge.o: IDEdge.h IDEdge.cpp PrintSVG.h PrintSVG.cpp
	$(CC) $(CFLAGS) -c IDEdge.cpp

OSTree.o: OSTree.h OSTree.cpp
	$(CC) $(CFLAGS) -c OSTree.cpp

clean:
	rm -f *.o *~ a.out* CLayout
