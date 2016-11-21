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

header="Arquivo"
for arg in $*; do
	header="$header \t Label $arg"
done

for folder in $(find ./ -maxdepth 1 -mindepth 1 -type d); do
	cd $folder
	if [ -e "means.txt" ]; then
		rm means.txt
	fi
	echo -e "\033[01;031m processanto ${folder}.\033[00;00m"
	echo -e $header >> means.txt
	for files in $(ls *_e1.mnc.gz); do
		let tamanho=${#files}
		let comprimento=tamanho-10
		E1=${files:0:comprimento}_e1
		LBL=$(ls *_lbl_res.mnc.gz)

		result="$E1"
		for arg in $*; do
			tmp1=`mincstats -mean ${E1}.mnc.gz -mask ${LBL} -mask_binvalue $arg -clobber`
			#tmp1=$(tmp1/./,)
			result="$result \t${tmp1:19}"
		done
	done
	echo -e "$result" >> means.txt

        for files in $(ls *_e2.mnc.gz); do
                let tamanho=${#files}
                let comprimento=tamanho-10
                E2=${files:0:comprimento}_e2
                LBL=$(ls *_lbl_res.mnc.gz)

                result="$E2"
                for arg in $*; do
                        tmp1=`mincstats -mean ${E2}.mnc.gz -mask ${LBL} -mask_binvalue $arg -clobber`
                        #tmp1=$(tmp1/./,)
                        result="$result \t${tmp1:19}"
                done
        done
	echo -e "$result" >> means.txt

        for files in $(ls *_e3.mnc.gz); do
                let tamanho=${#files}
                let comprimento=tamanho-10
                E3=${files:0:comprimento}_e3
                LBL=$(ls *_lbl_res.mnc.gz)

                result="$E3"
                for arg in $*; do
                        tmp1=`mincstats -mean ${E3}.mnc.gz -mask ${LBL} -mask_binvalue $arg -clobber`
                        #tmp1=$(tmp1/./,)
                        result="$result \t${tmp1:19}"
                done
        done
	echo -e "$result" >> means.txt

        for files in $(ls *_e4.mnc.gz); do
                let tamanho=${#files}
                let comprimento=tamanho-10
                E4=${files:0:comprimento}_e4
                LBL=$(ls *_lbl_res.mnc.gz)

                result="$E4"
                for arg in $*; do
                        tmp1=`mincstats -mean ${E4}.mnc.gz -mask ${LBL} -mask_binvalue $arg -clobber`
                        #tmp1=$(tmp1/./,)
                        result="$result \t${tmp1:19}"
                done
        done
	echo -e "$result" >> means.txt

        for files in $(ls *_e5.mnc.gz); do
                let tamanho=${#files}
                let comprimento=tamanho-10
                E5=${files:0:comprimento}_e5
                LBL=$(ls *_lbl_res.mnc.gz)

                result="$E5"
                for arg in $*; do
                        tmp1=`mincstats -mean ${E5}.mnc.gz -mask ${LBL} -mask_binvalue $arg -clobber`
                        #tmp1=$(tmp1/./,)
                        result="$result \t${tmp1:19}"
                done
        done
	echo -e "$result" >> means.txt
	cd ..
done
