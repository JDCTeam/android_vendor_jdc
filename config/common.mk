# BSOD Killer
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/bsod_killer:system/bin/bsod_killer

# Changelog
PRODUCT_COPY_FILES += \
    vendor/jdc/Changelog.md:system/etc/Changelog.md

# Custom format script
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/format.sh:install/bin/format.sh

# eMMC trim
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/emmc_trim:system/bin/emmc_trim

# For keyboard gesture typing
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# LEDify
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/ledify:system/bin/ledify

# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/jdc/overlay/common

# Packages
PRODUCT_PACKAGES += \
    SunBeam \
    STweaks \
    OTAUpdates \
    Toolbox
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ota.romname=Optimized-CM-12.1 \
    ro.ota.version=$(shell date -u +%Y%m%d) \
    ro.ota.manifest=https://romhut.com/roms/Optimized-CM-121/ota.xml

# Prebuilt ConsumerIR
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/lib/hw/consumerir.msm8960.old:system/lib/hw/consumerir.msm8960.old

# Take a logcat
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/take_log:system/bin/take_log
