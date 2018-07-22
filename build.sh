./halium/halium-boot/check-kernel-config kernel/samsung/jf/arch/arm/configs/lineageos_jf_defconfig -w
./halium/halium-boot/check-kernel-config kernel/samsung/jf/arch/arm/configs/lineageos_jf_defconfig 
source build/envsetup.sh
lunch lineage_jfltexx-userdebug
echo "Building..."
time schedtool -B -n 1 -e ionice -n 1 mka halium-boot -j"$CPU_NUM" "$@"
if [ "$?" == 0 ]; then
		echo "HALIUM-BOOT DONE."
	else
		echo "HALIUM-BOOT FAILED."
fi
echo ""
time schedtool -B -n 1 -e ionice -n 1 mka systemimage -j"$CPU_NUM" "$@"
if [ "$?" == 0 ]; then
		echo "SYSTEMIMAGE DONE."
	else
		echo "SYSTEMIMAGE FAILED."
fi
echo ""
