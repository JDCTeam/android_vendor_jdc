PRODUCT_BRAND ?= LiquidRemix

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Google property overides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.setupwizard.rotation_locked=true \
    ro.config.calibration_cad=/system/etc/calibration_cad.xml

# Security Enhanced Linux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Don't compile SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0
endif

ifneq ($(TARGET_BUILD_VARIANT),userdebug)
ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif
endif

ifeq ($(BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE),)
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/data/cache
else
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/cache
endif

# LatineIME Gesture swyping
ifneq ($(filter shamu,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so \
    vendor/liquid/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so
else
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/common/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so \
    vendor/liquid/prebuilt/common/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/liquid/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/liquid/prebuilt/common/bin/50-liquid.sh:system/addon.d/50-liquid.sh \
    vendor/liquid/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/liquid/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# init.d support
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/common/bin/sysinit:system/bin/sysinit

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# LiquidRemix specific init file
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/common/etc/init.local.rc:root/init.liquid.rc

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Google Dialer
PRODUCT_COPY_FILES +=  \
    vendor/liquid/prebuilt/common/etc/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml 

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Include LiquidRemix boot animation
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/common/media/bootanimation.zip:system/media/bootanimation.zip

# AR
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/common/etc/calibration_cad.xml:system/etc/calibration_cad.xml

# TWRP
ifeq ($(WITH_TWRP),true)
include vendor/liquid/config/twrp.mk
endif

# DU Utils Library
PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils

# DU Utils Package
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils

# Required packages
PRODUCT_PACKAGES += \
    Gallery2 \
    Launcher3 \
    LiquidLounge

# Optional packages
PRODUCT_PACKAGES += \
    libemoji \
    LiveWallpapersPicker

PRODUCT_PACKAGES += \
    librsjni

# Custom packages
PRODUCT_PACKAGES += \
    ExactCalculator \
    OmniJaws \
    OmniStyle \
    DU-Fonts

# Extra tools
PRODUCT_PACKAGES += \
    libsepol \
    gdbserver \
    micro_bench \
    mke2fs \
    oprofiled \
    powertop \
    sqlite3 \
    strace \
    tune2fs

# ExFAT support
WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.recorder.show_manufacturer_and_model=true

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank
endif

# Prebuilt Apps
$(call inherit-product-if-exists, vendor/liquid/prebuilt/common/prebuilt.mk)

# Vendor Overlays
DEVICE_PACKAGE_OVERLAYS += vendor/liquid/overlay/common

# Color Accents
PRODUCT_PACKAGES += \
    PixelTheme \
    AmberAccent \
    BlackAccent \
    BlueAccent \
    BlueGreyAccent \
    BrownAccent \
    CyanAccent \
    DeepOrangeAccent \
    DeepPurpleAccent \
    GreenAccent \
    GreyAccent \
    IndigoAccent \
    LightBlueAccent \
    LightGreenAccent \
    LimeAccent \
    OrangeAccent \
    PinkAccent \
    PurpleAccent \
    RedAccent \
    TealAccent \
    YellowAccent \
    WhiteAccent

# UI Variants
PRODUCT_PACKAGES += \
    SystemDarkTheme \
    SettingsDarkTheme \
    DuiDarkTheme \
    SystemBlackTheme \
    SettingsBlackTheme \
    DuiBlackTheme

# Version System
PRODUCT_VERSION_MAJOR = 9
PRODUCT_VERSION_MINOR = 1
PRODUCT_VERSION_MAINTENANCE := 0

ifeq ($(TARGET_VENDOR_SHOW_MAINTENANCE_VERSION),true)
    LIQUID_VERSION_MAINTENANCE := $(PRODUCT_VERSION_MAINTENANCE)
else
    LIQUID_VERSION_MAINTENANCE := 0
endif

# Set LIQUID_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef LIQUID_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "LIQUID_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^LIQUID_||g')
        LIQUID_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

# Filter out random types, so it'll reset to UNOFFICIAL
ifeq ($(filter RELEASE NIGHTLY SNAPSHOT EXPERIMENTAL,$(LIQUID_BUILDTYPE)),)
    LIQUID_BUILDTYPE :=
endif

ifdef LIQUID_BUILDTYPE
    ifneq ($(LIQUID_BUILDTYPE), SNAPSHOT)
        ifdef LIQUID_EXTRAVERSION
            # Force build type to EXPERIMENTAL
            LIQUID_BUILDTYPE := EXPERIMENTAL
            # Remove leading dash from LIQUID_EXTRAVERSION
            LIQUID_EXTRAVERSION := $(shell echo $(LIQUID_EXTRAVERSION) | sed 's/-//')
            # Add leading dash to LIQUID_EXTRAVERSION
            LIQUID_EXTRAVERSION := -$(LIQUID_EXTRAVERSION)
        endif
    else
        ifndef LIQUID_EXTRAVERSION
            # Force build type to EXPERIMENTAL, SNAPSHOT mandates a tag
            LIQUID_BUILDTYPE := EXPERIMENTAL
        else
            # Remove leading dash from LIQUID_EXTRAVERSION
            LIQUID_EXTRAVERSION := $(shell echo $(LIQUID_EXTRAVERSION) | sed 's/-//')
            # Add leading dash to LIQUID_EXTRAVERSION
            LIQUID_EXTRAVERSION := -$(LIQUID_EXTRAVERSION)
        endif
    endif
else
    # If LIQUID_BUILDTYPE is not defined, set to UNOFFICIAL
    LIQUID_BUILDTYPE := UNOFFICIAL
    LIQUID_EXTRAVERSION := 
endif

ifeq ($(LIQUID_BUILDTYPE), UNOFFICIAL)
    ifneq ($(TARGET_UNOFFICIAL_BUILD_ID),)
        LIQUID_EXTRAVERSION := -$(TARGET_UNOFFICIAL_BUILD_ID)
    endif
endif

ifeq ($(LIQUID_BUILDTYPE), RELEASE)
    ifndef TARGET_VENDOR_RELEASE_BUILD_ID
        LIQUID_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(LIQUID_BUILD)
    else
        ifeq ($(TARGET_BUILD_VARIANT),user)
            ifeq ($(LIQUID_VERSION_MAINTENANCE),0)
                LIQUID_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(TARGET_VENDOR_RELEASE_BUILD_ID)-$(LIQUID_BUILD)
            else
                LIQUID_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(LIQUID_VERSION_MAINTENANCE)-$(TARGET_VENDOR_RELEASE_BUILD_ID)-$(LIQUID_BUILD)
            endif
        else
            LIQUID_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(LIQUID_BUILD)
        endif
    endif
else
    ifeq ($(LIQUID_VERSION_MAINTENANCE),0)
        LIQUID_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date -u +%Y%m%d)-$(LIQUID_BUILDTYPE)$(LIQUID_EXTRAVERSION)-$(LIQUID_BUILD)
    else
        LIQUID_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(LIQUID_VERSION_MAINTENANCE)-$(shell date -u +%Y%m%d)-$(LIQUID_BUILDTYPE)$(LIQUID_EXTRAVERSION)-$(LIQUID_BUILD)
    endif
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.liquid.version=$(LIQUID_VERSION) \
    ro.liquid.releasetype=$(LIQUID_BUILDTYPE) \
    ro.liquid.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(LIQUID_VERSION)

LIQUID_DISPLAY_VERSION := $(LIQUID_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.liquid.display.version=$(LIQUID_DISPLAY_VERSION)

-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include vendor/liquid/config/partner_gms.mk

$(call prepend-product-if-exists, vendor/extra/product.mk)
