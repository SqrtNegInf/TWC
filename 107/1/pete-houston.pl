#!/usr/bin/env perl
use v5.36;

use List::Util 'sum';

my $x = 0;
my @sdn;
my %cinit = map { $_ => 0 } 0 .. 9;

OUTER: while ($#sdn < 2) {
	$x++;
	my @digits = split //, $x;
	next unless @digits == sum (@digits);
	my %count = %cinit;
	$count{$_}++ for @digits;
	for my $i (0 .. $#digits) {
		next OUTER unless $count{$i} == $digits[$i];
	}
	push @sdn, $x;
}

print join (', ', @sdn), "\n";
