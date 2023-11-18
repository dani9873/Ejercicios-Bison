%{
#include "Variables.tab.h"
%}

%%
"int"   {return PR_INT;}
";"     {return PCOMA;}
","     {return COMA;}
[a-z]+   {return ID;}
.       { }
%%
