#!/usr/bin/env raku

my Str $str = 'Perl Weekly Challenge';
my $distance = $str ~~ tr/e/E/;
say "$str -> e x " ~ $distance.Int;
