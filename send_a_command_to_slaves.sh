source 00_00_conf_reseau.conf
#exchange_key.sh
for destination  in "${ips[@]}"
do
	ssh $destination '$1'
done
