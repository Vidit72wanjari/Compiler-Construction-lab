%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%union {
    double dval;
}

%token <dval> NUMBER
%token EOL

%left '+' '-'
%left '*' '/'
%right UMINUS

%type <dval> exp

%%

input:
      /* empty */
    | input line
    ;

line:
      EOL
    | exp EOL    { printf("= %.10g\n", $1); }
    | error EOL  { yyerror("syntax error, skipping line"); yyerrok; }
    ;

exp:
      NUMBER         { $$ = $1; }
    | exp '+' exp    { $$ = $1 + $3; }
    | exp '-' exp    { $$ = $1 - $3; }
    | exp '*' exp    { $$ = $1 * $3; }
    | exp '/' exp    { if ($3 == 0) { yyerror("division by zero"); $$ = 0; } else $$ = $1 / $3; }
    | '-' exp %prec UMINUS { $$ = -$2; }
    | '(' exp ')'    { $$ = $2; }
    ;

%%

int main(void) {
    printf("Desk Calculator. Enter expressions, one per line.\n");
    printf("Ctrl+D to exit.\n");
    return yyparse();
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
