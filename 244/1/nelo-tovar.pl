#!/usr/bin/env perl

use v5.28;
use strict;
use warnings;

use Data::Dump qw(dump);

my @examples = (
    [ 8, 1, 2, 2, 3 ],
    [ 6, 5, 4, 8 ],
    [ 2, 2, 2 ],
);

sub count_smaller {
    my $nums = shift;
    my @smallers;

    foreach my $x (@$nums) {
        my $count = 0;
        foreach my $y (@$nums){
            $count++ if ($y < $x);
        }
        push(@smallers, $count)
    }
    
    return \@smallers;
}

for my $elements (@examples) {
    my $cs = count_smaller $elements;

    say 'Input : @nums = ', dump(@$elements);
    say 'Output : ', dump(@$cs);
    say ' ';
}
