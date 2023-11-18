%{
#include<stdio.h>
void yyerror(char *mensaje);
int yylex();
%}

%token SUMA RESTA MULT DIV 
%token ENTERO
%%

expresion   :expresion SUMA expresion {printf("Operacion correcta\n"); }
            |expresion RESTA expresion{printf("Operacion correcta\n"); }
            |expresion MULT expresion{printf("Operacion correcta\n"); }
            |expresion DIV expresion{printf("Operacion correcta\n"); }
            | ENTERO
            ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(char *mensaje) {
    fprintf(stderr,"Error de sintaxis: %s\n", mensaje);
}
