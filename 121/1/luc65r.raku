#!/usr/bin/env raku

#unit sub MAIN(UInt $m, UInt $n is copy where * > 0);
my ($m, $n)  =  12, 3;
say $m +^ 1 +< ($n - 1);
