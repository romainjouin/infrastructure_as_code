source ./00_00_conf_variables.conf 
hadoop_tgz="$(basename $hadoop_tgz_url)"
if [[ "$hadoop_tgz" == *.tar.gz ]]
 then
	hadoop_uncompressed="${hadoop_tgz::-7}"
	echo " - 7 : $hadoop_uncompressed"
elif [[ "$hadoop_tgz" == *.tgz ]] 
then
	hadoop_uncompressed="${hadoop_tgz::-4}"

	echo " - 4 : $hadoop_uncompressed"
else
	echo "->ERROR :"
	echo "adresse inconnue : $hadoop_tgz "
	echo " ne se termine ni par tgz ni par .tar.gz"
	exit -1
fi

mkdir -p  "$(dirname $hadoop_home)"
cd        $download_dir
echo "$hadoop_tgz_url"
curl -O   $hadoop_tgz_url
tar -xvf  $hadoop_tgz
if [[ "$os" == "mac" ]] 
then
	rm -rf $hadoop_home
fi
echo  "[ $hadoop_uncompressed - $hadoop_home ]"
mv       $hadoop_uncompressed $hadoop_home
