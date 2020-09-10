#ifndef SIGNATURE_H
#define SIGNATURE_H
//-----------------------------------------------------------------------------
#include "DataTypes.h"
//-----------------------------------------------------------------------------
SIGNATURE DuplicateSignature(SIGNATURE Original);
void FreeSignature(SIGNATURE * Signature);
int RemovedUnusedSymbols(SIGNATURE Signature);
SIGNATURE NewSignature(void);
char * GetSignatureSymbol(SYMBOLNODE SymbolNode);
char * GetSignatureShortSymbol(SYMBOLNODE SymbolNode);
int GetSignatureArity(SYMBOLNODE SymbolNode);
void IncreaseSymbolUseCount(SYMBOLNODE Symbol,int HowMuch);
int GetSignatureUses(SYMBOLNODE SymbolNode);
SYMBOLNODE IsSymbolInSignatureList(SYMBOLNODE List,char * Name,int Arity);
SYMBOLNODE InsertIntoSignatureList(SYMBOLNODE * List,char * Name,int Arity,
READFILE Stream);
SYMBOLNODE InsertIntoSignature(SIGNATURE Signature,TermType Type,
char * Name,int Arity,READFILE Stream);
SYMBOLNODE NextInSignatureTree(SYMBOLNODE SignatureTree,SYMBOLNODE Current);
void ListSignatureBySearch(SYMBOLNODE SignatureTree);
void PrintSignatureTree(SYMBOLNODE SignatureTree);
void PrintSignature(SIGNATURE Signature);
char * GetSignatureSymbolUsage(SIGNATURE Signature,char ** PutUsageHere,
char ** FunctorUsageStartsHere);
void GetSignatureSymbolUsageStatistics(SYMBOLNODE SignatureNode,
double * NumberOfSymbols,double * NumberOfSymbolsArity0,
double * MinSymbolArity,double * MaxSymbolArity);
//-----------------------------------------------------------------------------
#endif
