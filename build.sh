#! /bin/bash

#      _____  __________      
#  __ / / _ \/ ___/_  _/__ ___ ___ _
# / // / // / /__  / // -_) _ `/  ' \ 
# \___/____/\___/ /_/ \__/\_,_/_/_/_/ 
#
# Copyright 2018 JDCTeam
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


TEAM_NAME="JDCTeam"
TARGET=jflte
LOS_VER=16.0
VERSION_BRANCH=opt-cm-16.0
OUT="out/target/product/jflte"
AROMA_DIR=aroma
ROM_VERSION=10.1
export OPTIMIZED_LINEAGEOS_VERSION=$ROM_VERSION
export ANDROID_HOME=~/Android/Sdk

buildTest()
{
	export z=`date "+%H%M%S-%d%m%y"`
	echo "Building..."
	time schedtool -B -n 1 -e ionice -n 1 make otapackage -j10 "$@"
	if [ "$?" == 0 ]; then
		echo "Build done"
		mv $OUT/lineage*.zip $OUT/OptLos16-V$ROM_VERSION-$z.zip 
	else
		echo "Build failed"
	fi
	croot
}
buildRelease()
{
	echo "Building..."
	time schedtool -B -n 1 -e ionice -n 1 make otapackage -j10 "$@"
	if [ "$?" == 0 ]; then
		echo "Build done"
		mv $OUT/lineage*.zip $OUT/Optimized-LineageOS-$LOS_VER-Version-$ROM_VERSION.zip 
	else
		echo "Build failed"
	fi
	croot
}

anythingElse() {
    echo " "
    echo " "
    echo "Anything else?"
    select more in "Yes" "No"; do
        case $more in
            Yes ) bash build.sh; break;;
            No ) exit 0; break;;
        esac
    done ;
}

getBuild() {
	croot
	rm -rf build
	repo sync build/make
	repo sync build/kati
	repo sync build/soong
	repo sync build/blueprint
	
}

upstreamMerge() {

	croot
	#echo "Refreshing manifest"
	#repo init -u git://github.com/"$TEAM_NAME"/manifests.git -b "$VERSION_BRANCH"
	#echo "Syncing projects"
	#repo sync --force-sync
	
        echo "Upstream merging"
        ## Our snippet/manifest
        ROOMSER=.repo/manifests/snippets/optlos.xml
        # Lines to loop over
        CHECK=$(cat ${ROOMSER} | grep -e "<remove-project" | cut -d= -f3 | sed 's/revision//1' | sed 's/\"//g' | sed 's|/>||g')

        ## Upstream merging for forked repos
        while read -r line; do
            echo "Upstream merging for $line"
	    rm -rf $line
	    repo sync $line
	    cd "$line"
	    git branch -D "$VERSION_BRANCH"
	    git checkout -b "$VERSION_BRANCH"
            UPSTREAM=$(sed -n '1p' UPSTREAM)
            BRANCH=$(sed -n '2p' UPSTREAM)

            git pull https://www.github.com/"$UPSTREAM" "$BRANCH"
            git push origin "$VERSION_BRANCH"
            croot
        done <<< "$CHECK"


}

useAroma()
{
    LOG="Unzipping files to repack with AROMA..."/$(date +"%T")
    if [ ! -d "$AROMA_DIR" ]; then
	echo "No AROMA directory found.Please check your sources"
	break;
    fi
    FILENAME=Optimized-LineageOS-"$LOS_VER"-"$(date +%Y%m%d)"-"$TARGET"-AROMA
    echo " "
    LATEST=$(ls -t | grep -v .zip.md5 | grep .zip | head -n 1)
    TEMP2=tmpAroma
    if [ -d "$TEMP2" ]; then 
    rm -rf "$TEMP2"
    fi
    mkdir "$TEMP2"
    echo "Unpacking ROM to temp folder"
    unzip -q "$LATEST" -d"$TEMP2"
    echo "Removing META-INF folder"
    rm -rf "$TEMP2"/META-INF
    echo "Copying Aroma Installer"
    cp -r "$AROMA_DIR"/jdc "$TEMP2"/jdc
    cp -r "$AROMA_DIR"/xbin "$TEMP2"/xbin
    cp -r "$AROMA_DIR"/META-INF "$TEMP2"/META-INF

    cd "$TEMP2"
    echo "Repacking ROM"
    zip -rq9 ../"$FILENAME".zip *
    cd ..
    echo "Creating MD5"
    md5sum "$FILENAME".zip > "$FILENAME".zip.md5
    echo "Cleaning up"
    rm -rf "$TEMP2"
    echo "Done"
    LOG="Added AROMA.Build finished successfully"/$(date +"%T")

}

