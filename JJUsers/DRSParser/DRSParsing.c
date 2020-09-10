#include <stdio.h>
#include <assert.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include "DataTypes.h"
#include "Utilities.h"
#include "FileUtilities.h"
#include "Tokenizer.h"
#include "Parsing.h"
#include "Signature.h"
#include "Examine.h"
#include "Compare.h"
#include "Modify.h"
#include "List.h"
#include "Tree.h"
#include "ListStatistics.h"
#include "PrintTSTP.h"
#include "PrintDFG.h"
#include "PrintKIF.h"
#include "PrintOtter.h"
#include "PrintXML.h"
#include "SystemOnTPTP.h"
//-----------------------------------------------------------------------------
int main(int argc, char *argv[]) {

    SIGNATURE Signature;
    READFILE Stream; 
    ContextType Context;
    VARIABLENODE EndOfScope;
    TERM DRSTerm;

//----One signature for all testing
    Signature = NewSignature();
    Context.Variables = NULL;
    Context.Signature = Signature;
    EndOfScope = NULL;

    if ((Stream = OpenReadFile(argv[1],NULL)) == NULL) {
        return(EXIT_FAILURE);
    }

    DRSTerm = ParseTerm(Stream,nontype,Context,&EndOfScope,non_logical_data,
none,NULL,0);

    FreeSignature(&Signature);
    return(EXIT_SUCCESS);
}
//-----------------------------------------------------------------------------
