if [ -e '~/python3/' ] ; then
  rm -rf ~/python3/
fi

curl -O https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
chmod +x Anaconda3-5.0.1-Linux-x86_64.sh
./Anaconda3-5.0.1-Linux-x86_64.sh
