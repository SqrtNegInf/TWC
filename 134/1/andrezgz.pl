#!/usr/bin/env perl
use v5.36;

# start from the first obvious pandigital number in base 10
my $n = 1023456789;

my @pandigitals;
while (@pandigitals < 5) {
    my %unique;
    $unique{$_}++ for split //, $n;
    push @pandigitals, $n if '1' x 10 eq join '', values %unique;
    $n++;
}

say join "\n", @pandigitals;
