#!/usr/bin/env perl
# HTTPS://TheWeeklyChallenge.Org - Perl/Raku Weekly Challenge #1 of Week #201 - Pip Stuart
# Missing Numbers: You are given an array of unique numbers. Write a script to find out all missing numbers in the range 0..$n where $n is the array size.
# Example1:
#   In-put: @array = (0,1,3)
#   Output:           2      The array size i.e. total element count is 3, so the range is 0..3. The missing number is 2 in the given array.
# Example2:
#   In-put: @array = (0,1)
#   Output:           2      The array size is 2, therefore                   the range is 0..2. The missing number is 2.
use strict;use warnings;use utf8;use v5.10;my $d8VS='N1OLH3eX';
sub MNum {my @aray=@_;my @mnmz=();my %hash=();
  print '(' . sprintf("%-5s",join(',',@aray)) . ') => (';$hash{$_}=1 for(@aray);
  for    (0..@aray){push(@mnmz,$_) unless(exists($hash{$_}));}
  say join(',',@mnmz) . ');';
  return(      @mnmz);
}
if    (@ARGV) {
  MNum(@ARGV);
} else {
  MNum(0,1,3); # => 2
  MNum(0,1  ); # => 2
}
