#!/bin/bash

IP="192.168.1.36"
VOL_START=30
VOL_STOP=50
VOL_INC=2

# close stdout
exec 1<&-

mpc -h $IP volume $VOL_START
mpc -h $IP play

# raise volume from VOL_START to VOL_STOP, in steps of VOL_INC per second
for vol in `seq $VOL_START $VOL_INC $VOL_STOP`;
do
    mpc -h $IP volume $vol
    sleep 1
done;
