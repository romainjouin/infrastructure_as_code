#linux_useful_functions.sh
echo "sourcing linux_useful_functions.sh"
echo "	\-> function is_string_of_5_letters () : vérifie si la commande passée en paramètre, renvoie plus de 5 caracteres"
function is_string_of_5_letters ()
{
	a_tester=$1
	limite=5
	lenght=${#a_tester}
	if [ $lenght -lt $limite ] 
	then
		echo " ! ! ! Something is wrong : ($0 $1) ! ! !"
		echo 0
	else
		echo "$1 > 5"
		echo 1
	fi
}

echo "	\->function download () : telecharge l'url passee en parametre $1 dans le répertoire $base_dir (setté ailleurs ?)"
function download ()
{
# expect one parameter : an url to download
# use wget to download the file
	if [ ! -d $base_dir ]
	then
		echo "ERROR : [$base_dir] is not a directory"
		return 1		
	fi
	url=$1
	filename="$(basename $url)"
	target_path="$base_dir/$filename"
	echo ""
	echo "download($url)"

	if [ -e $target_path ]
	then 
		echo "\-> $target_path already exists"
	else
		echo "[$filename] doesn't exist"
		echo " \-> Downloading $filename through  $url to $target_path"
		wget $url
		echo "mv [$filename] to [$target_path]"
		mv $filename $target_path
	fi
}
echo "	\->function sha256() : prend en paramètre deux urls : $1 fichier à downloader, $2 checksum du fichier - les télécharges dans $base_dir"
function sha256()
{
# expect two urls as parameters
# first : a file to download
# 2nd : a cheksum file
# download and checksum files
	echo " - sha256 - "
	echo "sha256 ($1, $2)"
	url_fichier=$1
	url_shasum=$2
	download $url_fichier
	download $url_shasum
	filename="$(basename $url_shasum)"
	f_shasum="$base_dir/$filename"
	fichier="$base_dir/$filename"
	echo "=> Verify shasum "
	echo "=> $f_shasum "
	echo "=> $fichier"
	result=$( cd $base_dir ;  shasum -a 256 -c $f_shasum )
	echo " result = [$result]"
	echo $result
}