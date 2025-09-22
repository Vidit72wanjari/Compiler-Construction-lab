%{
#include<stdio.h>
#include<ctype.h>
%}

%%
.* {
	char*s=yytext;
	for(int i=0;s[i];i++) putchar(toupper(s[i]));
	printf("\n");
	
	for(int i=0;s[i];i++) putchar(tolower(s[i]));
	printf("\n");
	
	int start = 1;
	for(int i=0;s[i];i++){
		putchar(start && isalpha (s[i]) ? toupper(s[i]) : tolower(s[i]));
		start = isspace(s[i]);
		}
		printf("\n");
	}
%%

int main()
{
printf("Enter text: ");
yylex();
}

int yywrap()
{
return 1;
}
