#!/bin/bash
url="http://d3kbcqa49mib13.cloudfront.net/spark-1.6.3-bin-hadoop2.6.tgz"
nom_tgz=$(basename $url)
spark_version=${nom_tgz::-4}
slave=$1
ip_master=$2
echo "ssh  $slave "~/Informatique/$spark_version/sbin/start-slave.sh spark://$ip_master:7077""
ssh  $slave "~/Informatique/$spark_version/sbin/start-slave.sh spark://$ip_master:7077"

