//-----------------------------------------------------------------------------
//----APRILS
//----A new version of the Prophet System;
//----Automated Prophesier of Relevance using Information from Latent Semantics
//----Alex Roederer
//----February 1st, 2009
//-----------------------------------------------------------------------------
#include "aprils.h"
//-----------------------------------------------------------------------------
//--UNNECESSARY?
#define APRILS
#define MAX_STRING_LENGTH 300000 
#define MAX_SYMBOL_NAME_LENGTH 250
#define MAX_FORMULA_LENGTH 150000
#define FLOAT_REDUCER 10000000
//-----------------------------------------------------------------------------
typedef struct {
    char *name; 
    int numberOfArguments; 
    int totalNumberOfOccurences; 
    int numberOfFormulaContaining; 
    float *relatedness; 
} SymbolProfile; 

typedef struct { 
    char *formula; 
    int totalNumberOfSymbols; 
    int importanceFactor; 
    float rating; 
    int *occurencesOfSymbol; 
} FormulaProfile;
//-----------------------------------------------------------------------------
//int printSymbolProfile(SymbolProfile *ToPrint,int max_symbols) {
//
//    int indexThroughRelatedness; 
//
//    printf("  Name of Symbol: %s\n",ToPrint->name); 
//    printf("  Number of Args: %i\n",ToPrint->numberOfArguments); 
//    printf("  Total frequenc: %i\n",ToPrint->totalNumberOfOccurences);
//    for(indexThroughRelatedness=0; indexThroughRelatedness < max_symbols; indexThroughRelatedness++) {
//        printf("    Relatedness%i: %f\n",indexThroughRelatedness,ToPrint->relatedness[indexThroughRelatedness]);
//    }
//
//    return 1; 
//}
//-----------------------------------------------------------------------------
//int printFormulaProfile(FormulaProfile *ToPrint,int max_symbols) {
//
//    int indexThroughSymbols; 
//
//    printf("Text of Formul: %s\n",ToPrint->formula); 
//    printf("Number o Symbl: %i\n",ToPrint->totalNumberOfSymbols);
//    printf("Importance Fac: %i\n",ToPrint->importanceFactor);
//    printf("Rating        : %f\n",ToPrint->rating);
//    for(indexThroughSymbols=0; indexThroughSymbols < max_symbols; indexThroughSymbols++) {
//        printf("Symb%i hasfreq: %i\n",indexThroughSymbols,ToPrint->occurencesOfSymbol[indexThroughSymbols]);
//    }
//
//    return 1; 
//}
//-----------------------------------------------------------------------------
//int printAllSymbols(SymbolProfile **ToPrint,int max_symbols) {
//
//    int index; 
//    
//    for(index=0; ToPrint[index] != NULL; index++) {
//        printSymbolProfile(ToPrint[index],max_symbols);
//    }
//
//    return 1;
//}
//-----------------------------------------------------------------------------
//int printAllFormula(FormulaProfile **ToPrint,int max_symbols) {
//
//    int index; 
//    
//    for(index=0; ToPrint[index] != NULL; index++) {
//        printFormulaProfile(ToPrint[index],max_symbols);
//    }
//
//    return 1;
//}
//-----------------------------------------------------------------------------
int clearFloatArray(float *Array,int length) {
    int index; 

    for(index = 0; index < length; index++) {
        Array[index] = 0.0; 
    }

    return 1; 
}
//-----------------------------------------------------------------------------
int clearIntArray(int *Array,int length) {
    int index; 

    for(index = 0; index < length; index++) {
        Array[index] = 0; 
    }

    return 1; 
}
//-----------------------------------------------------------------------------
int parseListOfSymbols(char *SymbolList,char **SymbolArray,int *TotalOccurences,int *ArityArray, int max_symbols) {

    char *SymbolUsageListCopy; 
    char *SymbolUsageListCopyLeft; 
    char *SymbolUsageListCopyRight; 

    char *OccurencesCopy;
    char *ArityCopy; 

    int SymbolIndex = 0; 
    int SymbolIndex2 = 0; 

    int Finished = 0; 

    SymbolUsageListCopy = SymbolList; 
    SymbolUsageListCopyLeft = SymbolUsageListCopy; 

    //Splits the provided string of symbols into an array of strings,
    //each entry containing one symbol/arity/frequency triplet. 
    while(!Finished && SymbolIndex < max_symbols) {

        SymbolUsageListCopyLeft = SymbolUsageListCopy; 
        SymbolIndex2 = 0; 

        while(*SymbolUsageListCopy != '\n' && *SymbolUsageListCopy != '\0') {
            SymbolUsageListCopy++; 
            SymbolIndex2++; 
        } 

        if (*SymbolUsageListCopy == '\0') {
            Finished = 1; 
        } else {
            *SymbolUsageListCopy = '\0'; 
        }

        if (SymbolIndex2 > 0) {
            SymbolUsageListCopyRight = SymbolUsageListCopy; 

            while(*SymbolUsageListCopyRight != '/') {
                SymbolUsageListCopyRight--;
                SymbolIndex2--; 
            }

            OccurencesCopy = SymbolUsageListCopyRight; 
            OccurencesCopy++; 
            *SymbolUsageListCopyRight = '\0'; 

            while(*SymbolUsageListCopyRight != '/') {
                SymbolUsageListCopyRight--;
                SymbolIndex2--; 
            }

            ArityCopy = SymbolUsageListCopyRight; 
            ArityCopy++; 
            *SymbolUsageListCopyRight = '\0'; 
                
            SymbolArray[SymbolIndex] = Malloc((SymbolIndex2 + 1) * sizeof(char)); 
            strncpy(SymbolArray[SymbolIndex], SymbolUsageListCopyLeft, SymbolIndex2); 
            SymbolArray[SymbolIndex][SymbolIndex2] = '\0'; 
            TotalOccurences[SymbolIndex] = atoi(OccurencesCopy);
            ArityArray[SymbolIndex] = atoi(ArityCopy);     

            SymbolIndex++; 
        }

        if (!Finished) {
            SymbolUsageListCopy++;
        } 
    }

    return SymbolIndex; 

}
//-----------------------------------------------------------------------------
int symbolNumber(char *ToFind,SymbolProfile **ArrayOfSymbols, int max_symbols) {
    int index = 0;

    while(ArrayOfSymbols[index] != NULL && index < max_symbols && strcmp(ArrayOfSymbols[index]->name,ToFind)) {
        index++; 
    }

    if (index >= max_symbols) {
        return -1; 
    } else {
        return index; 
    }

return 0; 
}
//-----------------------------------------------------------------------------
//int createArrayOfSymbolProfiles(SymbolProfile **SymbolProfilesArray,
//    char **SymbolArray,int *TotalOccurences,int *ArityArray,
//    int *totalNumberOfSymbols,int max_symbols) { 

