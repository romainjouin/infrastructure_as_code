#!/bin/bash
# Add network machine's names into  /etc/hosts  of current server
# To be launched as sudo

# 1) importing network topology
source 00_00_conf_reseau.conf # import variable 'machines'
n=-1
for nom_machine in "${machines[@]}"
do
        n=$(( $n + 1 ))
        ip_machine=${ips[$n]}
        link=" $ip_machine $nom_machine"
        echo -e "$link" >> /etc/hosts
done

