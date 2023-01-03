#!/usr/bin/env perl

use v5.36;
use List::MoreUtils qw(any pairwise slide);
my @A = (1, 5, 1, 1, 6, 4);
my @high=sort {$a <=> $b} @A;
my @low=reverse splice @high, 0, (@high+1)/2;
@high=reverse @high;
my $prev;
my @out = grep {defined $_} pairwise {($a, $b)} @low, @high;
my $failed=any {$_} slide {$a == $b} @out;
say join " ", @A, "->", $failed?"No solution":@out;
