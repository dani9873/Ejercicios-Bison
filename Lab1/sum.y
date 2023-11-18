%{
#include <stdio.h>
void yyerror(char *s);    
int yylex();
%}

%token NUM
%token ADD
%token EOL

%%
inicio: 	sumandos EOL   	 
        	;

sumandos:   NUM ADD NUM    	 
        	;

%%

void yyerror(char *s){
 fprintf(stderr, "Error: %s\n", s);
}

int main(int argc, char **argv){
	yyparse();
	return 0;
}

