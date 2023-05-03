#!/usr/bin/env perl
use v5.36;
use Test::More;

is count_divisibles([4, 5, 1, 6], 2), 2, 'Example 1';
is count_divisibles([1, 2, 3, 4], 2), 2, 'Example 2';
is count_divisibles([1, 3, 4, 5], 3), 2, 'Example 3';
is count_divisibles([5, 1, 2, 3], 4), 2, 'Example 4';
is count_divisibles([7, 2, 4, 5], 4), 1, 'Example 5';

done_testing;

#
#
# METHOD

sub count_divisibles($list, $k) {
    my $count = 0;
    my $size  = scalar @$list;
    for (my $i = 0; $i < $size; $i++) {
        for (my $j = $i + 1; $j < $size; $j++) {
            if (($list->[$i] + $list->[$j]) % $k == 0) {
                $count++;
            }
        }
     }

    return $count;
}