//    int sProfileIndex; 

//Go through SymbolArray. For each entry,
//add a new entry in the SymbolProfile array, and set the name,values appropriately. 
//    for(sProfileIndex=0; sProfileIndex < max_symbols SymbolArray[sProfileIndex] != NULL; sProfileIndex++) {
//    for(sProfileIndex=0; sProfileIndex < max_symbols; sProfileIndex++) {}

//        SymbolProfilesArray[sProfileIndex] = Malloc(sizeof(SymbolProfile)); 
//        SymbolProfilesArray[sProfileIndex]->name = (char *)Malloc(MAX_SYMBOL_NAME_LENGTH*sizeof(char)); 
//        strcpy(SymbolProfilesArray[sProfileIndex]->name,SymbolArray[sProfileIndex]); 
//        SymbolProfilesArray[sProfileIndex]->totalNumberOfOccurences = TotalOccurences[sProfileIndex]; 
//        SymbolProfilesArray[sProfileIndex]->relatedness = (float *)Malloc((max_symbols)*(sizeof(float))); 
//        clearFloatArray(SymbolProfilesArray[sProfileIndex]->relatedness,max_symbols);
//        SymbolProfilesArray[sProfileIndex]->numberOfArguments = ArityArray[sProfileIndex]; 
//        SymbolProfilesArray[sProfileIndex]->numberOfFormulaContaining = 0; 
//        (*totalNumberOfSymbols)++;
//    }

