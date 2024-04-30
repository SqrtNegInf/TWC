#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -srand => 1;
use Data::Dumper;

my $cases = [
    [[[1, 0, 0, 2],
      [0, 3, 4, 0],
      [0, 5, 6, 0],
      [7, 0, 0, 1],
     ], 1, 'Example 1'],
    [[[1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
     ], 0, 'Example 2'],
    [[[1, 0, 2],
      [0, 3, 0],
      [4, 0, 5],
     ], 1, 'Example 3'],
];

sub x_matrix
{
    my $m = shift;
    my $n = $#$m;

    for my $i (0..$n) {
        for my $j (0..$n) {
            if ($i == $j || ($i+$j) == $n) { # diagional or antidiaginal
                return 0 if $m->[$i]->[$j] == 0;
            } else { # any other
                return 0 if $m->[$i]->[$j] != 0;
            }
        }
    }
    return 1;
}

for (@$cases) {
    is(x_matrix($_->[0]), $_->[1], $_->[2]);
}
done_testing();

exit 0;

