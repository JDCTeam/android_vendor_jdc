PRODUCT_BRAND ?= LiquidRemix

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# Google property overides
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    ro.com.android.dataroaming=false \
    drm.service.enabled=true \
    net.tethering.noprovisioning=true \
    persist.sys.dun.override=0 \
    ro.build.selinux=1 \
    ro.adb.secure=0 \
    ro.setupwizard.rotation_locked=true \
    ro.opa.eligible_device=true \
    persist.sys.disable_rescue=true \
    ro.config.calibration_cad=/system/etc/calibration_cad.xml

# Don't compile SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true

# Default ringtone/notification/alarm sounds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.ringtone=Zen_too.ogg,Hotline.ogg \
    ro.config.notification_sound=Popcorn.ogg \
    ro.config.alarm_alert=Bright_morning.ogg

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0
endif

# Disable ADB authentication
PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    ro.secure=0 \
    persist.service.adb.enable=1 \
    persist.sys.usb.config=mtp,adb

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

# Fonts
PRODUCT_PACKAGES += \
    Liquid-Fonts

# Subs OMS
PRODUCT_PACKAGES += \
    SubstratumSignature \
	
# Wallpapers
PRODUCT_PACKAGES += \
    LiquidPapers \

# Themes
PRODUCT_PACKAGES += \
    SettingsDarkTheme \
    SystemDarkTheme \
    SystemUIDarkTheme \
    SettingsBlackTheme \
    SystemBlackTheme \
    SystemUIBlackTheme

# QS tile styles
PRODUCT_PACKAGES += \
    QStileDefault \
    QStileCircleTrim \
    QStileCircleDualTone \
    QStileCircleGradient \
    QStileDottedCircle \
    QStileDualToneCircle \
    QStileInk \
    QStileInkdrop \
    QStileMountain \
    QStileNinja \
    QStileOreo \
    QStileOreoCircleTrim \
    QStileOreoSquircleTrim \
    QStilePokesign \
    QStileSquaremedo \
    QStileSquircle \
    QStileSquircleTrim \
    QStileTeardrop \
    QStileWavey

# QS header styles
PRODUCT_PACKAGES += \
    QSHeaderBlack \
    QSHeaderGrey \
    QSHeaderLightGrey \
    QSHeaderAccent \
    QSHeaderTransparent

# UI themes
PRODUCT_PACKAGES += \
    AOSPUI \
    PixelUI

# Notification themes
PRODUCT_PACKAGES += \
    NotificationBlackTheme \
    NotificationDarkTheme \
    NotificationLightTheme

# Accents
PRODUCT_PACKAGES += \
    Amber \
    Black \
    Blue \
    BlueGrey \
    Brown \
    CandyRed \
    Cyan \
    DeepOrange \
    DeepPurple \
    ExtendedGreen \
    Green \
    Grey \
    Indigo \
    JadeGreen \
    LightBlue \
    LightGreen \
    Lime \
    Orange \
    PaleBlue \
    PaleRed \
    Pink \
    Purple \
    Red \
    Teal \
    Yellow \
    White \
    UserOne \
    UserTwo \
    UserThree \
    UserFour \
    UserFive \
    UserSix \
    UserSeven \
    ObfusBleu \
    NotImpPurple \
    Holillusion \
    MoveMint \
    FootprintPurple \
    BubblegumPink \
    FrenchBleu \
    Stock \
    ManiaAmber \
    SeasideMint \
    DreamyPurple \
    SpookedPurple \
    HeirloomBleu \
    TruFilPink \
    WarmthOrange \
    ColdBleu \
    DiffDayGreen \
    DuskPurple \
    BurningRed \
    HazedPink \
    ColdYellow \
    NewHouseOrange \
    IllusionsPurple

# Whitelist packages
PRODUCT_PROPERTY_OVERRIDES += \
    ro.services.whitelist.packagelist=com.google.android.gms

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/liquid/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/liquid/prebuilt/common/bin/50-liquid.sh:system/addon.d/50-liquid.sh \
    vendor/liquid/prebuilt/common/bin/blacklist:system/addon.d/blacklist

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/liquid/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/liquid/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Backup services whitelist
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

