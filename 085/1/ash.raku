#!/usr/bin/env raku
#
# Task 1 from
# https://perlweeklychallenge.org/blog/perl-weekly-challenge-085/

say + so 1 < any(@$_.combinations(3)>>.sum) < 2
    for <1.2 0.4 0.1 2.5>, <0.2 1.5 0.9 1.1>, <0.5 1.1 0.3 0.7>;

