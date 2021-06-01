MODBASE=$MODPATH/modules/bootanimations
SDK=$API
case $(getconfig bootanimation) in
1)
printlog "• Selected ROG Phone 3 boot animation"
bootzip=$MODBASE/rog3/bootanimation.zip
;;
2)
printlog "• Selected ROG Phone 5 boot animation"
bootzip=$MODBASE/rog5/bootanimation.zip
;;
3)
printlog "• Selected Asus Zenfone Max Pro M1 Stockrom boot animation"
bootzip=$MODBASE/X00T/bootanimation.zip
;;
4)
printlog "• Selected Sony Xperia boot animation"
bootzip=$MODBASE/xperia/bootanimation.zip
;;
5)
printlog "• Selected Zenfone 8 boot animation"
bootzip=$MODBASE/zenfone8/bootanimation.zip
;;
6)
printlog "• Selected Google Pixel 5 Dark boot animation"
bootzip=$MODBASE/google_pixel_5_dark/bootanimation.zip
;;
7)
printlog "• Selected Google Pixel 5 White boot animation"
bootzip=$MODBASE/google_pixel_5_white/bootanimation.zip
;;
*)
printlog "• Using default boot animation ROM"
bootzip="default ROM boot animation"
;;
esac


printlog " •>>> Installing Boot Animation <<<•"
if [ -f $SYSTEM/media/bootanimation.zip ]; then
	BOOTANIMATION_MEDIA=$MODPATH/system/media
	test ! -d $BOOTANIMATION_MEDIA && cdir $BOOTANIMATION_MEDIA
	cp -pf $bootzip $MODPATH/$BOOTANIMATION_MEDIA/
	sedlog "Copying boot animation <$bootzip> to <$BOOTANIMATION_MEDIA>"
elif [ -f $SYSTEM/product/media/bootanimation.zip ]; then
	BOOTANIMATION_MEDIA=$MODPATH/system/product/media
	test ! -d $BOOTANIMATION_MEDIA && cdir $BOOTANIMATION_MEDIA
	cp -pf $bootzip $BOOTANIMATION_MEDIA/
	sedlog "Copying boot animation <$bootzip> to <$BOOTANIMATION_MEDIA>"
else
	printlog "! bootanimation.zip not detected in system"
fi