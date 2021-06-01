MODBASE=$MODPATH/modules/tweaks

if [ $(getconfig Camera2ApiEnable) -eq 1 ]; then
printlog "• Enabling Camera2API"
LIST_TWEAKS="
	persist.camera.HAL3.enabled=1
	persist.vendor.camera.HAL3.enabled=1
	persist.camera.eis.enable=1
	"
		for W in $LIST_TWEAKS; do
			echo "$W" >> $MODPATH/system.prop
		done
fi
if [ $(getconfig Disable.Thermal.engine) -eq 1 ]; then
	printlog "• Disabling Android Thermal Engine"
	cdir $MODPATH/system/vendor/etc
	echo "Disabled by TirexBox" > $MODPATH/system/vendor/etc/thermal-engine.conf
fi

if [ $(getconfig Network.Tweaks) -eq 1 ]; then
	if [ $SDK -ge 29 ]; then
	printlog "• Enabling Network Tweaks"
	LIST_TWEAKS="
	net.tcp.buffersize.default=4096,87380,256960,4096,16384,256960
	net.tcp.buffersize.wifi=4096,87380,256960,4096,16384,256960
	net.tcp.buffersize.umts=4096,87380,256960,4096,16384,256960
	net.tcp.buffersize.gprs=4096,87380,256960,4096,16384,256960
	net.tcp.buffersize.edge=4096,87380,256960,4096,16384,256960
	net.tcp.buffersize.hspda=4096,87380,256960,4096,16384,256960
	net.tcp.buffersize.hspa=4096,87380,256960,4096,16384,256960
	net.tcp.buffersize.evdo=4096,87380,256960,4096,16384,256960
	"
		for W in $LIST_TWEAKS; do
			echo "$W" >> $MODPATH/system.prop
		done
	fi
fi

if [ $(getconfig Network.Tweak.Ipv4) -eq 1 ]; then
	if [ $SDK -ge 29 ]; then
	printlog "• Enabling Network Tweaks Ipv4"
	LIST_TWEAKS="
	net.ipv4.tcp_ecn=0
	net.ipv4.route.flush=1
	net.ipv4.tcp_rfc1337=1
	net.ipv4.ip_no_pmtu_disc=0
	net.ipv4.tcp_sack=1
	net.ipv4.tcp_fack=1
	net.ipv4.tcp_window_scaling=1
	net.ipv4.tcp_timestamps=1
	net.ipv4.tcp_rmem=4096 39000 187000
	net.ipv4.tcp_wmem=4096 39000 187000
	net.ipv4.tcp_mem=187000 187000 187000
	net.ipv4.tcp_no_metrics_save=1
	net.ipv4.tcp_moderate_rcvbuf=1
	"
		for W in $LIST_TWEAKS; do
			echo "$W" >> $MODPATH/system.prop
		done
	fi

fi
if [ $(getconfig force.stop.app.after.booting) -eq 1 ]; then
sed_prop "force.stop.app.after.booting=ON"
fi
case $(getconfig AnimationScale) in
	1) SCALE=0.0 ;;
	2) SCALE=0.3 ;;
	3) SCALE=0.5 ;;
	4) SCALE=1.0 ;;
	5) SCALE=1.5 ;;
	6) SCALE=2.0 ;;
	*) SCALE=0.5 ;;
esac
printlog "• Set Animation Scale $SCALE"
settings put global transition_animation_scale $SCALE
settings put global window_animation_scale $SCALE
