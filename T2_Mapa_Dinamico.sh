#!/bin/bash
tamanho=0
comprimento=0
count=0

if [ -e temp.txt ]; then rm temp.txt; fi
if [ -e Valores.txt ]; then rm Valores.txt; fi

header="Paciente \t\t"
#header1="\t\t"

for folder in $(find ./ -maxdepth 1 -mindepth 1 -type d)
do
	cd $folder

	#inicializar variáveis
	Echo=0
	EchoTime=0
	EchoCount=0
	X=0
	SomX=0
	Y=0
	LogY=0
	SomLogY=0
	SomXLogY=0
	SomXX=0

	#######################################################################
	# Primeiro, converter DICOM em MINC                                   #
	# No loop tb é descoberto a quantidades de echos                      #
	# utilizada no exame - Pode variar                                    #
	#######################################################################
	for file in $(find ./ -type f | grep -i DICOM | sort);
	do
                echo -e "\033[01;034mConvertendo arquivos para MINC\033[00;00m"
		temp=$(dcmdump $file | grep -i -a echotime)
		temp=${temp#*[}
		temp=${temp%]*}
		if [ "$EchoTime" -lt $temp ];
		then
			EchoTime=$temp
			EchoCount=$((EchoCount+1))
			header="${header} Echo $EchoCount = $EchoTime \t"
			#header="${header} Echo $EchoCount\t"
		fi
		d2m . $file
	done
	header="${header} T2"

	# Renomear o primeiro arquivo para padrão e capturar nome do paciente
        echo -e "\033[01;034mConsertando primeiro arquivo\033[00;00m"
	file=$(ls *_mri.mnc)
	file=${file:0:37}
	mv ${file}_mri.mnc ${file}_mri_version1.mnc
	gzip *.mnc

	# Estabelece Padrão de nomes dos arquivos
	file=${file}_mri_version

	# Quantidade de arquivos
	qtde=$(ls *version*.mnc.gz | wc -l)

	# resample do label com primeiro arquivo
	cp ../label.mnc.gz .
	res label ${file}1

	# Encontrar label
	lbl=$(ls *label_res*)

	#######################################################################
	# Calculo do T2                                                       #
	#######################################################################
	count=0
	result=""
	for arg in $(mincinfo label.mnc.gz -varvalues image | sort | uniq)
	do
                echo -e "\033[01;033mProcessando Label $arg\033[00;00m"
		result="${result} folder \t"
		result="${result} Label $arg \t\n"

		for i in $(seq 1 ${qtde});
		do
	                echo -e "\033[01;033mProcessando ${file}${i}.mnc.gz\033[00;00m"

			X=$(mincheader ${file}${i}.mnc.gz | grep -a echo_time)
			X=${X#*=}
			X=${X%;*}
			if [ "$X" != " 0. " ];
			then
				X=$(echo "$X*1000" | bc -l)
				#header1="${header1} $X \t"
				SomX=$(echo "$SomX+$X" | bc -l)
	                	#echo -e "\033[01;034m1. X=$X / SomX=$SomX\033[00;00m"

				Y=$(mincstats -mean ${file}${i}.mnc.gz -mask ${lbl} -mask_binvalue $arg)
       		        	Y=${Y:19}
				result="${result} $Y \t"
		               	LogY=$(echo "l($Y)" | bc -l)
        		        SomLogY=$(echo "$SomLogY+$LogY" | bc -l)
	        	        #echo -e "\033[01;034m2. Y=$Y / LogY=$LogY / SomLogY=$SomLogY \033[00;00m"

		                XLogY=$(echo "$X*$LogY" | bc -l)
        		        SomXLogY=$(echo "$SomXLogY+$XLogY" | bc -l)
	        	        #echo -e "\033[01;034m3. XLogY=$XLogY / SomXLogY=$SomXLogY \033[00;00m"

	                	XX=$(echo "$X*$X" | bc -l)
	        	        SomXX=$(echo "$SomXX+$XX" | bc -l)
		                #echo -e "\033[01;034m4. XX=$XX / SomXX=$SomXX \033[00;00m"

	                        count=$((count+1))
        	                if [ "$EchoCount" -eq $count ];
                	        then
                        	        # a = (Echos*soma(X*y)-soma(X)*soma(y)) /  (Echos*soma(X*X)-soma(X)*soma(X))
					a=$(echo "($EchoCount * $SomXLogY - $SomX * $SomLogY) / ($EchoCount * $SomXX - $SomX * $SomX)" | bc -l)
	                                echo "Calculando (EchoCount * SomXLogY - SomX * SomLogY) / (EchoCount * SomXX - SomX * SomX)"
        	                        echo "Calculando ($EchoCount * $SomXLogY - $SomX * $SomLogY) / ($EchoCount * $SomXX - $SomX * $SomX)"
                	                #T2 = -1/a
                        	        T2=$(echo "-1/$a" | bc -l)

	                                result="$result $T2 \n"

	                                SomX=0
        	                        LogY=0
                	                SomLogY=0
                        	        count=0
                                	SomXLogY=0
	                                SomXX=0
        	                fi
			fi
		done
	done
	cd ..
	echo -e $header >> temp.txt
	echo -e $result >> temp.txt
done

sed -e 's/\./,/g' temp.txt >> Valores.txt
rm temp.txt
