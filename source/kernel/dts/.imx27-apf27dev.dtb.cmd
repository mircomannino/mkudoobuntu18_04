cmd_arch/arm/boot/dts/imx27-apf27dev.dtb := /home/mirco/Scaricati/gcc-linaro-5.4.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc -E -Wp,-MD,arch/arm/boot/dts/.imx27-apf27dev.dtb.d.pre.tmp -nostdinc -I/home/mirco/Scrivania/UDOO-Neo/Ubuntu18-04/udoo-dev/linux_kernel/arch/arm/boot/dts -I/home/mirco/Scrivania/UDOO-Neo/Ubuntu18-04/udoo-dev/linux_kernel/arch/arm/boot/dts/include -I/home/mirco/Scrivania/UDOO-Neo/Ubuntu18-04/udoo-dev/linux_kernel/drivers/of/testcase-data -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/.imx27-apf27dev.dtb.dts.tmp arch/arm/boot/dts/imx27-apf27dev.dts ; /home/mirco/Scrivania/UDOO-Neo/Ubuntu18-04/udoo-dev/linux_kernel/scripts/dtc/dtc -O dtb -o arch/arm/boot/dts/imx27-apf27dev.dtb -b 0 -i arch/arm/boot/dts/  -d arch/arm/boot/dts/.imx27-apf27dev.dtb.d.dtc.tmp arch/arm/boot/dts/.imx27-apf27dev.dtb.dts.tmp ; cat arch/arm/boot/dts/.imx27-apf27dev.dtb.d.pre.tmp arch/arm/boot/dts/.imx27-apf27dev.dtb.d.dtc.tmp > arch/arm/boot/dts/.imx27-apf27dev.dtb.d

source_arch/arm/boot/dts/imx27-apf27dev.dtb := arch/arm/boot/dts/imx27-apf27dev.dts

deps_arch/arm/boot/dts/imx27-apf27dev.dtb := \
  arch/arm/boot/dts/imx27-apf27.dts \
  arch/arm/boot/dts/imx27.dtsi \
  arch/arm/boot/dts/skeleton.dtsi \

arch/arm/boot/dts/imx27-apf27dev.dtb: $(deps_arch/arm/boot/dts/imx27-apf27dev.dtb)

$(deps_arch/arm/boot/dts/imx27-apf27dev.dtb):
