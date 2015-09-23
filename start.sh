#!/bin/bash

echo 'RUNNING OPENTSDB'
echo 'POINTING TO HBASE ZK ' $HBASE_ZK

echo 'WAIT A BIT FOR HBASE TO WARMUP'
sleep 30

echo 'LAUNCHING OPENTSDB'
/opt/start-tsdb.sh

#echo 'Leave a loop scrip running'
#/bin/sh -c "while true; do echo 'OPENTSDB RUNNING'; /bin/date; sleep 1; done" 
