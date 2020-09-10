//-----------------------------------------------------------------------------
#define NUMBER_OF_RPRINTF_STRINGS 10
static char * RegisteredRfprintfStrings[NUMBER_OF_RPRINTF_STRINGS];
static int NumberOfRegisteredRfprintfStrings = 0;
//-----------------------------------------------------------------------------
int FindRegisteredRfprintfString(char * String) {

    int Index;
    
//----Search for the string 
    Index = 0;
    while (Index < NumberOfRegisteredRfprintfStrings &&
String != RegisteredRfprintfStrings[Index]) {
        Index++;
    }   
//----If found, then it's already registered
    if (Index < NumberOfRegisteredRfprintfStrings) {
        return(Index);
    } else {
        return(-1);
    }
}
//-----------------------------------------------------------------------------
int RegisterRfprintfString(char * String) {

    int Index;

//----If found, then it's already registered
    if ((Index = FindRegisteredRfprintfString(String)) >= 0) {
        return(0);
    }
//----If not found but no space, then error
    if (Index == NUMBER_OF_RPRINTF_STRINGS) {
        CodingError("Ran out of RegisteredRfprintfStrings");
        return(0);
    }
//----Otherwise save
    RegisteredRfprintfStrings[NumberOfRegisteredRfprintfStrings++] = String;
    strcpy(String,"");
    return(1);
}
//-----------------------------------------------------------------------------
int DeRegisterRfprintfString(char * String) {

    int Index;
    
//----If found, then shift down
    if ((Index = FindRegisteredRfprintfString(String)) >= 0) {
        Index++;
        while (Index < NumberOfRegisteredRfprintfStrings) {
            RegisteredRfprintfStrings[Index-1] = 
RegisteredRfprintfStrings[Index];
            Index++;
        }
        NumberOfRegisteredRfprintfStrings--;
        return(1);
    } else {
        return(0);
    }
}
//-----------------------------------------------------------------------------
void Rfprintf(FILE * Stream,char * Format,...) {

    int Index;
    String PartOfOutput;
    char * StringStream;
    va_list Data;

    va_start(Data,Format);
    StringStream = (char *) Stream;
//----If the pointer is registered as a string, sprintf, else fprintf
    if ((Index = FindRegisteredRfprintfString(StringStream)) >= 0) {
        if (vsnprintf(PartOfOutput,STRINGLENGTH,Format,Data) >= STRINGLENGTH) {
            CodingError("Component buffer overflow in string directed printf");
        }
//----Extremely dangerous - cannot tell if there's anough memory
        strcat(StringStream,PartOfOutput);
    } else {
        vfprintf(Stream,Format,Data);
    }
    va_end(Data);
}
//-----------------------------------------------------------------------------
