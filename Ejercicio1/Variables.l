%{
#include "Variables.tab.h"
%}

%%
"int"   {return PR_INT;}
";"     {return PCOMA;}
","     {return COMA;}
[a-b]   {return ID;}
.       { }
%%
