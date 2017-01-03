#!/bin/bash
slave=$1
ip_master=$2
if [[ $# -ne 2 ]]
then
	echo "Il faut deux arguments : (1 = ip du slave, 2 =  ip du maître"
else

	echo "ssh  $slave "$spark_home/sbin/start-slave.sh spark://$ip_master:7077""
	ssh  $slave "$spark_home/sbin/start-slave.sh spark://$ip_master:7077"
fi
