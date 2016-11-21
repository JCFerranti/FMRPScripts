#!/bin/bash -e
tamanho=0
comprimento=0
count=0

if [ -e volumes.txt ]; then rm volumes.txt; fi

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

#echo -e $header >> volumes.txt


for folder in $(find ./ -maxdepth 1 -mindepth 1 -type d)
do
	cd $folder
	for files in $(ls *_process.mnc.gz);
	do
		let tamanho=${#files}
		let comprimento=tamanho-15
		PROC=${files:0:comprimento}_process
		LBL=${files:0:comprimento}_process_lbl
		if [ ! -e $LBL.mnc.gz ]; then
			echo -e "\033[01;033mCompactando (gzip) label. ${LBL}.mnc.gz"
			gzip $LBL.mnc
		fi
		if [ -e $PROC.mnc.gz ] && [ -e $LBL.mnc.gz ]; then
			echo -e "\033[01;033mProcessando $MPR\033[00;00m"
			if [ -e ${LBL}_res.mnc.gz ]; then
				echo -e "${LBL}_res.mnc.gz ja existe. Ignorando"
			else
				res $LBL $PROC
			fi

			result="$PROC"
			for arg in $*; do
			echo "mincstats -histogram histogram_label_${arg}.txt ${PROC}.mnc.gz -mask ${LBL}_res.mnc.gz -mask_binvalue $arg -clobber"
			tmp2=`mincstats -histogram histogram_label_${arg}.txt ${PROC}.mnc.gz -mask ${LBL}_res.mnc.gz -mask_binvalue $arg -clobber`
			done

		fi
	done
	cd ..
done
