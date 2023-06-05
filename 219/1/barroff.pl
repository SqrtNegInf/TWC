#!/usr/bin/env perl
use v5.36;

use strict;
use warnings;

sub sorted_power ( $k, @numbers ) {
    my @sn = sort { $a > $b } map( { $_**$k } @numbers );
    return \@sn;
}

sub sorted_squares (@numbers) {
    return sorted_power( 2, @numbers );
}

#| Run test cases
sub MAIN() {
    use Test::More;

    is_deeply sorted_squares( -2, -1, 0, 3, 4 ), [ 0, 1, 4, 9, 16 ],
      "works for (-2, -1, 0, 3, 4)";
    is_deeply sorted_squares( 5, -4, -1, 3, 6 ), [ 1, 9, 16, 25, 36 ],
      "works for (5, -4, -1, 3, 6)";
    done_testing;
}

MAIN();
