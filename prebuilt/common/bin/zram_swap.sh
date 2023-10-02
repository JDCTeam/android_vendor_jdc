#!/vendor/bin/sh
#      _____  __________      
#  __ / / _ \/ ___/_  _/__ ___ ___ _
# / // / // / /__  / // -_) _ `/  ' \ 
# \___/____/\___/ /_/ \__/\_,_/_/_/_/ 
#
# Configure and mount ZRAM swap
#

LOG_TAG=zram
ZRAM_SIZE=1816807680
ZRAM_SWAPPINESS=85

/vendor/bin/log -t $LOG_TAG -p i "Trying to mount ZRAM swap..."

if [ ! -d /sys/block/zram0 ]; then
  /vendor/bin/log -t $LOG_TAG -p e "Kernel without ZRAM detected"
  exit 0;
fi

echo $ZRAM_SIZE > /sys/block/zram0/disksize
echo  1 > /sys/block/zram0/reset
/vendor/bin/mkswap /dev/block/zram0
/vendor/bin/swapon /dev/block/zram0
echo $ZRAM_SWAPPINESS > /proc/sys/vm/swappiness
echo 0 > /proc/sys/vm/page-cluster

# ext4 performance tweaks for battery-backed systems
# Credits: VR-25 from https://github.com/VR-25/zram-swap-manager
[ -d /data/adb ] && mount | grep ' ext4 .*rw' | awk '{print $3}' | xargs -n 1 mount -o remount,noatime,barrier=0,commit=60

sync

/vendor/bin/log -t $LOG_TAG -p i "ZRAM Swap is ready"

exit 0
