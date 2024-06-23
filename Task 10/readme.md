# Task 10
Understanding the processing of large dataset on spark framework
# Procedure
- Open Cloudera and check if apache spark installed or not.
- If not installed, enter below commands to install
```
wget https://downloads.apache.org/spark/spark-3.3.2/spark-3.3.2-bin-hadoop3.2.tgz
tar xvf spark-3.3.2-bin-hadoop3.2.tgz
sudo mv spark-3.3.2-bin-hadoop3.2 /usr/local/spark
nano ~/.bashrc
export SPARK_HOME=/usr/local/spark
export PATH=$PATH:$SPARK_HOME/bin
source ~/.bashrc
spark-shell --version
```
- create the spark.py and mnm_dataset.csv file,which are in this folder.
- After creating spark.py file and mnm_dataset.csv files, enter below commands in cmd:
```
spark-submit spark.py /home/cloudera/mnm_dataset.csv
```
