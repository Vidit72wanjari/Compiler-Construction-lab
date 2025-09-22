%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
%}

%%
0[xX][0-9a-fA-F]+	{
			long num = strtol(yytext, NULL, 16);
			printf("Hex: %s to Decimal: %ld\n",yytext,num);
			}
[0-9]+			{
			long num = strtol(yytext, NULL, 10);
			printf("Decimal: %s to Hex: 0x%lX\n",yytext, num);
			}
[\t\n]+;
.;


 
%%

int main(){
printf("Enter number: \n");
yylex();
return 0;
}

int yywrap(){
return 1;
}
