%{
#include <stdio.h>
void yyerror(char *mensaje);//prototipo para mostrar errores de sintaxis
int yylex(); //prototipo para pedir nuevos tokens
%}

%token PR_INT PCOMA COMA ID

%%
//areas de reglas
declara : PR_INT variable otra_variable PCOMA   { printf("Declaración de variables exitosa\n"); }
        ;
otra_variable : COMA variable otra_variable 
                | vacio
                ;
vacio : 
            ;
variable : ID
            ;

%%
//Area de usuario, codigo de usuario
int main() {
    yyparse();
    return 0;
}

void yyerror(char *mensaje) {
    fprintf(stderr,"Error sintáctico: %s\n", mensaje);
}

