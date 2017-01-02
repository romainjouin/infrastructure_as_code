#!/bin/bash
source 00_00_conf_variables.conf 

ssh $1 /bin/bash <<EOC
rm $hadoop_home/etc/hadoop/core-site.xml
cat <<EOF >$hadoop_home/etc/hadoop/core-site.xml
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
<property>
 <name>fs.default.name</name>
<value>hdfs://$ip_master:$hadoop_port_master_hadoop</value>
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
mkdir -p $hadoop_home/hdfs-data/dn
mkdir -p $hadoop_home/hdfs-data/nn
rm       $hadoop_home/etc/hadoop/hdfs-site.xml 
cat <<hdfs-site >$hadoop_home/etc/hadoop/hdfs-site.xml 
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>

<property>
<name>dfs.namenode.name.dir</name>
<value>file://$hadoop_home/hdfs-data/nn</value>
</property>

<property>
<name>dfs.datanode.data.dir</name>
<value>file://$hadoop_home/hdfs-data/dn</value>
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



cat <<hadoop-env >$hadoop_home/etc/hadoop/hadoop-env.sh

export JAVA_HOME=/usr/lib/jvm/java-8-oracle


hadoop-env


EOC

