#!/bin/bash -e
tamanho=0
comprimento=0
count=0

if [ -e temp.txt ]; then rm temp.txt; fi
if [ -e Valores.txt ]; then rm Valores.txt; fi

header="Paciente \t"
for arg in {1..8}; do
	header="$header \t Echo $arg"
done

echo -e $header >> temp.txt

#############################
# extrair tempo das imagens #
#############################
#X=(20 40 60 80 100 120 140 160)
#SomX=$(echo "20+40+60+80+100+120+140+160" | bc -l)

for folder in $(find ./ -maxdepth 1 -mindepth 1 -type d)
do
	cd $folder
	result="$folder"

	for arg in {1..5}; do
		result="$folder \t Label $arg"
		SomY=0
		SomX=0
		cont=0
		SomXy=0
		SomXX=0
		NEcos=0
		echo -e "\033[01;034mProcessando $folder - Label $arg\033[00;00m"
		for files in $(ls *_e[12345678]*.mnc.gz); do
			let tamanho=${#files}
			let comprimento=tamanho-7
			IN=${files:0:comprimento}
			LBL=$(ls *_process_lbl_res.mnc.gz)

			echo -e "\033[01;033mCalcular Tempo de Eco\033[00;00m"
			temp=`mincheader $files | grep -a echo_time`
			X=${temp:26:4}
			X=$(echo "$X*1000" | bc -l)
			SomX=$(echo "$SomX+$X" | bc -l)
			echo -e "\033[01;033mTempo de Eco $X\033[00;00m"

			echo -e "\033[01;033mCalcular Log(mean)\033[00;00m"
			Y=`mincstats -mean $IN.mnc.gz -mask ${LBL} -mask_binvalue $arg`
			Y=${Y:19}
			y=$(echo "l($Y)" | bc -l)
			echo -e "\033[01;033mSomatoria Som(y)\033[00;00m"
			SomY=$(echo "$SomY+$y" | bc -l)

			echo -e "\033[01;033mSomatoria Som(X*y)\033[00;00m"
			# Somatoria(X*y)
			Xy=$(echo "$X*$y" | bc -l)
			SomXy=$(echo "$SomXy+$Xy" | bc -l)

			echo -e "\033[01;033mCalcular Som(X*X)\033[00;00m"
			# Somatoria(X*X)
			XX=$(echo "$X*$X" | bc -l)
			SomXX=$(echo "$SomXX+$XX" | bc -l)

			result="$result \t $Y"
			NEcos=$(($NEcos+1))
		done

		# e[1..8] = Y 	X[1..8]=20..160
		# y=ln(Y)
		# a = (8*soma(X*y)-soma(X)*soma(y)) /  (8*soma(X*X)-soma(X)*soma(X))
		# 8 = tamanho do vetor de ecos
		echo $NEcos
		a=$(echo "($NEcos * $SomXy - $SomX * $SomY) / ($NEcos * $SomXX - $SomX * $SomX)" | bc -l)
		#echo "Processando (NEcos * SomXy - SomX * SomY) / (NEcos * SomXX - SomX * SomX)"
		#echo "Processando (NEcos * $SomXy - $SomX * $SomY) / (NEcos * $SomXX - $SomX * $SomX)"
		#T2 = -1/a
		T2=$(echo "-1/$a" | bc -l)
		#echo "Processando -1/$a"
		#echo $T2

		result="$result \t $T2"
		echo -e "$result" >>  ../temp.txt
	done
	cd ..
done
sed -e 's/\./,/g' temp.txt >> Valores.txt
rm temp.txt
