#!/usr/bin/env perl
use v5.36;

sub fusc($n) {
    my @a=(0,1);
    for (2..$n-1) {
	my $new = ($_ % 2 == 0) ? ($a[$_/2]) : ($a[($_-1)/2] + $a[($_+1)/2]);
	push @a, ($new,);
    }
    return \@a;
}

my $nr = (scalar @ARGV) ? ($ARGV[0]) : (50);
for (@{fusc($nr)}) {say};
