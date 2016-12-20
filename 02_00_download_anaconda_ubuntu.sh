#!bin/bash
source 00_00_useful_functions_generic.sh
url=https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh

filename="$(basename $url)"
target_path="$base_dir/$filename"
download $url
bash target_path

