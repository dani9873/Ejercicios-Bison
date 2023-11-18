%{
#include<stdio.h>
void yyerror(char *mensaje);//prototipo para mostrar errores de sintaxis
int yylex(); //prototipo para pedir nuevos tokens
%}

%token ID FLOAT IGUAL ENTRADA SALIDA EN2 SAN2 ENTERO FLOTANTE P_COMA COMA
%%

declara: declara FLOAT variable entrada entero salida IGUAL entrada2 flotante salida2 P_COMA {printf("Sintaxis correcta\n"); }
|declara FLOAT variable entrada entero salida IGUAL entrada2 flotante coma salida2 P_COMA {printf("Sintaxis correcta\n"); }
|vacio
vacio:
coma: COMA
flotante: FLOTANTE |',' COMA
entero: ENTERO
entrada: ENTRADA
entrada2:EN2
salida2:SAN2
salida: SALIDA
variable: ID

%%

int main () {
    yyparse();
    return 0;
}

void yyerror(char *mensaje) {
    fprintf(stderr,"Error de sintaxis: %s\n", mensaje);
}
