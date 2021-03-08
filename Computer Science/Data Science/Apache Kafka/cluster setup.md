# Setup Kafka Cluster

## Getting Ready

## Change Server Properties

Set broker.id & broker.rack depending on the broker and/or node:

```bash
broker.id=0
broker.rack=RACK1
```

```bash
broker.id=1
broker.rack=RACK2
```

Change log.dirs as follows for each broker:

```bash
log.dirs=/home/kafka/kafka_2.12-2.7.0/kafka_data
```

Add the following:

```bash
offsets.topic.num.partitions=3
offsets.topic.replication.factor=2
min.insync.replicas=2
default.replication.factor=2
zookeeper.connect=kafkabroker1:2182,kafkabroker2:2182,kafkabroker3:2182
```

& create said directory as well:

```bash
cd ..
mkdir kafka_data
```

## Change Zookeeper Configurations

set dataDir to a path:

```bash
dataDir=/home/kafka/kafka_2.12-2.7.0/zookeeper_data
```

set clientPort to 2182 (NiFi zookeepers are using 2181):

```bash
clientPort=2182
```

& create said directory as well:

```bash
cd ..
mkdir zookeeper_data
```

## Start Kafka & Zookeeper Cluster

Start Kafka in each node:

```bash
# start broker
./bin/kafka-server-start.sh config/server.properties
```

Start Zookeeper in each node:

```bash
# start zookeeper
./bin/zookeeper-server-start.sh config/zookeeper.properties
```

## Testing Cluster

ssh into any server any check:

```bash
zookeeper-shell.sh kafkabroker1:2182 ls /brokers/ids
```
