#!/usr/bin/env perl
use v5.28;

use strict;
use warnings;
use Data::Dump qw(dump);

my @examples = (
    { x => [3, 7, 5], y => [9, 5, 7] },
    { x => [1, 2, 1], y => [5, 4, 4] },
    { x => [2], y => [5] },
);

sub magic_number {
    my $x = shift;
    my $y = shift;
    my @xx = sort @$x;
    my @yy = sort @$y;

    return abs($xx[0] - $yy[0])
}

for my $elements (@examples) {
    my $mn = magic_number $elements->{x}, $elements->{y};

    say 'Input : @x = ', dump($elements->{x});
    say '        @y = ', dump($elements->{y});
    say 'Output : ', $mn;
    say ' ';
}
