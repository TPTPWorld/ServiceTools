%==============================================================================
%----This outputs TPTP Problem Set clauses in a format acceptable to
%----the SMT standard format
%==============================================================================
%==============================================================================
%----Generic output
%==============================================================================
%------------------------------------------------------------------------------
%----Output an atom with variables in SMT format
smt_output_term(Variable):-
    looks_like_a_variable(Variable),
    !,
    write('?'),
    write(Variable).

smt_output_term([OneTerm]):-
    !,
    smt_output_term(OneTerm).

smt_output_term([FirstTerm|RestOfTerms]):-
    !,
    smt_output_term(FirstTerm),
    write(' '),
    smt_output_term(RestOfTerms).

%----Negative integers
smt_output_term(NegativeInteger):-
    number(NegativeInteger),
    NegativeInteger < 0,
    !,
    abs(NegativeInteger,PositiveInteger),
    write('(~ '),
    write(PositiveInteger),
    write(')').

%----Translate atomic symbols
smt_output_term(Symbol):-
    atomic(Symbol),
    tptp2X_member((Symbol)-(SMTSymbol),
[
%----Functions
('$plus_int')-('+'),
('$minus_int')-('-'),
('$times_int')-('*'),
('$divide_int')-('/'),
% ('$remainder_int')-(''),
% ('$power_int')-(''),
('$uminus_int')-('~'),
% ('$abs_int')-(''),
% ('$min_int')-(''),
% ('$max_int')-(''),
%----Predicates
('$less_int')-('<'),
('$lesseq_int')-('<='),
('$greater_int')-('>'),
('$greatereq_int')-('>='),
('$tptp_equal')-('='),
('$true')-(true),
('$false')-(false),
('$distinct')-(distinct),
%----Types
('$int')-('Int'),
('$i')-(smt_individual),
('$iType')-(smt_individual),
('$o')-(smt_truth),
('$oType')-(smt_truth)
]),
    !,
    write(SMTSymbol).

%----Normal atomic things
smt_output_term(Atomic):-
    atomic(Atomic),
    !,
    writeq(Atomic).

smt_output_term(T1 > T2):-
    !,
    output_prefix_formula(smt,T1,0,0,outermost),
    write(' '),
    output_prefix_formula(smt,T2,0,0,outermost).

smt_output_term(T1*T2):-
    !,
    output_prefix_formula(smt,T1,0,0,outermost),
    write(' '),
    output_prefix_formula(smt,T2,0,0,outermost).

smt_output_term(_Name : _Type):-
    !,
    write('SHOULD NEVER DO THIS').

%----Complex terms
smt_output_term(Complex):-
    Complex =.. [Symbol|Arguments],
    write('('),
    smt_output_term(Symbol),
    write(' '),
    smt_output_term(Arguments),
    write(')').
%------------------------------------------------------------------------------
%----Output a quantified variable
smt_output_variable(Variable):-
    looks_like_a_variable(Variable),
    !,
    write('('),
    smt_output_term(Variable),
    write(' '),
    smt_output_term('$i'),
    write(')').

smt_output_variable(Variable:Thing):-
    looks_like_a_variable(Variable),
    write('('),
    smt_output_term(Variable),
    (   tptp_atomic_formula(Thing)
    ->  (   write(' '),
            NewIndent = 0
        )
    ;   (   nl,
            NewIndent = 6
        )
    ),
    output_prefix_formula(smt,Thing,NewIndent,0,outermost),
    write(')').

smt_output_variable(Variable:=Thing):-
    looks_like_a_variable(Variable),
    smt_output_variable(Variable:Thing).
%------------------------------------------------------------------------------
%----Output an atom
smt_output_atom(_,Atom):-
    smt_output_term(Atom).
%------------------------------------------------------------------------------
%==============================================================================
%----FOF output
%==============================================================================
%------------------------------------------------------------------------------
%----Equality must be a formula
smt_let_type([_:='$tptp_equal'(_,_)],_,flet):-
    !.

%----Something that looks like a formula is one
smt_let_type([_:=Value|_],_,flet):-
    tptp_non_atomic_formula(Value),
    !.

%----If it's not obvious, see if the Variable is used as an atom in Scope
smt_let_type([Variable:=_],Scope,flet):-
    findall(PredicateSymbol,
        (   extract_atom_from_formula(Scope,Atom),
            functor(Atom,PredicateSymbol,_)),
        PredicateSymbols),
    tptp2X_exact_member(Variable,PredicateSymbols),
    !.

