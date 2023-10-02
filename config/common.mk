# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bootanimation/bootanimation.zip:system/media/bootanimation.zip

# Custom init script
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/etc/init.jdcteam.rc:system/vendor/etc/init/hw/init.jdcteam.rc

# eMMC trim
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/emmc_trim:system/vendor/bin/emmc_trim

# ZRAM swap support
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/zram_swap.sh:vendor/bin/zram_swap.sh \
    vendor/jdc/prebuilt/common/etc/zram.swap.rc:vendor/etc/init/zram.swap.rc

# Changelog
PRODUCT_COPY_FILES += \
    vendor/jdc/Changelog.md:system/vendor/etc/Changelog.md
      
# LEDify
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/bin/ledify:system/vendor/bin/ledify

# Log banner
PRODUCT_COPY_FILES += \
    vendor/jdc/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner

# Overlays
DEVICE_PACKAGE_OVERLAYS += vendor/jdc/overlay/common

# Packages
PRODUCT_PACKAGES += \
   Launcher3QuickStep \
   Gallery2 \
   Markup \
   Turbo \
   privapp-permissions-turbo.xml

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opa.eligible_device=true

# Needed by some RILs and for some gApps packages
PRODUCT_PACKAGES += \
    librsjni \
    libprotobuf-cpp-full
