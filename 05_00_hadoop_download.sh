#!/bin/bash
echo "Sourcing download_hadoop.sh"
echo "	\-> telecharge hadoop et le dezip dans [ $hadoop_dir ]"

source reseau.sh
hadoop_dir="~/Informatique/hadoop"
url=http://mirrors.ircam.fr/pub/apache/hadoop/common/hadoop-2.6.4/hadoop-2.6.4.tar.gz
nom_tar=$(basename $url)
n=-1
machines=("macair")
for nom_machine in "${machines[@]}"
do
	echo "ssh $nom_machine && mkdir $hadoop_dir  && cd $hadoop_dir && curl -O  $url && tar -xvf $nom_tar"
	ssh $nom_machine "[ -d $hadoop_dir ] ||  mkdir $hadoop_dir  && cd $hadoop_dir && curl -O  $url && tar -xvf $nom_tar"
done
