#!/usr/bin/env raku

multi MAIN(Str:D $S = 'The Weekly Challenge-97') { put $S.words.reverse.join(' ') }
#multi MAIN(*@S)      { MAIN(@S.join(' ')) }
