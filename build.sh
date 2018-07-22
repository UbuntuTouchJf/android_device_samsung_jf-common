./halium/halium-boot/check-kernel-config kernel/samsung/jf/arch/arm/configs/lineageos_jf_defconfig -w
./halium/halium-boot/check-kernel-config kernel/samsung/jf/arch/arm/configs/lineageos_jf_defconfig 
source build/envsetup.sh
lunch lineage_jfltexx-userdebug
echo "Building..."
mka halium-boot
if [ "$?" == 0 ]; then
	echo "HALIUM-BOOT DONE."
else
	echo "HALIUM-BOOT FAILED."
	exit -1;
fi
echo ""
mka systemimage
if [ "$?" == 0 ]; then
	echo "SYSTEMIMAGE DONE."
else
	echo "SYSTEMIMAGE FAILED."
	exit -1;
fi
echo ""
