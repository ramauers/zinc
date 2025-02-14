baseline
baseline: spec
	<baseline>
	spec
		for: #'common'
		do: [ 
			spec
				configuration: 'XMLSupport'
					with: [ 
							spec
								versionString: #'stable';
								repository: 'http://www.squeaksource.com/MetacelloRepository' ];
				yourself.
			spec
				package: 'Zinc-Character-Encoding-Core';
				package: 'Zinc-Character-Encoding-Tests'
					with: [ spec requires: 'Zinc-Character-Encoding-Core' ];
				package: 'Zinc-Resource-Meta-Core'
					with: [ spec requires: 'Zinc-Character-Encoding-Core' ];
				package: 'Zinc-Resource-Meta-Tests'
					with: [ spec requires: 'Zinc-Resource-Meta-Core' ];
				package: 'Zinc-HTTP'
					with: [ spec requires: #('Zinc-Character-Encoding-Core' 'Zinc-Resource-Meta-Core') ];
				package: 'Zinc-Patch-HTTPSocket' with: [ spec requires: 'Zinc-HTTP' ];
				package: 'Zinc-AWS' with: [ spec requires: #('Zinc-HTTP' 'XMLSupport') ];
				package: 'Zinc-REST' with: [ spec requires: #('Zinc-HTTP' 'NeoJSON') ];
				package: 'Zinc-WebSocket-Core' with: [ spec requires: 'Zinc-HTTP' ];
				package: 'Zinc-WebSocket-Tests'
					with: [ spec requires: 'Zinc-WebSocket-Core' ];
				package: 'Zinc-SSO-OAuth1-Core'
					with: [ spec requires: #('Zinc-HTTP' 'NeoJSON') ];
				package: 'Zinc-SSO-OAuth2-Core'
					with: [ spec requires: #('Zinc-HTTP' 'NeoJSON') ];
				package: 'Zinc-SSO-OpenID-Core'
					with: [ spec requires: #('Zinc-HTTP' 'XMLSupport') ];
				package: 'Zinc-SSO-Demo'
					with: [ 
							spec
								requires:
									#('Zinc-SSO-OAuth1-Core' 'Zinc-SSO-OAuth2-Core' 'Zinc-SSO-OpenID-Core') ];
				package: 'Zinc-SSO-OAuth1-Tests'
					with: [ spec requires: #('Zinc-SSO-OAuth1-Core') ];
				package: 'Zinc-SSO-OpenID-Tests'
					with: [ spec requires: #('Zinc-SSO-OpenID-Core') ];
				package: 'Zinc-WebDAV' with: [ spec requires: 'Zinc-HTTP' ];
				package: 'Zinc-WWS-Server' with: [ spec requires: 'Zinc-HTTP' ];
				package: 'Zinc-WWS-Client' with: [ spec requires: 'Zinc-HTTP' ];
				package: 'Zinc-Tests' with: [ spec requires: 'Zinc-HTTP' ].
			spec
				group: 'default' with: #('Core');
				group: 'Core' with: #('Zinc-HTTP');
				group: 'CI' with: #('default' 'Tests');
				group: 'Tests'
					with:
						#('Zinc-Tests' 'Zinc-Character-Encoding-Tests' 'Zinc-Resource-Meta-Tests');
				group: 'Character-Encoding'
					with: #('Zinc-Character-Encoding-Core' 'Zinc-Character-Encoding-Tests');
				group: 'Resource-Meta'
					with: #('Zinc-Resource-Meta-Core' 'Zinc-Resource-Meta-Tests');
				group: 'Tests' with: #('Zinc-Tests');
				group: 'AWS' with: #('Zinc-AWS');
				group: 'WebDAV' with: #('Zinc-WebDAV');
				group: 'WebSocket' with: #('Zinc-WebSocket-Core' 'Zinc-WebSocket-Tests');
				group: 'SSO-OAuth1' with: #('Zinc-SSO-OAuth1-Core' 'Zinc-SSO-OAuth1-Tests');
				group: 'SSO-OAuth2' with: #('Zinc-SSO-OAuth2-Core');
				group: 'SSO-OpenID' with: #('Zinc-SSO-OpenID-Core' 'Zinc-SSO-OpenID-Tests');
				group: 'SSO-Demo'
					with:
						#('Zinc-SSO-OAuth1-Core' 'Zinc-SSO-OAuth2-Core' 'Zinc-SSO-OpenID-Core');
				group: 'SSO'
					with: #('SSO-OAuth1' 'SSO-OAuth2' 'SSO-OpenID' 'SSO-Demo' 'Zinc-SSO-Demo');
				group: 'WWS' with: #('Zinc-WWS-Server' 'Zinc-WWS-Client');
				group: 'REST' with: #('Zinc-REST');
				yourself ].
	spec
		for: #'squeakCommon'
		do: [ 
			spec
				configuration: 'NeoJSON'
					with: [ 
							spec
								versionString: #'stable';
								repository: 'http://mc.stfx.eu/Neo' ];
				yourself.
			spec
				package: 'Zinc-Patch-HTTPSocket' with: [ spec requires: 'Zinc-HTTP' ];
				package: 'Zinc-Zodiac'
					with: [ spec requires: #('Zinc-HTTP' 'Zodiac-Core' 'Zodiac-Tests') ];
				package: 'Zodiac-Core';
				package: 'Zodiac-Tests'
					with: [ 
							spec
								requires: 'Zodiac-Core';
								yourself ].
			spec
				group: 'Patch-HTTPSocket' with: #('Zinc-Patch-HTTPSocket');
				group: 'Zodiac' with: #('Zinc-Zodiac');
				group: 'SSL' with: #('Zodiac');
				yourself ].
	spec
		for: #'pharo1.x'
		do: [ 
			spec
				package: 'Zinc-FileSystem-Legacy';
				package: 'Zinc-Pharo-Forward-Compatibility';
				package: 'Zinc-HTTP'
					with: [ spec requires: #('Zinc-FileSystem-Legacy' 'Zinc-Pharo-Forward-Compatibility') ] ].
	spec
		for: #'pharo2.x'
		do: [ 
			spec
				package: 'Zinc-FileSystem';
				package: 'Zinc-HTTP' with: [ spec requires: 'Zinc-FileSystem' ] ].
	spec
		for: #'gemstone'
		do: [ 
			spec repository: 'github://GsDevKit/zinc:gs_master/repository'.
			spec
				baseline: 'GLASS1'
					with: [ 
							spec
								loads: #('Base' 'Announcements');
								repository: 'github://glassdb/glass:master/repository' ];
				configuration: 'GsPharo'
					with: [ 
							spec
								version: '0.9.3';
								repository: 'http://seaside.gemtalksystems.com/ss/PharoCompat' ];
				baseline: 'Cryptography'
					with: [ 
							spec
								loads: #('Cryptography');
								repository: 'github://GsDevKit/Cryptography:master/repository' ];
				baseline: 'GsApplicationTools'
					with: [ 
							spec
								loads: #('Core');
								repository: 'github://GsDevKit/gsApplicationTools:master/repository' ];
				baseline: 'NeoJSON'
					with: [ spec repository: 'github://GsDevKit/NeoJSON:gs_master/repository' ];
				yourself.
			spec
				package: 'SocketStream';
				package: 'Zinc-FileSystem-Legacy' with: [ spec requires: #('GLASS1') ];
				package: 'Zinc-GemStone-Server-Tools'
					with: [ spec requires: #('Zinc-HTTP' 'GsApplicationTools') ];
				package: 'Zinc-WebSocket-Core'
					with: [ spec requires: #('Zinc-HTTP' 'Cryptography') ];
				package: 'Zinc-HTTP'
					with: [ 
							spec
								requires: #('GLASS1' 'Zinc-FileSystem-Legacy');
								includes: #('SocketStream') ];
				package: 'Zinc-Tests' with: [ spec requires: #('GsPharo') ].
			spec
				group: 'Core' with: #('Zinc-GemStone-Server-Tools');
				group: 'CI' with: #('REST' 'WebSocket');
				group: 'SSL' with: #();
				yourself ].
	spec
		for: #'gs2.x'
		do: [ 
			spec
				package: 'Zinc-Character-Encoding-Tests'
					with: [ spec includes: 'Zinc-Character-Encoding-GS2-Tests' ];
				package: 'Zinc-Character-Encoding-GS2-Tests'
					with: [ spec requires: 'Zinc-Character-Encoding-Tests' ];
				yourself ].
	spec
		for: #'gs3.x'
		do: [ 
			spec
				package: 'Zinc-Character-Encoding-Tests'
					with: [ spec includes: 'Zinc-Character-Encoding-GS3-Tests' ];
				package: 'Zinc-Character-Encoding-GS3-Tests'
					with: [ spec requires: 'Zinc-Character-Encoding-Tests' ];
				package: 'Zinc-WebSocket-Core'
					with: [ spec requires: #('Zinc-HTTP' 'Cryptography') ];
				yourself ].
	spec
		for: #(#'gs2.x' #'gs3.0.x')
		do: [ 
			spec
				package: 'Zinc-Character-Encoding-Core'
					with: [ spec includes: 'Zinc-Character-Encoding-GS24-Core' ];
				package: 'Zinc-Character-Encoding-GS24-Core'
					with: [ spec requires: 'Zinc-Character-Encoding-Core' ];
				yourself ].
	spec
		for: #(#'gs2.x' #'gs3.0.x' #'gs3.1.x')
		do: [ 
			spec
				package: 'Zinc-Character-Encoding-Tests'
					with: [ spec includes: 'Zinc-Character-Encoding-GS-Tests' ];
				package: 'Zinc-Character-Encoding-GS-Tests'
					with: [ spec requires: 'Zinc-Character-Encoding-Tests' ];
				yourself ].
	spec
		for:
			#(#'gs3.2.x' #'gs3.3.x' #'gs3.4.x' #'gs3.5.x' #'gs3.6.x')
		do: [ 
			spec
				package: 'Zinc-Character-Encoding-Core'
					with: [ spec includes: 'Zinc-Character-Encoding-GS32-Core' ];
				package: 'Zinc-Character-Encoding-GS32-Core'
					with: [ spec requires: 'Zinc-Character-Encoding-Core' ];
				yourself ].
	spec
		for:
			#(#'gs3.7.x' #'gs3.8.x' #'gs3.9.x')
		do: [ 
			spec
				package: 'Zinc-Character-Encoding-Core'
					with: [ 
						spec 
							file: 'Zinc-Character-Encoding-Core.v37';
							includes: 'Zinc-Character-Encoding-GS32-Core' ];
				package: 'Zinc-Character-Encoding-GS32-Core'
					with: [ 
						spec 
							file: 'Zinc-Character-Encoding-GS32-Core.v37';
							requires: 'Zinc-Character-Encoding-Core' ];
				yourself ].
	spec
		for:
			#(#'gs3.3.x' #'gs3.4.x' #'gs3.5.x' #'gs3.6.x' #'gs3.7.x' #'gs3.8.x' #'gs3.9.x')
		do: [ 
			spec
				baseline: 'Zodiac'
					with: [ 
							spec
								loads: #('Core');
								repository: 'github://GsDevKit/zodiac:gs_master/repository' ];
				yourself.
			spec
				package: 'Zinc-Zodiac' with: [ spec requires: #('Zinc-HTTP' 'Zodiac') ];
				yourself.
			spec
				group: 'SSL' with: #('Zinc-Zodiac');
				yourself ]