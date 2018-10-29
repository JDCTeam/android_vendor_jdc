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

##### # hardware/qcom/power
repopick 230513; # power: msm8960: Implement performance profiles  

##### # hardware/qcom/wlan-caf
repopick 226638; # wcnss_qmi: Generate a fixed random mac address if the NV doesn't provide one  
repopick 226643; # wcnss_service: Read serial number from custom property  

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
repopick 224813; # bt: osi: undef PROPERTY_VALUE_MAX  

##### # system/sepolicy
repopick 223748; # Build sepolicy tools with Android.bp.  

##### # hardware/qcom/display
repopick 223340 223341 223342 222686 222687 222688 222689 223343 223344 223345 223346 224958; 

##### # build/soong
repopick 224613; # soong: Add LOCAL_AIDL_FLAGS handling

##### # hardware/qcom/keymaster
repopick 224945-224954; ## AOSP Keymaster Chain: Broken crypto in current state, on hold

##### # hardware/qcom/media
repopick 224955 224956 224957; ## AOSP 8960 Media Chain




