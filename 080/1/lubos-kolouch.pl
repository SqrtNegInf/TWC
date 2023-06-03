#!/usr/bin/env perl
use v5.36;

use List::Util qw/min max/;

sub get_smallest_missing {
    my $arr = shift;

    # Let's see if are lucky and the minimum -1 is >0
    my $arr_min = min( grep { $_ > 0 } @$arr);

    return $arr_min-1 if $arr_min-1 > 0;

    # Not lucky, arr_min is 0, so need to iterate
    # NOTE: the excercise does not say what to do if there is nothing missing
    # so let's just return 0 as per Twitter confirmation 
    
    while ($arr_min < max(@$arr)) {
        $arr_min++;

        return $arr_min unless grep { $_ == $arr_min } @$arr;
    }

    return 0;
}

use Test::More;

is(get_smallest_missing([5, 2, -2, 0]), 1);
is(get_smallest_missing([1, 8, -1]), 2);
is(get_smallest_missing([2, 0, -1]), 1);
is(get_smallest_missing([2, 0, 1]), 0);
is(get_smallest_missing([2, 0, 1, 3, 4, 5]), 0);

done_testing;
