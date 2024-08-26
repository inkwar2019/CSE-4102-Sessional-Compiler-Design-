%option noyywrap
%{
#include<stdio.h>
int line_no = 1;
%}
digits [0-9]
%%
"int" {printf("INT\n");}
"float" {printf("FLOAT\n");}
"main" {printf("MAIN\n");}
"(" {printf("LP\n");}
")" {printf("RP\n");}
"{" {printf("LB\n");}
"}" {printf("RB\n");}
"=" {printf("EQUL\n");}
";" {printf("SEMI\n");}

{digits}+	{printf("INT_VAL\n");}
{digits}+"."{digits}+	{printf("FLOAT_VAL\n");}
[a-zA-Z_][0-9a-zA-Z_$]*   {printf("ID\n"); }
[\n] {line_no++;}
[ \t] {}
. {return line_no;}
%%
int main()
{
	int i = yylex();
    if (i==0)
        printf("Lexical Analysis Completed\n");
    else
        printf("Eror at line %d\n",i);
	return 0;
}