//    return 1; 
//}
//-----------------------------------------------------------------------------
int destroyArrayOfSymbolProfiles(SymbolProfile **SymbolProfilesArray,int max_symbols) {

    int sProfileIndex; 

    for(sProfileIndex=0; sProfileIndex < max_symbols; sProfileIndex++) {
        Free((void **)&SymbolProfilesArray[sProfileIndex]->relatedness); 
        Free((void **)&SymbolProfilesArray[sProfileIndex]->name); 
        Free((void **)&SymbolProfilesArray[sProfileIndex]); 
    }

    return 1; 
}
//-----------------------------------------------------------------------------
int createArrayOfFormulaProfiles(FormulaProfile **FormulaProfilesArray,LISTNODE HeadOfFormulaList,SymbolProfile **SymbolProfilesArray,int *totalNumberOfFormula,int max_symbols,int max_formula) {

    int fProfileIndex; 
    int tempSymbolArrayIndex; 

    char *SymbolUsageInFormula;
    char *FuncsUsageInFormula; 

    char *TemporarySymbolArray[max_symbols]; 
    int OccurencesOfSymbolsInFormula[max_symbols];
    int ArityOfSymbolsInFormula[max_symbols];

    int SymbolCounter; 
    int PositionOfSymbol;  

    int numberOfSymbolsInFormula; 

    SymbolUsageInFormula = (char *)Malloc(max_symbols*MAX_SYMBOL_NAME_LENGTH*sizeof(char)); 
    FuncsUsageInFormula = (char *)Malloc(max_symbols*MAX_SYMBOL_NAME_LENGTH*sizeof(char)); 

//Now, we make a FormulaProfileArray, going through the list of formulas,
    for(fProfileIndex = 0; fProfileIndex < max_formula; fProfileIndex++) {

        FormulaProfilesArray[fProfileIndex] = (FormulaProfile *)Malloc(sizeof(FormulaProfile));
        FormulaProfilesArray[fProfileIndex]->formula = (char *)Malloc(MAX_FORMULA_LENGTH*sizeof(char)); 
        memset(FormulaProfilesArray[fProfileIndex]->formula,'\0',(size_t)(MAX_FORMULA_LENGTH*sizeof(char)));
        FormulaProfilesArray[fProfileIndex]->occurencesOfSymbol = (int *)Malloc((max_symbols)*sizeof(int));
        clearIntArray(FormulaProfilesArray[fProfileIndex]->occurencesOfSymbol,max_symbols); 
        PrintStringAnnotatedTSTPNode(FormulaProfilesArray[fProfileIndex]->formula,HeadOfFormulaList->AnnotatedFormula,tptp,1); 
//Sets importance factor and rating to zero. 
        FormulaProfilesArray[fProfileIndex]->importanceFactor = 0;
        FormulaProfilesArray[fProfileIndex]->rating = 0;

//for each formula, get the symbol usage in that formula. 
        GetAnnotatedFormulaSymbolUsage(HeadOfFormulaList->AnnotatedFormula,&SymbolUsageInFormula,&FuncsUsageInFormula); 

        numberOfSymbolsInFormula = parseListOfSymbols(SymbolUsageInFormula,TemporarySymbolArray,OccurencesOfSymbolsInFormula,ArityOfSymbolsInFormula,max_symbols);

        SymbolCounter = 0;

//Go through the symbols in that formula,
//Find that symbol's location in the main symbol list, log the occurences 
        for(tempSymbolArrayIndex = 0; tempSymbolArrayIndex < numberOfSymbolsInFormula; tempSymbolArrayIndex++) {

            PositionOfSymbol = symbolNumber(TemporarySymbolArray[tempSymbolArrayIndex],SymbolProfilesArray,max_symbols); 
            FormulaProfilesArray[fProfileIndex]->occurencesOfSymbol[PositionOfSymbol] = OccurencesOfSymbolsInFormula[tempSymbolArrayIndex];
            SymbolCounter += OccurencesOfSymbolsInFormula[tempSymbolArrayIndex]; 
        }
 
//Now we know the total number of symbols in this formula. 
        FormulaProfilesArray[fProfileIndex]->totalNumberOfSymbols = SymbolCounter;
        HeadOfFormulaList = HeadOfFormulaList->Next; 
        (*totalNumberOfFormula)++; 
    }

//    FormulaProfilesArray[fProfileIndex] = NULL;

    return 1; 
}
//-----------------------------------------------------------------------------
int destroyArrayOfFormulaProfiles(FormulaProfile **FormulaProfilesArray,int max_symbols,int max_formula) {

    int fProfileIndex; 

    for(fProfileIndex=0; fProfileIndex < max_formula; fProfileIndex++) {
        Free((void **)&FormulaProfilesArray[fProfileIndex]->occurencesOfSymbol); 
        Free((void **)&FormulaProfilesArray[fProfileIndex]->formula); 
        Free((void **)&FormulaProfilesArray[fProfileIndex]); 
    }

    return 1; 
}
//-----------------------------------------------------------------------------
int countSymbolOccurencesInFormula(SymbolProfile **SymbolProfilesArray,FormulaProfile **FormulaProfilesArray,int max_symbols,int max_formula) {

    int indexThroughSymbols;
    int indexThroughFormula; 
    int counter; 

//    for(indexThroughSymbols = 0;SymbolProfilesArray[indexThroughSymbols] != NULL; indexThroughSymbols++) {
    for(indexThroughSymbols = 0; indexThroughSymbols < max_symbols; indexThroughSymbols++) {
        counter = 0;
//        for(indexThroughFormula = 0;FormulaProfilesArray[indexThroughFormula] != NULL; indexThroughFormula++) {
        for(indexThroughFormula = 0; indexThroughFormula < max_formula; indexThroughFormula++) {
            if (FormulaProfilesArray[indexThroughFormula]->occurencesOfSymbol[indexThroughSymbols] > 0) {
                counter++; 
            }
        }
        SymbolProfilesArray[indexThroughSymbols]->numberOfFormulaContaining = counter;
    }

    return 1;
}
//-----------------------------------------------------------------------------
float compare(SymbolProfile *s1,SymbolProfile *s2) {
    float result; 
    int index; 

    index = 0; 
    result = 0;

    while(s1->relatedness[index] > 0) {
        result += (s1->relatedness[index] * s2->relatedness[index]); 
        index++;
    }

    return result; 
}
//-----------------------------------------------------------------------------
int normalizeSymbol(SymbolProfile *Symbol,int totalNumberOfSymbols) {

    int indexThroughRelatedness; 
    int quit; 
    float L2; 

    L2 = 0; 
    quit = 0; 
    
    for(indexThroughRelatedness=0; indexThroughRelatedness < totalNumberOfSymbols; indexThroughRelatedness++) {
        L2 += pow((float)Symbol->relatedness[indexThroughRelatedness],2); 
    }
//printf("L2: %f\n",L2); 

    if (!(L2 == L2) || L2 > FLT_MAX){
    //Exceeded, NAN generated, or
    //Exceeded, INF generated
        for(indexThroughRelatedness=0; indexThroughRelatedness < totalNumberOfSymbols; indexThroughRelatedness++) {
            Symbol->relatedness[indexThroughRelatedness] /= FLOAT_REDUCER; 
        } 
        normalizeSymbol(Symbol,totalNumberOfSymbols);    
    } else {
        for(indexThroughRelatedness=0; indexThroughRelatedness < totalNumberOfSymbols; indexThroughRelatedness++) {
//ERROR: IS THIS RIGHT? 
            if (L2 == 0) {
                Symbol->relatedness[indexThroughRelatedness] = 0; 
            } else {
                Symbol->relatedness[indexThroughRelatedness] /= (float)sqrt(L2); 
            }
//printf("S:%f\n",Symbol->relatedness[indexThroughRelatedness]); 
        }
    }
    return 1;
}
//-----------------------------------------------------------------------------
int normalizeVector(float *vector,int length) {
    int index; 
    float L2; 

    index = 0;
    L2 = 0; 
    
    for(index = 0; index < length; index++) {
        L2 += pow(vector[index],2); 
    }

    for(index = 0; index < length; index++) {
        if (L2 == 0) {
            vector[index] = 0; 
	} else {
            vector[index] /= (float)sqrt(L2); 
        }
    }

    return 1;
} 
//-----------------------------------------------------------------------------
int crossProduct(float *p, float *q, int length, float *relatedness) {
    int index; 

    for(index = 0; index < length; index++) {
        *relatedness += p[index] * q[index]; 
    }

    return 1;
}
//-----------------------------------------------------------------------------
int comparef(FormulaProfile *f1,FormulaProfile *f2,SymbolProfile **SymbolProfileArray,float *relatedness,int totalNumberOfSymbols) {
    int indexSt; 
    int indexSi; 
    float pvector[totalNumberOfSymbols];
    float qvector[totalNumberOfSymbols]; 

    clearFloatArray(pvector,totalNumberOfSymbols);
    clearFloatArray(qvector,totalNumberOfSymbols);

    for(indexSt = 0; indexSt < totalNumberOfSymbols; indexSt++) {
        for(indexSi = 0; indexSi < totalNumberOfSymbols; indexSi++) {
            pvector[indexSi] += f1->occurencesOfSymbol[indexSt] * SymbolProfileArray[indexSt]->relatedness[indexSi]; 
            qvector[indexSi] += f2->occurencesOfSymbol[indexSt] * SymbolProfileArray[indexSt]->relatedness[indexSi]; 
        }
    }

    normalizeVector(pvector,totalNumberOfSymbols);
    normalizeVector(qvector,totalNumberOfSymbols);

//int i;
//for (i = 0; i < totalNumberOfSymbols; i++) {
//printf("p: %f, q: %f\n",pvector[i], qvector[i]);  
//}

    crossProduct(pvector,qvector,totalNumberOfSymbols,relatedness); 

    return 1; 
}
//-----------------------------------------------------------------------------
float computeWeight(float a1, float a2, float nF1, float nF2, float t) {
    return (a1 * a2 * (1-(nF1-1)/(t-1)) * (1 -(nF1-1)/(t-1))); 
}
//-----------------------------------------------------------------------------
float computeStrangeWeight(float a1, float a2, float nF1, float nF2, float t) {
    return (a1 * a2 * (1-(nF1-1)/(t-1)) * (1 -(nF1-1)/(t-1))); 
}
//-----------------------------------------------------------------------------
int getSpecificListStatistics(LISTNODE ListHead,int *max_formula,int *max_symbols) {
    HeadListType HeadListNode;
    double predicates;
    double propositions;
    double minPredicateArity;
    double maxPredicateArity;
    double functors;
    double constants;
    double minfunctorarity;
    double maxfunctorarity;

    HeadListNode.TheList = ListHead;
    HeadListNode.Next = NULL;
    *max_formula = HeadListCount(&HeadListNode,nodes); 
    GetListSymbolUsageStatistics(&HeadListNode,&predicates,&propositions,&minPredicateArity,&maxPredicateArity,&functors,&constants,&minfunctorarity,&maxfunctorarity); 
    *max_symbols = (int)(predicates + functors); 

    return 1;
}
//-----------------------------------------------------------------------------
void killProcess(int TheSignal) {
    //The only time this gets called is when the alarm goes off
    int PPID;

    PPID = getpid();
    printf("<KILLED>\n"); 

    kill(PPID,SIGQUIT);
}
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
int main(int argc, char *argv[]) {

    char *FileName; 
    char *SymbolUsageList;
    char *FuncsUsage; 

    SymbolProfile **SymbolProfilesArray;
    FormulaProfile **FormulaProfilesArray;

    char *conjectureFormula; 

    int totalNumberOfFormula = 0;
    int totalNumberOfSymbols = 0;

    int max_formula; 
    int max_symbols;

    int symbolsFound; 

    LISTNODE HeadOfFormulaList;
    LISTNODE HeadOfConjectureList;
    SIGNATURE Signature; 

    char **SymbolArray;
    int *TotalOccurences;
    int *ArityArray; 

    int symbolIndex1;
    int symbolIndex2; 
    int symbolIndex3; 

    int sProfileIndex; 
    int fProfileIndex; 

    int conjectureIndex; 
    float formulaRelatedness; 
   
    float delta; 
    float mindelta; 
    float difference; 
    float storage; 
    int formulaCount; 
    float scale; 
    float rvalue; 
    float holder;
    float new_value;

//    int largestRelatedness; 
//    int indexThroughFinalProfiles;

    int timeoutValue; 

//-----------------------------------------------------------------------------
//----Process command line arguments, checks for validity, prints necessary
//----outputs
//-----------------------------------------------------------------------------

    //----Incorrect number of arguments provided. Print help
    if (argc < 2 || argc > 5 || (strcmp(argv[1],"--h") == 0)) {
        printf("aprils PROBLEM_FILE [SCALE_FACTOR [DELTA [TIMEOUT]]]\n");
        return(EXIT_SUCCESS);
    } else {
        FileName = argv[1]; 
    }

    //----If provided, get the scale factor. If not, set to .5
    if (argc < 3) {
        scale = .5;
    } else {
        scale = atof(argv[2]);
        if (scale > 1 || scale < 0) {
            printf("Bad scale argument");
            return(EXIT_SUCCESS); 
        }
    }

    //----If provided, get the minimum delta. If not, set to .1
    if (argc < 4) {
        mindelta = 0.01; 
    } else {
        mindelta = atof(argv[3]);
        if (mindelta <= 0) {
            printf("Bad delta argument");
            return(EXIT_SUCCESS); 
        }
    }

    //----If provided, set the timeout counter... this is unadvertised
    if (argc > 4) {
        timeoutValue = atoi(argv[4]); 
        if (signal(SIGALRM,killProcess) == SIG_ERR) {
            perror("Could not set SIGALRM handler");
        } else {
            if (timeoutValue > 0) {
                 alarm(timeoutValue); 
            }
        }
    }

//-----------------------------------------------------------------------------
//----Extract formula from file
//-----------------------------------------------------------------------------

    //----Generate a new signature for this session.---------------------------
    //----This is required by the JJParser to parse a formula list-------------
    Signature = NewSignature(); 
    //----Parse the file to extract the formulae-------------------------------
    HeadOfFormulaList = ParseFileOfFormulae(FileName,NULL,Signature,1,NULL); 

    //----Find the conjecture amongst the formula------------------------------
    if (ThereIsAConjecture(HeadOfFormulaList)) {
//----UNNECESSARY? 
        Signature = NewSignature(); 
    //----Find the conjecture--------------------------------------------------
    //----Get a duplicate list of the formula
        HeadOfConjectureList = 
            ParseFileOfFormulae(FileName,NULL,Signature,1,NULL); 
        //----Filter that list, choosing only conjectures
        HeadOfConjectureList = 
            (LISTNODE)SelectListOfAnnotatedFormulaeWithType(
                &HeadOfConjectureList,conjecture,0); 
        //----If no conjecture was found, (nothing is left after filtering)
        //----produce a new list, and filter for negated_conjectures
        if (HeadOfConjectureList == NULL) {
            HeadOfConjectureList = 
                ParseFileOfFormulae(FileName,NULL,Signature,1,NULL); 
            HeadOfConjectureList = 
                (LISTNODE)SelectListOfAnnotatedFormulaeWithType(
                    &HeadOfConjectureList,negated_conjecture,0); 
        }
        //----If no negated conjecture was found
        //----produce a new list, and filter for question
        if (HeadOfConjectureList == NULL) {
            HeadOfConjectureList = 
                ParseFileOfFormulae(FileName,NULL,Signature,1,NULL); 
            HeadOfConjectureList = 
                (LISTNODE)SelectListOfAnnotatedFormulaeWithType(
                    &HeadOfConjectureList,question,0); 
        }
        //----If nothing has been found by now, a severe arror has occured
        if (HeadOfConjectureList == NULL) {
            printf("Conjecture detected, but none found. ERROR\n"); 
            return EXIT_FAILURE; 
        }
    //----No conjecture was found in the list of formula. Cannot proceed.
    } else {
        printf("No conjecture found, please check problem file\n"); 
        return EXIT_FAILURE; 
    }
    //----Get a count of how many symbols and formula this problem has---------
    getSpecificListStatistics(HeadOfFormulaList,&max_formula,&max_symbols);
    //----If no formula found in the file, we exit with an error message-------
    if (max_formula < 1) {
        printf("No formula found, check file name\n");
        return EXIT_FAILURE; 
    }

//----HACK by Geoff to deal with no axioms, which causes a crash I can't fix
    if (max_formula == 1) {
        printf("%% SZS status Success for %s\n",FileName);
        printf("%% SZS output start ListOfFormulae for %s\n",FileName);
        AddUsefulInformationToAnnotatedFormula(HeadOfConjectureList->
AnnotatedFormula, Signature, "relevance(1.00)"); 
        PrintAnnotatedTSTPNode(stdout,HeadOfConjectureList->AnnotatedFormula,
tptp,1); 
        printf("%% SZS output end ListOfFormulae for %s\n",FileName);
        exit(EXIT_SUCCESS);
    }

//-----------------------------------------------------------------------------
//----Using the sizes found above, we count the occurances of the symbols
//----in all of the forumla
//-----------------------------------------------------------------------------

    conjectureFormula = (char *)Malloc(MAX_FORMULA_LENGTH*sizeof(char)); 
    memset(conjectureFormula,'\0',(size_t)(MAX_FORMULA_LENGTH*sizeof(char)));
    PrintStringAnnotatedTSTPNode(
        conjectureFormula,HeadOfConjectureList->AnnotatedFormula,tptp,1); 

    //----Define variables using the sizes found above-------------------------
    
    SymbolArray = (char **)Malloc(max_symbols*sizeof(char *)); 
    TotalOccurences = (int *)Malloc(max_symbols*sizeof(int)); 
    ArityArray = (int *)Malloc(max_symbols*sizeof(int)); 

    SymbolProfilesArray = Malloc(max_symbols*sizeof(SymbolProfile *));
    FormulaProfilesArray = Malloc(max_formula*sizeof(FormulaProfile *)); 

    float oldstvalue[max_symbols];
    int marked[max_formula]; 

    SymbolUsageList = (char *)Malloc(MAX_STRING_LENGTH*sizeof(char)); 
    FuncsUsage = (char *)Malloc(MAX_STRING_LENGTH*sizeof(char)); 

    //----Gets a list of the symbols in all the formulae-----------------------
    GetListOfAnnotatedFormulaSymbolUsage(
        HeadOfFormulaList,&SymbolUsageList,&FuncsUsage); 
    //----Parses the symbols into three arrays: an array containing symbol
    //----strings, an array containing freqencies, and an array 
    //----containing arities. 
    //Note that FuncsUsage will not free after this...
    symbolsFound = parseListOfSymbols(SymbolUsageList,SymbolArray,TotalOccurences,ArityArray,max_symbols);

    if (symbolsFound < max_symbols) {
        printf("Discrepancy between symbols counted and max symbols\n"); 
    }

    //----Create a SymbolProfileArray------------------------------------------
    //----Go through SymbolArray. For each entry,
    //----add a new entry in the SymbolProfile array, and set the name,values appropriately. 
    for(sProfileIndex=0; sProfileIndex < max_symbols; sProfileIndex++) {
        SymbolProfilesArray[sProfileIndex] = Malloc(sizeof(SymbolProfile)); 
        SymbolProfilesArray[sProfileIndex]->name = (char *)Malloc(MAX_SYMBOL_NAME_LENGTH*sizeof(char)); 
        strcpy(SymbolProfilesArray[sProfileIndex]->name,SymbolArray[sProfileIndex]); 
        SymbolProfilesArray[sProfileIndex]->totalNumberOfOccurences = TotalOccurences[sProfileIndex]; 
        SymbolProfilesArray[sProfileIndex]->relatedness = (float *)Malloc((max_symbols)*(sizeof(float))); 
        clearFloatArray(SymbolProfilesArray[sProfileIndex]->relatedness,max_symbols);
        SymbolProfilesArray[sProfileIndex]->numberOfArguments = ArityArray[sProfileIndex]; 
        SymbolProfilesArray[sProfileIndex]->numberOfFormulaContaining = 0; 
        totalNumberOfSymbols++;
    }

    //----Create a FormulaProfilesArray----------------------------------------

    createArrayOfFormulaProfiles(
        FormulaProfilesArray,HeadOfFormulaList,SymbolProfilesArray,
            &totalNumberOfFormula,max_symbols,max_formula);

    //----Free the Formula List, as it is not necessary any more---------------
    FreeListOfAnnotatedFormulae(&HeadOfConjectureList); 

    //----Fill in number of formula containing each symbol
    countSymbolOccurencesInFormula(
        SymbolProfilesArray,FormulaProfilesArray,max_symbols,max_formula); 

    Free((void **)&SymbolArray); 
    Free((void **)&TotalOccurences);
    Free((void **)&ArityArray); 

//    Free(&SymbolUsageList); 
//    Free(&FuncsUsage); 

//-----------------------------------------------------------------------------
//----Using the sizes found above, we count the occurances where two symbols
//----appear together in a forumla, and add them to the matrix
//-----------------------------------------------------------------------------


    //----For each symbol, we look at every other symbol, and look at where 
    //----those symbols appear together in a formula. 
    for(symbolIndex2 = 0;symbolIndex2 < max_symbols;symbolIndex2++) {
        for(symbolIndex1 = 0;symbolIndex1 < max_symbols;symbolIndex1++) {
            for(fProfileIndex = 0;fProfileIndex < max_formula;fProfileIndex++) {

                //----Each time they do, we compute a weight and add it to
                //----the "relatedness" value in the SymbolProfilesArray
                holder = computeWeight(
                    (float)FormulaProfilesArray[fProfileIndex]->
                        occurencesOfSymbol[symbolIndex2], 
                    (float)FormulaProfilesArray[fProfileIndex]->
                        occurencesOfSymbol[symbolIndex1],
                    (float)(SymbolProfilesArray[symbolIndex2]->
                        numberOfFormulaContaining),
                    (float)(SymbolProfilesArray[symbolIndex1]->
                        numberOfFormulaContaining),
                    (float)(totalNumberOfFormula)
                );

                SymbolProfilesArray[symbolIndex2]->
                    relatedness[symbolIndex1] += holder;
            }
        }
    }
    //----Now each symbol is "realted" to every other symbol by some value,
    //----contained in their relatedness arrays

    //----We normalize those values across the total number of Symbols present
    //----in all formulas. 
    for(symbolIndex2 = 0; symbolIndex2 < max_symbols; symbolIndex2++) {
        normalizeSymbol(SymbolProfilesArray[symbolIndex2], totalNumberOfSymbols); 
    }
    //----The values we have now obtained could be used to calculate 
    //----relatedness between formulas, but would produce only a flat 
    //----comparison, somewhat similar to that produced by Contextual
    //----direct relevance

//-----------------------------------------------------------------------------
//----The heart of the algorithm is here: here is where we compute how related
//----formula are, based on which symbols appear in them 
//----since each symbol has information on how related it is to every other
//----symbol, it's a matter of moving from the set of symbols that are
//----actually incluted, do the symbols THOSE symbols are related to, 
//----to the symbols THOSE symbols are related to, etc etc. 
//-----------------------------------------------------------------------------

    delta = 1; 
    formulaCount = 1; 

    //----There's question here as to whether we should ever iterate more than
    //----the max number of formulas. Geoff postulates that this should never
    //----be necessary. I'm not so sure...
    //ALTERNATE while(delta > 0.1) {
    while(delta > 0.1 && formulaCount < max_formula) {
        delta = 0; 

        //----Scale will be a number between 0 and 1, which will determine how
        //----much of an impact symbols have as they move farther away from 
        //----the original set. As the while loop... loops, formulaCount will
        //----increment, and the rvalue will get closer to 0. 
        rvalue = (float)pow(scale,formulaCount);

        //----Again we consider all pairs of symbols
        for(symbolIndex2 = 0; symbolIndex2 < max_symbols; symbolIndex2++) {
            for(symbolIndex3 = 0; symbolIndex3 < max_symbols; symbolIndex3++) {

                //----Save the previous relatedness value in oldstvalue
                //----Note that we are looking for how related symbol 3 is to
                //----symbol 2, so we save the value for 3 that wasy in the
                //----profile for 2. 
                oldstvalue[symbolIndex3] = 
                    SymbolProfilesArray[symbolIndex2]->
                        relatedness[symbolIndex3]; 
                new_value = 0.0; 

                //----For each symbol (1), we multiply how much 1 is related 
                //----to 2 by how much 3 is related to 1. This gets us a value
                //----comparing Symbo 2 and Symbol 3 by their respective 
                //----relations to each other symbol. 
                for(symbolIndex1 = 0; symbolIndex1 < max_symbols; 
                symbolIndex1++) {
                    storage = rvalue * 
                        (float)SymbolProfilesArray[symbolIndex2]->
                            relatedness[symbolIndex1] * 
                        (float)SymbolProfilesArray[symbolIndex1]->
                            relatedness[symbolIndex3]; 

                    //----The new value is this product added to whatever 
                    //----was in the relatedness before
                    new_value += 
                        storage; 
//                    ((1-rvalue) * 
//                        SymbolProfilesArray[symbolIndex2]->
//                            relatedness[symbolIndex3])
//                        + storage; 
                }

                SymbolProfilesArray[symbolIndex2]->relatedness[symbolIndex3] +=
                    new_value; 
            }           
            //----Now we have established relatedness between symbols that is 
            //----one "level" deep. 
            //----The new set of relatednesses is normalized 
            normalizeSymbol(
                SymbolProfilesArray[symbolIndex2], totalNumberOfSymbols); 
            //----To find how much the entire array has changed, we look at the
            //----difference between the old and new values in each position
            //----that amount of change gets added to the delta. The final delta
            //----will be the sum of the magnitudes of the changes... so if a
            //----single relatedness changed a lot, or they all changed a little,
            //----the delta will signify a relatively large change. 
            for(symbolIndex3 = 0; symbolIndex3 < max_symbols; symbolIndex3++) {
                difference = 
                    (oldstvalue[symbolIndex3] 
                    - SymbolProfilesArray[symbolIndex2]->
                            relatedness[symbolIndex3]);  
                if (difference < 0) {
                    delta -= difference; 
                } else if (difference > 0) {
                    delta += difference; 
                }  
            }
        }
        formulaCount++; 
    }

    fProfileIndex = 0; 
    conjectureIndex = -1; 

//-----------------------------------------------------------------------------
//----Now, we must find the location of the conjecture in the formula array,
//----so that all other formula can be compared to it. 
//----Really, there shoube a more efficient way of doing this.  
//-----------------------------------------------------------------------------

    for(fProfileIndex = 0; fProfileIndex < max_formula; fProfileIndex++) {
        if (!strcmp(
            FormulaProfilesArray[fProfileIndex]->formula,conjectureFormula)) {
            conjectureIndex = fProfileIndex; 
        }
    }
    //----If it's not found (which should not happen), we just use the first
    //----formula in thie list. 
    if (conjectureIndex < 0) {
        conjectureIndex = 0; 
    }

//-----------------------------------------------------------------------------
//----For each formula, we now compare its formula profile to the formula
//----profile of the conjecture. The number returned is stored, and the formula
//----is marked
//-----------------------------------------------------------------------------
    fProfileIndex = 0;
    while(fProfileIndex < max_formula) {
        formulaRelatedness = 0.0;
        comparef(FormulaProfilesArray[fProfileIndex],FormulaProfilesArray[conjectureIndex],SymbolProfilesArray,&formulaRelatedness,totalNumberOfSymbols); 
        FormulaProfilesArray[fProfileIndex]->rating = formulaRelatedness; 
        marked[fProfileIndex] = 1; 
        fProfileIndex++; 
    }

    Signature = NewSignature(); 

    char relinfo[100]; 
    ANNOTATEDFORMULA f; 
    LISTNODE FormulaList; 

    FormulaList = HeadOfFormulaList; 
    fProfileIndex = 0; 
    memset(conjectureFormula,'\0',(size_t)(MAX_FORMULA_LENGTH*sizeof(char)));        
    printf("%% SZS status Success for %s\n",FileName);
    printf("%% SZS output start ListOfFormulae for %s\n",FileName);
    while(fProfileIndex < max_formula) {
        f = FormulaList->AnnotatedFormula; 
        sprintf(relinfo, "relevance(%f)\n",FormulaProfilesArray[fProfileIndex]->rating); 
        AddUsefulInformationToAnnotatedFormula(f, Signature, relinfo); 
        PrintStringAnnotatedTSTPNode(conjectureFormula,f,tptp,1); 
        printf("%s", conjectureFormula);
        memset(conjectureFormula,'\0',(size_t)(MAX_FORMULA_LENGTH*sizeof(char)));        
        fProfileIndex++; 
        if (FormulaList->Next != NULL) {
            FormulaList = FormulaList->Next; 
        }
    }
    printf("%% SZS output end ListOfFormulae for %s\n",FileName);


    Free((void **)&conjectureFormula); 
    FreeListOfAnnotatedFormulae(&HeadOfFormulaList); 

    return(EXIT_SUCCESS); 
}
//-----------------------------------------------------------------------------
