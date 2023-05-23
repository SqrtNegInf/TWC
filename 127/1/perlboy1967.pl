#!/usr/bin/env perl
use v5.36;

use Test::More;

is(areDisjointSets([1,2,3],[2,3,4]),0);
is(areDisjointSets([1,2,3],[4,5,6]),1);

done_testing;


sub areDisjointSets {
  my ($ar1,$ar2) = @_;

  my %h = map +($_,1),@$ar1;

  foreach my $i (@$ar2) {
    return 0 if exists $h{$i};
  }

  return 1;
}
