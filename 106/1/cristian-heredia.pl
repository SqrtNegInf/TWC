#!/usr/bin/env perl


use strict;
use warnings;

#Input
my @N = (2, 9, 3, 5);

my $result = 0;
my $sub = 0;

if (@N != 1) {
    my @sorted = sort { $a <=> $b } @N;
    for (my $i= 0; $i<@N-1; $i++) {
        $sub = $sorted[$i+1] - $sorted[$i];
        if ($sub > $result) {
            $result = $sub;
        }
    }
}
print "$result\n";








