. build/envsetup.sh

#Merged to jdc repos
#=====================================================
# bionic
#repopick 223067; # libc fortify: Ignore open() O_TMPFILE mode bits warning

# build/make
#repopick 222733; # core: Disable vendor restrictions
#repopick 222760; # Add LOCAL_AIDL_FLAGS

# dalvik
#repopick 225475; # dexdeps: Add option for --include-lineage-classes.
#repopick 225476; # dexdeps: Ignore static initializers on analysis.

# system/core
#repopick 223085; # adbd: Disable "adb root" by system property (2/3)
#repopick 223500; # Add back fuse support
#repopick 224264; # debuggerd: Resolve tombstoned missing O_CREAT mode

# packages/apps/Settings
#repopick -c 11 226142; # Settings: Add developer setting for root access
#repopick -c 10 226148; # Settings: "Security & location" -> "Security & privacy"
#repopick 226150; # Settings: add Trust interface hook
#repopick 226151; # Settings: show Trust brading in confirm_lock_password UI
#repopick 225755; # Settings: Hide AOSP theme-related controllers
#repopick 225756; # Settings: fix dark style issues
#repopick 226154; # fingerprint: Allow devices to configure sensor location
#repopick 227120; # Settings: Check interfaces before enabling ADB over network
#repopick 228403; # Settings: forward port lock pattern grid size (2/2)
#repopick 228404; # Forward port pattern visibility settings (2/2)
#repopick 227929; # Settings: Remove battery percentage switch
#=====================================================

# repopick 229491; # build: Automatically replace old-style kernel header includes with new header lib
# build/soong
# repopick 224613; # soong: Add LOCAL_AIDL_FLAGS handling
# repopick 229411; # soong sbox: Add option to allow copying all generated output

# external/perfetto

repopick 223413; # perfetto_cmd: Resolve missing O_CREAT mode
# external/tinycompress
# repopick 229414; # tinycompress: Use generated kernel headers
# repopick 229414; # tinycompress: Use generated kernel headers
# frameworks/base

repopick -c 17 226236; # SystemUI: add navbar button layout inversion tuning
repopick -c 16 224844; # lockscreen: Add option for showing unlock screen directly
repopick -c 15 225754; # SystemUI: Berry styles
repopick -c 14 225582; # [TEMP]: Revert "OMS: harden permission checks"
repopick -c 13 227108; # SystemUI: Fix several issues in the ADB over Network tile
repopick -c 12 226615; # NavigationBarView: Avoid NPE before mPanelView is created
repopick -c 11 227821; # GlobalScreenshot: Fix screenshot not saved when appending appname with some languages
repopick -c 10 228405; # Forward port CM Screen Security settings (1/2)
repopick 229230; # SystemUI: allow the power menu to be relocated
repopick 230016; # Implement expanded desktop feature
repopick 224446; # SystemUI: Make tablets great again
repopick 224513; # SystemUI: Disable config_keyguardUserSwitcher on sw600dp
repopick 221716; # Where's my circle battery, dude?
# frameworks/native

repopick 224443; # libbinder: Don't log call trace when waiting for vendor service on non-eng builds
repopick 225546; # AppOpsManager: Update with the new ops
# hardware/qcom/audio

repopick 222693; # msm8960: treblize configuration
repopick 222694; # audio: Make CVD version retrieval nonfatal with ACDB v1
repopick 223338; # Revert "msm8x74: remove from top level makefile"
repopick 225117; # msm8960: Add some missing out/in types
repopick 225118; # msm8960: Add two stub microphone functions

# hardware/qcom/audio-caf/msm8996
repopick 225714; # hal/audio_hw_extn_api: Fix printf formatting of ret

# hardware/qcom/bt-caf
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


# hardware/qcom/media-caf/msm8916
repopick 223442; # Add -Wno-error to compile with global -Werror.

# hardware/qcom/power
repopick 230513; # power: msm8960: Implement performance profiles

# hardware/qcom/wlan-caf
repopick 226638; # wcnss_qmi: Generate a fixed random mac address if the NV doesn't provide one
repopick 226643; # wcnss_service: Read serial number from custom property
repopick 227449; # libbt-vendor: Fix BLUETOOTH_MAC_ADDR_BOOT_PROPERTY definition
repopick 227450; # libbt-vendor: Add missing vendor prefix to a bluetooth.status prop

# lineage-sdk
repopick 225581; # lineage-sdk: Make styles init at system services ready
repopick 227931; # lineagesdk: Refactor battery icon options

# packages/apps/Camera2
repopick 224752; # Use mCameraAgentNg for getting camera info when available
repopick 225265; # Add Storage preference (1/2)
# packages/apps/DeskClock

repopick 226131; # DeskClock: Add support of power off alarm feature
# packages/apps/DocumentsUI

repopick 225289; # DocumentsUI: support night mode
# packages/apps/LineageParts

repopick 227930; # LineageParts: Bring back and refactor battery icon options
repopick 221756; # StatusBarSettings: Hide battery preference category based on icon visibility

# packages/apps/SettingsIntelligence

repopick 230519 -P packages/apps/SettingsIntelligence; # Fix dark style issues
repopick 231538; # SettingsIntelligence: Match Settings style
repopick 231539; # SettingsIntelligence: Regen database on build version change
# system/bt

repopick 225422; # Bluetooth: Read BLE vendor capability to proceed on Secure conn
repopick 223945; # Prevent abort in case of command timeout
repopick 225423; # Add support to force disable enhanced sco commands
repopick 224813; # bt: osi: undef PROPERTY_VALUE_MAX

# system/sepolicy

repopick 223748; # Build sepolicy tools with Android.bp.

#hw/samsung
repopick 228524;
repopick 226076;
repopick 226077;
repopick 227453;
repopick 227454;
repopick 226075;
repopick 231194;
repopick 225628;
repopick 225629;
repopick 225630;
repopick 225631;
repopick 225632;
repopick 225633;
repopick 225634;
repopick 225635;
repopick 226080;
repopick 231660;
