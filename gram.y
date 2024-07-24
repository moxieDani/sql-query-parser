// C code block between '%{' and '%}'
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// prototype of creating token function
int yylex();

// prototype of printing error message function
void yyerror(const char* s);

%}

// Defines the different data types that can be used in parsing.
%union {
    int ival;
    char* sval;
}

// %token defines the tokens that can be used in gram.
%token INTEGER IDENTIFIER // token for integer and identifier
%token SELECT FROM WHERE EQ SEMICOLON // token for query keyword
%token STAR  // token for '*'

// %% is start of gram rule
%% 

// query defines grammer rule. This rule parses SELECT statement.
query:
    // Explain the sturcture of SQL query
    SELECT select_list FROM table_name where_clause SEMICOLON
    {
        // print success message if this rule is parsed successfully.
        printf("Parsed query successfully.\n");
    }
    ;
// select_list defines a list of columns to select.
select_list:
    // IDENTIFIER: When selecting a single column.
    IDENTIFIER
    | select_list ',' IDENTIFIER // handles selecting multiple columns.
    | STAR  // Processes when all columns(*) are selected.
    ;

// table_name defines the table name, consisting of a single IDENTIFIER.
table_name:
    IDENTIFIER
    ;

// where_clause defines a conditional clause.
where_clause:
    WHERE condition // if there is a condition.
    |  /* empty */ //handles the absence of a condition.
    ;

// condition defines the content of the conditional clause.
condition:
    IDENTIFIER EQ INTEGER // A condition that indicates that a particular column is equal to a particular integer.
    ;
// %% is end of gram rule
%% 

// The yyerror function is called when an error occurs during parsing.
void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}
