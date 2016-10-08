#! /bin/bash

#      _____  __________      
#  __ / / _ \/ ___/_  _/__ ___ ___ _
# / // / // / /__  / // -_) _ `/  ' \ 
# \___/____/\___/ /_/ \__/\_,_/_/_/_/ 
#
# Copyright 2016 JDCTeam
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


TEAM_NAME="JDC"
TARGET=jflte
VARIANT=userdebug
CM_VER=14.0
OUT="out/target/product/jflte"
FILENAME=OptimizedCM-"$CM_VER"-"$(date +%Y%m%d)"-"$TARGET"-GSM


buildROM()
{
	echo "Building..."
	time schedtool -B -n 1 -e ionice -n 1 make otapackage -j"$CPU_NUM" "$@"
	if [ "$?" == 0 ]; then
		echo "Build done"
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

clean() {
	make clean && make clobber
}

deepClean() {
	ccache -C && ccache -c
}

getBuild() {
	croot
	rm -rf build
	repo sync build
	repo sync build/kati
	repo sync build/soong
	repo sync build/blueprint
}

getMani() {
	croot
	rm -rf .repo/manifest*
	repo init -u git://github.com/dkati/optcm-manifest.git -b opt-cm-14.0  > /dev/null
	repo sync --force-sync
}


echo " "
echo -e "\e[1;91mWelcome to the $TEAM_NAME build script"
echo -e "\e[0m "
echo "Setting up build environment..."
. build/envsetup.sh > /dev/null
echo "Setting build target $TARGET""..."
lunch cm_"$TARGET"-"$VARIANT" > /dev/null
echo " "
echo -e "\e[1;91mPlease make your selections carefully"
echo -e "\e[0m "
echo " "
select build in "Build ROM" "Refresh build directory" "Refresh manifest" "Clean" "Deep clean(inc. ccache)" "Rename ROM" "Exit"; do
	case $build in
		"Build ROM" ) buildROM; anythingElse; break;;
		"Refresh build directory" ) getBuild; anythingElse; break;;
		"Refresh manifest" ) getMani; anythingElse; break;
		"Clean" ) clean; anythingElse; break;;
		"Deep clean(inc. ccache)" ) clean; deepClean; anythingElse; break;;
		"Exit" ) exit 0; break;;

	esac
done
exit 0