# Google Markup
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/common/lib/libsketchology_native.so:system/lib/libsketchology_native.so \
    vendor/liquid/prebuilt/common/lib64/libsketchology_native.so:system/lib64/libsketchology_native.so

# TWRP
ifeq ($(WITH_TWRP),true)
include vendor/liquid/config/twrp.mk
endif

# Required packages
PRODUCT_PACKAGES += \
    Eleven \
    Launcher3

# Liquid packages
PRODUCT_PACKAGES += \
    LiquidLounge \
    LiquidOTA

# Optional packages
PRODUCT_PACKAGES += \
    libemoji \
    LiveWallpapers \
    LiveWallpapersPicker

PRODUCT_PACKAGES += \
    librsjni

# Google packages
PRODUCT_PACKAGES += \
    MarkupGoogle

# Weather packages
PRODUCT_PACKAGES += \
    OmniJaws

# Extra tools
PRODUCT_PACKAGES += \
    libsepol \
    mke2fs \
    powertop \
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
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/liquid/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/liquid/overlay/common

# Version System
PRODUCT_VERSION_MAJOR = 10
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE := 3

ifeq ($(TARGET_VENDOR_SHOW_MAINTENANCE_VERSION),true)
    LIQUID_VERSION_MAINTENANCE := $(PRODUCT_VERSION_MAINTENANCE)
else
    LIQUID_VERSION_MAINTENANCE := 3
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
ifeq ($(filter RELEASE SNAPSHOT EXPERIMENTAL WEEKLY FINAL,$(LIQUID_BUILDTYPE)),)
    LIQUID_BUILDTYPE :=
endif

ifdef LIQUID_BUILDTYPE
    ifneq ($(LIQUID_BUILDTYPE), SNAPSHOT)
        ifdef LIQUID_EXTRAVERSION
            # Force build type to EXPERIMENTAL
            LIQUID_BUILDTYPE := EXPERIMENTAL
            # Force build type to WEEKLY
            LIQUID_BUILDTYPE := WEEKLY
            # Force build type to FINAL
            LIQUID_BUILDTYPE := FINAL
            # Remove leading dash from LIQUID_EXTRAVERSION
            LIQUID_EXTRAVERSION := $(shell echo $(LIQUID_EXTRAVERSION) | sed 's/-//')
            # Add leading dash to LIQUID_EXTRAVERSION
            LIQUID_EXTRAVERSION := -$(LIQUID_EXTRAVERSION)
        endif
    else
        ifndef LIQUID_EXTRAVERSION
            # Force build type to EXPERIMENTAL, SNAPSHOT mandates a tag
            LIQUID_BUILDTYPE := EXPERIMENTAL
            # Force build type to WEEKLY, SNAPSHOT mandates a tag
            LIQUID_BUILDTYPE := WEEKLY
            # Force build type to FINAL, SNAPSHOT mandates a tag
            LIQUID_BUILDTYPE := FINAL
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
        LIQUID_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(shell date -u +%Y%m%d)-OFFICIAL-$(LIQUID_BUILD)
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

TARGET_PRODUCT_SHORT := $(subst liquid_,,$(LIQUID_BUILDTYPE))

ROM_FINGERPRINT := LiquidRemix/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date +%Y%m%d)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.liquid.version=$(LIQUID_VERSION) \
    ro.liquid.releasetype=$(LIQUID_BUILDTYPE) \
    ro.liquid.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(LIQUID_VERSION) \
    ro.liquid.fingerprint=$(ROM_FINGERPRINT)

LIQUID_DISPLAY_VERSION := $(LIQUID_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.liquid.display.version=$(LIQUID_DISPLAY_VERSION)

-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include vendor/liquid/config/partner_gms.mk

$(call inherit-product-if-exists, vendor/extra/product.mk)
