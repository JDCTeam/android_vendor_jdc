. build/envsetup.sh

##### # external/perfetto
repopick 223413; # perfetto_cmd: Resolve missing O_CREAT mode  

##### # frameworks/native
repopick 224443; # libbinder: Don't log call trace when waiting for vendor service on non-eng builds  
repopick 225546; # AppOpsManager: Update with the new ops  

##### # hardware/qcom/audio
repopick 222693; # msm8960: treblize configuration  
repopick 222694; # audio: Make CVD version retrieval nonfatal with ACDB v1  
repopick 223338; # Revert "msm8x74: remove from top level makefile"  
repopick 225117; # msm8960: Add some missing out/in types  
repopick 225118; # msm8960: Add two stub microphone functions  

##### # hardware/qcom/bt-caf
repopick -c 12 226648; # libbt: Fix case where SoC type is not set  
repopick -c 11 226649; # Bluetooth: load btaddr from NV if QCOM_BT_USE_BTNV is set  
repopick -c 10 226650; # libbt-qcom: Allow reading BT address from property  
repopick 226651; # Add vendor-specific message types for FM.  
repopick 226652; # Remove hardcoded LOCAL_MODULE_PATHS from vendor components. (bt)  
repopick 226653; # BT: Moving chipset version parameters' initialization out of ALOG  
repopick 226654; # Apply the Cherokee's mechanism of stopping hci_filter to ROME  
repopick 226655; # Add missing headers to libbt-vendor  
repopick 226656; # Load bluetooth firmwares from /vendor  
repopick 226658; # Don't build libbt-hidlclient for OSS builds  
repopick 227449; # libbt-vendor: Fix BLUETOOTH_MAC_ADDR_BOOT_PROPERTY definition  
repopick 227450; # libbt-vendor: Add missing vendor prefix to a bluetooth.status prop  

##### # hardware/qcom/power
repopick 230513; # power: msm8960: Implement performance profiles  

##### # hardware/qcom/wlan-caf
repopick 226638; # wcnss_qmi: Generate a fixed random mac address if the NV doesn't provide one  
repopick 226643; # wcnss_service: Read serial number from custom property  
repopick 227449; # libbt-vendor: Fix BLUETOOTH_MAC_ADDR_BOOT_PROPERTY definition  
repopick 227450; # libbt-vendor: Add missing vendor prefix to a bluetooth.status prop  

##### # lineage-sdk
repopick 225581; # lineage-sdk: Make styles init at system services ready  
repopick 227931; # lineagesdk: Refactor battery icon options  

##### # packages/apps/Camera2
repopick 224752; # Use mCameraAgentNg for getting camera info when available  
repopick 225265; # Add Storage preference (1/2)  

##### # packages/apps/DeskClock
repopick 226131; # DeskClock: Add support of power off alarm feature  

##### # packages/apps/DocumentsUI
repopick 225289; # DocumentsUI: support night mode  

##### # packages/apps/LineageParts
repopick 227930; # LineageParts: Bring back and refactor battery icon options  
repopick 221756; # StatusBarSettings: Hide battery preference category based on icon visibility  

##### # packages/apps/SettingsIntelligence
repopick 230519 -P packages/apps/SettingsIntelligence; # Fix dark style issues  

##### # system/bt
repopick 225422; # Bluetooth: Read BLE vendor capability to proceed on Secure conn  
repopick 223945; # Prevent abort in case of command timeout  
repopick 225423; # Add support to force disable enhanced sco commands  
repopick 224813; # bt: osi: undef PROPERTY_VALUE_MAX  

##### # system/core
repopick 223085; # adbd: Disable "adb root" by system property (2/3)  
repopick 223500; # Add back fuse support  
repopick 224264; # debuggerd: Resolve tombstoned missing O_CREAT mode  

##### # system/sepolicy
repopick 223748; # Build sepolicy tools with Android.bp.  

