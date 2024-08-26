%option noyywrap
%{
#include<stdio.h>
int line_no = 1;
%}
digits [0-9]
%%
{digits}+	{printf("Number found\n");}
[0-9a-zA-Z]+   {printf("String found\n"); }
. {return line_no;}
[\n] {line_no++;}
%%
int main()
{
	int i = yylex();
    	printf("%d",i);
	return 0;
}
