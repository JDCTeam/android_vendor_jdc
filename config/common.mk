# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/jdc/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/jdc/prebuilt/common/bin/50-base.sh:system/addon.d/50-base.sh \

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bootanimation/bootanimation.zip:system/media/bootanimation.zip

# BSOD Killer
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/bsod_killer:system/bin/bsod_killer

# Official Changelog
PRODUCT_COPY_FILES += \
	vendor/jdc/Changelog.md:system/etc/Changelog.md

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
DEVICE_PACKAGE_OVERLAYS += vendor/jdc/overlay/common

# Packages
PRODUCT_PACKAGES += \
   Turbo \
   Toolbox \
   Mixplorer
    
# Proximity sensor reset
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/proximity:install/bin/proximity

# Take a logcat
#PRODUCT_COPY_FILES += \
#vendor/jdc/prebuilt/common/bin/take_log:system/bin/take_log
    
#Substratum Verified
PRODUCT_PROPERTY_OVERRIDES := \
    ro.substratum.verified=true
    
# Google Assistant
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opa.eligible_device=true

# Needed by some RILs and for some gApps packages
PRODUCT_PACKAGES += \
    librsjni \
    libprotobuf-cpp-full
