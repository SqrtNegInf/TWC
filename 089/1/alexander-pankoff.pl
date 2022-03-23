#!/usr/bin/env perl
use v5.20;
use utf8;
use strict;
use warnings;
use feature qw(say signatures);
no warnings 'experimental::signatures';

use List::Util qw(sum0);

#use FindBin;
#use lib File::Spec->join( $FindBin::RealBin, '..', '..', '..', 'challenge-083', 'alexander-pankoff', 'perl', 'lib' );

#use Combinations qw(combinations);

# returns possible combinations of $length elements from @pool.
sub combinations ( $count, @pool ) {
    return () if $count == 0 || $count > @pool;
    return map { [$_] } @pool if $count == 1;

    my @combinations;
    while ( @pool && $count <= @pool ) {
        my $elem = shift @pool;
        my @sub_combinations = combinations( $count - 1, @pool );
        push @combinations, map { [ $elem, @$_, ] } @sub_combinations;
    }

    return @combinations;
}


sub gcd_sum($up_to) {
    return sum0( map { gcd( $_->[0], $_->[1] ) } unique_pairs( 1 ... $up_to ) );
}

sub unique_pairs(@xs) {
    combinations( 2, @xs );
}

# euclids algorithm
sub gcd ( $x, $y ) {
    return $x if $y == 0;
    return gcd( $y, $x % $y );
}

say gcd_sum( 100 );
