#!/usr/bin/env perl

use v5.32;

use common::sense;

use Test2::V0 -srand => 1;

use Algorithm::Combinatorics qw(permutations subsets);

sub largestOfThree (@) {
  my @l = sort { $b <=> $a } @_;

  my $subsetSize = $#l+1;
  while ($subsetSize > 0) {
    for my $subset (subsets(\@l,$subsetSize)) {
      my @subset = sort { $b <=> $a } @$subset;
      for my $p (permutations(\@subset)) {
        my $s = join('',@$p);
        return $s if ($s % 3 == 0);
      }
      $subsetSize--;
    }
  }
  return -1;
}


is(largestOfThree(8,1,9),981);
is(largestOfThree(8,6,7,1,0),8760);
is(largestOfThree(1),-1);

done_testing;
