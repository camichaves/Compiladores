/***************** 
  Definiciones
	Se colocan las cabeceras, variables y expresiones regulares

********************/


%{
  #include <stdio.h>
  #include <stdlib.h>
  #include "sintactico.tab.h"
  int linea=1;
%}
/*
Creamos todas las expresiones regulares
Creamos la definicion llamada DIGITO, podemos acceder esta definicion
usando {DIGITO}*/

DIGITO [0-9]
NUMERO {DIGITO}+("."{DIGITO}+)?
VARIABLE ([a-z|A-Z]+([0-9])*)+

%%
 /***************
   Reglas
 *****************/


 /* Creamos las reglas que reconoceran las cadenas que acepte
  nuestro scanner y retornaremos el token a bison con la
  funcion return. */
{NUMERO} {yylval.real=atof(yytext); return(NUMERO);}

"=" 	{return(IGUAL);}
"+" 	{return(MAS);}
"-" 	{return(MENOS);}
";" 	{return(PTOCOMA);}
","   {return(COMMA);}
"*" 	{return(POR);}
"/" 	{return(DIV);}
"(" 	{return(PAA);}
")" 	{return(PAC);}
"sin" {return(SIN);}
"cos" {return(COS);}
"pow" {return(POW);}
"\n" 	{linea++;}
[\t\r\f] {}
" "		{}
. {printf("Error simbolo no reconocido %s en linea %d \n",yytext, linea);}
 /* Si en nuestra entrada tiene algun caracter que no pertenece a 
   las reglas anteriores, se genera un error lexico */

%%
/* 
Codigo de Usuario

Aqui podemos realizar otras funciones, como por ejemplo ingresar
simbolos a nuestra tabal de simbolos o cualquier otra accione
del usuario.  
Todo lo que el usuario coloque en esta seccion se copiara al
archvi lex.yy.c tal y como esta.
*/
