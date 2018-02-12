echo "export PYSPARK_PYTHON=/home/spark/anaconda3/bin/python3.6" >> ~/.bashrc
echo "export PYTHONHASHSEED=323" >> ~/.bashrc
echo "export PYSPARK_DRIVER_PYTHON_OPTS="notebook --ip=* "" >> ~/.bashrc
echo "export PYSPARK_DRIVER_PYTHON=jupyter " >> ~/.bashrc
