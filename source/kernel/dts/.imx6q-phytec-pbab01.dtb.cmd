cmd_arch/arm/boot/dts/imx6q-phytec-pbab01.dtb := /home/mirco/Scaricati/gcc-linaro-5.4.1-2017.05-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc -E -Wp,-MD,arch/arm/boot/dts/.imx6q-phytec-pbab01.dtb.d.pre.tmp -nostdinc -I/home/mirco/Scrivania/UDOO-Neo/Ubuntu18-04/udoo-dev/linux_kernel/arch/arm/boot/dts -I/home/mirco/Scrivania/UDOO-Neo/Ubuntu18-04/udoo-dev/linux_kernel/arch/arm/boot/dts/include -I/home/mirco/Scrivania/UDOO-Neo/Ubuntu18-04/udoo-dev/linux_kernel/drivers/of/testcase-data -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/.imx6q-phytec-pbab01.dtb.dts.tmp arch/arm/boot/dts/imx6q-phytec-pbab01.dts ; /home/mirco/Scrivania/UDOO-Neo/Ubuntu18-04/udoo-dev/linux_kernel/scripts/dtc/dtc -O dtb -o arch/arm/boot/dts/imx6q-phytec-pbab01.dtb -b 0 -i arch/arm/boot/dts/  -d arch/arm/boot/dts/.imx6q-phytec-pbab01.dtb.d.dtc.tmp arch/arm/boot/dts/.imx6q-phytec-pbab01.dtb.dts.tmp ; cat arch/arm/boot/dts/.imx6q-phytec-pbab01.dtb.d.pre.tmp arch/arm/boot/dts/.imx6q-phytec-pbab01.dtb.d.dtc.tmp > arch/arm/boot/dts/.imx6q-phytec-pbab01.dtb.d

source_arch/arm/boot/dts/imx6q-phytec-pbab01.dtb := arch/arm/boot/dts/imx6q-phytec-pbab01.dts

deps_arch/arm/boot/dts/imx6q-phytec-pbab01.dtb := \
  arch/arm/boot/dts/imx6q-phytec-pfla02.dtsi \
  arch/arm/boot/dts/imx6q.dtsi \
  /home/mirco/Scrivania/UDOO-Neo/Ubuntu18-04/udoo-dev/linux_kernel/arch/arm/boot/dts/include/dt-bindings/interrupt-controller/irq.h \
  arch/arm/boot/dts/imx6q-pinfunc.h \
  arch/arm/boot/dts/imx6qdl.dtsi \
  /home/mirco/Scrivania/UDOO-Neo/Ubuntu18-04/udoo-dev/linux_kernel/arch/arm/boot/dts/include/dt-bindings/clock/imx6qdl-clock.h \
  /home/mirco/Scrivania/UDOO-Neo/Ubuntu18-04/udoo-dev/linux_kernel/arch/arm/boot/dts/include/dt-bindings/gpio/gpio.h \
  arch/arm/boot/dts/skeleton.dtsi \

arch/arm/boot/dts/imx6q-phytec-pbab01.dtb: $(deps_arch/arm/boot/dts/imx6q-phytec-pbab01.dtb)

$(deps_arch/arm/boot/dts/imx6q-phytec-pbab01.dtb):
