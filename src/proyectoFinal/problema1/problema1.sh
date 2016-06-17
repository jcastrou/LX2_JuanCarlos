#!/bin/bash

DATA=/home/cujc/Administrador_de_Servidores/LX2_JuanCarlos/src/proyectoFinal/problema1
GRAF_DATA=$DATA/datos_graf
mkdir $GRAF_DATA
m=0

	for e in `find $Data -name "Datos.*"`
	do
	echo "Dando formato de datos para graficar el archivo de $e"
		cat $e | awk -F "\",\"" '{print $1 " " $2 " " $3 " " $4 " " $5}' | sed '1,$ s/"//g' | sed '1,$ s/TOA5/#TOA5/g'| sed '1,$ s/TIMESTAMP/#TIMESTAMP/g' |sed '1,$ s/TS/#Ts/g' | sed '1,$ s/Smp/#Smp/g'
		 > $GRAF_DATA/graf-$m.dat
	let m=m+1
	done 2> error2.log
	


