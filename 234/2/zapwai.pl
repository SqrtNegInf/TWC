#!/usr/bin/env perl
use v5.30;

my @ints = (4, 4, 2, 4, 3);

my $c = 0;
for my $i (0 .. $#ints - 2) {
    for my $j ($i .. $#ints - 1) {
	for my $k ($j .. $#ints) {
	    $c++ if ( ($ints[$i] != $ints[$j]) && ($ints[$i] != $ints[$k]) && ($ints[$k] != $ints[$j]) );
	}
    }
}
say "Input: \@ints = @ints";
say "Output: $c";
