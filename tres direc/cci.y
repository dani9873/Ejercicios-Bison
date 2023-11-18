%{
#include <stdio.h>
#include <string.h>

void yyerror(char *s);    
int yylex();
void nuevaTemp(char *s);

%}

%union{
	char cadena[50];
}

%token <cadena>NUM
%token ADD
%token EOL
%type <cadena>sumandos

%%
inicio: sumandos EOL        	 
    ;

sumandos:sumandos ADD NUM     	{ nuevaTemp($$); printf("%s=%s+%s\n",$$,$1,$3);   }
    | NUM                 	 
    ;

%%
void nuevaTemp(char *s){
	static int actual=1;
	sprintf(s,"t%d",actual++);
}

void yyerror(char *s){
	fprintf(stderr, "Error: %s\n", s);
}

int main(int argc, char **argv){
	yyparse();
	return 0;
}

