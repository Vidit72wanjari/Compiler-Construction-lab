%{
#include "calc.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

DIGIT   [0-9]
NUMBER  {DIGIT}+(\.{DIGIT}+)?([eE][+-]?{DIGIT}+)?

%%

[ \t]+                ;   /* skip whitespace */
{NUMBER}              { yylval.dval = atof(yytext); return NUMBER; }
\n                    { return EOL; }
"+"                   { return '+'; }
"-"                   { return '-'; }
"*"                   { return '*'; }
"/"                   { return '/'; }
"("                   { return '('; }
")"                   { return ')'; }

.                     { fprintf(stderr,"Unknown char: %s\n", yytext); }

%%

int yywrap(void) { return 1; }
