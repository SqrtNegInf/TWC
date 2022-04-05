#!/usr/bin/env raku

# Task 1 from
# https://perlweeklychallenge.org/blog/perl-weekly-challenge-067/

# Comments: https://andrewshitov.com/2020/06/29/combinations-in-raku/

my $m = 5;
my $n = 3;

say '[ ',
    ([X] (1..$m) xx $n)\
        >>.sort
        .unique(:as(*.Str))
        .grep(*.unique.elems == $n)
        .sort(*.Str)
        .map({"[{.join(',')}]"})
        .join(', '),
    ' ]';
