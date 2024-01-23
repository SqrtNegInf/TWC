#!/usr/bin/env perl
use v5.36;

sub unique_sum_zero ($n) {
    my @ints;
    map( { push( @ints, $_, 0 - $_ ) } 1 .. int( $n / 2 ) );
    push( @ints, 0 ) if $n % 2 == 1;
    @ints = sort( { $a <=> $b } @ints );
    return \@ints;
}

sub MAIN() {
    if (@ARGV) {

        #| Run on command line argument
        say @{ unique_sum_zero( $ARGV[0] ) };
    }
    else {
        #| Run test cases
        use Test::More;

        is_deeply unique_sum_zero(5), [ -2, -1, 0, 1, 2 ], 'works for 5';
        is_deeply unique_sum_zero(3), [ -1, 0, 1 ],        'works for 3';
        is_deeply unique_sum_zero(1), [0],                 'works for 1';
        is_deeply unique_sum_zero(0), [],                  'works for 0';
        done_testing
    }
}

MAIN();
