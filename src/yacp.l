%{
#include<iostream>
#include"yacp.h"
#define RESOURCE_DEF screen|usb|keyboard
#define ARG_DEF resolution|brightness
#define MODIFIER_DEF 1920*1024|2560*1920|[0 - 100][%]
int col = 0, last_col = 0, line = 0;
%}

comment ^#.*
name [a-zA-Z0-9!@#\$%\^&\*\(\)\\\/_\-\[\]\{\}\+=<>.""]+[\n]

arg_screen resolution|brightness
arg_keyboard backlit|layout|region

mod_screen 1920*1024|2560*1920|[0 - 100][%]
mod_keyboard [0 - 3]|qwerty|dvorak|us|uk

resource screen|keyboard

var [_a-zA-Z][_a-zA-Z0-9]*
set (set)[ ]+{var}[ ]+{name}

%x MATCH

%x screen
%x keyboard

%%
BEGIN(MATCH)
<match>{comment} {
    line++;
    std::cout<<"This a comment\n";
}
<match>{set} {
    line++;
    std::cout<<"This is a set\n";
}
<match>{resource} {
    line++;
    if(strcmp(yytext,"screen")){
        BEGIN(screen)
    }
    else {
        BEGIN(keyboard)
    }
}

<screen>{arg_screen}[]{mod_screen} {
    
}

<keyboard>{arg_keyboard}[]{mod_keyboard} {
    
}

. col++; 
\n {
line++;
col = col - last_col;
last_col = col;
std::cout<<"Parse error at line: "<<line<<" & col: "<<col<<std::endl;
return 1;
}
%%

int yywrap(){
    return 0;
}

int main(int argv, char **argc) 
{ 
    yyin = fopen(argc[1], "r"); 
    yyout = fopen(argc[2], "w");
    yylex(); 
    return 0; 
} 