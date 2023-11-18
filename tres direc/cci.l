%{
#include "cci.tab.h"
#include <string.h>
%}

%%
"+" 	{return ADD;}
[0-9]+  {strcpy(yylval.cadena,yytext); return NUM;}
\n  	{return EOL;}
[ \t]   {}
