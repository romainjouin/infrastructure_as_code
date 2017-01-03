#!/bin/bash

source 00_00_conf_variables.conf

if [[ $# -ne 1 ]]
then
	echo "Il faut un argument :  ip du maître"
else
	ip_master=$1
	ssh  $ip_master "$spark_home/sbin/start-master.sh"
fi
