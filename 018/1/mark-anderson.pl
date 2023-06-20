#!/usr/bin/env perl
use v5.36;

use List::Util 'all';

my @strings =  <zabc xabcy abcd>;
my $pattern = pop @strings;
my $longest;

OUTER:
for(my $w=length $pattern; $w>0; $w--) {
    for(my $i=0; $i<=(length $pattern)-$w; $i++) {
        $longest = substr $pattern, $i, $w;
            last OUTER if all { /$longest/ } @strings;
    }
}

say $longest;
