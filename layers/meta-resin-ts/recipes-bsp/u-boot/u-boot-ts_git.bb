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

SRCBRANCH = "v2014.10"
SRCREV = "3ed0b758529a82c04c33f730e0051d153439195e"
SRC_URI = " \
    git://github.com/embeddedarm/u-boot.git;branch=${SRCBRANCH} \
    file://0001-Enable-the-1-I2C-bus-Add-LCD-commands.patch \
    file://0001-We-do-not-want-flash-env.-We-only-want-internal-env.patch \
    file://0002-Replace-default-emmc-bootargs.patch \
    file://0004-Replace-default-sd-bootargs.patch \
    file://ts4900-integrate-with-resin-configuration.patch \
    "

S = "${WORKDIR}/git"

UBOOT_MAKE_TARGET = "u-boot.imx"
UBOOT_SUFFIX = "imx"

COMPATIBLE_MACHINE = "ts4900"
