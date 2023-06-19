#!/usr/bin/env perl

use strict;
use warnings;

arithmetic_subsequence(9, 4, 7, 2, 10);
arithmetic_subsequence(3, 6, 9, 12);
arithmetic_subsequence(20, 1, 15, 3, 10, 5, 8);

sub arithmetic_subsequence {
   my @ints = @_;
   print "Input: (" . join(", ", @ints) . ")\n";
   my $result = find_longest_arithmetic(@ints);
   print "Output: $result\n";
}

sub find_longest_arithmetic {
   my @ints = @_;
   my $result;
   if(is_arithmetic(@ints)) {
      $result = scalar(@ints);
   } else {
      my $max = 0;
      foreach my $index (0..$#ints) {
         my $tmp = find_longest_arithmetic( @ints[0..$index-1], @ints[$index+1..$#ints]);
         $max = $tmp if $tmp > $max;
      }
      return $max;
   }
}

# this helper function just checks if a given array is
# arithmetic. For that, we calculate the first difference.
# If any of the subsequent differences doesn't match this
# first one, the array is not arithmetic and we return 0.
# In the end all differences match so we can return 1.
sub is_arithmetic {
   my @ints = @_;
   return 0 if scalar(@ints) < 2;
   my $diff = $ints[1] - $ints[0];
   foreach my $index (1..$#ints-1) {
      my $this_diff = $ints[$index+1] - $ints[$index];
      return 0 if $this_diff != $diff;
   }
   return 1;
}
