#!/usr/bin/env perl
use v5.36;

my (%cols, @cols, %nums, @nums);
@cols = ('A'..'ZZZ'); 
@cols{1..scalar(@cols)} = @cols;
@nums = (1..scalar(@cols));
@nums{@cols} = @nums;

my $in = 28;
print "$cols{$in}\n" if $in =~ /^\d+$/ && $in <= scalar(@nums);
print "$nums{$in}\n" if $in =~ /^[A-Z]{1,3}$/;
