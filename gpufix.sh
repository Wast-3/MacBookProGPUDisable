cd /sys/firmware/efi/efivars
echo "removing gpu power prefs var"
if sudo rm gpu-power-prefs* ; then
	echo "removed power prefs var"
else 
	echo "unable to remove power prefs var"
	
	echo "remounting system with read-write permissions"
	cd /
	umount /sys/firmware/efi/efivars/
	mount -t efivarfs rw /sys/firmware/efi/efivars/
	cd /sys/firmware/efi/efivars/
	chattr -i gpu-power-prefs*	
	if rm gpu-power-prefs* ; then
        	echo "removed power prefs var"
	else
		echo "failed to remove power prefs var again"
		echo "assuming it doesn't exist"
	fi
fi

`printf "\x07\x00\x00\x00\x01\x00\x00\x00" > /sys/firmware/efi/efivars/gpu-power-prefs-fa4ce28d-b62f-4c99-9cc3-6815686e30f9`

`chattr +i "/sys/firmware/efi/efivars/gpu-power-prefs-fa4ce28d-b62f-4c99-9cc3-6815686e30f9"`

cd /
umount /sys/firmware/efi/efivars/

echo "Remember to reboot in safe mode"
