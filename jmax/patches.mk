
RECOVERY_REPO_DATE := $(shell git --git-dir=$$TOP/.repo/projects/bootable/recovery.git show -s --date=format:'%y%m%d' --format=%cd HEAD)
$(warning RECOVERY_REPO_DATE = $(RECOVERY_REPO_DATE))

X_CURRENT_DATE := $(shell date '+%y%m%d')
$(warning X_CURRENT_DATE = $(X_CURRENT_DATE))

X_BUILD_VERSION_SUFFIX := remittor

X_BUILD_VERSION := $(RECOVERY_REPO_DATE)-$(X_CURRENT_DATE)-$(X_BUILD_VERSION_SUFFIX)

# Change build version
$(shell sed -i 's/^#define TW_DEVICE_VERSION.*/#define TW_DEVICE_VERSION   PB_MAIN_VERSION "-$(X_BUILD_VERSION)"/g' $(TOP)/bootable/recovery/variables.h)
$(shell sed -i 's/^#define PB_BUILD.*/#define PB_BUILD                     PB_MAIN_VERSION "-$(X_BUILD_VERSION)"/g' $(TOP)/bootable/recovery/variables.h)
$(shell sed -i 's/^#define TW_VERSION_STR.*/#define TW_VERSION_STR     TW_MAIN_VERSION_STR "-$(X_BUILD_VERSION)"/g' $(TOP)/bootable/recovery/variables.h)

# Fix position for button "Repair or Change File System"
$(shell sed -i 's/y="%row17a_y%" textplacementmain="3"/y="%row19a_y%" textplacementmain="3"/g' $(TOP)/bootable/recovery/gui/theme/common/portrait.xml)

# Fix GUI menu
$(shell sed -i 's/.*name="mid_transparent" val.*/<variable name="mid_transparent"  value="#00000040" \/>/g' $(TOP)/bootable/recovery/gui/theme/portrait_hdpi/ui.xml)
$(shell sed -i 's/.*name="semi_transparent" val.*/<variable name="semi_transparent"  value="#000000B0" \/>/g' $(TOP)/bootable/recovery/gui/theme/portrait_hdpi/ui.xml)
$(shell sed -i 's/.*<template name="sort_options_new">$$/<template name="sort_options_new"><background color="%semi_transparent%" \/>/g' $(TOP)/bootable/recovery/gui/theme/portrait_hdpi/ui.xml)

