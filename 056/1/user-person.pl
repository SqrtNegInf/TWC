#!/usr/bin/env perl
use v5.36;

my @n = (2, 7, 9);
my $k = 2;
my @match = ();

for (my $i = $#n;$i > 0; --$i) {

    my $diff = $n[$i] - $k;

    for (my $j = $i-1; $n[$j] >= $diff ; --$j) {
        if ($n[$j] == $diff && $i != $j) {
            push @match, "($i, $j)";
        }
    }
}

say "$_ " foreach reverse @match;
