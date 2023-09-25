#!/usr/bin/env perl
use v5.36;

my @ints = (1, 0, 2, 3, 0, 4, 5, 0);
for(my $i = 0; $i <= $#ints; $i++) {
    if($ints[$i] == 0) {
        splice(@ints, $i, 0, 0);
        pop(@ints);
        $i++;
    }
}

say('(', join(', ', @ints), ')');
