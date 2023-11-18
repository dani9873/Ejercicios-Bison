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
%token ADD MUL SUB DIV
%token EOL
%token PI PF
%type <cadena> expresion termino factor

%%
programa:  	/**/       	 
        	| programa expresion EOL    	{ printf("-------\n"); }
        	;

expresion: 	expresion ADD termino  	{nuevaTemp($$); printf("%s=%s+%s\n",$$,$1,$3);   	}
            |expresion SUB termino  	{nuevaTemp($$); printf("%s=%s-%s\n",$$,$1,$3);   	}
        	|termino
        	;

termino:      	termino MUL factor 	{ nuevaTemp($$); printf("%s=%s*%s\n",$$,$1,$3);   	}
            | termino DIV factor 	{ nuevaTemp($$); printf("%s=%s/%s\n",$$,$1,$3);   	}
         	| factor   	 
         	;
factor:          	PI expresion PF 	{ strcpy($$,$2);       	}           	 
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
