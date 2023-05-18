#!/usr/bin/env perl
use v5.36;

my ($i, $j, $k) = <2 3 4>; #@ARGV;
die "$k is greater than $i * $j\n" if $k > $i * $j;

my @prods;
for my $x (1 .. $i) {
	for my $y (1 .. $j) {
		push @prods, $x * $y;
	}
}

@prods = sort { $a <=> $b } @prods;
print $prods[$k - 1] . "\n";