%----This assumes all things that look like terms really are. But they can
%----be predicates, so I need to dig into the formula - TO DO
smt_let_type([_:=_],_,let):-
    !.

%----Otherwise something is wrong
smt_let_type([Variable:=_],_,_):-
    write('ERROR: In := definitions --->'),
    write(Variable),
    nl,
    fail.
%------------------------------------------------------------------------------
%----Recognise and split up quantified formulae
smt_quantified_formula(QuantifiedFormula,SMTQuantifier,Variables,
Formula):-
    QuantifiedFormula =.. [:,Quantification,Formula],
    !,
    Quantification =.. [Quantifier,Variables],
    tptp2X_member(ct(Quantifier,SMTQuantifier),[ct('!',forall),ct('?',exists),
ct(':=',SMTLet)]),
    ( Quantifier == ':=' ->
        smt_let_type(Variables,Formula,SMTLet)
    ; true).
%------------------------------------------------------------------------------
%----Recognise and split up binary formulae
smt_binary_formula(BinaryFormula,SMTConnective,LHS,RHS):-
    BinaryFormula =.. [Connective,LHS,RHS],
    tptp2X_member((Connective)-(SMTConnective),
[('<=>')-('iff'),('<~>')-('xor'),('=>')-('implies'),('&')-('and'),
(';')-('or'),('|')-('or'),('>')-(''),('*')-('')]).
%----Both needed after shorten which sets '|' somewhere - need to check
%----|;BUG
%------------------------------------------------------------------------------
%----Recognise and split up unary formulae
smt_unary_formula(UnaryFormula,SMTConnective,Formula):-
    UnaryFormula =.. [Connective,Formula],
%----Had to use ()s due to some Prolog confusion about -
    tptp2X_member((Connective)-(SMTConnective),[('~')-('not')]).
%------------------------------------------------------------------------------
%----The format for outputing quantified formulae in oscar format
%----FormulaPrefix,VariablesPrefix,VariablesSeparator,VariablesSuffix,
%----FormulaSuffix
smt_quantified_format('(',' ',' ',' ',' )').

%----PrefixBracket,ConnectivePrefix,ConnectiveSuffix,SuffixBracket
smt_binary_format('(','','',' )').

%----FormulaPrefix,ConnectiveSuffix,FormulaSuffix
smt_unary_format('(',' ',' )').
%------------------------------------------------------------------------------
%----Write extrasorts-declarations for the sort symbols occuring in a type;
%----uses an asserted predicate to check which ones have already been
%----written away.
:- dynamic asserted_smt_extrasort/1.
output_smt_extrasorts([]):-
    !.

output_smt_extrasorts([Type|Types]):-
    !,
    output_smt_extrasorts(Type),
    output_smt_extrasorts(Types).

output_smt_extrasorts(IndividualType):-
    tptp2X_member(IndividualType,['$i','$iType']),
    !,
    output_smt_extrasorts(smt_individual).

output_smt_extrasorts(DefinedType):-
    tptp2X_member(DefinedType,['$int','$o','$oType']),
    !.

output_smt_extrasorts(Type):-
    asserted_smt_extrasort(Type),
    !.

output_smt_extrasorts(Type):-
    \+ atomic(Type),
    Type =.. [F | Types],
    !,
    tptp2X_member(F, [*, >]),
    output_smt_extrasorts(Types).

output_smt_extrasorts(Type):-
    atomic(Type),
    assert(asserted_smt_extrasort(Type)),
    write(':extrasorts ('),
    output_prefix_formula(smt,Type,0,0,outermost),
    write(')'),
    nl.

%------------------------------------------------------------------------------
%----If the formulae has an acceptable status then output
output_smt_formulae([]).

%----Type signature for proposition
output_smt_formulae([tff(Name,type,F:Boolean)|RestOfFormulae]):-
    tptp2X_member(Boolean,['$o','$oType']),
    !,
    write('; '),
    write(Name),
    nl,
    write(':extrapreds(('),
    write(F),
    write(' '),
    output_prefix_formula(smt,Boolean,0,0,outermost),
    write('))'),
    nl,
    nl,
    output_smt_formulae(RestOfFormulae).

