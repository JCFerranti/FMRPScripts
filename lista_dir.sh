#!/bin/bash
#numarq=0

#Estilos
#=======
#00: Nenhum
#01: Negrito
#04: Sublinhado
#05: Piscante
#07: Reverso
#08: Oculto

	
#Cores de texto
#==============
#30: Preto
#31: Vermelho
#32: Verde
#33: Amarelo
#34: Azul
#35: Magenta (Rosa)
#36: Ciano (Azul Ciano)
#37: Branco

	
#Cores de fundo
#==============
#40: Preto
#41: Vermelho
#42: Verde
#43: Amarelo
#44: Azul
#45: Magenta (Rosa)
#46: Ciano (Azul Ciano)
#47: Branco 


echo -e "\033[00;31m============================"
x=0
for pasta in $(ls);
do
	let x=$x+1
	echo $x
done
echo -e "============================";

echo -e "\033[00;32m============================"
for pasta in $(ls);
do
	[ -d "$pasta" ] &&
	array[x++]=$pasta
done
echo -e "Encontradas ${#array[@]} pastas."
echo -e "============================";


echo -e "\033[00;35m============================"
for item in "${array[@]}";
do
	echo $item
done
echo -e "============================";


echo -e "\033[00;0m============================"
for x in {1..${#array[@]}};
#for x in {0..2};
do
	echo ${array[x]}
done
echo -e "============================";
