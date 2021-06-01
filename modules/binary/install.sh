MODBASE=$MODPATH/modules/binary

[ ! -d $MODPATH/system/bin ] && cdir $MODPATH/system/bin

if [ $(getconfig 7za) = ON ]; then
printlog "• Installing 7za"
cp -pf $MODBASE/7za/$ARCH/7za $MODPATH/system/bin
chmod 755 $MODPATH/system/bin/7za
fi

if [ $(getconfig Brotli) = ON ]; then
printlog "• Installing Brotli"
cp -pf $MODBASE/bash/$ARCH/brotli $MODPATH/system/bin
chmod 755 $MODPATH/system/bin/brotli
fi

if [ $(getconfig Bash) = ON ]; then
printlog "• Installing Bash"
cp -pf $MODBASE/bash/$ARCH/bash $MODPATH/system/bin
chmod 755 $MODPATH/system/bin/bash
$BIN/busybox tar -xf $MODBASE/bash/etc.tar.xz -C $MODPATH/system
chmod -R $MODPATH/system/etc
fi

if [ $(getconfig Curl) = ON ]; then
printlog "• Installing Curl"
cp -pf $MODBASE/curl/$ARCH/curl $MODPATH/system/bin
chmod 755 $MODPATH/system/bin/curl
fi

if [ $(getconfig Busybox) = ON ]; then
printlog "• Installing Busybox"
cp -pf $MODBASE/busybox/$ARCH/busybox $MODPATH/system/bin
chmod 755 $MODPATH/system/bin/busybox
fi

if [ $(getconfig Vim) = ON ]; then
printlog "• Installing Vim"
cp -pf $MODBASE/vim/$ARCH/vim $MODPATH/system/bin
chmod 755 $MODPATH/system/bin/vim
$BIN/busybox tar -xf $MODBASE/vim/usr.tar.xz -C $MODPATH/system
fi

if [ $(getconfig Zip) = ON ]; then
printlog "• Installing Zip"
cp -pf $MODBASE/zip/$ARCH/zip $MODPATH/system/bin
chmod 755 $MODPATH/system/bin/zip
fi

if [ $(getconfig Zstd) = ON ]; then
printlog "• Installing Zstd"
cp -pf $MODBASE/zstd/$ARCH/zstd $MODPATH/system/bin
chmod 755 $MODPATH/system/bin/zstd
fi