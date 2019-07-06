DESCRIPTION = "U-Boot port for ts4900"
SECTION = "Bootloader"

RESIN_EXTERNAL_MMC = "0"
RESIN_INTERNAL_MMC = "1"
UBOOT_KCONFIG_SUPPORT = "1"
inherit resin-u-boot

require recipes-bsp/u-boot/u-boot.inc

PROVIDES_append = " u-boot"

LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://Licenses/gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"

SRCBRANCH = "v2017.09"
SRCREV = "6f43d375a8cef2008fbfe7d110a2fb8e6a693971"
SRC_URI = " \
    git://github.com/embeddedarm/u-boot.git;branch=${SRCBRANCH} \
    file://0001-Enable-the-1-I2C-bus-Add-LCD-commands.patch \
    file://ts4900-integrate-with-resin-configuration.patch \
"

S = "${WORKDIR}/git"

UBOOT_MAKE_TARGET = "u-boot.imx"
UBOOT_SUFFIX = "imx"

COMPATIBLE_MACHINE = "ts4900"
