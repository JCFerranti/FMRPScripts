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

echo -e $header >> volumes.txt

for files in $(ls *_mpr.mnc.gz);
do
	let tamanho=${#files}
	let comprimento=tamanho-11
	MPR=${files:0:comprimento}_mpr
	ASEGAPARC=${files:0:comprimento}_mpr_aparc+aseg
	if [ -e $MPR.mnc.gz ] && [ -e $ASEGAPARC.mnc.gz ]; then
		echo -e "\033[01;033mProcessando $MPR\033[00;00m"
		if [ -e ${ASEGAPARC}_res.mnc.gz ]; then
			echo -e "${ASEGAPARC}_res.mnc.gz ja existe. Ignorando"
		else
			res $ASEGAPARC $MPR
		fi

		result="$MPR"
		for arg in $*; do
			tmp1=`mincstats -volume ${MPR}.mnc.gz -mask ${ASEGAPARC}_res.mnc.gz -mask_binvalue $arg`
			result="$result \t ${tmp1:19}"
		done

		echo -e "$result" >>  volumes.txt
	fi
done
