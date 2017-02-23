#Arise
PRODUCT_COPY_FILES += \
	vendor/jdc/prebuilt/common/arize/arize.zip:system/arize/arize.zip

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bootanimation/bootanimation.zip:system/media/bootanimation.zip

# BSOD Killer
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/bsod_killer:system/bin/bsod_killer

# Custom format script
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/format.sh:install/bin/format.sh

# Custom init script
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/etc/init.jdcteam.rc:root/init.jdcteam.rc

# eMMC trim
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/emmc_trim:system/bin/emmc_trim

# For keyboard gesture typing
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# LEDify
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/ledify:system/bin/ledify

# Log banner
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner

# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/jdc/overlay/common

# Packages
PRODUCT_PACKAGES += \
    STweaks \
    masquerade
    
# SuperSU
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/supersu/supersu.zip:system/supersu/supersu.zip

# Prebuilt ConsumerIR
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/lib/hw/consumerir.msm8960.old:system/lib/hw/consumerir.msm8960.old

# Prebuilt Toolbox
PRODUCT_COPY_FILES += \
    vendor/jdc/proprietary/Toolbox.apk:system/priv-app/Toolbox/Toolbox.apk 
    
# Proximity sensor reset
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/proximity.sh:install/bin/proximity.sh

# Take a logcat
#PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/take_log:system/bin/take_log
    
#Substratum Verified
PRODUCT_PROPERTY_OVERRIDES := \
    ro.substratum.verified=true

# Enable Storage Manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=1
    
# Google Assistant
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opa.eligible_device=true

# Set cache location
ifeq ($(BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE),)
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.device.cache_dir=/data/cache
else
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.device.cache_dir=/cache
endif

# Needed by some RILs and for some gApps packages
PRODUCT_PACKAGES += \
    librsjni \
    libprotobuf-cpp-full
