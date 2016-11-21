#!/bin/bash -e
tamanho=0
comprimento=0
count=0

if [ -e temp.txt ]; then rm temp.txt; fi

if [ $# -lt 1 ]; then
	echo -e "\033[01;031m Faltam Labels para processar.\033[00;00m"
	exit 1
else
	echo -e "\033[01;033mProcessando $# Labels."
fi

header="Paciente"
for arg in $*; do
	header="$header \t Label $arg"
done

echo -e $header >> temp.txt

for folder in $(find ./ -maxdepth 1 -mindepth 1 -type d)
do
	cd $folder
	echo -e "\033[01;033mProcessando $folder\033[00;00m"

	IN=$(ls *_e4.mnc.gz)
	LBL=$(ls *process_lbl_res.mnc.gz)
	if [ -e $IN ] && [ -e $LBL ]; then
		echo -e "\033[01;033mProcessando $MPR\033[00;00m"

		result="$IN"
		for arg in $*; do
			tmp1=`mincstats -volume ${IN} -mask ${LBL} -mask_binvalue $arg`
			result="$result \t ${tmp1:19}"
		done
	else
		echo "Faltam arquivos para processar!"
	fi

	cd ..
	echo -e "$result" >>  temp.txt
done
sed -e 's/\./,/g' temp.txt >> Volumes.txt
rm temp.txt
