#!/bin/
source 00_00_conf_reseau.conf
n=-1
for nom_machine in "${machines[@]}"
do
    link="romain@$nom_machine"
	cat ~/.ssh/id_rsa.pub | ssh $link 'cat >> ~/.ssh/authorized_keys'
done
