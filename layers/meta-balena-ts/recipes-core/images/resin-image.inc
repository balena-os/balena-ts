#
# ts4900
#

IMAGE_FSTYPES_append_ts4900 = " resinos-img"

# We burn the FPGA bitstream in uboot so we need it in boot partition
RDEPENDS_${PN}_append_ts4900 = " ts4900-fpga"

RESIN_IMAGE_BOOTLOADER_ts4900 = "u-boot-ts"

# Customize resinos-img
RESIN_BOOT_PARTITION_FILES_ts4900 = " \
    ${KERNEL_IMAGETYPE}${KERNEL_INITRAMFS}-${MACHINE}.bin:/boot/${KERNEL_IMAGETYPE} \
    u-boot-ts4900.imx-single: \
    u-boot-ts4900.imx-quad: \
    uImage-imx6dl-ts4900.dtb:/boot/imx6dl-ts4900.dtb \
    uImage-imx6q-ts4900.dtb:/boot/imx6q-ts4900.dtb \
    uImage-imx6q-ts4900-2.dtb:/boot/imx6q-ts4900-2.dtb \
    uImage-imx6dl-ts4900-2.dtb:/boot/imx6dl-ts4900-2.dtb \
    uImage-imx6q-ts4900-14.dtb:/boot/imx6q-ts4900-14.dtb \
    uImage-imx6dl-ts4900-14.dtb:/boot/imx6dl-ts4900-14.dtb \
    ts4900-fpga.bin:/boot/ts4900-fpga.bin \
    "
