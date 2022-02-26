#!/usr/bin/env raku

=begin pod

Week 135:

    https://theweeklychallenge.org/blog/perl-weekly-challenge-135

Task #1: Middle 3-digits

    You are given an integer.

    Write a script find out the middle 3-digits of the given integer, if possible otherwise throw sensible error.

Inspiration:

    Translated from the Perl solution as below:

    https://github.com/manwar/perlweeklychallenge-club/blob/master/challenge-135/mohammad-anwar/perl/ch-1.pl

=end pod

for 1, 1234, 1234567 -> $n {

    my $num = $n.abs;
    my $len = $num.chars;

    say "ERROR: Too short [$n]."             and next if $len == 1;
    say "ERROR: Even number of digits [$n]." and next if $len %% 2;

    my $i = ($len / 2) - 1;
    $num.substr($i, 3).say;
}
