#linux_useful_functions.sh

echo "	\-> function ubuntu_get_java_8 () : ajoute le repo pour avoir java 8, et installe java 8"
function ubuntu_get_java_8 ()
{
	sudo add-apt-repository	--yes 	ppa:webupd8team/java	
	sudo apt-get 			--yes	update
	sudo apt-get 			--yes	install 	software-properties-common
	echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
	sudo apt-get 			--yes	install 	oracle-java8-installer
}


echo  "function ubuntu_get_docker() : télécharge docker"
function ubuntu_get_docker()
{
	sudo apt-get install aptitude
	sudo sh -c "wget -qO- https://get.docker.io/gpg | apt-key add -"
	sudo sh -c "echo deb http://get.docker.io/ubuntu docker main\ > /etc/apt/sources.list.d/docker.list"
	sudo apt-get 	update
	sudo aptitude 	update
	sudo aptitude 	install lxc-docker
}

echo "function ubuntu_get_cassandra() : télécharge cassandra"
function ubuntu_get_cassandra()
{
	# 1 - Add the Apache repository of Cassandra to /etc/apt/sources.list.d/cassandra.sources.list, for example for version 3.9:
	echo "deb http://www.apache.org/dist/cassandra/debian 39x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
	# 2 - Add the Apache Cassandra repository keys:
	curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -
	# 3 - add the public key A278B781FE4B2BDA
	sudo apt-key adv --keyserver pool.sks-keyservers.net --recv-key A278B781FE4B2BDA
	# 4 - Update the repositories:
	sudo apt-get update
	# 5 - Install Cassandra:
	sudo apt-get install cassandra
}