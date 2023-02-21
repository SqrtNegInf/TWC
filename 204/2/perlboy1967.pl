#!/usr/bin/env perl

use v5.16;
use common::sense;

use List::MoreUtils qw(arrayify);

use Test::More;
use Test::Deep qw(cmp_deeply);


sub reshapeMatrix ($$\@) {
  my ($r,$c,$ar) = @_;

  my @l = arrayify($ar);
  return [] if ($r * $c != scalar @l);

  my @foo;
  while ($r--) {
    push(@foo,[splice(@l,0,$c)]);
  }

  return \@foo; 
}

cmp_deeply(reshapeMatrix(1,4,@{[[1,2],[3,4]]}),
           [[1,2,3,4]]);
cmp_deeply(reshapeMatrix(3,2,@{[[1,2,3],[4,5,6]]}),
           [[1,2],[3,4],[5,6]]);
cmp_deeply(reshapeMatrix(3,2,@{[[1,2]]}),
           []);

done_testing;
