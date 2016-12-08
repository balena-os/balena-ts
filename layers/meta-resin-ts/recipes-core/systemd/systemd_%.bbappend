FILESEXTRAPATHS_prepend_ts7700 := "${THISDIR}/${PN}:"

SRC_URI_append_ts7700 = " file://0001-Do-not-ignore-the-nbd-interface.patch"

do_install_append_ts4900() {
    rm ${D}/${sysconfdir}/systemd/system.conf.d/watchdog.conf
}
