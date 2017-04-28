grammar rbb3_dgmn;

goal
	: main declaration* EOF
	;

main
	: CLASS identifier OCBRACKET PUBLIC STATIC VOID MAIN OABRACKET STRING OBBRACKET CBBRACKET identifier CABRACKET OCBRACKET statement CCBRACKET CCBRACKET
	;

declaration 
	: CLASS identifier (EXTENDS identifier)? OCBRACKET (vardeclaration)* (metdeclaration)* CCBRACKET
	;

vardeclaration
	: type identifier ENDLINE
	;

metdeclaration
	: PUBLIC type identifier OABRACKET (type identifier (COMMA type identifier)*)? CABRACKET OCBRACKET (vardeclaration)* (statement)* RETURN expression ENDLINE CCBRACKET
	;

type
	: INT OBBRACKET CBBRACKET
	| BOOLEAN
	| INT
	| identifier
	;

statement
	: OCBRACKET (statement)* CCBRACKET
	| IF OABRACKET expression CABRACKET statement ELSE statement
	| WHILE OABRACKET expression CABRACKET statement
	| SYSTEMOUTPRINTLN OABRACKET expression CABRACKET ENDLINE
	| identifier EQUALS expression ENDLINE
	| identifier OBBRACKET expression CBBRACKET EQUALS expression ENDLINE
	;

expression
	: expression (AND | LESS | PLUS | MINUS | TIMES) expression
	| expression OBBRACKET expression CBBRACKET
	| expression DOT LENGTH
	| expression DOT identifier OABRACKET (expression (COMMA expression)* )? CABRACKET
	| integer
	| TRUE
	| FALSE
	| identifier
	| THIS
	| NEW INT OBBRACKET expression CBBRACKET
	| NEW identifier OABRACKET CABRACKET
	| EXCLAMATION expression
	| OABRACKET expression CABRACKET
	;

identifier
	: (UNDERLNE | [A-Za-z])((([A-Za-z] | [0-9] | UNDERLINE)+)*)
	;

integer
	: ([1-9][0-9]*) 
	| ZERO
	;

space
	: '\n'
	| ' '
	| '\t'
	| '\r'
	-> skip
	;

singlelinecomment
	: '//'
	| (~[\r\n])*
	-> skip
	;

multilinecomment
	: '/*' .*? '*/'
	-> skip
	;

// Reserved expressions


LENGTH
	: 'length'
	;

TRUE
	: 'true'
	;

FALSE
	: 'false'
	;

THIS
	: 'this'
	;

NEW
	: 'new'
	;

CLASS
	: 'class'
	;
	
PUBLIC
	: 'public'
	;
	
STATIC
	: 'static'
	;
	
VOID
	: 'void'
	;
	
MAIN
	: 'main'
	;
	
STRING
	: 'String'
	;
	
EXTENDS
	: 'extends'
	;
	
RETURN
	: 'return'
	;

INT
	: 'int'
	;

BOOLEAN
	: 'boolean'
	;
	
IF
	: 'if'
	;

ELSE
	: 'else'
	;	

WHILE
	: 'while'
	;

SYSTEMOUTPRINTLN
	: 'System.out.println'
	;


// Characters


ZERO
	: '0'
	;

UNDERLINE
	: '_'
	;

ENDLINE
	: ';'
	;
	
COMMA
	: ','
	;
	
DOT
	: '.'
	;

EXCLAMATION
	: '!'
	;

EQUALS
	: '='
	;
	
AND
	:'&&'
	;

LESS
	: '<'
	;

TIMES
	: '*'
	;

PLUS
	: '+'
	;

MINUS
	: '-'
	;
	
OABRACKET
	: '('
	;
	
CABRACKET
	: ')'
	;
	
OBBRACKET
	: '['
	;
	
CBBRACKET
	: ']'
	;
	
OCBRACKET
	: '{'
	;
	
CCBRACKET
	: '}'
	;