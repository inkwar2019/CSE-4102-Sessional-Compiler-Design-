
%{
    #include<stdio.h>
    int i = 0;
    char *file1;
%}
digits [0-9]
%%
{digits}+	{printf("Number found\n");}
[0-9a-zA-Z]+   {printf("String Found\n");}
%%
int yywrap()
{
  	FILE *newfile_pointer;
  	char *file2="input-2.txt";
  	newfile_pointer = fopen("input-2.txt","r");
  	if(strcmp(file1,file2)!=0)
  	{
  		file1=file2;  
  		yyin = newfile_pointer;
    		return 0;
  	}
  	else
  		return 1;
}
int main()
{
    file1="input-1.txt";
  	yyin = fopen("input-1.txt","r");
	int num = yylex();
	printf("Found: %d",num);
	return 0;
}