#!/usr/bin/env raku
sub MAIN(UInt $N where * > 0 = 12) {
	.chars.say with ( [*] 1..$N ) ~~ / 0+ $/ or '' }
