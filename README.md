[![Github All Releases](https://img.shields.io/github/downloads/unihertz-jelly-max/twrp_device_unihertz_jmax/total.svg)](https://github.com/unihertz-jelly-max/twrp_device_unihertz_jmax/releases)
[![Github Latest Release](https://img.shields.io/github/downloads/unihertz-jelly-max/twrp_device_unihertz_jmax/latest/total.svg)](https://github.com/unihertz-jelly-max/twrp_device_unihertz_jmax/releases)
[![ViewCount](https://views.whatilearened.today/views/github/unihertz-jelly-max/twrp_device_unihertz_jmax.svg)](https://github.com/unihertz-jelly-max/twrp_device_unihertz_jmax)
[![Donations Page](https://github.com/andry81-cache/gh-content-static-cache/raw/master/common/badges/donate/donate.svg)](https://github.com/remittor/donate)

### TWRP device tree for Unihertz Jelly Max

--------

The Jelly Max is a unique smartphone from Unihertz.

It was released in September 2024.

## Device specifications

Basic      | Spec Sheet
----------:|:-------------------------
CPU        | Octa-core CPU with 4x Arm Cortex-A78 up to 2.5 GHz
Chipset    | Mediatek Dimensity 7300 (mt6878)
GPU        | Mali-G615
Memory     | 12 GB RAM (LPDDR5T 9600Mbps)
Android    | 14
Storage    | 256 GB (UFS 3.1)
Display    | 720 x 1520 pixels, 5.05 inches, 60 hz
Battery    | Lithium 4000 mAh, non-removable
Dimensions | 128.7 x 62.7 x 16.3 mm
Weight     | 185g
Aux Slot   | Second SIM or SDCard

![Unihertz Jelly Max](https://github.com/user-attachments/assets/5a11fa0e-1cc3-49b4-a9e6-3f68c08f3c9a)

## Features

Works:

- [X] ADB
- [X] Decryption
- [X] Display
- [X] Fasbootd
- [ ] Flashing
- [X] MTP
- [ ] Sideload
- [ ] USB OTG
- [X] Vibrator

## Preparation

Choose one of the recovery system:

### Checkout minimal TWRP with AOSP tree:
```
mkdir ~/TWRP
cd ~/TWRP
curl https://raw.githubusercontent.com/GerritCodeReview/git-repo/refs/heads/main/repo > repo
chmod a+rx repo
./repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-14 -g default,-mips,-darwin,-notdefault
./repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j4
```

### Checkout minimal PBRP (PitchBlack):
```
mkdir ~/TWRP
cd ~/TWRP
curl https://raw.githubusercontent.com/GerritCodeReview/git-repo/refs/heads/main/repo > repo
chmod a+rx repo
./repo init --depth=1 -u https://github.com/PitchBlackRecoveryProject/manifest_pb.git -b android-14.0 -g default,-mips,-darwin,-notdefault
./repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j4
```

### Checkout minimal OFRP (OrangeFox):
```
mkdir ~/TWRP
mkdir ~/OrangeFox_sync
cd ~/OrangeFox_sync
git clone https://gitlab.com/OrangeFox/sync.git
cd ~/OrangeFox_sync/sync/
./orangefox_sync.sh --branch 12.1 --path ~/TWRP
```

## Patch manifest.xml

```
cd ~/TWRP
sed -i '/\/asuite\"/d' ~/TWRP/.repo/manifests/remove-minimal.xml
sed -i '/\/gflags\"/d' ~/TWRP/.repo/manifests/remove-minimal.xml
./repo sync
```

## Add device tree

```
git clone https://github.com/unihertz-jelly-max/twrp_device_unihertz_jmax.git ~/TWRP/device/unihertz
```

## Build recovery image (vendor_boot.img)

```
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL="C"
unset TOP ; unset OUT ; unset ${!TARGET_*} ; unset ${!BOARD_*} ; unset ${!PRODUCT_*} ; unset ${!OUT_*} ; unset ${!HOST_*} ; unset ${!KERNEL_*} ; unset ${!SOONG_*} ; unset ${!CLANG_*} ; unset ${!CROSS_*} ; unset ${!TWRP_*} ; unset ${!TW_*} ; unset ${!PB_*} ; unset ${!OF_*} ; unset ${!FOX_*}
unset NOT_ORANGEFOX

cd ~/TWRP
source build/envsetup.sh && lunch
```

Console output:
```
You're building on Linux

Lunch menu .. Here are the common combinations:
     1. aosp_arm-eng
     2. aosp_arm64-eng
     3. aosp_x86-eng
     4. aosp_x86_64-eng
     5. twrp_duchamp-eng
     6. twrp_jmax_A14_241029_eea-eng
     7. twrp_jmax_A14_241029_tee-eng
     8. twrp_jmax_A14_XXXXXX_eea-eng
     9. twrp_jmax_A14_XXXXXX_tee-eng

Which would you like? [aosp_arm-eng]
Pick from common choices above (e.g. 13) or specify your own (e.g. aosp_barbet-eng):
```
Enter the number of required device/firmware and type next command:
```
mka vendorbootimage
```

## To use it:

```
adb reboot bootloader
fastboot flash vendor_boot vendor_boot.img
fastboot reboot recovery
```

## Donations

[![Donations Page](https://github.com/andry81-cache/gh-content-static-cache/raw/master/common/badges/donate/donate.svg)](https://github.com/remittor/donate)
