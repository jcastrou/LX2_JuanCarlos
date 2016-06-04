#!/bin/bash
errorlog="$0.er"
#La salida estandar de error estara redireccionarda al archivo PracticasEnClase.sh
if cp archivo1.txt archivo1.txt.bck2> $errorLog
then
	echo "El archivo1.txt fue correctamente respaldado..."
else
	echo "El archivo1.txt no pudo ser respaldado,verifique el log: $errorlog"
fi

echo "#####SEGUNDO EJERCICIO PAGINA 10 #######"
#La salida estandar de error estara redireccionarda al archivo PracticasEnClase.sh
if cp archivo1.txt archivo1.txt.bck2> $errorLog
then
	echo "El archivo1.txt fue correctamente respadado..."
	echo "Eliminando el archivo original"
###El ejemplo de un IF anidado, una condicion contenida dentro de otra
if rm archivo1.txt
then
	echo "El archivo original fue eliminado correctamente..."
else
	echo "El archivo1.txt no pudo ser respaldado, verifique el log : $errorlog"
fi

echo "#######TERCER EJERCICIO PAGINA 13 ########"

if test -e $1 #El comand "test -e" verifica que el archivo exista
then
	cp $1.bck
	echo "El archivo $2 fue correctamente respaldado"
elif test -e $3
then
	cp $3 $3.bck
	echo "El archivo $3 fue correctamente respaldado"
else
	echo "No se pudo respaldar ninguno de los archivos: $@"
fi

echo "######CUARTO EJERCICIO ESTRUCTURAS FOR#####"

for a in casa caja carro
do
	echo "El valor de la variab\"a\" es: $a"
	echo "Validando el elemento..."
	#Validara el valor de cada elemento
	if [$a = carro]
	then 	
		echo "En los elementos existe la palabra carro..."
	else

		echo "En los elementos NO existe la palabra carro" 
	fi
	done  

