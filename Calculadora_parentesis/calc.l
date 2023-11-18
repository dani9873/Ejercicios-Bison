%{
#include "calc.tab.h"
%}

%%
"+"    {return SUMA;}
"-"    {return RESTA;}
"*"    {return MULT;}
";"     {return PCOMA;}
"("      {return PI;}
")"      {return PF;}
[0-9]+  {yylval=atoi(yytext); return ENTERO;}
.       {}

%%

