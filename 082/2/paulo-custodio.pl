#!/usr/bin/env perl
use v5.36;

say interleaved('XXY', 'XXZ', 'XXXXZY');


sub interleaved {
    my($a, $b, $c) = @_;
    for my $i (0 .. length($a)) {
        if (substr($a,0,$i).$b.substr($a,$i) eq $c) {
            return 1;
        }
    }
    return 0;
}
