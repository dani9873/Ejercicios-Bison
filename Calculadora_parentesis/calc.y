%{
#include<stdio.h>
void yyerror(char *mensaje);
int yylex();
%}

%token SUMA RESTA MULT PCOMA
%token PI PF
%token ENTERO
%%

inicio:expresion PCOMA     {printf("%i\n",$1);}
        ;       
expresion:expresion SUMA termino  {$$ = $1 + $3;} 
            |expresion RESTA termino {$$ = $1 - $3;}  
            |termino              
            ;
termino: termino MULT factor {$$ = $1 * $3;}   
        |factor                
        ;
factor: PI expresion PF {$$=$2;}
        |ENTERO 
        ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(char *mensaje) {
    fprintf(stderr,"Error de sintaxis: %s\n", mensaje);
}
