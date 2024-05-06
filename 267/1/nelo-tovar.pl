#!/usr/bin/env perl
use v5.28;

use strict;
use warnings;

use Data::Dump qw(dump);

my @examples = (
    [ -1, -2, -3, -4, 3, 2, 1 ],
    [  1, 2, 0, -2, -1 ],
    [ -1, -1, 1, -1, 2 ],
);

sub product_sign {
    my $nums = shift;
    my $product = 1;

    $product *= $_ foreach (@$nums);

    return $product <=> 0;
}

for my $elements (@examples) {
    my $ps = product_sign $elements;

    say 'Input : @inst = ', dump(@$elements);
    say 'Output : ', $ps;
    say ' ';
}
