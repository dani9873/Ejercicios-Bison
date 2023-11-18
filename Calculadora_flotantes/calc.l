%{
#include "calc.tab.h"
%}

%%
"+"    {return SUMA;}
"-"    {return RESTA;}
"*"    {return MULT;}
"/"    {return DIV;}
"("      {return PI;}
")"      {return PF;}
";"     {return PCOMA;}
[0-9]+\.[0-9]+  {yylval.t_float=atof(yytext); return FLOTANTE;}
.       {}

%%

