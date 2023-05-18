#!/usr/bin/env perl
use v5.36;

use Math::Factor::XS qw/factors/;

my @nums;

my $pos = 1;

while ( scalar @nums < 10 ) {

    my @factors = factors($pos);

    # 1 and the number are always divisors
    push @nums, $pos if scalar @factors == 6;

    $pos++;
}

print "@nums\n";
