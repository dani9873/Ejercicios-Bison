%{
#include "array.tab.h"
%}

%%

"float"   {return FLOAT;}
"="     {return IGUAL;}
"["    {return ENTRADA;}
"]"    {return SALIDA;}
"{"    {return EN2;}
"}"    {return SAN2;}
";"    {return P_COMA;}
(,[-+]?[0-9]*\.?[0-9]+)*   {return COMA;}
[1-9]+ {return ENTERO;}
[0-9]+\.[0-9]+    {return FLOTANTE;}
[a-z]+   {return ID;}
.       { }

%%

