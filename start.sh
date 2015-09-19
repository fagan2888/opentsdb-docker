#!/bin/bash

echo 'STARTING OPENTSDB'

echo 'OPENTSDB ZK SET TO' $HBASE_ZK

echo 'WAIT A BIT FOR HBASE TO START'
sleep 30

echo 'LAUNCHING OPENTSDB'
/usr/share/opentsdb/bin/tsdb tsd --zkquorum=$HBASE_ZK --auto-metric

#echo 'Leave a loop scrip running'
#/bin/sh -c "while true; do echo 'OPENTSDB RUNNING'; /bin/date; sleep 1; done" 
