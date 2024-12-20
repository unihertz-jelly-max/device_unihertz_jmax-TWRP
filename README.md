### TWRP device tree for Unihertz Jelly Max

=========================================

The Unihertz Jelly Max is a unique smartphone from Unihertz.

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
Battery    | Litium 4000 mAh, non-removable
Dimensions | 128.7 x 62.7 x 16.3 mm
Weight     | 180g
Aux Slot   | Second SIM or SDCard

![Unihertz Jelly Max](https://nghenhinvietnam.vn/uploads/global/gallery/73456/1333/original.jpg)

## Features

Works:

- [X] ADB
- [ ] Decryption
- [X] Display
- [ ] Fasbootd
- [ ] Flashing
- [ ] MTP
- [ ] Sideload
- [ ] USB OTG
- [ ] Vibrator

## Compile

First checkout minimal TWRP with aosp tree:

```
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync -j4
```

Then add these projects to .repo/manifest.xml:

```xml
<project path="device/unihertz/jmax" name="unihertz-jelly-max/android_device_unihertz_jmax_TWRP" remote="github" />
```

Finally execute these:

```
source build/envsetup.sh
lunch twrp_<device>-eng
mka vendorbootimage
```

## To use it:

```
fastboot flash vendor_boot vendor_boot.img
```
