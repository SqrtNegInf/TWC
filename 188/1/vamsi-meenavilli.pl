#!/usr/bin/env perl

use Test::More;

is count_divisibles([4, 5, 1, 6], 2), 2, 'Example 1';
is count_divisibles([1, 2, 3, 4], 2), 2, 'Example 2';
is count_divisibles([1, 3, 4, 5], 3), 2, 'Example 3';
is count_divisibles([5, 1, 2, 3], 4), 2, 'Example 4';
is count_divisibles([7, 2, 4, 5], 4), 1, 'Example 5';

done_testing();

sub count_divisibles {
    my ($list, $k) = @_;

    my $divisible_pairs_count = 0;
    my $list_size = scalar @$list;

    for (my $i = 0; $i < $list_size; $i++) {
        for (my $j = $i + 1; $j < $list_size; $j++) {
            $divisible_pairs_count++ if (($list->[$i] + $list->[$j]) % $k == 0);
        }
    }

    return $divisible_pairs_count;
}
