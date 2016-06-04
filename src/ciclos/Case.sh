#!/bin/bash

#Ejemplo de case

shopt -s nocasematch
distro = $1

case "$distro" in
	Ubuntu)
		echo "Distribucion $1 Soportada"
	;;
	Centos)
                echo "Distribucion $1 Soportada"
        ;;
        
  	Fedora)
                echo "Distribucion $1 Soportada"
        ;;
	*)
		echo "distro no soportada"
esac
        

