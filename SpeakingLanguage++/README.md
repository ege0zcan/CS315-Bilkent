# SpeakingLanguage
Logical operation language designed using yacc and lex for CS-315 Programming Languages course

 Write "make" in the terminal to generate the parser.
	
	$ make

This will generate the "parser" file which can be executed on its own. It is also possible to feed a file as an input as follows:
	
	$ ./parser < ./parser < CS315f18_group36.test
  
If the given program has no syntax error the parser will print out ```Input program is valid``` 

If there is a syntax error, the parser will tell which line causes the problem with an output like: ```syntax error on line 23```
