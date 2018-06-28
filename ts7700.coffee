deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'ts7700'
	aliases: [ 'ts7700' ]
	name: 'Technologic TS-7700'
	arch: 'armv5e'
	state: 'discontinued'

	instructions: commonImg.instructions

	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted-TS-7700.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted-TS-7700.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted-TS-7700.md#on-mac-and-linux'

	supportsBlink: false

	yocto:
		machine: 'ts7700'
		image: 'resin-image'
		fstype: 'resinos-img'
		version: 'yocto-krogoth'
		deployArtifact: 'resin-image-ts7700.resinos-img'
		compressed: true

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
