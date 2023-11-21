#!/usr/bin/env perl

use v5.28;
use strict;
use warnings;

use Data::Dump qw(dump);

my @examples = (
    [ 2, 5, 9 ],
    [ 7, 7, 7, 7, 7, 7, 7 ],
);

sub sum_of_floor {
    my $nums = shift;
    my $sum = 0;

    foreach my $i (@$nums) {
        $sum += int($i / $_) foreach (@$nums)
    }

    return $sum
}

for my $elements (@examples) {
    my $sof = sum_of_floor($elements);

    say 'Input : @nums = ', dump(@$elements);
    say 'Output : ', $sof;
}
