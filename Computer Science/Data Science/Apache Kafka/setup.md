# Setup Kafka Cluster

## Creating User for Kafka

Minimizing Damage to machine in Kafka Server Comprimised

```bash
# Add User
# Add to sudo group
# Login to kafka user
sudo adduser kafka
sudo adduser kafka sudo
su -l kafka
```

## Download and Install Kafka 2.7.0

Remember to Change Filepath as Desired

```bash
curl "https://downloads.apache.org/kafka/2.7.0/kafka_2.13-2.7.0.tgz" -o /home/kafka/kafka.tgz
tar -xzf kafka.tgz
cd /home/kafka/kafka_2.13-2.7.0/
```

## Starting Kafka Environment

```bash
# Start the ZooKeeper service
# Note: Soon, ZooKeeper will no longer be required by Apache Kafka.
sudo bin/zookeeper-server-start.sh config/zookeeper.properties
```

And in another Terminal:

```bash
# Start the Kafka broker service
sudo bin/kafka-server-start.sh config/server.properties
```
