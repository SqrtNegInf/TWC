#!/usr/bin/env perl
# Week 82 Task 1 solution by Steven Wilson. 

use strict;
use warnings;
use Test::More;
use Math::Factor::XS qw/ factors /;

my @e1_t = qw/ 1 2 3 6 /;
my @e2_t = qw/ 1 /;
is_deeply( common_factors( 12, 18 ), \@e1_t, 'example 1' );
is_deeply( common_factors( 18, 23 ), \@e2_t, 'example 2' );
done_testing();

sub common_factors {
    my ( $first, $second ) = @_;
    my %first_factors  = map { $_ => 1 } factors($first);
    my @second_factors = factors($second);
    my @intersection   = sort { $a <=> $b }
        grep { exists $first_factors{$_} } @second_factors;
    unshift @intersection, 1;
    return \@intersection;
}
