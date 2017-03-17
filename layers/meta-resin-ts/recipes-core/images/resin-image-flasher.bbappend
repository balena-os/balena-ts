include resin-image.inc

#
# ts4900
#

RDEPENDS_${PN}_append_ts4900 = " u-boot-script-ts"

# we copy bootlooader binaries for both supported SoC variants (single and quad core) and
# final decision on which to use shall be made later (from within the image maker in our case)
RESIN_BOOT_PARTITION_FILES_append_ts4900 = " \
    u-boot-ts4900.imx-single: \
    u-boot-ts4900.imx-quad: \
    boot.ub:/boot/boot.ub \
    "
