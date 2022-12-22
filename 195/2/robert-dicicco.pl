#!/usr/bin/env perl

use strict;

use warnings;

use feature qw/say/;

my @nn = ([1,1,2,6,2], [1,3,5,7], [6,4,5,6,1] );


for my $n (@nn) {

  my %seen = ();

  print("Input: [@$n]\n");

  foreach my $x (@$n) {

    next if ($x =~ /^\d*[13579]$/);

    (exists $seen{$x}) ? ($seen{$x}++) : ($seen{$x} = 1);

  }

  if ((keys %seen) == 0) {print"Output: -1\n\n";next;}


  my @heights = reverse(sort { $seen{$a} <=> $seen{$b} } keys %seen);

  print("Output: $heights[0]\n\n");

}
