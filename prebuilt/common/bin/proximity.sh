#!/sbin/sh
#
# Copyright (c) 2016 - JDCTeam
#
#!/system/bin/sh
echo 0 > /sys/class/sensors/proximity_sensor/prox_cal
echo 1 > /sys/class/sensors/proximity_sensor/prox_cal
exit 0