source ./00_00_conf_variables.conf 
hadoop_tgz="$(basename $hadoop_tgz_url)"
if [[ "$hadoop_tgz" == *.tar.gz ]]
 then
	hadoop_uncompressed="${hadoop_tgz::-7}"
elif [[ "$hadoop_tgz" == *.tgz ]] 
then
	hadoop_uncompressed="${hadoop_tgz::-4}"
else
	echo "->ERROR :"
	echo "adresse inconnue : $hadoop_tgz "
	echo " ne se termine ni par tgz ni par .tar.gz"
	exit -1
fi

mkdir -p  "$(dirname $hadoop_home)"
cd        $download_dir
#curl -O   $hadoop_tgz_url
#tar -xvf  $hadoop_tgz
mv $hadoop_uncompressed $hadoop_home
echo  $hadoop_uncompressed $hadoop_home
