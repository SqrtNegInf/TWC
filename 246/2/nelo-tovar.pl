#!/usr/bin/env perl

use v5.28;
use strict;
use warnings;

use List::Util qw (min max);
use Data::Dump qw(dump);

my @examples = (
    [ 1, 1, 2, 3, 5 ],
    [ 4, 2, 4, 5, 7 ],
    [ 4, 1, 2, -3, 8 ],
);

sub is_lrso {
    my $a = shift;
    my $length = scalar @$a;
    my $min = min(@$a);
    my $max = max(@$a);

    for (my $p = $min; $p < $max; $p++) {
        for (my $q = $min; $q < $max; $q++) {
            my $count = 0;

            for (my $n = 2; $n < $length; $n++) {
                $count++ if ( $a->[$n] eq ($p * $a->[$n-2] + $q * $a->[$n-1]))
            }

            return 1 if ($count == ($length -2))
        }
    }
     
    return 0;
}

for my $elements (@examples) {
    my $lrso = is_lrso $elements;

    say 'Input : @a = ', dump(@$elements);
    say 'Output : ', $lrso ? 'True' : 'False';
    say ' ';
}
