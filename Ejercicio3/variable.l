%{
#include "variable.tab.h"
%}

%%

"#include"   {return INCLUDE;}
".h"     {return H;}
"<"    {return ENTRADA;}
">"    {return SALIDA;}
"\""   {return ES2;}
[a-z]+   {return ID;}
.       { }

%%

