%{
#include "sum.tab.h"
%}

%%
"+" 	{return ADD;}
[0-9]+   {return NUM;}
\n  	{return EOL;}
[ \t]        {}
