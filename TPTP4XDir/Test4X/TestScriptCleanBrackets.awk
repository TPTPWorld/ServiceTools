#!/bin/awk -f
BEGIN {
    Accumulator = "";
}
{
    Accumulator = Accumulator $0;
    do {
        Substitutions = 0;
#----CNF: Extra ()s around clause
        Substitutions += \
sub(/LPAREN \( +<RPAREN ) +</,"",Accumulator);
#----FOF: Remove extra ()s around formulae
        Substitutions += \
sub(/LPAREN \( +<<fof_logic_formula> +<<fof_unitary_formula> +<RPAREN ) +</,"",Accumulator);
#----FOF: Remove extra ()s around negated equalities
        Substitutions += \
sub(/<fof_unitary_formula> +<LPAREN \( +<<fof_logic_formula> +<RPAREN ) +</,"",Accumulator);
#----TFF: Remove extra ()s around types
        Substitutions += \
sub(/LPAREN \( +<<tff_atom_typing> +<RPAREN ) +</,"",Accumulator);
        Substitutions += \
sub(/LPAREN \( +<<tff_atom_typing> +<LPAREN \( +<<tff_non_atomic_type> +<RPAREN ) +<RPAREN ) +</,"",Accumulator);
#----TFF: Remove extra ()s around formulae
        Substitutions += \
sub(/LPAREN \( +<<tff_logic_formula> +<<tff_unitary_formula> +<RPAREN ) +</,"",Accumulator);
        Substitutions += \
sub(/<tff_unitary_formula> +<LPAREN \( +<<tff_logic_formula> +<RPAREN ) +</,"",Accumulator);
#----TFF: Add needed ()s around boolean variables
        Substitutions += \
sub(/ +>  LPAREN \( +>  <tff_logic_formula> +>  <tff_unitary_formula> +>  <tfx_unitary_formula> +>  RPAREN )/,"",Accumulator);
        Substitutions += \
sub(/ +>  LPAREN \( +>  <tff_logic_formula> +>  <tff_unitary_formula> +>  RPAREN )/,"",Accumulator);
        Substitutions += \
sub(/ +>  <tff_unitary_formula> +>  LPAREN \( +>  <tff_logic_formula> +>  RPAREN )/,"",Accumulator);
#----TFF: Add needed ()s around quantified equations
        Substitutions += \
sub(/ +>  <tff_unitary_formula> +>  LPAREN \( +>  <tff_logic_formula> +>  RPAREN )/,"",Accumulator);
#----THF: Remove extra ()s around types
        Substitutions += \
sub(/LPAREN \( +<<thf_atom_typing> +<RPAREN ) +</,"",Accumulator);
        Substitutions += \
sub(/LPAREN \( +<<thf_atom_typing> +<<thf_unitary_type> +<<thf_unitary_formula> +<LPAREN \( +<<thf_logic_formula> +<<thf_binary_formula> +<<thf_binary_type> +<RPAREN ) +<RPAREN ) +</,"",Accumulator);
#----THF: Remove extra ()s around formulae
        Substitutions += \
sub(/LPAREN \( +<<thf_logic_formula> +<<thf_unitary_formula> +<RPAREN ) +</,"",Accumulator);
        Substitutions += \
sub(/<thf_unitary_formula> +<LPAREN \( +<<thf_logic_formula> +<RPAREN ) +</,"",Accumulator);
#----THF: Add needed ()s around boolean variables
        Substitutions += \
sub(/ +>  LPAREN \( +>  <thf_logic_formula> +>  <thf_unitary_formula> +>  RPAREN )/,"",Accumulator);
#----THF: Add needed ()s around equations
        Substitutions += \
sub(/ +>  RPAREN ) +>  <thf_unitary_formula> +>  LPAREN \( +>  <thf_logic_formula>/,"",Accumulator);
#----THF: Add needed ()s around $ite arguments
        Substitutions += \
sub(/ +>  <thf_unitary_formula> +>  LPAREN \( +>  <thf_logic_formula> +>  RPAREN )/,"",Accumulator);
    } while (Substitutions > 0);
}
END {
    do {
        Substitutions = 0;
#----Too subtle for diff to remove the context
        Substitutions += \
sub(/LPAREN \( +<<thf_logic_formula> +<<thf_unitary_formula> +< +>  LPAREN \( +>  <thf_logic_formula> +>  <thf_unitary_formula>/,"",Accumulator);
    } while (Substitutions > 0);
    if (Accumulator != "") {
        print "::" Accumulator "::";
    }
}
