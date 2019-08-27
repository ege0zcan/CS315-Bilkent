%{
#include <stdlib.h>
%}
%option yylineno

END_SIGN \#
DOT \.
IS is
IF if
ELSE else
BOOLEAN True|False
WHILE while
COMMA \,
EXCLAMATION_MARK \!
CONSTANT constant
MOVE Move
TURN Turn
GRAB Grab
RELEASE Release
READ_DATA Read_Data
SEND Send
RECEIVE Receive
CALL call
WITH with
NEW_FUNCTION_IS newFunctionIs
COLON \:
RETURN return
NOTHING nothing
READ read
WRITE write
GREATER greaterThan
LESS_THAN lessThan
EQUAL_TO equalTo
GREAT_EQ greaterEqual
LESS_EQ lessThanEqual
PLUS plus
MINUS minus
TIMES times
DIVIDED_BY dividedBy
INTEGER [+-]?[0-9]+
FLOAT [+-]?[0-9]*(\.)?[0-9]+
AND and
OR or
EQUALS equals
PROGRAM program 
CONST_IDENTIFIER [A-Z][A-Z0-9]*
IDENTIFIER [a-z][a-z0-9]*
FUNC_IDENTIFIER ([A-Z][a-z0-9_]+)+
COMMENT ps.*


%%
\n ;
[ \t] ;
{END_SIGN}  return END_SIGN;
{DOT}   return DOT; 
{IS}  return IS;
{IF}  return IF;
{ELSE}  return ELSE;
{BOOLEAN}  return BOOLEAN;
{WHILE}  return WHILE;
{COMMA}  return COMMA;
{EXCLAMATION_MARK}  return(EXCLAMATION_MARK );
{CONSTANT}   return(CONSTANT );
{MOVE} return(MOVE);
{TURN} return(TURN);
{GRAB} return(GRAB);
{RELEASE} return(RELEASE);
{READ_DATA} return(READ_DATA);
{SEND} return(SEND);
{RECEIVE} return(RECEIVE);
{CALL}   return(CALL );
{WITH}    return(WITH );
{NEW_FUNCTION_IS}  return(NEW_FUNCTION_IS );
{COLON}   return COLON ;
{RETURN}   return(RETURN );
{NOTHING} return(NOTHING );
{READ}   return(READ);
{WRITE}   return(WRITE);
{GREATER}   return(GREATER);
{LESS_THAN}   return LESS_THAN;
{EQUAL_TO}   return(EQUAL_TO);
{GREAT_EQ}   return(GREAT_EQ);
{LESS_EQ}   return(LESS_EQ);
{PLUS}   return(PLUS );
{MINUS}   return(MINUS );
{TIMES}   return(TIMES);
{DIVIDED_BY}   return(DIVIDED_BY );
{INTEGER}  {return INTEGER;}
{FLOAT}   return(FLOAT);
{AND}   return(AND );
{OR}   return(OR );
{EQUALS}   return(EQUALS );
{COMMENT} ;
{PROGRAM} return(PROGRAM );
{IDENTIFIER} {return IDENTIFIER;}
{CONST_IDENTIFIER}  return(CONST_IDENTIFIER );
{FUNC_IDENTIFIER} return(FUNC_IDENTIFIER );
%%
int yywrap(){return 1;}

void yyerror( char *s){ fprintf(stderr, "%s on line %d\n",s,yylineno);} 