%----Type signature for predicate
output_smt_formulae([tff(Name,type,F:(Type>Boolean))|RestOfFormulae]):-
    tptp2X_member(Boolean,['$o','$oType']),
    !,
    write('; '),
    write(Name),
    nl,
    output_smt_extrasorts(Type),
    write(':extrapreds (('),
    write(F),
    write(' '),
    output_prefix_formula(smt,Type,0,0,outermost),
    write('))'),
    nl,
    nl,
    output_smt_formulae(RestOfFormulae).

%----Type signature for functions
output_smt_formulae([tff(Name,type,F:Type)|RestOfFormulae]):-
    !,
    write('; '),
    write(Name),
    nl,
    output_smt_extrasorts(Type),
    write(':extrafuns (('),
    write(F),
    write(' '),
    output_prefix_formula(smt,Type,0,0,outermost),
    write('))'),
    nl,
    nl,
    output_smt_formulae(RestOfFormulae).

%----Conjecture
output_smt_formulae([tff(Name,Role,Formula)|RestOfFormulae]):-
    tptp2X_member(Role,[conjecture,negated_conjecture]),
    !,
    write('; '),
    write(Name),
    nl,
    write(':formula '),
    nl,
    output_generic_prefix_formula(smt,Formula),
    nl,
    nl,
    output_smt_formulae(RestOfFormulae).

output_smt_formulae([fof(Name,Role,Formula)|RestOfFormulae]):-
    tptp2X_member(Role,[conjecture,negated_conjecture]),
    !,
    write('; '),
    write(Name),
    nl,
    write(':formula '),
    nl,
    output_generic_prefix_formula(smt,Formula),
    nl,
    nl,
    output_smt_formulae(RestOfFormulae).

%----Everything else assumed to be axiom-like
output_smt_formulae([tff(Name,_,Formula)|RestOfFormulae]):-
    write('; '),
    write(Name),
    nl,
    write(':assumption '),
    nl,
    output_generic_prefix_formula(smt,Formula),
    nl,
    nl,
    output_smt_formulae(RestOfFormulae).

output_smt_formulae([fof(Name,_,Formula)|RestOfFormulae]):-
    write('; '),
    write(Name),
    nl,
    write(':assumption '),
    nl,
    output_generic_prefix_formula(smt,Formula),
    nl,
    nl,
    output_smt_formulae(RestOfFormulae).

%------------------------------------------------------------------------------
smt_separate_type_declarations([],[],[]).

smt_separate_type_declarations([TypeDeclaration|Rest],[TypeDeclaration|
RestOfTypeDeclarations],LogicalFormulae):-
    TypeDeclaration =.. [tff,_,type|_],
    !,
    smt_separate_type_declarations(Rest,RestOfTypeDeclarations,LogicalFormulae).

smt_separate_type_declarations([Logical|Rest],TypeDeclarations,[Logical|
RestOfLogicalFormulae]):-
    smt_separate_type_declarations(Rest,TypeDeclarations,RestOfLogicalFormulae).
%------------------------------------------------------------------------------
smt_xproduct_length(_ * RHS,Arity):-
    !,
    Arity1 is Arity - 1,
    smt_xproduct_length(RHS,Arity1).

smt_xproduct_length(_,0).
%------------------------------------------------------------------------------
smt_symbol_is_declared(Symbol,0,RequiredResultType,TypeDeclarations):-
    tptp2X_member(tff(_,type,Symbol: RequiredResultType),TypeDeclarations).

smt_symbol_is_declared(Symbol,Arity,RequiredResultType,TypeDeclarations):-
    Arity > 0,
    tptp2X_member(tff(_,type,Symbol: XProduct > RequiredResultType),
TypeDeclarations),
    smt_xproduct_length(XProduct,Arity).
%------------------------------------------------------------------------------
smt_find_undeclared_symbols([],_,_,[]).

smt_find_undeclared_symbols([Symbol/Arity|RestOfStructures],TypeDeclarations,
RequiredResultType,UndeclaredStructures):-
    smt_symbol_is_declared(Symbol,Arity,RequiredResultType,TypeDeclarations),
    !,
    smt_find_undeclared_symbols(RestOfStructures,TypeDeclarations,
RequiredResultType,UndeclaredStructures).

smt_find_undeclared_symbols([Undeclared|RestOfStructures],TypeDeclarations,
RequiredResultType,[Undeclared|RestOfUndeclaredStructures]):-
    smt_find_undeclared_symbols(RestOfStructures,TypeDeclarations,
RequiredResultType,RestOfUndeclaredStructures).
%------------------------------------------------------------------------------
smt_make_xproduct(1,ArgumentType,ArgumentType).

