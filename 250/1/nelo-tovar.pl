#!/usr/bin/env perl
use v5.36;

use Data::Dump qw(dump);

my @examples = (
    [ 0, 1, 2 ],
    [ 4, 3, 2, 1 ],
    [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 ],
);

sub smallest_index {
    my $ints = shift;
    my $length = scalar @$ints;

    for (my $i = 0; $i < $length; $i++) {
         return $i if (($i % 10) == $ints->[$i] );
    }
    
    return -1;
}

for my $elements (@examples) {
    my $si = smallest_index $elements;

    say 'Input : @ints = ', dump(@$elements);
    say 'Output : ', $si;
    say ' ';
}
