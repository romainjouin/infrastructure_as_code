#!/bin/bash
source reseau.sh
hadoop_dir="~/Informatique/hadoop"
url=http://mirrors.ircam.fr/pub/apache/hadoop/common/hadoop-2.6.4/hadoop-2.6.4.tar.gz
nom_tar=$(basename $url)
n=-1
version_hadoop=${nom_tar:0:$(expr ${#nom_tar} - 7)}
echo $nom_tar
echo $version_hadoop
ssh $1 /bin/bash <<EOC
rm $hadoop_dir/$version_hadoop/etc/hadoop/core-site.xml
cat <<EOF >$hadoop_dir/$version_hadoop/etc/hadoop/core-site.xml
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
<property>
 <name>fs.default.name</name>
<value>hdfs://$ip_master:$port_master_hadoop</value>
</property>
<property>
   <name>hadoop.proxyuser.httpfs.hosts</name>
   <value>*</value>
</property>
<property>
   <name>hadoop.proxyuser.httpfs.groups</name>
   <value>*</value>
</property>
<property>
   <name>hadoop.proxyuser.hdfs.groups</name>
   <value>*</value>
</property>
<property>
<name>hadoop.proxyuser.hdfs.hosts</name>
<value>*</value>
</property>
</configuration>
EOF
mkdir -p  $hadoop_dir/$version_hadoop/hdfs-data/dn
mkdir -p $hadoop_dir/$version_hadoop_dir/hdfs-data/nn
#rm $hadoop_dir/$version_hadoop/etc/hadoop/hdfs-site.xml 
cat <<hdfs-site >$hadoop_dir/$version_hadoop/etc/hadoop/hdfs-site.xml 
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>

<property>
<name>dfs.namenode.name.dir</name>
<value>file:///home/romain/Informatique/hadoop/hdfs-data/nn</value>
</property>

<property>
<name>dfs.datanode.data.dir</name>
<value>file://home/romain/Informatique/hadoop/hdfs-data/dn</value>
</property>

<property>
<name>dfs.webhdfs.enabled</name>
<value>true</value>
</property>

<property>
<name>dfs.replication</name>
<value>3</value>
</property>

</configuration>
hdfs-site



cat <<hadoop-env >$hadoop_dir/$version_hadoop/etc/hadoop/hadoop-env.sh

export JAVA_HOME=/usr/lib/jvm/java-8-oracle


hadoop-env


EOC

