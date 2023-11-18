%{
#include<stdio.h>
void yyerror(char *mensaje);
int yylex();

%}
%union {
        int t_int;
        float t_float;
}

%token SUMA RESTA MULT PCOMA DIV
%token PI PF
%token <t_float>FLOTANTE
%type <t_float> expresion
%type <t_float> termino
%type <t_float> factor

%%

inicio:expresion PCOMA     {printf("%f\n", $1);}
        ;

expresion:expresion SUMA termino  {$$ = $1 + $3;} 
            |expresion RESTA termino {$$ = $1 - $3;}  
            |termino           
            ;
termino: termino MULT factor {$$ = $1 * $3;} 
        |termino DIV factor {$$ = $1 / $3;} 
        |factor                
        ;
factor: PI expresion PF {$$ = $2;}
        |FLOTANTE 
        ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(char *mensaje) {
    fprintf(stderr,"Error de sintaxis: %s\n", mensaje);
}
