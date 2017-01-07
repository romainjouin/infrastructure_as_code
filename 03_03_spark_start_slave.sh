#!/bin/bash
source 00_00_conf_variables.conf
if [[ "$#" -ne 2 ]]
then
	echo " Nombre de paramètres incorrect"
	echo "Parameters : 1 = ip_slave  , 2 =  ip_master" 
else
	slave=$1
	ip_master=$2
	ssh  $slave "~/$spark_home/sbin/start-slave.sh spark://$ip_master:7077"
fi
