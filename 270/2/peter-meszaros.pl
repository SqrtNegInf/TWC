#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -no_srand;
use Data::Dumper;
use List::Util qw/max/;

my $cases = [
    [[[4, 1],          3, 2], 9],
    [[[2, 3, 3, 3, 5], 2, 1], 6],
    [[[3, 3, 4, 4],    1, 1], 1],
    [[[3, 3, 4, 4],    1, 2], 2],
    [[[3, 3, 4, 4],    1, 3], 2],
];

# get max diff
# for pair of maxes   -> decrement 
#                        if level2 cheaper than two level1 --> count level2 step
#                        else                              --> count two level1 step
#                        undef maxes
# if exist single max -> decrement
#                        count level1 step
#                        undef maxes
# repeat until max diff == 0
sub distribute_elements
{
    my $l = $_[0]->[0];
    my $x = $_[0]->[1];
    my $y = $_[0]->[2];

    my $x_cnt = 0;
    my $y_cnt = 0;

    my $max = max @$l;
    my @diff = map { $max - $_ } @$l;

    my @max;
    while (my $max = max @diff) {
        for my $i (0..$#diff) {
            if ($diff[$i] == $max) {
                push @max, $i;
                if (@max == 2) {
                    --$diff[$max[0]];
                    --$diff[$max[1]];
                    if ((2 * $x) < $y) { 
                        $x_cnt += 2;
                    } else {
                        ++$y_cnt;
                    }
                    undef @max;
                }
            }
        }
        if (@max) {
            --$diff[$max[0]];
            ++$x_cnt;
            undef @max;
        }
    }
    
    return $x_cnt * $x + $y_cnt * $y;
}

for (@$cases) {
    is(distribute_elements($_->[0]), $_->[1], $_->[2]);
}
done_testing();

exit 0;

