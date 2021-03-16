# Setup Spark Standalone Cluster

## Getting Ready

Edit hosts file in all servers:

```bash
sudo vim /etc/hosts
```

```bash
<master ip address> sparkmasterserver
<slave1 ip address> sparkslaveserver1
<slave2 ip address> sparkslaveserver2
```

Install java and scala on all servers

```bash
# Whichever version your installing
sudo yum install java-1.8.0-openjdk
sudo yum install scala
```

check with:

```bash
java -version
scala -version
```

## Download and Install Spark

Download:

```bash
wget https://downloads.apache.org/spark/spark-3.1.1/spark-3.1.1-bin-hadoop2.7.tgz
```

untar:

```bash
tar xzf spark-3.1.1-bin-hadoop2.7.tgz
```

move to /usr/local/spark:

```bash
sudo mv spark-3.1.1-bin-hadoop2.7.tgz /usr/local/spark
```

Add to PATH:

```bash
export PATH = $PATH:/usr/local/spark/bin
```

## Configure Spark Master

ONLY IN MASTER

```bash
cd /usr/local/spark/conf
cp spark-env.sh.template spark-env.sh
sudo vim spark-env.sh
```

Add the following line to the file

```bash
export SPARK_MASTER_HOST='<master ip address>'
```

Open:

```bash
sudo vim workers
```

Add:

```bash
sparkmasterserver
sparkslaveserver1
sparkslaveserver2
```

## Starting Spark Cluster

<b> Inside the Master Node: </b>

To Start the Cluster:

```bash
cd /usr/local/spark
./sbin/start-all.sh
```

To Stop the Cluster:

```bash
cd /usr/local/spark
./sbin/stop-all.sh
```

## Testing Cluster

check using running java VMs on master

```bash
jps
```

run following commands to open shell for each language:

```bash
./pyspark
./spark-shell
# and for the rest
```

Check logs to find any errors and specific port number cluster is running on

## Spark Web UI

<b> Default Ports: </b>

Spark Master UI

```bash
http://<master ip address>:8080/
```

Spark Application UI:

```bash
http://<master ip address>:4040/
```
