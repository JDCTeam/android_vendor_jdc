==============
Copyright 2015 - JDCTeam
--------------
Addons/common files for ROMs

WORK IN PROGRESS.

#### F2FS format script:

Smart way to handle both ext4/F2FS at ROM's installation. If TARGET_USERIMAGES_USE_F2FS is set to true, edify_generator from android_build will set format and mount commands for F2FS (in case this file system is enabled for /system too). This isn't a safe way because ROM's installation will be denied on non-F2FS compatible recovery; instead, in this case format as ext4 with mke2fs. Also let the user choose what file system he wants (requires a F2FS-compatible recovery).

Needs:

- **TARGET_CUSTOM_SYSTEM_FORMAT := true** in your BoardConfig

- https://github.com/AntaresOne/android_build/commit/e9b6c07db536e28c9b8d05fb0fc0984149983d2a in your local source

In your source's root:

	cd build && git fetch https://github.com/AntaresOne/android_build cm-12.1-custom && git cherry-pick e9b6c07db536e28c9b8d05fb0fc0984149983d2a && cd ..

You're now ready to build

#### STweaks:

Copyright 2012 - Gokhan Moral

Kernel settings configuration app with dynamic UI generation, made by gokhanmoral. Android Lollipop's Material UI and some additions are made by B--B. We use it with Alucard kernel.

Needs:

- **TARGET_SHIP_STWEAKS := true** in your BoardConfig
