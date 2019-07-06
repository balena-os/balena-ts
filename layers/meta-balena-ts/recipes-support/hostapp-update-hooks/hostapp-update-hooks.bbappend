FILESEXTRAPATHS_append := ":${THISDIR}/files"

# the 99-flash-bootloader hook uses nproc from the coreutils package to get the number of cpus
RDEPENDS_${PN}_append_ts4900 = " coreutils"

HOSTAPP_HOOKS += " \
    99-resin-uboot \
    99-flash-bootloader \
"
