#!/usr/bin/env perl
use v5.36;

sub get_arrays {
    my @what = @_;

    my @output;
    my @cur_arr;
    my $last_item = $what[0] -1;

    for my $item (@what) {

        if ($item == $last_item + 1) {
            push @cur_arr, $item;
        } else {
            push @output, [@cur_arr];
            @cur_arr = ($item);
        }

        $last_item = $item;
    }

    push @output, [@cur_arr] if @cur_arr;
    return \@output;
}

use Test::More;

is_deeply(get_arrays((1, 2, 3, 6, 7, 8, 9)), [[1, 2, 3], [6, 7, 8, 9]]);
is_deeply(get_arrays((11, 12, 14, 17, 18, 19)), [[11, 12], [14], [17, 18, 19]]);
is_deeply(get_arrays((2, 4, 6, 8)), [[2], [4], [6], [8]]);
is_deeply(get_arrays((1, 2, 3, 4, 5)), [[1, 2, 3, 4, 5]]);

done_testing;
