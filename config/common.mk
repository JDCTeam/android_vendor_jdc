# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bootanimation/bootanimation.zip:system/media/bootanimation.zip

# BSOD Killer
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/bsod_killer:system/bin/bsod_killer

# Custom init script
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/etc/init.jdcteam.rc:root/init.jdcteam.rc

# eMMC trim
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/emmc_trim:system/vendor/bin/emmc_trim

# Fonts
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/fonts/Roboto-Black.ttf:system/fonts/Roboto-Black.ttf \
    vendor/jdc/prebuilt/common/fonts/DroidSansFallback.ttf:system/fonts/DroidSansFallback.ttf \
    vendor/jdc/prebuilt/common/fonts/Roboto-Bold.ttf:system/fonts/Roboto-Bold.ttf \
    vendor/jdc/prebuilt/common/fonts/Roboto-Light.ttf:system/fonts/Roboto-Light.ttf \
    vendor/jdc/prebuilt/common/fonts/Roboto-Medium.ttf:system/fonts/Roboto-Medium.ttf \
    vendor/jdc/prebuilt/common/fonts/Roboto-Regular.ttf:system/fonts/Roboto-Regular.ttf \
    vendor/jdc/prebuilt/common/fonts/Roboto-Thin.ttf:system/fonts/Roboto-Thin.ttf

# For keyboard gesture typing
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# LEDify
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/ledify:system/vendor/bin/ledify \
    vendor/jdc/prebuilt/common/bin/ledify:system/bin/ledify

# Log banner
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner

# Overlays
DEVICE_PACKAGE_OVERLAYS += vendor/jdc/overlay/common

# Packages
PRODUCT_PACKAGES += \
   Turbo \
   Mixplorer \
   Bromide
    
# Proximity sensor reset
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/proximity:system/vendor/bin/ledify

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
