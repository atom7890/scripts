#!/bin/bash

echo "Cloning Device Resources"  

echo "Device Tree"
rm -rf device/xiaomi/spring;
git clone -b infinity-17 https://github.com/atom7890/android_device_xiaomi_spring_infinity-x.git device/xiaomi/spring

echo "Kernel (prebuilt)"
rm -rf device/xiaomi/spring-kernel;
git clone -b lineage-24.0 https://gitlab.com/Niyush-04/android_device_xiaomi_spring-kernel.git device/xiaomi/spring-kernel

echo "Vendor"
rm -rf vendor/xiaomi/spring;
git clone -b lineage-24.0 https://github.com/spring4ever/android_vendor_xiaomi_spring.git vendor/xiaomi/spring

echo "Xiaomi Stacks"
rm -rf hardware/xiaomi;
git clone -b lineage-24.0 https://github.com/LineageOS/android_hardware_xiaomi.git hardware/xiaomi


echo "cloning Device Specific Change"

echo "Custom HALs"
rm -rf hardware/qcom-caf/common;
git clone https://github.com/spring4ever/android_hardware_qcom-caf_common.git hardware/qcom-caf/common

rm -rf hardware/qcom-caf/sm6375-6.1/audio/agm;  
git clone https://github.com/spring4ever/android_vendor_qcom_opensource_agm.git hardware/qcom-caf/sm6375-6.1/audio/agm

rm -rf hardware/qcom-caf/sm6375-6.1/audio/pal; 
git clone https://github.com/spring4ever/android_vendor_qcom_opensource_arpal-lx.git hardware/qcom-caf/sm6375-6.1/audio/pal

rm -rf hardware/qcom-caf/sm6375-6.1/audio/primary-hal;  
git clone https://github.com/spring4ever/android_hardware_qcom_audio-ar.git hardware/qcom-caf/sm6375-6.1/audio/primary-hal

rm -rf hardware/qcom-caf/sm6375-6.1/audio/graphservices;  
git clone https://github.com/spring4ever/android_vendor_qcom_opensource_audioreach-graphservices.git hardware/qcom-caf/sm6375-6.1/audio/graphservices

rm -rf hardware/qcom-caf/sm6375-6.1/display;  
git clone https://github.com/spring4ever/android_hardware_qcom_display.git hardware/qcom-caf/sm6375-6.1/display

rm -rf hardware/qcom-caf/sm6375-6.1/dataipa;  
git clone https://github.com/spring4ever/android_vendor_qcom_opensource_dataipa.git hardware/qcom-caf/sm6375-6.1/dataipa

rm -rf hardware/qcom-caf/sm6375-6.1/data-ipa-cfg-mgr;  
git clone https://github.com/spring4ever/android_vendor_qcom_opensource_data-ipa-cfg-mgr.git hardware/qcom-caf/sm6375-6.1/data-ipa-cfg-mgr

ln -sf ../common/os_pickup_qssi.bp hardware/qcom-caf/sm6375-6.1/Android.bp


echo "updater ota support"

rm -rf packages/apps/Updater;
git clone -b 17 https://github.com/atom7890/packages_apps_Updater.git packages/apps/Updater


echo "Cloning Dolby Support"

echo "Dolby Hardware"
rm -rf hardware/dolby;
git clone -b sony-A17 https://github.com/swiitch-OFF-Lab/hardware_dolby.git hardware/dolby

echo "DolbyUi"
rm -rf packages/apps/DolbyUI;
git clone -b 16.0 https://github.com/swiitch-OFF-Lab/packages_apps_DolbyUI.git packages/apps/DolbyUI

echo "Cloning infinity private keys"

echo "vendor_infinity-priv_keys"
rm -rf vendor/infinity-priv/keys
git clone https://github.com/atom7890/vendor_infinity-priv_keys.git vendor/infinity-priv/keys


echo "Setup environment!..."
source build/envsetup.sh

echo "build started!..."
export BUILD_USERNAME=atom7890
export BUILD_HOSTNAME=foss

lunch infinity_spring-userdebug;
m bacon -j$(nproc --all);
