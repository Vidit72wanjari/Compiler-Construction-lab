%{
#include <stdio.h>
int n = 0;
%}

%%

.*\.com[ \t]*\n     {n++;
			 printf("Matched: %d\n", n); }

.|\n                { /* Ignore other characters/lines */ }

%%

int main() {
    yylex();
    return 0;
}


int yywrap(){
return 1;
}
