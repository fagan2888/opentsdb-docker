# OpenTSDB

sudo docker run -d -h opentsdb --name opentsdb -p 4242:4242 --link hbase:hbase -e HBASE_ZK=hbase:2181 antoniojfsousa/opentsdb:latest


Requirements: 

HBASE container needs to be running

OpenTSDB tables need to be installed on HBASE

hbase zk is passed to /etc/hosts once we link




# Access the shell

sudo docker exec -i -t opentsdb bash



# Start with Interactive Shell

Note: Useful if we cannot start the CMD normally

sudo docker run -h opentsdb --name opentsdb -p 4242:4242 --link hbase:hbase -e HBASE_ZK=hbase:2181 -i -t --entrypoint /bin/bash antoniojfsousa/opentsdb:latest

/usr/share/opentsdb/bin/tsdb tsd --zkquorum=$HBASE_ZK



# Creating OpenTSDB Tables 

(needs to be done on hbase server)

sudo docker exec -i -t hbase bash

export HBASE_HOME=/opt/hbase

export COMPRESSION=NONE

curl -s https://raw.githubusercontent.com/OpenTSDB/opentsdb/master/src/create_table.sh | bash




