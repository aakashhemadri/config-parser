%{
#include<iostream>
#include"yacp.h"
#include"config.h"
%}

comment ^#.*
name .+
arg (resolution)
modifier (1920*1024)
resource (screen)[ ]+{arg}[ ]+{modifier}
var [_a-zA-Z][_a-zA-Z0-9]*
set (set)[ ]+{var}[ ]+{name}

%%

{comment} {
    std::cout<<"comment";
}
{set} {
    std::cout<<"set";
}
{resource} {
    std::cout<<"resource";
}

%%

int yywrap(){
    return 0;
}

int main(int argv, char **argc) 
{ 
    extern FILE *yyin, *yyout; 
    yyin = fopen(argc[1], "r"); 
    yyout = fopen(argc[2], "w");
    yylex(); 
    return 0; 
} 