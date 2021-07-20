sudo apt-get update
sudo apt-get upgrade
sudo apt install default-jdk scala git -y

cd ~

wget https://downloads.apache.org/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz
tar xzf spark-*
sudo mv spark-3.1.2-bin-hadoop3.2 /opt/spark

echo "export SPARK_HOME=/opt/spark" >> ~/.profile
echo "export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin" >> ~/.profile
echo "export PYSPARK_PYTHON=/usr/bin/python3" >> ~/.profile

start-master.sh
