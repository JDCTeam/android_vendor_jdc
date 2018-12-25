. build/envsetup.sh

##### # packages/apps/Camera2
repopick 224752; # Use mCameraAgentNg for getting camera info when available  
repopick 225265; # Add Storage preference (1/2)  

##### # hardware/qcom/display
repopick 223341; 

##### # build/soong
repopick 224613; # soong: Add LOCAL_AIDL_FLAGS handling

##### # hardware/qcom/keymaster
repopick 224945-224954; ## AOSP Keymaster Chain: Broken crypto in current state, on hold

##### # lineage overlays
repopick 236134;