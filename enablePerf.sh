#!/bin/bash

for ((i=0;i<=$[$(nproc)-1];i++))
do
	echo "performance" > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor
done