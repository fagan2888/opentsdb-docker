#!/bin/bash
echo 'STARTING OPENTSDB'

echo 'CREATING TABLES ONLY IF NEEDED'
bash /opt/create-tsdb-tables.sh

echo 'LAUNCHING OPENTSDB'
/usr/share/opentsdb/bin/tsdb tsd --zkquorum=$HBASE_ZK --auto-metric

#echo 'Leave a loop scrip running'
#/bin/sh -c "while true; do echo 'OPENTSDB RUNNING'; /bin/date; sleep 1; done"
