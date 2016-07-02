#!/bin/bash
rm cpu.dat
rm ram.dat
Mensaje="Ingrese la opcion que desea graficar"
opciones=("CPU" "RAM" "Salir")

ObtenerCpu() {
        for  (( ; ; ))
        do
        echo ` top -bn1 | grep "Cpu(s)" |sed "s/.*, *\([0-9.]*\)%* id.*/\1/"|awk '{print 100 -$1}'` >> cpu.dat
       	#Saco el porcentaje de cpu que se estan consumiendo en este momento
                sleep 1
        done
}
ObtenerRam() {
        for  (( ; ; ))
        do
       echo  `free -m | grep '+' | awk {'print $3'}` >> ram.dat
      #Saco el porcentaje de ram que se estan consumiendo en este momento
	      sleep 1
        done
}
echo "$Mensaje"
select opt in "${opciones[@]}"
do
		case $opt in
			"CPU")
		ObtenerCpu & 
		sleep 1 
		gnuplot liveCpu.gnu
		;;
		"RAM")
		ObtenerRam &
		sleep 1
		gnuplot liveRam.gnu
		;;
		"Salir")
		break
		;;
		*) echo "El numero ingresado no es una opcion"
		
		esac
done

