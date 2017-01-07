sudo apt-get --yes --force-yes install lm-sensors
sudo sensors-detect --yes
sudo service kmod start
echo "launching sensors"
watch -n 5 'sensors'
