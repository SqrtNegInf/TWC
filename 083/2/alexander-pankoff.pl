#!/usr/bin/env perl
use v5.20;
use utf8;
use strict;
use warnings;
use autodie;
use feature qw(say signatures);
no warnings 'experimental::signatures';

use List::Util qw(any first sum0);
use Scalar::Util qw(looks_like_number);

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

say flip_array((2,13,10,8));

sub flip_array(@numbers) {
    my $sum     = sum0(@numbers);
    my $ceiling = int( $sum / 2 );

    for my $target ( reverse( 0 .. $ceiling ) ) {
        my $count = first(
            sub {
                any { sum0(@$_) eq $target } combinations( $_, @numbers );
            },
            1 .. @numbers
        );

        return $count if $count;
    }

    return 0;
}
