#!/usr/bin/env perl
use v5.36;

use List::Util qw/sum/;

sub duplicate_zeros (@ints) {
    my @result;
    map( { $_ == 0 ? push( @result, 0, 0 ) : push( @result, $_ ) } @ints );
    @result = @result[ 0 .. @ints - 1 ];
    return \@result;
}

sub MAIN() {
    if (@ARGV) {

        #| Run command line arguments
        say remove_one(@ARGV);
    }
    else {
        #| Run test cases
        use Test::More;

        is_deeply duplicate_zeros( ( 1, 0, 2, 3, 0, 4, 5, 0 ) ),
          [ 1, 0, 0, 2, 3, 0, 0, 4 ], 'works for (1, 0, 2, 3, 0, 4, 5, 0)';
        is_deeply duplicate_zeros( ( 1, 2, 3 ) ), [ 1, 2, 3 ], 'works for (1, 2, 3)';
        is_deeply duplicate_zeros( ( 0, 3, 0, 4, 5 ) ), [ 0, 0, 3, 0, 0 ],
          'works for (0, 3, 0, 4, 5)';
        done_testing;
    }
}

MAIN();
