	#!/bin/bash
	Data=/home/cujc/Administrador_de_Servidores/LX2_JuanCarlos/src/proyectoFinal/problema2
mkdir $Data/datos_csv
OUT_DATA=$Data/datos_csv

m=0

for j in `find $DATA -name '*.xls'` 
	do
	echo "Procesando  Archivo $j"
	xls2csv $j > $OUT_DATA/datos-$m.csv
	let m=m+1
	done 2>error1.log
 
