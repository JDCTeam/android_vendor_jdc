#! /bin/bash

#
#    ____  ____  __   ____  ____       
#   (_  _)( ___)(  ) (_  _)( ___)      
#  .-_)(   )__)  )(__  )(   )__)       
#  \____) (__)  (____)(__) (____)      
#   ____  ____  _  _  ___  _____  _  _ 
#  (  _ \( ___)( \/ )/ __)(  _  )( \( )
#   )(_) ))__)  \  /( (__  )(_)(  )  ( 
#  (____/(____)  \/  \___)(_____)(_)\_)
#
# Copyright 2015 Matt "Kryten2k35" Booth
# Copyright 2015 Jflte Dev Connection
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


TEAM_NAME="JFLTE Developers Connection"
TARGET=jflte
VARIANT=userdebug
CM_VER=12.1
ALU_DIR=kernel/samsung/alucard24

buildROM () { 
    ## Start the build
    echo "Building";
    CPU_NUM=$(nproc)
    ((CPU_NUM+=1))
    time schedtool -B -n 1 -e ionice -n 1 make otapackage -j"$CPU_NUM+=1" "$@"
    anythingElse
}

repoSync(){
    ## Sync the repo
    echo "Syncing repositories"
    repo sync

    if [ "$1" == "2" ]; then 
        echo "Upstream merging"
        ## local manifest location
        ROOMSER=.repo/local_manifests/local_manifest.xml
        # Lines to loop over
        CHECK=$(cat ${ROOMSER} | grep -e "<remove-project" | cut -d= -f3 | sed 's/revision//1' | sed 's/\"//g' | sed 's|/>||g')
        
        ## Upstream merging for forked repos
        while read -r line; do
            echo "Upstream merging for $line"
            cd  "$line"
            UPSTREAM=$(sed -n '1p' UPSTREAM)
            BRANCH=$(sed -n '2p' UPSTREAM)
            ORIGIN=$(sed -n '3p' UPSTREAM)
            git pull https://www.github.com/"$UPSTREAM" "$BRANCH"
            git push "$ORIGIN" HEAD:"$BRANCH"
            croot
        done <<< "$CHECK"
    fi
    anythingElse
}

makeclean(){
    ## Fully wipe, including compiler cache
    echo "Cleaning ccache"
    ccache -C
    echo "Cleaning out folder"
    make clean
    anythingElse
}

buildAlu() {
    cd "$ALU_DIR"
    ./build_kernel_5.1.sh
    if [ "$?" == 0 ]; then
        echo "Alucard Kernel built, ready to repack"
    else
        echo "Alucard kernel build failure, do not repack"
    fi
    croot
    anythingElse

}

repackRom() {
    LATEST=$(ls -t $OUT | grep -v .zip.md5 | grep .zip | head -n 1)
    TEMP=temp
    ALU_OUT="$ALU_DIR"/READY-JB
    mkdir "$TEMP"
    echo "Unpacking ROM to temp folder"
    unzip -q "$OUT"/"$LATEST" -d"$TEMP"
    echo "Copying Alucard Kernel"
    cp -r "$ALU_OUT"/system "$ALU_OUT"/boot.img $TEMP

    cd "$TEMP"
    echo "Repacking ROM"
    zip -rq9 ../"$LATEST" *
    cd ..
    echo "Creating MD5"
    md5sum "$LATEST" > "$LATEST".md5
    echo "Cleaning up"
    rm -rf "$TEMP"
    echo "Done"
    anythingElse

}

anythingElse() {
    echo " "
    echo " "
    echo "Anything else?"
    select more in "Yes" "No"; do
        case $more in
            Yes ) bash build.sh; break;;
            No ) exit 0; ;;
        esac
    done ;
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
select build in "Build ROM" "Sync" "Sync and upstream merge" "Build Alucard Kernel" "Repack ROM" "Clean" "Clean fully"; do
    case $build in
        "Build ROM" ) buildROM; break;;
        "Sync" ) repoSync 1; break;;
        "Sync and upstream merge" ) repoSync 2; break;;
        "Build Alucard Kernel" ) buildAlu; break;;
        "Repack ROM" ) repackRom; break;;
        "Clean" ) make clean; anythingElse; break;;
        "Clean fully" ) makeclean; break;;
    esac
done

exit 0