#!/usr/bin/env perl
use v5.36;

use Math::Utils qw/gcd/;
use Math::Combinatorics;

sub get_gcd_sum {
    my $n = shift;

    my $gcd_sum = 0;

    my $combinat = Math::Combinatorics->new(
        count => 2,
        data  => [ 1 .. $n ],
    );
    while ( my @combo = $combinat->next_combination ) {
        $gcd_sum += gcd(@combo);
    }

    return $gcd_sum;
}

use Test::More;

is( get_gcd_sum(3), 3 );
is( get_gcd_sum(4), 7 );
is( get_gcd_sum(100), 13015 );

done_testing;
