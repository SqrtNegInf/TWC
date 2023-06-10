#!/usr/bin/env perl
use v5.36;

my @N = (2, 7, 9);
my $k = 2;

my %in_array;
@in_array{ @N } = 0 .. $#N;

for (@N) {
    say join ', ', @in_array{ $k + $_, $_ } if exists $in_array{ $k + $_ };
}
