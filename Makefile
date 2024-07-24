CC = gcc
YACC = bison
LEX = flex

all: parser

parser: gram scan
	$(CC) -o parser gram.tab.c lex.yy.c main.c

gram: gram.y
	$(YACC) -d gram.y

scan: scan.l
	$(LEX) scan.l

clean:
	rm -rf parser gram.tab.c gram.tab.h lex.yy.c parser.dSYM
