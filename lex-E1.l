%option noyywrap
%{
#include<stdio.h>
int i = 0;
%}
digits [0-9]
%%
{digits}+	{printf("Number found\n");}
[0-9a-zA-Z]+   {printf("String Found\n");}
%%
int main()
{
	yylex();
	return 0;
}