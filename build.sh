#! /bin/bash
TEAM_NAME="JFLTE Developers Connection"
TARGET=jflte
CM_VER=12.1
ALU_DIR=kernel/samsung/alucard24

buildROM () { 
	## Start the build
	echo "Building";
	time brunch "$TARGET"
	anythingElse
}

repoSync(){
	## Sync the repo
    repo sync

    if [ "$1" > 1 ]; then 
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
	ccache -C
    make clean
    anythingElse
}

buildAlu() {
    cd "$ALU_DIR"
    ./build_kernel_5.1.sh
    if [ "$?" == 0 ]; then
        repackRom
    else
        echo "Alucard kernel build failure"
    fi

}

repackRom() {
    LATEST=$(ls -t $OUT | grep "cm-12.1" | grep .zip | head -n 1)
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
breakfast "$TARGET" > /dev/null
echo " "
echo " "
echo -e "\e[1;91mPlease make your selections carefully"
echo -e "\e[0m "
echo " "
echo "Do you wish to build, sync or clean?"
select build in "Build ROM" "Sync" "Sync and upstream merge" "Build Alucard Kernel" "Repack ROM" "clean" "clean-fully"; do
    case $build in
        "Build ROM" ) buildROM; break;;
        "Sync" ) repoSync 1; break;;
        "Sync and upstream merge" ) repoSync 2; break;;
        "Build Alucard Kernel" ) buildAlucard; break;;
        "Repack ROM" ) repackRom; break;;
        "Clean" ) make clean; break ;;
        "Clean fully" ) makeclean; break;;
    esac
done

exit 0