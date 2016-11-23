inherit kernel-resin

COMPATIBLE_MACHINE = "ts4900"

FILESEXTRAPATHS_prepend_ts4900 := "${THISDIR}/${PN}:"

SRC_URI_append_ts4900 = " file://ts4900_dts_change.patch"
