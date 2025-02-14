*zinc-character-encoding-gs3-tests
testUTF8Overlong
  "Overlong encoding, aka Non shortest form characters should be rejected.
	See http://en.wikipedia.org/wiki/UTF-8#Overlong_encodings"

  self
    should: [ ZnUTF8Encoder new decodeBytes: #(16rF0 16r82 16r82 16rAC) asByteArray ]
    raise: ZnInvalidUTF8 , ArgumentError.
  self
    should: [ ZnUTF8Encoder new decodeBytes: #(193 129 193 130 193 131) asByteArray ]
    raise: ZnInvalidUTF8 , ArgumentError