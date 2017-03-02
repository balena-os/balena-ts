do_install_append_ts4900() {
    rm ${D}/${sysconfdir}/systemd/system.conf.d/watchdog.conf
}
