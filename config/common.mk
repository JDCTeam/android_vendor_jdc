# EXT4/F2FS format script
ifeq ($(TARGET_CUSTOM_SYSTEM_FORMAT),true)
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/format.sh:install/bin/format.sh
endif
    
# STweaks
ifeq ($(TARGET_SHIP_STWEAKS),true)
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/app/stweaks/stweaks.apk:system/app/STweaks/STweaks.apk
endif

# OTA Updates
PRODUCT_PROPERTY_OVERRIDES += \
	ro.ota.romname=Optimized-CM-12.1 \
	ro.ota.version=$(shell date -u +%Y%m%d) \
	ro.ota.manifest=https://romhut.com/roms/Optimized-CM-121/ota.xml

# Take a logcat

PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/take_log:system/bin/take_log

# Changelog
PRODUCT_COPY_FILES += \
    vendor/jdc/Changelog.md:system/etc/Changelog.md