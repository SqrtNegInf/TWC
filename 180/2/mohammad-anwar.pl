#!/usr/bin/env perl
use v5.36;
use Test2::V0 -srand => 1;

is trim_list(3, [1, 4, 2, 3, 5]),       [4, 5],       'Example 1';
is trim_list(4, [9, 0, 6, 2, 3, 8, 5]), [9, 6, 8, 5], 'Example 2';

done_testing;

#
#
# METHOD

sub trim_list($i, $n) {
    my @l = ();
    foreach (@$n) {
        push @l, $_ if $_ > $i;
    }

    return \@l;
}
