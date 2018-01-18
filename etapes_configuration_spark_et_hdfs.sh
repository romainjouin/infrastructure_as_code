sudo ls
sudo apt-get update
sudo apt-get -y install git
git clone https://github.com/romainjouin/infrastructure_as_code
cd infrastructure_as_code/
./02_00_download_anaconda_ubuntu.sh
./03_01_install_java_linux.sh
./03_02_install_spark.sh
./05_00_download_hadoop.sh
./05_01_hdfs_configure.sh
