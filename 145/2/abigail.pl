#!/usr/bin/env perl
use v5.36;

#
# Please see the section "Unicode and Combining Characters" at
# https://abigail.github.io/HTML/Perl-Weekly-Challenge/week-145-2.html
# to see how we interpret a palindrome.
#

local $, = $";
$_ = 'redivider';
#while () {
    my %seen;
    /(.+)(?{$seen {$1} ++ if $1 eq reverse $1})(*FAIL)/;
    #
    # Do we need to keep the order in which the palindromes
    # appear in the word? The examples do, but the description
    # is, (obviously, because the description bares no resemblance
    # to the examples) silent about that.
    #
    # We'll judge that the order appearing in the examples is an
    # artifact of the algorithm used to calculate the answers, and
    # not an requirement.
    #
    say sort keys %seen;
#}
