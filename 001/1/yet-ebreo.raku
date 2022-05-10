#!/usr/bin/env raku

my $string = "Perl Weekly Challenge";
my @count  = $string~~m:g/e/ ;
$string~~tr/e/E/;

say "Resulting string: $string";
say "Replaced e: "~0+@count~" times";
