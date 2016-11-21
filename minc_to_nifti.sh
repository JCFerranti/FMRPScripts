#!/bin/bash

#####################################################################
# Author: Julio Cesar Ferranti                                      #
#####################################################################
# Converte as imagens MINC em NIFTI e organiza as pastas            #
#####################################################################

echo -e "\033[01;031mEncontrando MINc para conversão em NIFT.\033[00;00m"

for file in $(find -maxdepth 1 -mindepth 1 | grep mnc)
do
	tam=${#file}
        nome=${file:0:tam-4}

	echo -e "\033[01;33mConvertendo $nome.mnc\033[00;00m"
	mnc2nii -q -nii -short ${nome}.mnc ${nome}.nii
done
	echo -e "\033[01;33mEncerrada a conversao de todas as pastas.\033[00;00m"

exit 0
