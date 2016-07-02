#!/bin/bash
Data=/home/cujc/Administrador_de_Servidores/LX2_JuanCarlos/src/proyectoFinal/problema2
mkdir $Data/datos_csv
OUT_DATA=$Data/datos_csv
GRAF_DATA=$Data/datos_graf
FULL_DATA=$Data/full_datos
mkdir $GRAF_DATA
mkdir $FULL_DATA

m=0
#Convertir los archivos del formato .xls al formato .csv
for j in `find $DATA -name '*.xls'` 
	do
	echo "Procesando  Archivo $j"
xls2csv $j > $OUT_DATA/datos-$m.csv
	let m=m+1
	done 2>ErrorConversionDeArchivos.log
 
#Dar formato a los archivos para poderlos imprimir
m=0
for p in `find $OUT_DATA -name "*.csv"`
do
	echo "Dando formato a los datos para graficar el archivo  $p"
	cat $p | awk -F "\",\"" '{print $2}' | sed '1,$ s/"//g' | sed '2 s/Monto/#Monto/g'  > $GRAF_DATA/grafico-$m.dat
	let m=m+1
	done 2>ErrorGrafica.log
m=0
#Revisa si el archivo de los datos de agua existe para borrarlo
if [ -a $FULL_DATA/agua.dat ]
then
	rm $FULL_DATA/agua.dat
	echo "Archivo agua.dat borrado"
	fi 2>ErrorIf1.log

#Saca la informacion de los 6 meses del agua
for k in `find $GRAF_DATA -name "*.dat"`
do
	sed '4,$d' $k >> $FULL_DATA/agua.dat
 	echo "Procesando archivo $k,sacando datos de los 6 mese del agua"
        let m=m+1
        done 2>ErrorConElFULL.log

#Revisa si el archivo de los datos de luz existe para borrarlo
if [ -a $FULL_DATA/Luz.dat ]
then
        rm $FULL_DATA/Luz.dat
        echo "Archivo Luz.dat borrado"
        fi 2>ErrorIf.log

#Saca la informacion de a luz
for u in `find $GRAF_DATA -name "*.dat"`
do
        sed -i '2,3d' $u >> $FULL_DATA/Luz.dat
	sed    '3,$d'  $u >> $FULL_DATA/Luz.dat
	echo "Procesando archivo $u,tres primeros meses de Luz"
        let m=m+1
        done 2>ErrorConElFULL.log

DATA_AGUA=$FULL_DATA/agua.dat
DATA_LUZ=$FULL_DATA/Luz.dat
graficarAgua(){

gnuplot <<EOF 2> error.log
set term png
set output 'AGUA.png'
plot "$DATA_AGUA" using 1:1 with lines title "Agua de los 6 meses"

EOF
}
graficarLuz(){

gnuplot <<EOF 2> error.log
set term png
set output 'LUZ.png'
plot "$DATA_LUZ" using 1:1 with lines title "Luz de los primeros 3 meses"

EOF
}

graficarAgua  
graficarLuz

echo "SUPER SCRIPT EJECUTADO DE MANERA EXITOSA"    
