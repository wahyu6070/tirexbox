LIST_RM="
/data/adb/service.d/tirexbox-post-fs

"
for W in $LIST_RM; do
rm -rf $W
done
#set default animation scale android
settings put global transition_animation_scale 1.0
settings put global window_animation_scale 1.0