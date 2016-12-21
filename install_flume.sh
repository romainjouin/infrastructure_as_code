mkdir ~/flume
cd ~/flume
curl -O http://wwwftp.ciril.fr/pub/apache/flume/1.6.0/apache-flume-1.6.0-bin.tar.gz  
tar -zxvf apache-flume-1.6.0-bin.tar.gz
mv  apache-flume-1.6.0-bin flume
cd flume
echo "export FLUME_HOME=\'~/flume/flume/\'" >> ~/.bash_profile
cp ~/spark/spark-1.6/lib/spark-assembly-1.6.2-hadoop2.6.0.jar .
curl -O http://jcenter.bintray.com/org/apache/spark/spark-streaming-flume-sink_2.10/1.6.2/spark-streaming-flume-sink_2.10-1.6.0.jar
curl -O http://jcenter.bintray.com/org/apache/spark/spark-streaming-flume_2.10/1.6.2/spark-streaming-flume_2.10-1.6.0.jar

