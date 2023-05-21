#!/usr/bin/env perl
use v5.36;

my $m = shift // 5;
my $n = shift // 5;

say sprintf ' x |' . '%3d' x $n, 1..$n;
say         '---|' . '---' x $n;
my %unique;
for my $row (1..$m) {
    my @mult = map { $row * $_ } 1..$n;
    @unique{@mult} = (undef) x @mult;
    say sprintf '%2d |' . '%3d' x @mult, $row, @mult;
}

say 'Distinct Terms: ' . join ',', sort {$a <=> $b} keys %unique;
say 'Count: ' . scalar keys %unique;
