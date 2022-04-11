#!/usr/bin/env raku

my $T =0; 
my @L = -25, -10, -7, -3, 2, 4, 8, 10;
say @L.sort.combinations(3).grep(*.sum == $T);
