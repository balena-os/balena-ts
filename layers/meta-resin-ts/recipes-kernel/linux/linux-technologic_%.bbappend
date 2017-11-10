inherit kernel-resin

COMPATIBLE_MACHINE = "ts4900"

FILESEXTRAPATHS_prepend_ts4900 := "${THISDIR}/${PN}:"

SRC_URI_append_ts4900 = " \
    file://ts4900_dts_change.patch \
    file://0001-ovl-allow-zero-size-xattr.patch \
    file://0002-ovl-use-a-minimal-buffer-in-ovl_copy_xattr.patch \
    file://0003-ovl-don-t-copy-up-opaqueness.patch \
    "
