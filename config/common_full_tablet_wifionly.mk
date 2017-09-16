# Inherit full common LiquidRemix stuff
$(call inherit-product, vendor/liquid/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME
