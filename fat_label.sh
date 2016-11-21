#!/bin/bash -e
tamanho=0
comprimento=0
count=0

if [ -e gordura.txt ]; then rm gordura.txt; fi

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

echo -e $header >> gordura.txt

for folder in $(find ./ -maxdepth 1 -mindepth 1 -type d)
do
	cd $folder
	for files in $(ls *_e1.mnc.gz);
	do
		let tamanho=${#files}
		let comprimento=tamanho-10
		IN=${files:0:comprimento}_e1
		OUT=${files:0:comprimento}_e2
		LBL=${files:0:comprimento}_lbl
		if [ ! -e $LBL.mnc.gz ]; then
			echo -e "\033[01;033mCompactando (gzip) label."
			gzip $LBL.mnc
		fi
		if [ -e $IN.mnc.gz ] && [ -e $OUT.mnc.gz ] && [ -e $LBL.mnc.gz ]; then
			echo -e "\033[01;033mProcessando $MPR\033[00;00m"
			mincmath -double -sub ${OUT}.mnc.gz ${IN}.mnc.gz subtracao.mnc
			mincmath -double -div subtracao.mnc ${OUT}.mnc.gz div.mnc
			mincmath -double -mult -const 50 div.mnc fat_map_temp.mnc
			mincwindow fat_map_temp.mnc fat_map.mnc 0 100
			gzip fat_map.mnc
			res $LBL fat_map

			rm subtracao.mnc.gz div.mnc.gz fat_map_temp.mnc.gz

			result="$IN"
			for arg in $*; do
				tmp1=`mincstats -mean fat_map.mnc.gz -mask ${LBL}_res.mnc.gz -mask_binvalue $arg`
				result="$result \t ${tmp1:19}"
			done
		fi
	done
	cd ..
	echo -e "$result" >>  gordura.txt
done
