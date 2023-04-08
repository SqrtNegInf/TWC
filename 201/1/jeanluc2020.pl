#!/usr/bin/env perl
use v5.36.0;
use strict;
use warnings;

my @examples = (
   [0, 1, 3],
   [0, 1],
   [0, 2, 4, 8],
   [0, 2, 4, 6, 8, 10]
);

foreach my $array (@examples) {
   # let's print the input array
   print "(" . join(", ", @$array) . "):\n";
   # for each element in the array create a corresponding
   # entry in the %seen hash
   my %seen = map { $_ => 1, } @$array;
   my @result;
   foreach my $i (0..scalar(@$array)) {
      # the missing elements are the ones not in %seen,
      # so add them to the result
      push @result, $i unless $seen{$i};
   }
   # print the result
   print "Output: " . join(", ", @result) . "\n";
}


