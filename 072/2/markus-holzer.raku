#!/usr/bin/env raku
sub MAIN( Str $file where *.IO.r = 'input.txt', UInt $from where * > 1 = 3, $to where * > 1 = 6) {
	.say for $file.IO.lines[ $from-1 .. $to-1 ] }
