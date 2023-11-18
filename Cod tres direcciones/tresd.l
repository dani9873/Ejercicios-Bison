%{
#include "tresd.tab.h"
#include <string.h>
%}

%%
"+" 	{return ADD;}
"*" 	{return MUL;}
"/" 	{return DIV;}
"-" 	{return SUB;}
"(" 	{return PI;}
")" 	{return PF;}
[0-9]+  {strcpy(yylval.cadena,yytext); return NUM;}
";" 	{return EOL;}
[ \t\n] {}
