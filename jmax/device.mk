
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

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.0.vendor \
    android.hardware.keymaster@4.1 \

# Keymint
PRODUCT_PACKAGES += \
    android.hardware.security.keymint \
    android.hardware.security.secureclock \
    android.hardware.security.sharedsecret \

# Keystore2
PRODUCT_PACKAGES += \
    android.system.keystore2 \

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service \

# Otacert
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(LOCAL_PATH)/security/releasekey

# Mtk plpath utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery \

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Fix missing json configs
PRODUCT_COPY_FILES += $(TOP)/system/core/libprocessgroup/profiles/cgroups.json:$(TARGET_COPY_OUT_RECOVERY)/root/etc/cgroups.json
PRODUCT_COPY_FILES += $(TOP)/system/core/libprocessgroup/profiles/task_profiles.json:$(TARGET_COPY_OUT_RECOVERY)/root/etc/task_profiles.json
