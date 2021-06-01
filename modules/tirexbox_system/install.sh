MODBASE=$MODPATH/modules/tirexbox_system

printlog "• Installing TirexBox Post-Fs"
copy $MODBASE/tirexbox-post-fs /data/adb/service.d/
chmod 755 /data/adb/service.d/tirexbox-post-fs
