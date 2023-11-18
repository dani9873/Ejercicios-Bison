%{
#include "sum2.tab.h"
%}

%%
"+" 	{return ADD;}
[0-9]+    {yylval=atoi(yytext); return NUM;}
\n  	{return EOL;}
[ \t]        {}
