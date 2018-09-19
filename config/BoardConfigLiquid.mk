
include vendor/liquid/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/liquid/config/BoardConfigQcom.mk
endif

include vendor/liquid/config/BoardConfigSoong.mk
