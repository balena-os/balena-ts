include resin-image.inc

#
# ts4900
#

# The bootloader gets flashed by resin-image-flasher
RESIN_IMAGE_BOOTLOADER_ts4900 = ""

#
# ts7700
#
IMAGE_FSTYPES_append_ts7700 = " resinos-img"

IMAGE_CMD_resinos-img_append_ts7700 () {
    bbnote "TS7700 specific resinos-img configuration"

    # Burn the second stage bootloader
    dd if=${DEPLOY_DIR_IMAGE}/bootstrap-code.img of=${RESIN_RAW_IMG} conv=notrunc ; sync ; sync

    # Prepare raw partition for kernel
    dd if=/dev/zero of=${RESIN_RAW_IMG} seek=1 count=$(expr ${RESIN_BOOT_SIZE_ALIGNED} \/ ${RESIN_IMAGE_ALIGNMENT}) conv=notrunc bs=$(expr ${RESIN_IMAGE_ALIGNMENT} \* 1024) ; sync ; sync

    # Burn kernel
    dd if=${DEPLOY_DIR_IMAGE}/zImage of=${RESIN_RAW_IMG} seek=1 conv=notrunc bs=$(expr ${RESIN_IMAGE_ALIGNMENT} \* 1024) ; sync ; sync

    # Set non-fs part-type for the boot partition (this is required by the bootloader)
    sfdisk -c  ${RESIN_RAW_IMG} 1 da
}
