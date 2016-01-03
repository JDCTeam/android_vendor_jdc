# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bootanimation/bootanimation.zip:system/media/bootanimation.zip

# Changelog
PRODUCT_COPY_FILES += \
    vendor/jdc/Changelog.md:system/etc/Changelog.md

# Custom format script
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/format.sh:install/bin/format.sh

# For keyboard gesture typing
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/jdc/overlay/common

# Packages
PRODUCT_PACKAGES += \
    SunBeam \
    STweaks \
    OTAUpdates
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ota.romname=Optimized-CM-12.1 \
    ro.ota.version=$(shell date -u +%Y%m%d) \
    ro.ota.manifest=https://romhut.com/roms/Optimized-CM-121/ota.xml

# Prebuilt ConsumerIR
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/lib/hw/consumerir.msm8960.old:system/lib/hw/consumerir.msm8960.old

# Prebuilt Toolbox (if exists)
PRODUCT_COPY_FILES += \
    vendor/jdc/proprietary/Toolbox.apk:system/priv-app/Toolbox/Toolbox.apk

# Ramdisk
PRODUCT_PACKAGES += \
    bsod_killer \
    emmc_trim \
    init.jdcteam.rc \
    ledify

# Take a logcat
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/take_log:system/bin/take_log
