#!/usr/bin/env perl
use v5.28;
use strict;
use warnings;

use Data::Dump qw(dump);

my @examples = (
    {start => 3, ints => [5, 3, 6, 1, 12]},
    {start => 1, ints => [1, 2, 4, 3]},
    {start => 2, ints => [5, 6, 7]},
);

sub multiply_by_two {
    my $nums = shift;
    my $start = shift;

    $start *= 2 while (grep {$_ eq $start} @$nums);
     
    return $start;
}

for my $elements (@examples) {
    my $mbt = multiply_by_two($elements->{ints}, $elements->{start});

    say 'Input : @ints = ', dump($elements->{ints}), ' and $start = ', $elements->{start};
    say 'Output : ', $mbt;
    say ' ';
}
