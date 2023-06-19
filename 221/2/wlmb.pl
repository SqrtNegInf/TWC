#!/usr/bin/env perl
use v5.36;

use List::Util qw(max first);

my @set=(9, 4, 7, 2, 10);
# Search longest subsequence, remove leading element and repeat. Keep max.
say "@set -> ", max map {test(@set[$_..@set-1])} 0..@set-1;

sub test(@subset){
    return 0+@subset unless @subset>1; # 0 or 1 for empty or one element subsets
    return 1+max map {rest($subset[$_]-$subset[0], @subset[$_..@subset-1])} 1..@subset-1;
}

sub rest($val, @subset){
    # find index of next (the second) element of arithmetic subsequence
    # starting at the first element $subset[0] and separated by value $val
    my $i=first {$subset[$_]==$subset[0]+$val} 1..@subset-1;
    return 1 unless defined $i; # none found? Only the first element is in sequence
    return 1+rest($val, @subset[$i..@subset-1]); # recurse starting from found value
}
