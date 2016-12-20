#mac_useful_functions.sh
current_file=m
ac_useful_functions.sh
echo "sourcing $current_file"


echo "	\->function mac_get_wget () : install wget avec brew sur un mac "
function mac_get_wget ()
{
	# [+1] needs wget
	test_wget=$(which wget)
	echo "test_wget=[$test_wget]"
	len_path=${#test_wget}
	echo "len_path=[$len_path]"
	if [ $len_path -lt 5 ]
	then
		echo "Missing wget => brew install wget"
		brew install wget
	fi
}

echo "	\->function mac_get_brew () : install bruw avec ruby sur un mac"
function mac_get_brew ()
{
	test_brew=$(which brew)
	echo "test_brew=[$test_brew]"
	len_path=${#test_brew}
	echo "len_path=[$len_path]"
	if [ $len_path -lt 5 ]
	then
		echo "Missing brew => install brew"
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
}

echo "	\->function mac_set_java_home () : export Java (vers /usr/libexec/java_home) home dans le bash profile, et le source."
function mac_set_java_home()
{
	echo "export JAVA_HOME=$(/usr/libexec/java_home)" >> ~/.bash_profile
	source ~/.bash_profile

}
