#! /bin/bash

#      _____  __________      
#  __ / / _ \/ ___/_  _/__ ___ ___ _
# / // / // / /__  / // -_) _ `/  ' \ 
# \___/____/\___/ /_/ \__/\_,_/_/_/_/ 
#
# Copyright 2015 Matt "Kryten2k35" Booth
# Copyright 2015 JDCTeam
# Contact: kryten2k35@ultimarom.com
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
VARIANT=userdebug
CM_VER=13
ALU_DIR=kernel/samsung/alucard24
AROMA_DIR=aroma
ALU_BUILD=build_kernel.sh
ALU_CLEAN=clean-all.sh
FILENAME=OptimizedCM-"$CM_VER"-"$(date +%Y%m%d)"-"$TARGET"-"$USER"
PREBUILTS=vendor/jdc/proprietary
getlog=false
LOG=""
LOGFILE=buildResults-"$CM_VER"-"$(date +%Y%m%d)"-"$TARGET"-AROMA.log


buildROM () { 
    if [ ! -d $PREBUILTS ]; then
	# Download Toolbox
	./vendor/jdc/get-prebuilts
    fi
    ## Start the build
    echo "Building";
    LOG="Starting the build..."/$(date +"%T")
    writeBuildLog;
    CPU_NUM=$[$(nproc)+1]
    time schedtool -B -n 1 -e ionice -n 1 make otapackage -j"$CPU_NUM" "$@"
    if [ "$?" == 0 ]; then
        LOG="Build done"/$(date +"%T")
	writeBuildLog;
    else
        LOG="Build was corrupted."/$(date +"%T")
	writeBuildLog;
	exit -1;
	
    fi
    
    
}

repoSync(){
    ## Sync the repo
    
     if [ "$1" == "2" ]; then 
	echo " "
	echo -e "\e[1;91mAutomatic upstream merge option is removed.\nIf you want to dev on that rom,learn how to upstream merge..."
	echo -e "\e[0m "
	echo " "
    fi

    if [ "$1" == "1" ]; then 
	echo "Syncing repositories"
	repo sync
    fi
}

makeclean(){
    ## Fully wipe, including compiler cache
    echo "Cleaning ccache"
    ccache -C
    ccache -c
    echo "Cleaning out folder"
    make clean
    echo "Making clobber"
    make clobber
    ## Clean Alucard cache, including its compiler cache
    if [ "$aluclean" == "true" ]; then
	cd "$ALU_DIR"
	./$ALU_CLEAN
	croot
    fi
}

buildAlu() {
    cd "$ALU_DIR"
    if [ "$(cat $ALU_BUILD | grep "enforcing")" != "" ]; then
    # Convert to androidboot.selinux
    sed -i 's/enforcing=0 selinux=1/androidboot.selinux=permissive/' $ALU_BUILD
    fi
    LOG="Starting alucard kernel..."/$(date +"%T")
    writeBuildLog;
    ./$ALU_BUILD
    if [ "$?" == 0 ]; then
        echo "Alucard Kernel built, ready to repack"
	LOG="Kernel build done"/$(date +"%T")
	writeBuildLog;
    else
        echo "Alucard kernel build failure, do not repack"
    fi
    
    croot
    
}

checkRamdisk() {
    echo "Going to build Alucard kernel, did you update the ramdisk?"
    select choice in "Yes" "No"; do
	case $choice in
	    Yes ) buildAlu; break;;
	    No ) 
		if [ "$fullbuild" == "true" ]; then
		    echo "You chosen to build ROM, kernel and repack but didn't update the ramdisk.\nTo prevent you from building a new kernel image with an old ramdisk I suspended the process.\nPlease update it and resume, I'll wait for you."
		    echo ""
		    echo "Are you ready?"
		    select ready in "Yes" "No"; do
			case $ready in
			    Yes ) buildAlu; break;;
			    No ) echo "Built ROM will not be deleted, once the ramdisk is updated run me again and select option 4 first, then option 5."; sleep 5; exit 0; break;;
			esac
		    done
		else
		    echo "Make sure you update the ramdisk, then run me again and select option 4." && sleep 5 | exit 0
		fi; break;;
	esac
    done
}

