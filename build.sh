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
LOS_VER=18.0
VERSION_BRANCH=opt-cm-18.0
OUT="out/target/product/jflte"
ROM_VERSION=1
export ANDROID_HOME=~/Android/Sdk

export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1 
buildTest()
{
	export z=`date "+%H%M%S-%d%m%y"`
	export OPTIMIZED_LINEAGEOS_VERSION="$ROM_VERSION - BETA"
	echo "Building..."
	time schedtool -B -n 1 -e ionice -n 1 make otapackage -j10 "$@"
	if [ "$?" == 0 ]; then
		echo "Build done"
		mv $OUT/lineage*.zip $OUT/OptLos17-V$ROM_VERSION-$z.zip 
	else
		echo "Build failed"
	fi
	croot
}
buildRelease()
{
	export OPTIMIZED_LINEAGEOS_VERSION="$ROM_VERSION - Release"
	echo "Building..."
	time schedtool -B -n 1 -e ionice -n 1 make otapackage -j10 "$@"
	if [ "$?" == 0 ]; then
		echo "Build done"
		mv $OUT/lineage*.zip Optimized-LineageOS-$LOS_VER-V$ROM_VERSION.zip 
	else
		echo "Build failed"
	fi
	croot
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
	ROOMSER=.repo/manifests/snippets/optlos.xml
    # Lines to loop over
    CHECK=$(cat ${ROOMSER} | grep -e "<project" | grep -e "jdc" | cut -d= -f3 | sed 's/remote//1' | sed 's/JDCTeam//1' | sed 's/\"//g'  | sed 's/\///g' )


    ## Upstream merging for forked repos
    while read -r line; do
    	x=$(echo ${line} | sed 's/_/\//1' | sed 's/android\///1' | sed 's/platform\///1' | sed 's/_/\//1' | sed 's/_/\//1' | sed 's/proprietary\///g' | sed 's/build/build\/make/g' | sed 's/-pie//g')
    	croot
    	cd "$x"
    	git remote add origin git@github.com:jdcteam/$line.git
    	#echo "$x"
        #echo "git remote add origin git@github.com:jdcteam/$line.git"
        #echo "----"
    done <<< "$CHECK"

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
select build in "Upstream merge" "Build Test" "Build Release" "Refresh remotes" "Produce audit2allow results" "Build Kernel Adiutor" "Exit"; do
	case $build in
		"Upstream merge" ) upstreamMerge; anythingElse; break;;
		"Build Test" ) buildTest; anythingElse; break;;
		"Build Release" ) buildRelease; anythingElse; break;;
		"Refresh build directory" ) getBuild; anythingElse; break;;
		"Refresh remotes" ) createRemotes; anythingElse; break;;
		"Produce audit2allow results" ) audit; anythingElse; break;;
		"Build Kernel Adiutor" ) buildAdiutor; anythingElse; break;;
		"Exit" ) exit 0; break;;
	esac
done
exit 0
