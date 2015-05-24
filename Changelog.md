# Jflte DevCon
### Developers
[AntaresOne](http://github.com/AntaresOne) - Lead

[Alucard24](http://github.com/Alucard24) - Kernel Developer

[Kryten2k35](http://github.com/Kryten2k35) - OTA Updates, git maintainer, scripting, tester

[angelcalibur](https://github.com/angelcalibur) - tester

[B--B](https://github.com/B--B) - tester

[smeroni68](https://github.com/smeroni68) - tester



### Changelog (short)
Any build includes upstream merging from CM

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
