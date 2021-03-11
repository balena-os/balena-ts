include balena-image.inc

#
# ts4900
#

RDEPENDS_${PN}_append_ts4900 = " u-boot-script-ts"

# the flasher needs to make sure it can be booted by non-balena u-boot installs from the eMMC
BALENA_BOOT_PARTITION_FILES_append_ts4900 = " \
    boot.ub:/boot/boot.ub \
    "
