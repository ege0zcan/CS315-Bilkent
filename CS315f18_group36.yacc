%token DOT IS IF ELSE BOOLEAN WHILE COMMA EXCLAMATION_MARK CONSTANT CALL WITH PROGRAM
%token NEW_FUNCTION_IS COLON RETURN NOTHING READ WRITE GREATER LESS_THAN EQUAL_TO GREAT_EQ
%token LESS_EQ PLUS MINUS TIMES DIVIDED_BY INTEGER FLOAT AND OR EQUALS CONST_IDENTIFIER
%token IDENTIFIER FUNC_IDENTIFIER MOVE TURN GRAB RELEASE READ_DATA  SEND COMMENT RECEIVE END_SIGN


%%
program: statements END_SIGN {printf("Input program is valid\n"); exit(0);}
       ;
statements: statement DOT | statement DOT statements
          ;
statement: non_if_statement | matched | unmatched
         ;
non_if_statement: assignment_statement | while_statement | constant_statement | function_call_statement | function_define_statement | read_statement | write_statement 
                ;
matched: IF logic_expression COMMA statements ELSE statements  EXCLAMATION_MARK  
       ;
unmatched: IF logic_expression COMMA statements  EXCLAMATION_MARK 
         ;
assignment_statement: IDENTIFIER IS expression | IDENTIFIER IS function_call_statement | IDENTIFIER IS read_statement | IDENTIFIER IS logic_expression
                    ;
basic_logic: factor comparator factor | BOOLEAN 
           ;
logic_expression: logic_expression logic_operator basic_logic | basic_logic
                ;
while_statement: WHILE logic_expression COMMA statements EXCLAMATION_MARK
               ;  
constant_statement: CONSTANT CONST_IDENTIFIER IS factor
                  ;
function_call_statement: CALL FUNC_IDENTIFIER WITH parameters | CALL FUNC_IDENTIFIER | CALL MOVE WITH FLOAT | CALL TURN WITH FLOAT | CALL GRAB | CALL RELEASE | CALL READ_DATA WITH INTEGER | CALL SEND WITH INTEGER | CALL RECEIVE 
                       ;
function_define_statement: NEW_FUNCTION_IS FUNC_IDENTIFIER WITH parameters COLON statements RETURN return_type EXCLAMATION_MARK | NEW_FUNCTION_IS FUNC_IDENTIFIER COLON statements RETURN return_type EXCLAMATION_MARK
                         ;
read_statement: READ
              ;
write_statement: WRITE return_type
               ;
return_type: logic_expression | expression | NOTHING
           ;
comparator: GREATER | LESS_THAN | EQUAL_TO | GREAT_EQ | LESS_EQ
          ;
expression: expression PLUS term | expression MINUS term | term
          ;
term: term TIMES factor | term DIVIDED_BY factor | factor
    ;
factor: IDENTIFIER | INTEGER | FLOAT
      ;
parameters: return_type | return_type COMMA parameters
          ;
logic_operator: AND | OR | EQUALS
              ;
%%

#include "lex.yy.c"

main(){
  yyparse();
}
