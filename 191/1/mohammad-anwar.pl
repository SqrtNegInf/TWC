#!/usr/bin/env perl

use v5.36;
use Test2::V0 -srand => 1;

is twice_largest(1, 2, 3, 4), -1, 'Example 1';
is twice_largest(1, 2, 0, 5),  1, 'Example 2';
is twice_largest(2, 6, 3, 1),  1, 'Example 3';
is twice_largest(4, 5, 2, 3), -1, 'Example 4';

done_testing;

#
#
# METHOD

sub twice_largest(@list) {
    @list   = sort { $a <=> $b } @list;
    my $max = pop @list;
    foreach (@list) {
        ($_ * 2 > $max) and return -1;
    }

    return 1;
}
