#!/bin/bash
# add ssh alias to bashrc so that we can ssh to the network just by the machine name
# 1) importing network topology
source 00_00_conf_reseau.conf # import variable 'machines'
n=-1
for nom_machine in "${machines[@]}"
do
        n=$(( $n + 1 ))
        ip_machine=${ips[$n]}
        link=" $ip_machine $nom_machine"
        to_print="alias $nom_machine='ssh $nom_machine'"
	target_file="~/.bashrc"
        echo -e "$to_print" >> "$target_file"
	echo "[ $to_print ]  added to $target_file  (not tested)"
done

