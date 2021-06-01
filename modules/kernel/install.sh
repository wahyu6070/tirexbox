MODBASE=$MODPATH/modules/kernel

case $(getconfig gpu.booster) in
1) 
printlog "• Enabling GPU booster to NORMAL"
sed_prop gpu.booster=1 
;;
2)
printlog "• Enabling GPU booster to EXTREME"
sed_prop gpu.booster=2 
;;
*) sed_prop gpu.booster=0 ;;
esac

case $(getconfig cpu.booster) in
1) 
printlog "• Enabling CPU booster to NORMAL"
sed_prop cpu.booster=1
;;
2)
printlog "• Enabling GPU booster to EXTREME"
sed_prop cpu.booster=2
;;
*) sed_prop cpu.booster=0 ;;
esac

