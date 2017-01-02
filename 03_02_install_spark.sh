source ./00_00_conf_variables.conf 
spark_tgz="$(basename $spark_tgz_url)"
spark_uncompressed="${spark_tgz::-4}"
mkdir -p  "$(dirname $spark_home)"
cd        $download_dir
#curl -O   $spark_tgz_url
tar -xvf  $spark_tgz
mv $spark_uncompressed $spark_home
