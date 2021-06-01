#by wahyu6070
MODBASE=$MODPATH/modules/debloater

[ -f $BASE/list-debloat ] && del $BASE/list-debloat
for W in $(ls -1 $MODBASE/list); do
	for W2 in $(ls -1 $MODBASE/list/$W); do
		if [ -f $MODBASE/list/$W/$W2 ]; then
			for W3 in $(cat $MODBASE/list/$W/$W2); do
				echo "$W3" >> $BASE/list-debloat
			done
		fi
	
	done
done

if [ $(getconfig TirexBox_Debloater) = 1 ] && [ -f $BASE/list-debloat ]; then
	for W4 in $(cat $BASE/list-debloat); do
	debloat_app $W4
	[ $? ] && printlog "• Debloating $W4" || sedlog "• Skipping Debloat <$W4>"
	done
fi


