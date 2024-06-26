#!/usr/bin/env perl
use v5.36;

use Data::Dump qw(dump);

my @examples = (
    [ -3, 1, 2, -1, 3, -2, 4 ],
    [ -1, -2, -3, 1 ],
    [ 1, 2 ],
);

sub max_positive_negative {
    my $nums = shift;
    my $positive = scalar grep {$_ >= 0} @$nums;
    my $negative = scalar grep {$_ < 0 } @$nums;

    return $positive > $negative ? $positive : $negative;
}

for my $elements (@examples) {
    my $mpn = max_positive_negative $elements;

    say 'Input : @ints = ', dump(@$elements);
    say 'Output : ', $mpn;
    say ' ';
}
