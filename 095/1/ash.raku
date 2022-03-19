#!/usr/bin/env raku
#
# Task 1 from
# https://perlweeklychallenge.org/blog/perl-weekly-challenge-095/

unit sub MAIN(Int $n = 1991);

say +($n.flip eq $n);
