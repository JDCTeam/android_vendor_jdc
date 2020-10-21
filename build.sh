#! /bin/bash
. build/envsetup.sh && lunch lineage_jflte-userdebug && make -j12 otapackage