audit () 
{
	croot
	rm -rf policies_from_audit.txt
	cd external/selinux/prebuilts/bin
	adb pull /sys/fs/selinux/policy
	adb logcat -b all -d | ./audit2allow -p policy > ../../../../policies_from_audit.txt
	echo " "
	echo "Policies produced"
	echo " "

}
createRemotes () 
{
	croot
	#vendor/jdc
	cd vendor/jdc
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_vendor_jdc-private.git
	croot
	#vendor/samsung
	cd vendor/samsung
	git remote remove origin
	git remote add origin git@github.com:jdcteam/proprietary_vendor_samsung-private.git
	croot
	#vendor/lineage
	cd vendor/lineage
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_vendor_lineage.git
	croot
	#device/samsung/jflte
	cd device/samsung/jflte
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_device_samsung_jfltepie-private.git
	croot
	#aroma
	cd AromaInstaller
	git remote remove origin
	git remote add origin git@github.com:jdcteam/AromaInstaller.git
	croot
	#adiutor
	cd buffcoreapp
	git remote remove origin
	git remote add origin git@github.com:jdcteam/BuffCoreApp.git
	croot
	#frameworks/opt/telephony
	cd frameworks/opt/telephony
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_frameworks_opt_telephony.git
	croot
	#packages/apps/CarrierConfig
	cd packages/apps/CarrierConfig
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_packages_apps_CarrierConfig.git
	croot
	#packages/apps/Setting
	cd packages/apps/Settings
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_packages_apps_Settings.git
	croot
        #dalvik
	cd dalvik
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_dalvik.git
	croot
	#system/core
	cd system/core
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_system_core-pie.git
	croot
	#bionic
	cd bionic
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_bionic.git
	croot
	#art
	cd art
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_art.git
	croot
	#build
	cd build/make
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_build.git
	croot
	#hw/samsung
	cd hardware/samsung
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_hardware_samsung.git
	croot
	#launcher
	cd packages/apps/Launcher3
	git remote remove origin
	git remote add origin git@github.com:jdcteam/platform_packages_apps_launcher3.git
	croot
	#sdk
	cd lineage-sdk
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_lineage-sdk.git
	croot
	# kernel
	cd kernel/samsung/jf
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_kernel_samsung_jf-pieForCommunity.git
	croot
	# native SU
	cd system/extras/su
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_system_extras_su.git
	croot	
	# lineageparts
	cd packages/apps/LineageParts
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_packages_apps_LineageParts.git
	croot	
	# perfetto
	cd external/perfetto
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_external_perfetto.git
	croot	
	#fw/base
	cd frameworks/base
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_frameworks_base.git
	croot
	#fw/native
	cd frameworks/native
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_frameworks_native.git
	croot
	#overlays
	cd packages/overlays/Lineage
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_packages_overlays_Lineage.git
	croot
	# Recorder
	cd packages/apps/Recorder
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_packages_apps_Recorder.git
	croot
	# Messaging
	cd packages/apps/Messaging
	git remote remove origin
	git remote add origin git@github.com:jdcteam/android_packages_apps_Messaging.git
	croot
	
	
	#Fix up manifest
	cd .repo/manifests
	git branch -D opt-cm-16.0
	git checkout -b opt-cm-16.0
	git remote remove origin
	git remote add origin git@github.com:jdcteam/manifests.git
	croot


	echo " "
	echo "Remotes refreshed..."
	echo " " 

}

buildAdiutor () {
	croot
	cd kerneladiutor
	./gradlew clean
	./gradlew build
}
echo " "
echo -e "\e[1;91mWelcome to the $TEAM_NAME build script"
echo -e "\e[0m "
echo "Setting up build environment..."
. build/envsetup.sh > /dev/null
echo "Setting build target $TARGET""..."
lunch lineage_"$TARGET"-userdebug > /dev/null
echo " "
echo -e "\e[1;91mPlease make your selections carefully"
echo -e "\e[0m "
echo " "
select build in "Upstream merge" "Build Test" "Build Release" "Add Aroma Installer to ROM" "Refresh build directory"  "Refresh remotes" "Produce audit2allow results" "Build Kernel Adiutor" "Exit"; do
	case $build in
		"Upstream merge" ) upstreamMerge; getBuild;anythingElse; break;;
		"Build Test" ) buildTest; anythingElse; break;;
		"Build Release" ) buildRelease; anythingElse; break;;
		"Add Aroma Installer to ROM" ) useAroma; anythingElse; break;;
		"Refresh build directory" ) getBuild; anythingElse; break;;
		"Refresh remotes" ) createRemotes; anythingElse; break;;
		"Produce audit2allow results" ) audit; anythingElse; break;;
		"Build Kernel Adiutor" ) buildAdiutor; anythingElse; break;;
		"Exit" ) exit 0; break;;
	esac
done
exit 0
