%{
#include <stdio.h>
int vowel_count = 0;
int consonant_count = 0;
int digit_count = 0;
%}

%%

[aeiouAEIOU]	{vowel_count++;}
[a-zA-Z]	{consonant_count++;}
[0-9]	{digit_count++;}
[ \t\n];
. ;

%%

int main (){
printf("Enter text (Ctrl+D to stop): \n");
yylex();
printf("\nVowels: %d\n", vowel_count);
printf("\nConsonants: %d\n", consonant_count);
printf("\nDigits: %d\n", digit_count);
return 0;
}


int yywrap(){
return 1;
}

