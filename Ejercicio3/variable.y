%{
#include <stdio.h>
void yyerror(char *mensaje);//prototipo para mostrar errores de sintaxis
int yylex(); //prototipo para pedir nuevos tokens
%}

%token ID INCLUDE H ENTRADA SALIDA ES2
%%

programa: programa INCLUDE entrada variable H salida { printf("Sintaxis correcta\n"); }
|programa INCLUDE ensa variable H ensa { printf("Sintaxis correcta\n"); }
|vacio
vacio: 
entrada: ENTRADA
ensa: ES2
salida: SALIDA
variable: ID

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(char *mensaje) {
    fprintf(stderr,"Error sintáctico: %s\n", mensaje);
}
