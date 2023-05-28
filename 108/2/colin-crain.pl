#!/usr/bin/env perl
use v5.36;

use bigint;

my $triangle;
my $values     = 14;
$triangle->[0] = [1];

for my $row ( 1..$values ) {
    ## the first value
    $triangle->[$row][0] = $triangle->[$row-1][-1];

    ## the rest of the row
    for my $i (1..$row) {
        $triangle->[$row][$i] =
            $triangle->[$row-1][$i-1] + $triangle->[$row][$i-1];
    }
}

for my $n (0..$values) {
    printf "%10s %-s\n", "B($n)", $triangle->[$n][0];
}
