#!/usr/bin/env raku

my @nums = (2, 4, 5, 1, 6);
my Int \k = @nums.pop;
put '@list = (', @nums.join(', '), '), $k = ', k;
put @nums.combinations(2).grep({ .sum %% k }).elems;
