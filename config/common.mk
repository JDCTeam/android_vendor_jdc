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
