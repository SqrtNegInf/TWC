#!/usr/bin/env perl
use v5.36;

my $max = 9;
my @t = ([1]);
for my $x (1 .. $max) {
	my @row = ($t[$x-1]->[-1]);
	for my $i (1 .. $x) {
		push @row, $row[-1] + $t[$x-1]->[$i-1];
	}
	push @t, [@row];
}

print "B_$_ = $t[$_]->[-1]\n" for 0 .. $max;
