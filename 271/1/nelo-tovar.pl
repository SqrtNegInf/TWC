#!/usr/bin/env perl
use v5.36;

use List::Util qw(max sum0);
use List::MoreUtils qw(first_index);
use Data::Dump qw(dump);

my @examples = (
    [ [ 0, 1 ], [1, 0] ],
    [ [ 0, 0, 0 ], [ 1, 0, 1 ] ],
    [ [ 0, 0 ], [ 1, 1 ], [ 0, 0 ] ]
);

sub maximum_ones {
    my $nums = shift;
    my @ones = map {sum0 @$_} @$nums;
    my $max = max @ones;

    return (first_index {$_ == $max} @ones) + 1;
}

for my $elements (@examples) {
    my $mo = maximum_ones $elements;

    say 'Input : $matrix = ', dump(@$elements);
    say 'Output : ', $mo;
    say ' ';
}
