%{
#include <string.h>
#include "gram.tab.h"
%}

%% /* start of flex rule. */

SELECT           { return SELECT; }
FROM             { return FROM; }
WHERE            { return WHERE; }
[0-9]+           { yylval.ival = atoi(yytext); return INTEGER; }
[a-zA-Z][a-zA-Z0-9_]* { yylval.sval = strdup(yytext); return IDENTIFIER; }
\*               { return STAR; }
=                { return EQ; }
;                { return SEMICOLON; }
[ \t\n]+         /* ignore whitespace */
.                { return yytext[0]; }
%% /* end of flex rule. */

int yywrap() {
    return 1;
}
