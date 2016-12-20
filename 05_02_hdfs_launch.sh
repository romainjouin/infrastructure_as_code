#!/bin/bash
source reseau.sh
hadoop_dir="~/Informatique/hadoop"
url=http://mirrors.ircam.fr/pub/apache/hadoop/common/hadoop-2.6.4/hadoop-2.6.4.tar.gz
nom_tar=$(basename $url)
n=-1
version_hadoop=${nom_tar:0:$(expr ${#nom_tar} - 7)}
echo $nom_tar
echo $version_hadoop

ssh $1 /bin/bash <<EOC
 echo 'Y' | $hadoop_dir/$version_hadoop/bin/hadoop namenode -format
EOC