repackRom() {
    LATEST=$(ls -t $OUT | grep -v .zip.md5 | grep .zip | head -n 1)
    TEMP=temp
    ALU_OUT="$ALU_DIR"/READY-JB
    LOG="Unzipping files to repack alucard..."/$(date +"%T")
    writeBuildLog;
    if [ -d "$TEMP" ]; then 
    rm -rf "$TEMP"
    fi
    mkdir "$TEMP"
    echo "Unpacking ROM to temp folder"
    unzip -q "$OUT"/"$LATEST" -d"$TEMP"
    echo "Copying Alucard Kernel"
    rm -rf "$TEMP"/system/lib/modules/*
    cp -r "$ALU_OUT"/system/lib/modules "$TEMP"/system/lib/modules
    cp -r "$ALU_OUT"/system/wget "$TEMP"/system/wget
    cp "$ALU_OUT"/boot.img "$TEMP"

    cd "$TEMP"
    echo "Repacking ROM"
    LOG="Zipping files to repack alucard..."/$(date +"%T")
    writeBuildLog;
    zip -rq9 ../"$FILENAME".zip *
    cd ..
    echo "Creating MD5"
    md5sum "$FILENAME".zip > "$FILENAME".zip.md5
    echo "Cleaning up"
    rm -rf "$TEMP"
    echo "Done"
    LOG="Build Repacked with Alucard kernel"/$(date +"%T")
    writeBuildLog;
}

flashRom() {
    echo " "
    adb root
    sleep 3
    echo "pushing ROM file"
    adb push "$FILENAME".zip /sdcard/"$FILENAME".zip
    echo "pushing MD5"
    adb push "$FILENAME".zip.md5 /sdcard/"$FILENAME".zip.md5
    echo "install /sdcard/$FILENAME.zip" > openrecoveryscript
    echo "pushing open recovery script"
    adb remount
    adb push openrecoveryscript /cache/recovery/openrecoveryscript
    echo "rebooting phone"
    adb reboot recovery
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

useAroma()
{
    LOG="Unzipping files to repack with AROMA..."/$(date +"%T")
    writeBuildLog;
    if [ ! -d "$AROMA_DIR" ]; then
	echo "No AROMA directory found.Please check your sources"
	break;
    fi
    FILENAME=OptimizedCM-"$CM_VER"-"$(date +%Y%m%d)"-"$TARGET"-AROMA
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
    writeBuildLog;

}

writeBuildLog()
{
     if [ "$getlog" == "true" ]; then
	echo -e $LOG >> $LOGFILE
	echo -e $'\r\n'
	
     fi
}
deleteOldLog()
{
	croot
	rm -rf buildResults*
}

echo " "
echo " "
echo -e "\e[1;91mWelcome to the $TEAM_NAME build script"
echo -e "\e[0m "
echo "Setting up build environment..."
. build/envsetup.sh > /dev/null
echo "Setting build target $TARGET""..."
lunch cm_"$TARGET"-"$VARIANT" > /dev/null
echo " "
echo " "
echo -e "\e[1;91mPlease make your selections carefully"
echo -e "\e[0m "
echo " "
echo "Do you wish to build, sync or clean?"
select build in "Build ROM" "Sync" "Sync and upstream merge" "Build Alucard Kernel" "Repack ROM" "Make Clean" "Make Clean (inc ccache)" "Make Clean All (inc ccache+Alucard)" "Push and flash" "Build ROM, Kernel and Repackage" "Add Aroma Installer to ROM" "Build ROM,kernel,repack,add aroma" "Exit"; do
    case $build in
        "Build ROM" ) buildROM; anythingElse; break;;
        "Sync" ) repoSync 1; anythingElse; break;;
        "Sync and upstream merge" ) repoSync 2; anythingElse; break;;
        "Build Alucard Kernel" ) checkRamdisk; anythingElse; break;;
        "Repack ROM" ) repackRom; anythingElse; break;;
        "Make Clean" ) make clean; anythingElse; break;;
        "Make Clean (inc ccache)" ) makeclean; anythingElse; break;;
	"Make Clean All (inc ccache+Alucard)" ) aluclean=true; makeclean; anythingElse; break;;
        "Push and flash" ) flashRom; break;;
        "Build ROM, Kernel and Repackage"  ) fullbuild=true; buildROM; checkRamdisk; repackRom; anythingElse; break;;
	"Add Aroma Installer to ROM" ) useAroma; anythingElse; break;;
	"Build ROM,kernel,repack,add aroma" ) getlog=true; deleteOldLog;fullbuild=true; buildROM; buildAlu; repackRom ; useAroma; getlog=false; anythingElse; break;;
	"Exit" ) exit 0; break;;
    esac
done

exit 0
