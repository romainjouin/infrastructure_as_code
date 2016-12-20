
echo "--debut sourcing generic_needed_import.sh--"
os_type=$(echo $OSTYPE)
if [[ $OSTYPE == "darwin"* ]];
then
	echo "I am a Mac";
	os="mac"

elif [[ $OSTYPE == "linux"* ]];
then
	echo "I am a linux"
	os="linux"
else
	echo "unknown os - exiting"
	exit
fi
echo "current_os : $os_type => var \$os = $os"
echo "--fin sourcing generic_needed_import.sh--"