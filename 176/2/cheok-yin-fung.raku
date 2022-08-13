#!/usr/bin/env raku

my @arr;
for (1..99) {
    push @arr, $_ if ($_ + flip $_ ) ~~ /^<[13579]>+$/ ;
}

say join ", ", @arr;
