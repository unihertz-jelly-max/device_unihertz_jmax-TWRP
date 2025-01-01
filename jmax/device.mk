
LOCAL_PATH := device/unihertz/jmax

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# A/B partitions
ENABLE_VIRTUAL_AB := true
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    dtbo \
    system \
    vendor \
    product \
    system_ext \
    boot \
    vendor \
    vendor_boot \
    vendor_dlkm \
    vbmeta \
    vbmeta_vendor \
    vbmeta_system \

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/mtk_plpath_utils \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true \

# Boot control HAL
PRODUCT_PACKAGES += \
    bootctrl \
    bootctrl.recovery \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery \

PRODUCT_PACKAGES += \
    libgptutils \
    libz \
    libcutils \

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload \
    update_engine_client \

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service \

# Otacert
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(LOCAL_PATH)/security/releasekey

# Mtk plpath utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery \

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)
