# Jflte DevCon
### Developers & Testers
[AntaresOne](http://github.com/AntaresOne) - Lead

[Alucard24](http://github.com/Alucard24) - Kernel Developer

[MattBooth](http://github.com/MattBooth) - OTA Updates, git maintainer, scripting, tester

[hawkerpaul](http://github.com/hawkerpaul) - scripting, tester

[angelcalibur](https://github.com/angelcalibur) - tester

[B--B](https://github.com/B--B) - AOSP Developer, tester

[javelinanddart](https://github.com/javelinanddart) - Kernel Developer

[Jimsilver73](https://github.com/Jimsilver73) - tester

[smeroni68](https://github.com/smeroni68) - tester

[franzyroy](https://github.com/franzyroy) - tester, cm themer

[smstiv](https://github.com/smstiv) - tester

[side](https://github.com/dkati) - tester, cm themer

[FernBch](http://forum.xda-developers.com/member.php?u=2026117) - tester

### Changelog
Any build includes upstream merging from CM

#### 20151113 (two builds)
* Device
    * Include Qualcomm PowerHAL
* Kernel
    * Build 1 specific: disabled BT MSM bluesleep (test for BT crash)
    * Build 2 specific: Disabled BT bluesleep bluedroid support (test for BT crash, MSM bluesleep is enabled)
    * Common: disabled MSM watchdog V2, various code updates
* ROM:
    * Settings app:
	* Do not show FCC ID & device name
	* get rid of Hardware info (now is in our Toolbox app)
    	* update team members & implement horizontal scrollview
    * Toolbox: 1.3.0, add realtime CPU, GPU & RAM status, code styling & removed redundant code
    * Various code updates

#### 20151106
* Kernel
    * Various code updates (mm, IntelliPlug, SELinux, UKSM)
* ROM
    * Android-5.1.1_r26
    * Updated boosted ringtones
    * Updated DeviceInfoNext, removed unuseful things & restored some others
    * Toolbox: 1.2.3, added issue report for app, fixed another IllegalStateException
    * Various other under-the-hood updates

#### 20151101
Includes all the changes of the previous build and fixes the bootloop for those who experienced it after upgrading to that version

#### 20151031
* Kernel
    * Linux kernel 3.4.110
    * Minor ramdisk updates
    * Restored maximum AC charge amperage
    * Updated F2FS driver
    * Various code updates
* ROM
    * Added high touch sensitivity
    * Device Info->Hardware:
	* Fixed showing values on activity resume
	* Removed unneeded things
    * Toolbox (v1.2.2):
	* Added double press to exit
	* Fixed IllegalStateException while exiting the easter egg if the countdown wasn't over
	* Made some settings not selectable, they don't do anything but showing text
	* Minor code updates & fixes
    * Updated Settings app layout
    * Various code updates

#### 20151022
* Device
    * Added back FFMPEG codecs
    * Added eMMC trim at each boot (log file is saved for each boot in /cache/trim.log)
    * Added our custom init script
    * Custom Doze service (Settings->Gesture)
    * Fixed MMS
    * Fixed 2G data connection
    * Fstab: put f2fs above ext4
    * General RIL updates
    * Moved dancing LED to LEDify
    * Realtime CPU/GPU maximum frequency & RAM status in About phone (2/2)
    * Reverted to new consumerIR  send command timing
    * Updated fingerprint for some models
    * Updated media codecs
    * Updated power management at boot
    * Updated RIL properties for I9505G
* Kernel
    * Linux kernel 3.4.109
    * A lot of code updates & fixes including general code from Linux kernel 3.10
    * Added back kexec-hardboot patch
    * Added KMS and UKMS from Linux kernel 3.10
    * Added VENO TCP protocol
    * Added ZRAM (use STweaks to enable it)
    * Changes and fixes on LMK
    * Changes on OOM control, less battery usage
    * CPU governors tuning/code cleaning
    * Fixed some APNs
    * Fixed sporadic system freeze
    * Increased maximum on call freq to 1350.000 KHz (fixed slow InCallUI while in deep sleep)
    * IPC: ported code from 3.10 kernel
    * Optimized alucard, darkness, nightmare and ondemand CPU governors
    * Various ramdisk optimizations & updates
* ROM
    * Android 5.1.1_r24
    * Archidroid v4.1
    * Built with GCC 4.9.4
    * Improved build environment
    * Bionic: reworked the whole branch:
        * a lot of improvements and more optimizations for ARM-Cortex-A15/Krait CPU
	* Implemented pty.h
	* Removed unused/not needed optimizations
	* Lots of cleaning
    * Aapt: default apk compression to 0 ratio (improved speed & memory usage)
    * Aapt: don't compress qmg, wbp and arsc assets
    * Added battery saver tile
    * Added JDC LEDify:
        * Can be managed by the Toolbox app (below)
        * Patterns:
	    * JDCTeam dancing rainbox (default)
	    * Hearbeat blue
	    * Heartbeat green
	    * Heartbeat red
	    * Nexus-like
	    * Nexus-like reversed
	    * Police blue/red
	    * Samsung default
    * Added JDC Toolbox app, wrote from scratch:
        * Manage LEDify settings (user-customizable notification LED at boot, prebuilt patterns)
	* Manage the IR LED driver (easy way to make any IR app work)
    * Added live lockscreen support & previews
    * Added show volume to tile chooser
    * Added volume boosted ringtones
    * Allow disabling the privacy guard notification
    * Audioflinger: do not build with -Os anymore
    * Correctly import wget binary needed by some STweaks features
    * Fixed remaining stagefright security issues & fixed some possible overflows
    * Fixed encryption for F2FS
    * Fixed ipv6 tethering
    * Format script:
        * Added ART cache & /cache autoclean 
        * Added kernel settings autoclean, enabled when required like this build)
	* Power on notification LED for debug purposes (blue if installing on /system, red if installing in MultiROM as secondary)
    * Framework: various multimedia updates
    * Improved SystemUI circle battery
    * Include Android security patch level in Settings
    * Libpng: small fixes from Marshmallow
    * New JDCTeam ASCII art
    * New bootanimation! Big thanks to @ovaxivanov
    * Personalized SetupWizard UI
    * Revamped Device Info in Settings:
        * Added device hardware info (under "Common"):
	    * CPU info (number of cores, realtime maximum frequency)
	    * GPU info (model, realtime maximum frequency)
	    * Realtime RAM status (size, used, free)
	    * SoC info (manufacturer, model)
	* Added ROM logo with team members below
	* Added "ROM Thread" which links the user to ROM's thread on XDA (under "More")
	* Device-related infos moved under "Common"
	* ROM & kernel infos moved under "ROM"
	* Issue report & JDCTeam on G+ moved under "More"
	* Updated some strings
    * Removed dancing LED (there's LEDify now)
    * Reverted CM changes for BFQIO and cgroups
    * Show icon of app associated with the toast notification
    * Support for faster brightness response to light changes
    * SystemUI: various updates & fixes, use new lockscreen music visualizer from Eleven
    * Telephony: many framework updates & improvements
    * Updated system icon to material
    * Updated Webview to v46.0.2490.76
    * Various SELinux updates
    * Various other code updates (CM upstream merged 18 August~today)

#### 20150817
* Kernel:
    * mm/slub/slab: Merged a lot of code from 3.10 kernel
* ROM:
    * Merged all updates from cm
    * Fixed all stagefright vulnerability

#### 20150811 - Internal
* Kernel:
    * Ramdisk updates
    * Huge updates on mm
    * Added support for I9507
    * Update Workqueue and Idr from 3.10 kernel
    * More enhancements on MMC (Performance Mode)
    * A lot of code updates
* ROM:
    * Some small fixes on Setting/Build/Device repos
    * Use our bionic and art repos (forked from AOSP) tuned for Cortex-A15/Krait cpu
    * Removed some logspam from proprietary files
    * ROM compiled with GCC-4.8.5 (Sabermod) tuned for Cortex-A15/Krait CPU
    * Terminal: reverted some cm changes (related to compiling) after latest changes

#### 20150724 - Internal (Pre-Stable #1)
* Device:
    * Init:
       * run BSOD Killer as service
       * run dancing LED as service
       * update jfltexx fingerprint to LRX22C
       * update product name (jgedlte -> jflte)
* Kernel:
    * Ramdisk updates
    * Many various code updates
* ROM:
    * New ROM name! OptimizedCM-12.1
    * Added BSOD Killer: this will prevent you from falling in the BSOD, goodbye nasty boy!
    * Added bug report feature in Settings->About phone
    * Added JDCTeam Google+ community in Settings->About phone
    * Added something secret somewhere (easter egg)
    * Added sound panel in power menu
    * Create jar files with 0 compression, improves speed and RAM usage
    * Switch to prebuilt Google WebView (version 44.0.2403.73), ROM build time decreased by almost 50%
    * Updated dancing LED (intercept when boot is complete, resed LEDs and disable)
    * Updated Network Speed Meter strings & added translation for Italy
    * Many other code updates

#### 20150720 - Internal (Pre-Stable #1)
* Device:
    * Fixed IR Blaster (IR remote apps now work)
    * New way to handle Radio (RIL) properties for all jf variants
    * Switch to binary Camera HAL, enhanced camera: this makes it much more reliable and working way better (shoot consecutive pictures, video mode is stable and front-facing camera works. NOTE: some crashes may still occur, but are sporadic against before)
    * Loki tool:
       * Fixed MultiROM environment recognition (not yet tested)
       * New script body
       * Updated strings
* Kernel:
    * Built with GCC 6.0
    * Ramdisk updates
    * Various code updates
* ROM:
    * Codebase updated to android-5.1.1_r6
    * Fixed MultiROM support (not yet tested)
    * Added back ArchiDroid Optimizations V4
    * Added Dancing Notification LED at boot (rainbow pattern+reverse)
    * Added Google Nexus Lollipop system audio files
    * Fixed a bug where was impossible to have working custom ringtone sound
    * Fixed high touch sensitivity and touchscreen hovering
    * Increased Network Speed Meter multiple indicator (incoming+outgoing traffic) size
    * Many APNs updates
    * Updated FFMPEG to 2.7
    * Format script:
       * Fixed a bug where if current filesystem is impossible to be recognized, /system is formatted as F2FS instead of EXT4 as default.
       * Fixed MultiROM environment recognition (not yet tested)
       * Updated script body, bye-bye to the ugly one used since November 2014 in previous Optimized CM12 (5.0)
       * Updated strings & description
       * Whitespace fixes

#### 20150701
* Kernel:
    * Various code updates
* ROM:
    * Removed ArchiDroid optimizations
    * Various code updates (mainly test stuff)

#### 20150616
* Device:
    * Removed CM Bug Report service
* Kernel:
    * Various code updates
* ROM:
    * Added prebuilt libjni for AOSP keyboard gesture typing
    * Added some new APNs & updates
    * Fixed back/menu keys remaining awake for a little time after screen lock
    * Set Android M wallpaper as default
    * Various code updates

#### 20150602
* Device:
    * Fix LTE doesn't come up on boot
    * SEPolicy updates
* Kernel:
    * Unified platform: fixed sensors for all jflte variants
    * F2FS driver updates
    * Small optimizations for alucard, darkness & nightmare governors
    * Various code updates
* ROM:
    * Fixed Google Play Services crash when Location is set to High Accuracy
    * Added Network Speed Meter in status bar
    * Added STweaks in Settings instead of CM's Performance
    * Bluetooth updates: fixed A2DP streaming for all BT devices
    * Camera: added option to save pictures in SD Card

#### 20150524
* Google+ community founded! https://goo.gl/Kz6Fd4

* OTA Updates by Kryten2k35:
    * Direct download link & http support
    * MD5 check
    * OpenRecoveryScript support! Directly reboot to recovery after download to automagically update
* Device:
    * Added variant-based RIL properties (enhance Radio compatibility with any device variant)
    * Fixed apps moving to OTG storage
    * Sprint data connection issues are gone
* Kernel:
    * HUGE code updates (see https://github.com/Alucard24/Alucard-Kernel-jfltexx/commits/my-aospv2-5.1 for details)
    * Ramdisk updates
* ROM:
    * Merged all the upstream changes from CM (from 07/05 to 24/05, for details: http://www.cmxlog.com/12.1/jfltexx/)
    * Optimized installation/update process
    * Cleaned framework
    * F2FS for /system not as default anymore (fixes ROM's installation on old non-compatible recoveries, you can choose what file system to use)
    * More system stability & speed
