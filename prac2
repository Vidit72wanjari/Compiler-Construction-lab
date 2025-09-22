%{
#include <stdio.h>
#include <string.h>
#include <ctype.h>

// Counters
int word_count = 0;
int letter_count = 0;
int keyword_count = 0;
int identifier_count = 0;
int line_count = 0;
int space_count = 0;

// List of C keywords
const char *keywords[] = {
    "int", "float", "char", "double", "void", "if", "else", "for", "while",
    "do", "return", "switch", "case", "break", "continue", "default",
    "static", "const", "long", "short", "unsigned", "signed", "struct", "union",
    "typedef", "sizeof", "auto", "register", "volatile", "enum", "extern", "goto"
};

int is_keyword(const char *str) {
    for (int i = 0; i < sizeof(keywords)/sizeof(keywords[0]); i++) {
        if (strcmp(str, keywords[i]) == 0) {
            return 1;
        }
    }
    return 0;
}

int is_identifier(const char *str) {
    if (!isalpha(str[0]) && str[0] != '_') return 0;
    for (int i = 1; str[i] != '\0'; i++) {
        if (!isalnum(str[i]) && str[i] != '_') return 0;
    }
    return !is_keyword(str);
}
%}

%%

[a-zA-Z_][a-zA-Z0-9_]*    {
                            word_count++;
                            for (int i = 0; yytext[i]; i++) {
                                if (isalpha(yytext[i])) letter_count++;
                            }
                            if (is_keyword(yytext)) {
                                keyword_count++;
                            } else if (is_identifier(yytext)) {
                                identifier_count++;
                            }
                         }

[ \t]+                   { space_count += yyleng; }
\n                       { line_count++; }
.                        ;  // Ignore all other characters

%%

int main() {
    printf("Reading input (Ctrl+D to stop):\n");
    yylex();
    printf("\nResults:\n");
    printf("Lines: %d\n", line_count);
    printf("Words: %d\n", word_count);
    printf("Letters: %d\n", letter_count);
    printf("Spaces: %d\n", space_count);
    printf("Keywords: %d\n", keyword_count);
    printf("Identifiers: %d\n", identifier_count);
    return 0;
}

int yywrap() {
    return 1;
}
