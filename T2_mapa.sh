#!/bin/bash -e
tamanho=0
comprimento=0
count=0

if [ -e temp.txt ]; then rm temp.txt; fi
if [ -e Valores.txt ]; then rm Valores.txt; fi

header="Paciente"
for arg in {1..5}; do
	header="$header \t Label $arg"
done

echo -e $header >> temp.txt

for folder in $(find ./ -maxdepth 1 -mindepth 1 -type d)
do
	cd $folder
	for files in $(ls *_e[12345678]*.mnc.gz);
	do
		let tamanho=${#files}
		let comprimento=tamanho-7
		IN=${files:0:comprimento}
		LBL=$(ls *_process_lbl_res.mnc.gz)

#		if [ ! -e $LBL.mnc.gz ]; then
#			echo -e "\033[01;033mCompactando (gzip) label."
#			gzip $LBL.mnc
#		fi

		if [ -e $IN.mnc.gz ] && [ -e $LBL ]; then
			echo -e "\033[01;033mProcessando $IN\033[00;00m"

			result="$IN"
			for arg in {1..5}; do
				tmp1=`mincstats -mean $IN.mnc.gz -mask ${LBL} -mask_binvalue $arg`
				result="$result \t ${tmp1:19}"
			done
			echo -e "$result" >>  ../temp.txt
		fi
	done
	cd ..
done
sed -e 's/\./,/g' temp.txt >> Valores.txt
rm temp.txt
