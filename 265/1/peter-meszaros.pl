#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -srand => 1;
use Data::Dumper;

my $cases = [
    [[1, 2, 3, 3, 3, 3, 4, 2], 3, 'Example 1'],
    [[1, 1],                   1, 'Example 2'],
    [[1, 2, 3],                1, 'Example 3'],
    [[],                   undef, 'Example 4'],
];

sub thirtythree_appearance
{
    my $l = shift;
    my $n = shift;

    my %h;
    $h{$_}++ for @$l;
    $h{$_} /= (@$l / 100) for keys %h;
    my @a = sort { $h{$a} == $h{$b} ?  $a <=> $b : $h{$a} <=> $h{$b} }
        grep { $h{$_} > 33 } (keys %h);
    return $a[0];
}

for (@$cases) {
    is(thirtythree_appearance($_->[0]), $_->[1], $_->[2]);
}
done_testing();

exit 0;
