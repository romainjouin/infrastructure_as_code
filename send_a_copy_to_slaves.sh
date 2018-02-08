source 00_00_conf_reseau.conf
#exchange_key.sh
for destination  in "${ips[@]}"
do
	echo "-----------------------"
	echo "=> $destination"
	scp $1 $destination:$2
done
