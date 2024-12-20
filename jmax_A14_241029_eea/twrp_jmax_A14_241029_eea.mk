
LOCAL_PATH := $(dir $(abspath $(firstword $(MAKEFILE_LIST))))
LOCAL_PATH := $(patsubst %/,%,$(LOCAL_PATH))

PRODUCT_DEVICE := $(notdir $(LOCAL_PATH))
PRODUCT_NAME := twrp_$(PRODUCT_DEVICE)

$(call inherit-product, device/unihertz/jmax/twrp_jmax.mk )
