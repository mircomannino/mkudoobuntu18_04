cmd_arch/arm/boot/dts/imx6sx-19x19-arm2-ldo.dtb := /home/mirco/Scaricati/gcc-linaro-5.4.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc -E -Wp,-MD,arch/arm/boot/dts/.imx6sx-19x19-arm2-ldo.dtb.d.pre.tmp -nostdinc -I/home/mirco/Scrivania/UDOO-Neo/Ubuntu18-04/udoo-dev/linux_kernel/arch/arm/boot/dts -I/home/mirco/Scrivania/UDOO-Neo/Ubuntu18-04/udoo-dev/linux_kernel/arch/arm/boot/dts/include -I/home/mirco/Scrivania/UDOO-Neo/Ubuntu18-04/udoo-dev/linux_kernel/drivers/of/testcase-data -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/.imx6sx-19x19-arm2-ldo.dtb.dts.tmp arch/arm/boot/dts/imx6sx-19x19-arm2-ldo.dts ; /home/mirco/Scrivania/UDOO-Neo/Ubuntu18-04/udoo-dev/linux_kernel/scripts/dtc/dtc -O dtb -o arch/arm/boot/dts/imx6sx-19x19-arm2-ldo.dtb -b 0 -i arch/arm/boot/dts/  -d arch/arm/boot/dts/.imx6sx-19x19-arm2-ldo.dtb.d.dtc.tmp arch/arm/boot/dts/.imx6sx-19x19-arm2-ldo.dtb.dts.tmp ; cat arch/arm/boot/dts/.imx6sx-19x19-arm2-ldo.dtb.d.pre.tmp arch/arm/boot/dts/.imx6sx-19x19-arm2-ldo.dtb.d.dtc.tmp > arch/arm/boot/dts/.imx6sx-19x19-arm2-ldo.dtb.d

source_arch/arm/boot/dts/imx6sx-19x19-arm2-ldo.dtb := arch/arm/boot/dts/imx6sx-19x19-arm2-ldo.dts

deps_arch/arm/boot/dts/imx6sx-19x19-arm2-ldo.dtb := \
  arch/arm/boot/dts/imx6sx-19x19-arm2.dts \
  arch/arm/boot/dts/imx6sx.dtsi \
  /home/mirco/Scrivania/UDOO-Neo/Ubuntu18-04/udoo-dev/linux_kernel/arch/arm/boot/dts/include/dt-bindings/clock/imx6sx-clock.h \
  /home/mirco/Scrivania/UDOO-Neo/Ubuntu18-04/udoo-dev/linux_kernel/arch/arm/boot/dts/include/dt-bindings/gpio/gpio.h \
  /home/mirco/Scrivania/UDOO-Neo/Ubuntu18-04/udoo-dev/linux_kernel/arch/arm/boot/dts/include/dt-bindings/interrupt-controller/arm-gic.h \
  /home/mirco/Scrivania/UDOO-Neo/Ubuntu18-04/udoo-dev/linux_kernel/arch/arm/boot/dts/include/dt-bindings/interrupt-controller/irq.h \
  arch/arm/boot/dts/imx6sx-pinfunc.h \
  arch/arm/boot/dts/skeleton.dtsi \

arch/arm/boot/dts/imx6sx-19x19-arm2-ldo.dtb: $(deps_arch/arm/boot/dts/imx6sx-19x19-arm2-ldo.dtb)

$(deps_arch/arm/boot/dts/imx6sx-19x19-arm2-ldo.dtb):
