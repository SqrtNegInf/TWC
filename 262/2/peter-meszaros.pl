#!/usr/bin/env perl

use strict;
use warnings;

srand 1;

use Test2::V0 -srand => 1;
use Data::Dumper;

my $cases = [
    [[[3, 1, 2, 2, 2, 1, 3], 2], 4, 'Example 1'],
    [[[1, 2, 3], 1],             0, 'Example 2'],
];

sub count_equal_divisable
{
    my $l = $_[0]->[0];
    my $k = $_[0]->[1];

    my $r = 0;
    my $c = 0;
    while (my $i = shift @$l) {
        for my $n (0..$#$l) {
            if ($i == $l->[$n]) {
                my $v = $c * $n / $k;
                ++$r if $v == int($v);
            }
        }
        ++$c;
    }

    return $r;
}

for (@$cases) {
    is(count_equal_divisable($_->[0]), $_->[1], $_->[2]);
}
done_testing();

exit 0;

