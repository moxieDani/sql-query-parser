#include <stdio.h>
#include "gram.tab.h"

int main() {
    printf("Kisoon SQL Parser.\n");
    printf("Enter SQL query : ");
    yyparse();
    return 0;
}