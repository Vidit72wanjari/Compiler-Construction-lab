%{
#include <stdio.h>
int a_count = 0;
%}

%%
[aA][a-zA-Z0-9]*	{a_count++;}
[a-zA-Z0-9]+ ;
[\t\n]+ ;
. ;
%%

int main(){
printf("Enter text (Ctrl+D to exit):\n");
yylex();
printf("Number of words starting with a: %d", a_count);
return 0;
}

int yywrap(){
return 1;
}
