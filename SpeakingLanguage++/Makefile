parser: y.tab.c lex.yy.c
	gcc -o parser y.tab.c
y.tab.c: CS315f18_group36.yacc lex.yy.c
	yacc CS315f18_group36.yacc
lex.yy.c: CS315f18_group36.lex
	lex CS315f18_group36.lex
clean:
	rm -f lex.yy.c y.tab.c parser
