#tirexbox by wahyu6070 since 23-05-2021 16-32 WIB
#Latest update 31-05-2021

BASE=/data/media/0/Android/tirexbox
LOG=$BASE/tirexbox.log
BIN=$MODPATH/bin/$ARCH32
SDK=$API
if [ -f /system/system/build.prop ]; then
SYSTEM=/system/system
elif [ -f /system/system_root/build.prop ]; then
SYSTEM=/system/system_root
else
SYSTEM=/system
fi

for W in tirexbox.functions; do
	[ -f $MODPATH/$W ] && chmod 755 $MODPATH/$W
done

for W in bin; do
	[ -d $MODPATH/$W ] && chmod -R 755 $MODPATH/$W
done

#functions load
. $MODPATH/tirexbox.functions
#make tirexbox
[ -f /data/media/0/Android/tirexbox/tirexbox.prop ] && del /data/media/0/Android/tirexbox/tirexbox.prop
sed_prop "tirexbox.version=$(get_mod version $MODPATH/module.prop)"
sed_prop "tirexbox.version.code=$(get_mod versionCode $MODPATH/module.prop)"

#Module and system info print line
print " "
print "        $(get_mod name $MODPATH/module.prop)"
print " Version    : $(get_mod version $MODPATH/module.prop)"
print " By         : $(get_mod author $MODPATH/module.prop)"
print " Build Date : $(get_mod date $MODPATH/module.prop)"
print " "
#base dir
[ ! -d $BASE ] && cdir $BASE

#Make log file
test -f $LOG && del $LOG
print "              $(get_mod name $MODPATH/module.prop) log" > $LOG
sedlog " "
sedlog " TirexBox Version : $(get_mod version $MODPATH/module.prop)"
sedlog " Build Date       : $(get_mod date $MODPATH/module.prop)"
sedlog " Script started   : $(date)"
sedlog " "
sedlog " "

#config
[ ! -d $BASE/config ] && cdir $BASE/config
if [ ! -f $BASE/config/default.tirexbox.config ]; then
	printlog " Copying default.tirexbox.config <using default>"
	cp -pf $MODPATH/config/default.tirexbox.config $BASE/config/default.tirexbox.config
elif [ ! $(getconfig tirexbox.code) -eq $(get_mod version.Code $MODPATH/module.prop) ]; then
	printlog " Updating default.tirexbox.config"
	cp -pf $MODPATH/config/default.tirexbox.config $BASE/config/default.tirexbox.config

fi
sedlog " Config Version  : $(getconfig tirexbox.config.version)"
sedlog " Config Codename : $(getconfig tirexbox.config.codename)"
sedlog " "

#set name rom with tirexbox
OLD_NAME=`get_mod ro.build.display.id $SYSTEM/build.prop`
NEW_NAME=`echo "$(get_mod name $MODPATH/module.prop) $(get_mod version $MODPATH/module.prop)"`
echo "ro.build.display.id=$OLD_NAME with $NEW_NAME" >> $MODPATH/system.prop

#Installing tirexbox modules
for WAHYU6070 in $(ls -1 $MODPATH/modules); do
	if [ -f $MODPATH/modules/$WAHYU6070/module.prop ]; then
	printlog " "
	printlog " ××××× Installing Module $(get_mod name $MODPATH/modules/$WAHYU6070/module.prop) ×××××"
	else
		printlog "! Not found <$MODPATH/modules/$WAHYU6070/module.prop>"
	fi
	if [ -f $MODPATH/modules/$WAHYU6070/install.sh ]; then
	chmod 755 $MODPATH/modules/$WAHYU6070/install.sh
	. $MODPATH/modules/$WAHYU6070/install.sh
	else
		printlog "! Not found <$MODPATH/modules/$WAHYU6070/install.sh>"
	fi
done
printlog " "
printlog " ⭐⭐⭐ TirexBox Installing Done ⭐⭐⭐"
print " "
print " "
print "✨ Tips"
print " Set Config In </sdcard/Android/tirexbox/config/default.tirexbox.config>"
print " "
print " "
print " "
print " Telegram : https://t.me/tirexbox"
print " "
