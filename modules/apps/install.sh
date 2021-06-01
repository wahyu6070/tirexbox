MODBASE=$MODPATH/modules/apps
SDK=$API
copy_app(){
	local INPUT=$1
	local OUTPUT=$2
	test ! -d $OUTPUT && cdir $OUTPUT
	copy $MODBASE/$INPUT $OUTPUT
	}

if [ $SDK -le 28 ]; then
	SED_SYSTEM=$MODPATH/system
else
	SED_SYSTEM=$MODPATH/system/product
fi
if [ $(getconfig GoogleKeyBord) = ON ]; then
	LIST_NAME="
	LatinIMEGooglePrebuilt
	LatinIME
	"
	for WAHYU6 in $LIST_NAME; do
		debloat_app $WAHYU6
	done
	printlog "• installing Google Keybord"
	copy_app GoogleKeybord $SED_SYSTEM/app/
fi

if [ $(getconfig GoogleMessenger) = ON ]; then
	LIST_NAME="
	PrebuiltBugle
	messaging
	"
	for WAHYU6 in $LIST_NAME; do
		debloat_app $WAHYU6
	done
	printlog "• installing Google Messenger"
	copy_app GoogleMessenger $SED_SYSTEM/app/
fi

if [ $(getconfig GoogleContacts) = ON ]; then
	LIST_NAME="
	GoogleContactsPrebuilt
	Contacts
	"
	for WAHYU6 in $LIST_NAME; do
		debloat_app $WAHYU6
	done
	printlog "• installing Google Contacts"
	copy_app GoogleContacts $SED_SYSTEM/app/
fi
if [ $(getconfig SoundPicker) = ON ]; then
	LIST_NAME="
	SoundPickerPrebuilt
	"
	for WAHYU6 in $LIST_NAME; do
		debloat_app $WAHYU6
	done
	printlog "• installing Sound Picker"
	copy_app SoundPicker $SED_SYSTEM/app/
fi

if [ $(getconfig GoogleDialer) = ON ]; then
	LIST_NAME="
	Dialer
	"
	for WAHYU6 in $LIST_NAME; do
		debloat_app $WAHYU6
	done
	printlog "• installing Google Dialer"
	copy_app GoogleDialer $SED_SYSTEM/priv-app/
fi