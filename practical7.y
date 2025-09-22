%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);
int yylex(void);
%}

%token NUMBER

%%

program:
program expr '\n' {printf("Result:%d \n",$2);}
|
;

expr:
NUMBER{$$ - $1;}
|expr expr '+' {$$ = $1 + $2;}
|expr expr '-' {$$ = $1 - $2;}
|expr expr '*' {$$ = $1 * $2;}
|expr expr '/' {$$ = $1 / $2;}
;

%%

void yyerror(char*s){
fprintf(stderr, "Error: %s\n",s);
}

int main(void){
yyparse();
return 0;
}
