#!/usr/bin/env perl
use v5.36;

use List::Util qw/min/;
use Data::Dumper;

sub get_n_ugly {
    my $what = shift;

    my @ugly_cache = [1];

    my $ugly_2 = 2;
    my $index_2 = 0;
    my $ugly_3 = 3;
    my $index_3 = 0;
    my $ugly_5 = 5;
    my $index_5 = 0;

    for my $pos (1..$what-1) {
        my $next_ugly = min($ugly_2, $ugly_3, $ugly_5);
        $ugly_cache[$pos] = $next_ugly;

        if ($next_ugly == $ugly_2) {
            $index_2++;
            $ugly_2 = $ugly_cache[$index_2] * 2;
        }

        if ($next_ugly == $ugly_3) {
            $index_3++;
            $ugly_3 = $ugly_cache[$index_3] * 3;
        }

        if ($next_ugly == $ugly_5) {
            $index_5++;
            $ugly_5 = $ugly_cache[$index_5] * 5;
        }

    }

    return $ugly_cache[-1];
}


use Test::More;

is(get_n_ugly(7), 8);
is(get_n_ugly(10), 12);
is(get_n_ugly(150), 5832);
done_testing;

