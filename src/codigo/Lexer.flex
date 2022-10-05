package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z]+
D=[0-9]+
S=[()]*
M=\^[0-9]*
Z=\^[0-9]+\/[0-9]*
Q=[0-9]+\/[0-9]+
E= ([+]{1}|[-]{1})*
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%

{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"+" {return Suma;}
"-" {return Resta;}
"/" {return Division;}
"^" {return Exponente;}
{E}*({D}|{Q}){L}({M}|{Z}) {lexeme=yytext(); return Monomio;}
{E}({D}|{Q}){L}({M}|{Z}){E}({D}|{Q}){L}({M}|{Z}) {lexeme=yytext(); return Binomio;}
{E}({D}|{Q}){L}({M}|{Z}){E}({D}|{Q}){L}({M}|{Z}){E}({D}|{Q}){L}({M}|{Z}) {lexeme=yytext(); return Trinomio;}
{E}({D}|{Q}){L}({M}|{Z}){E}({D}|{Q}){L}({M}|{Z}){E}({D}|{Q}){L}({M}|{Z}){E}({D}|{Q}){L}({M}|{Z}) {lexeme=yytext(); return Polinomio;}
 . {return ERROR;}
