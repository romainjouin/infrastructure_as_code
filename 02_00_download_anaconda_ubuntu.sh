if [ -d ~/anaconda3/z ] ; then
	echo "anaconda3 seems to be already installed"
else
echo "doesn't exist"
url=https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
delimiter="\/"
echo "going to install $url"
anaconda=$(echo $url | sed -e "s/$delimiter/\n/g" | tail -1)
echo $anaconda
	curl -O $url

	chmod +x $anaconda
	./$anaconda -b
fi
