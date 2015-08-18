# Jflte DevCon
### Developers
[AntaresOne](http://github.com/AntaresOne) - Lead

[Alucard24](http://github.com/Alucard24) - Kernel Developer

[MattBooth](http://github.com/MattBooth) - OTA Updates, git maintainer, scripting, tester

[hawkerpaul](http://github.com/hawkerpaul) - scripting, tester

[angelcalibur](https://github.com/angelcalibur) - tester

[B--B](https://github.com/B--B) - tester

[Jimsilver73](https://github.com/Jimsilver73) - tester

[smeroni68](https://github.com/smeroni68) - tester

### Changelog (short)
Any build includes upstream merging from CM

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
