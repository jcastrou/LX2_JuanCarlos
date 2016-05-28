#!/bin/bash

echo "*-*-*-*-* Espacio en el Disco *-*-*-*-*-*"
df -lh

echo "*-*-*-*-* Memoria en uso, disponibilidad de Memoria Ram y SWAP en MB *-*-*-*-*-*"

free -m

echo "*-*-*-*-* Interfaces de red conectadas al sistema *-*-*-*-*-*"
ifconfig

echo "*-*-*-*-* Estadisticas de la Red *-*-*-*-*-*"

netstat -s


echo "*-*-*-*-* Todos los puertos, activos y no activos  *-*-*-*-*-*"

netstat -a | more

echo "*-*-*-*-* Informacion de enrutamiento del kernel  *-*-*-*-*-*"
netstat -r


echo "*-*-*-*-* Conexiones Activas  *-*-*-*-*-*"
netstat -ltuna | grep ESTABLISHED

echo "*-*-*-*-* Uso de memoria Virtual por medio de los hilos nucleo,disco y actividad del procesor *-*-*-*-*-*"
vmstat

