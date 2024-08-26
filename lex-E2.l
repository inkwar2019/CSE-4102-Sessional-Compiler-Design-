%option noyywrap
%{
    #include <stdlib.h>
	#include <stdio.h>
    int i = 0;
%}
digits [0-9]
%%
{digits}+	{printf("Number found\n");}
[0-9a-zA-Z]+   {printf("String Found: %s (%d)\n",yytext,yyleng);}
%%
int main(int argc, char* argv[])
{
	if(argc > 1)
	{
		FILE *fp = fopen(argv[1], "r");
		if(fp)
			yyin = fp;
	}
	yylex();
	return 1;
}