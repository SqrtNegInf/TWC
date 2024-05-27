#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -no_srand;

use Data::Dumper;
use List::Util qw/sum0/;

my $cases = [
    [[[1, 0, 0],
      [0, 0, 1],
      [1, 0, 0],
     ], 1],
    [[[1, 0, 0],
      [0, 1, 0],
      [0, 0, 1],
     ], 3],
    [[[1, 0, 0, 1],
      [0, 1, 0, 0],
      [0, 0, 1, 0],
     ], 2],
];

sub special_positions
{
    my $m = shift;

    my $cnt = 0;

    for my $i (0 .. $#$m) {
        next if sum0($m->[$i]->@*) != 1;
        for my $j (0 .. $#{$m->[0]}) {
            if ($m->[$i]->[$j]) {
                my $sum = 0;
                for my $c (0 .. $#$m) {
                    $sum += $m->[$c]->[$j];
                    last if $sum > 1;
                }
                ++$cnt if $sum == 1;
                last;
            }
        }
    }

    return $cnt;
}

for (@$cases) {
    is(special_positions($_->[0]), $_->[1], $_->[2]);
}

done_testing();

exit 0;
