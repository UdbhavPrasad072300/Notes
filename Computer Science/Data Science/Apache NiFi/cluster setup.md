# Setup NiFi Cluster

## Getting Ready

Switch to root user for all servers with:

```bash
sudo su -
```

Get IP address of all servers with:

```bash
hostname -i
```

Add server names and IP addresses to hosts file for all servers

```bash
# Server 1
echo "13.197.10.1 nifiservername1" >> /etc/hosts
echo "13.197.10.1 nifiservername2" >> /etc/hosts
# Server 2
echo "13.197.10.1 nifiservername2" >> /etc/hosts
echo "13.197.10.1 nifiservername3" >> /etc/hosts
# And so on
```

You can test by pinging:

```bash
ping nifiserver1
```

Switch back to non-root user for all servers now

Install Java on all Servers:

```bash
# Whichever version your installing
sudo yum install java-1.8.0-openjdk
```

If you dont have internet access when scp java

Check with:

```bash
java -version
```

## Download NiFi

Download and Extract for all servers:

```bash
sudo yum -y install wget
wget https://downloads.apache.org/nifi/1.13.0/nifi-1.13.0-bin.tar.gz
tar zxf nifi-1.13.0-bin.tar.gz
rm -f nifi-1.13.0-bin.tar.gz
cd nifi-1.13.0/
```

## Change Zookeeper Configurations

Inside zookeeper.properties <b>FOR ALL SERVERS</b>:

Change Default:

```bash
server.1=
```

To the following format:

```bash
# format: server.<num>=<hostname>:2888:3888:2181
server.1=nifiserver1:2888:3888:2181
server.2=nifiserver2:2888:3888:2181
server.3=nifiserver3:2888:3888:2181
```

Make Directory for dataDir inside /home/uprasad/nifi-1.13.0/ for all servers:

```bash
cd ..
mkdir -p ./state/zookeeper
```

Create myid file in all servers as follows:

```bash
# Server 1
echo 1 >> ./state/zookeeper/myid
```

```bash
# Server 2
echo 2 >> ./state/zookeeper/myid
```

```bash
# Server 3
echo 3 >> ./state/zookeeper/myid
```

and so on...

## Change NiFi Properties

Inside nifi.properties change as follows:

```bash
cd conf
vim nifi.properties
```

Change (change hostname appropriately [nifiserver1, nifiserver2, ...]):

```bash
nifi.cluster.is.node=true
nifi.cluster.node.address=nifiserver1
nifi.cluster.node.protocol.port=9991
nifi.cluster.load.balance.host=nifiserver1

nifi.remote.input.host=nifiserver1
nifi.remote.input.secure=false
nifi.remote.input.socket.port=10000

nifi.web.http.host=nifiserver1

nifi.state.management.embedded.zookeeper.start=true

nifi.zookeeper.connect.string=nifiserver1:2181,nifiserver2:2181,nifiserver3:2181
```

## Start NiFi

with "&" NiFi runs in the background

For All Servers:

```bash
cd ../bin
./nifi.sh start &
```

Check Logs in directory:

```bash
cd ../logs
tail -f nifi-app.log
```

## Use NiFi

go to nifiserver1:8080/nifi/ on your browser FOR ALL SERVERS TO DOUBLE-CHECK

It will start initial work and take a while then start

Verify that all nodes are connected with the icon on the top-left side

You can work on any one of the server Web UI

Enjoy! orrrr GET TO WORK!!!
