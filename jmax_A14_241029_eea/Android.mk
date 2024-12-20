
LOCAL_PATH := $(call my-dir)

target_device_parts := $(subst _, ,$(TARGET_DEVICE))

ifeq ($(word 1,$(target_device_parts)),jmax)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