smt_make_xproduct(Arity,ArgumentType,(ArgumentType * RestOfXProduct)):-
    Arity > 1,
    Arity1 is Arity - 1,
    smt_make_xproduct(Arity1,ArgumentType,RestOfXProduct).
%------------------------------------------------------------------------------
smt_make_type_declarations([],_,_,[]).

smt_make_type_declarations([Symbol/Arity|RestOfStructures],ArgumentType,
ResultType,TypeDeclarations):-
    tptp2X_member(Symbol/Arity,['$tptp_equal'/2]),
    !,
    smt_make_type_declarations(RestOfStructures,ArgumentType,ResultType,
TypeDeclarations).

smt_make_type_declarations([Symbol/0|RestOfStructures],ArgumentType,ResultType,
[tff(Name,type,Symbol:ResultType)|RestOfTypeDeclarations]):-
    !,
    concatenate_atoms([Symbol,'_0_',type],Name),
    smt_make_type_declarations(RestOfStructures,ArgumentType,ResultType,
RestOfTypeDeclarations).

smt_make_type_declarations([Symbol/Arity|RestOfStructures],ArgumentType,
ResultType,[tff(Name,type,Symbol: XProduct > ResultType)|
RestOfTypeDeclarations]):-
    Arity > 0,
    smt_make_xproduct(Arity,ArgumentType,XProduct),
    concatenate_atoms([Symbol,'_',Arity,'_',type],Name),
%DEBUG write('=== MTD : '),write(tff(Name,type,Symbol: XProduct > ResultType)),nl,
    smt_make_type_declarations(RestOfStructures,ArgumentType,ResultType,
RestOfTypeDeclarations).
%------------------------------------------------------------------------------
smt_complete_type_declarations(LogicalFormulae,TypeDeclarations,
CompletedTypeDeclarations):-
%----Do basic syntactic examination
    examine_formulae_for_predicates(LogicalFormulae,_,PredicateStructures,_),
    examine_formulae_for_functors(LogicalFormulae,FunctorStructures,_),
%----Find which are already declared
    smt_find_undeclared_symbols(PredicateStructures,TypeDeclarations,'$o',
UndeclaredPredicateStructures),
%DEBUG write('--- UPS : '),write(UndeclaredPredicateStructures),nl,
%----Declare rest as $i and $o
    smt_make_type_declarations(UndeclaredPredicateStructures,'$i','$o',
PredicateTypeDeclarations),
    smt_find_undeclared_symbols(FunctorStructures,TypeDeclarations,_,
UndeclaredFunctorStructures),
%DEBUG write('--- UFS : '),write(UndeclaredFunctorStructures),nl,
    smt_make_type_declarations(UndeclaredFunctorStructures,'$i','$i',
FunctorTypeDeclarations),
%DEBUG write('--- ETDs : '),display(TypeDeclarations),nl,
%DEBUG write('--- PTDs : '),display(PredicateTypeDeclarations),nl,
%DEBUG write('--- FTDs : '),display(FunctorTypeDeclarations),nl,
    tptp2X_append(TypeDeclarations,PredicateTypeDeclarations,
TypeDeclarations1),
    tptp2X_append(TypeDeclarations1,FunctorTypeDeclarations,
CompletedTypeDeclarations).
%------------------------------------------------------------------------------
%----Output all the formulae in smt format
smt(smt,Formulae,_):-
    tptp_formulae(Formulae),
    write('(benchmark name'),
    nl,
    write(':logic AUFLIA'),
    nl,
    nl,
    smt_separate_type_declarations(Formulae,TypeDeclarations,LogicalFormulae),
%DEBUG write('-- TDs '),display(TypeDeclarations),nl,
    smt_complete_type_declarations(LogicalFormulae,TypeDeclarations,
CompletedTypeDeclarations),
%DEBUG write('-- CTDs '),display(CompletedTypeDeclarations),nl,
    output_smt_formulae(CompletedTypeDeclarations),
    output_smt_formulae(LogicalFormulae),
    write(')'),
    nl.
%------------------------------------------------------------------------------
%----Provide information about the smt format
smt_format_information(';','.smt').
%------------------------------------------------------------------------------
%----Provide information about the smt file
smt_file_information(format,smt,'SMT format').
%------------------------------------------------------------------------------
