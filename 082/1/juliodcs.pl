#!/usr/bin/env perl
use v5.36;

sub factors_to_hash($num) {
    map { $_ => undef } (grep { $num % $_ == 0 } (1 .. $num/2), $num)
}

my %a = factors_to_hash 100;
my %b = factors_to_hash 500;

say join q(, ), grep { exists $a{$_} } sort keys %b;
