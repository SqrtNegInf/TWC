#!/usr/bin/env perl
use v5.36;

sub calc_e {
    my $e = 1;
    my($n, $prod, $prev) = (0, 1, 0);
    while ($prev != $e) {
        $prev = $e;
        $e += 1/($prod *= ++$n);
    }
    return $e;
}

say sprintf("%.14f", calc_e());
