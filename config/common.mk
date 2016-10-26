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

# Prebuilt ConsumerIR
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/lib/hw/consumerir.msm8960.old:system/lib/hw/consumerir.msm8960.old

# Prebuilt Toolbox
PRODUCT_COPY_FILES += \
    vendor/jdc/proprietary/Toolbox.apk:system/priv-app/Toolbox/Toolbox.apk 

#QS Themes (if exists)
PRODUCT_COPY_FILES += \
    vendor/jdc/proprietary/LimeTheme.apk:system/priv-app/LimeTheme/LimeTheme.apk \
    vendor/jdc/proprietary/s7Theme.apk:system/priv-app/s7Theme/s7Theme.apk

# Take a logcat
#PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/take_log:system/bin/take_log
