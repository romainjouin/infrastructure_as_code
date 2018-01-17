source 00_00_conf_reseau.conf
cd ~
export PYSPARK_PYTHON=/home/spark/anaconda3/bin/python3.6
export PYTHONHASHSEED=323
export PYSPARK_DRIVER_PYTHON_OPTS="notebook --ip=* --no-browser"
export PYSPARK_DRIVER_PYTHON=jupyter 
~/spark/bin/pyspark –-master spark://$master:7077 --total-executor-cores 2

