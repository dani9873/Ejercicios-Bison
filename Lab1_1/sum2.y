%{
#include <stdio.h>
void yyerror(char *s);    
int yylex();
%}

%token NUM
%token ADD
%token EOL

%%

inicio: sumandos EOL { printf("=%d\n",$1); }   
        ;
sumandos:NUM ADD NUM ADD NUM { $$ = $1 + $3 + $5; }  
    	;

%%

void yyerror(char *s){
 fprintf(stderr, "Error: %s\n", s);
}

int main(){
	yyparse();
	return 0;
}
