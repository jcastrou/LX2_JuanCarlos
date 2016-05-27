	#!/bin/bash
	Data=/home/cujc/Administrador_de_Servidores/LX2_JuanCarlos/src/proyectoFinal/problema2
mkdir $Data/datos_csv
OUT_DATA=$Data/datos_csv
GRAF_DATA=$Data/datos_graf
mkdir $GRAF_DATA


m=0

for j in `find $DATA -name '*.xls'` 
	do
	echo "Procesando  Archivo $j"
	xls2csv $j > $OUT_DATA/datos-$m.csv
	let m=m+1
	done 2>/home/cujc/Administrador_de_Servidores/LX2_JuanCarlos/error/ErrorConversionDeArchivos.log
 

m=0
for p in `find $OUT_DATA -name "*.csv"`
do
	echo "Procesando datos del archivo $p para generar el grafico correspondiente al AGUA desde el mes de ENERO a JUNIO"
	cat $p | awk -F "\",\"" '{print $2}' | sed '1,$ s/"//g' | sed '2 s/AGUA/#AGUA/g' > $GRAF_DATA/grafico-$m.dat
	let m=m+1
	done 2>/home/cujc/Administrador_de_Servidores/LX2_JuanCarlos/error/ErrorGrafica.log

