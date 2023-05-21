#!/usr/bin/env perl
use v5.36;

use constant BIGN => 1024;
use Test::More tests => 2;

my @N = @ARGV;
@N = (2, 5, 4, 4, 5, 5, 2) if !defined($ARGV[0]);


say "@{oddities(@N)}";
say eccentric_odd(@N);



sub oddities {
    # return all the numbers appear odd number of times
    # inspired by Week 046 solutions
    # https://theweeklychallenge.org/blog/review-challenge-046/
    my @ans;
    my %ap;
    for (@_) {
        $ap{$_}++;
        $ap{$_} %= 2;
    }
    @ans = grep {$ap{$_} > 0} keys %ap;
    return [@ans];
}



sub eccentric_odd {
    # inspired by the "the DIFFERENCE from PERFECTION" in Task 1 of Week 117
    # https://theweeklychallenge.org/blog/review-challenge-117/
    # look like not very successful... Oooops.
    my $s = "";
    for my $d (@_) {
        my $md = index((scalar reverse $s), (scalar reverse "- $d "));
        my $pd = index((scalar reverse $s), (scalar reverse "+ $d "));
        $md = BIGN if $md == -1 && $pd >= 0;
        $pd = BIGN if $md == -1 && $pd == -1;
        $s .= $md < $pd ? "+ $d " : "- $d ";
    }
    return eval $s;
}



ok ${oddities(1, 2, 3, 4, 3, 2, 1, 4, 4)}[0] == 4, 
   "Example 2 using subroutine oddities";
ok eccentric_odd(1, 2, 3, 4, 3, 2, 1, 4, 4) == 4, 
   "Example 2 using subroutine eccentric_odd";
