#!/bin/bash
source 00_00_conf_variables.conf
if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
else
	ssh $1 /bin/bash <<EOC
 	echo 'Y' | $hadoop_home/bin/hadoop namenode -format
EOC
fi
