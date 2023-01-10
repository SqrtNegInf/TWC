#!/usr/bin/env perl

use v5.16;
use common::sense;

use List::Util qw(max);
use List::MoreUtils qw(slide);

use Test::More;


sub maxGap {
  return 0 if (scalar @_ < 2);

  my @deltas = slide { $b - $a } sort { $a <=> $b } @_;
  my $max = max(@deltas);

  return scalar grep { $_ == $max } @deltas;
}


is(maxGap(2,5,8,1),2);
is(maxGap(3),0);
is(maxGap(1,1,2,2,3,3),2);

done_testing;
