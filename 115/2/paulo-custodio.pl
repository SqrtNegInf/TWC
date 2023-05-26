#!/usr/bin/env perl
use v5.36;

my @nums = (4, 1, 7, 6);
@nums or die "Usage: ch-1.pl words...\n";
say largest_mult2(@nums);

sub largest_mult2 {
    my(@nums) = @_;

    # select smallest even number for last element
    my @even = sort {$a->[1] <=> $b->[1]}
               grep {$_->[1] % 2 == 0}
               map {[$_, $nums[$_]]} 0..$#nums;
    return 0 if !@even;         # no even numbers
    my($index, $last) = @{$even[0]};
    splice(@nums, $index, 1);       # remove it from @nums

    # sort the other elements in descending order
    @nums = sort {$b <=> $a} @nums;

    return 0+join('',@nums,$last);
}
