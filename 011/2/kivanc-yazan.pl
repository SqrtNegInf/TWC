#!/usr/bin/env perl
use warnings;
use strict;

# Solution:
my $n = 5;
die "Expecting a positive integer"
  unless $n && ($n =~ m/^\d+$/a) && ($n >= 1);

# Build the matrix and print it at the same time
my $arr;
for my $i (0..$n-1){
  for my $j (0..$n-1){
    my $value = ($i == $j) ? 1 : 0;
    $arr->[$i][$j] = $value;
    print $value . " ";
  }
  print "\n";
}
