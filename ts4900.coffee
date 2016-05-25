deviceTypesCommon = require 'resin-device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

TS_EMMC_BOOT_SELECT = 'Disable the SD boot jumper present on your specifc base board.'

TS_SD_BOOT_SELECT = 'Enable the SD boot jumper present on your specifc base board.'

postProvisioningInstructions = [
	instructions.BOARD_SHUTDOWN
	instructions.REMOVE_INSTALL_MEDIA
	TS_EMMC_BOOT_SELECT
	instructions.BOARD_REPOWER
]

module.exports =
	slug: 'ts4900'
	aliases: [ 'ts4900' ]
	name: 'Technologic TS-4900'
	arch: 'armv7hf'
	state: 'experimental'

	stateInstructions:
		postProvisioning: postProvisioningInstructions

	imageDownloadAlerts: [{
		type: "warning",
		message: "Please make sure to select the correct number of CPU Cores for your device. Failing to do so can brick your device."
	}]

	instructions: [
		instructions.ETCHER_SD
		instructions.EJECT_SD
		instructions.FLASHER_WARNING
		TS_SD_BOOT_SELECT
	].concat(postProvisioningInstructions)

	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted-TS-4900.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted-TS-4900.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted-TS-4900.md#on-mac-and-linux'

	supportsBlink: false

	yocto:
		machine: 'ts4900'
		image: 'resin-image-flasher'
		fstype: 'resin-sdcard'
		version: 'yocto-jethro'
		deployArtifact: 'resin-image-flasher-ts4900.resin-sdcard'
		compressed: true

	options: [
		{
			isGroup: true
			name: 'board'
			message: 'Board Options'
			options: [
				{
					name: 'processorCore'
					message: 'CPU Cores'
					type: 'list'
					choices: [
						'single',
						'quad'
					]
				}
			]
		}
		networkOptions.group
	]

	configuration:
		config:
			partition:
				primary: 4
				logical: 1
			path: '/config.json'

		operations: [
			command: 'copy'
			from:
				partition:
					primary: 1
				path: '/u-boot-ts4900.imx-single'
			to:
				partition:
					primary: 1
				path: '/u-boot.imx'
			when:
				processorCore: 'single'
		,
			command: 'copy'
			from:
				partition:
					primary: 1
				path: '/u-boot-ts4900.imx-quad'
			to:
				partition:
					primary: 1
				path: '/u-boot.imx'
			when:
				processorCore: 'quad'
		]

	initialization: commonImg.initialization
