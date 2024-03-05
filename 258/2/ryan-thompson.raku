#!/usr/bin/env raku

my $k = 1, my @n = (2, 5, 9, 11, 3);
say @n[ @n.keys.grep({ (TR:d/10/1/ with .base(2)) == $k }) ].sum
