#!/usr/bin/env perl

use v5.16;
use common::sense;


use Test::More;
use Test::Deep qw(cmp_deeply);


sub goodPairs (@) {
  my $ar = [];

  for my $i (0 .. scalar(@_) - 2) {
    for my $j ($i + 1 .. scalar(@_) - 1) {
      push(@$ar,[$i,$j])
        if ($_[$i] == $_[$j] and $i < $j);
    }
  }

  return $ar;
}


cmp_deeply(goodPairs(1,2,3,1,1,3),[[0,3],[0,4],[2,5],[3,4]]);
cmp_deeply(goodPairs(1,2,3),[]);
cmp_deeply(goodPairs(1,1,1,1),[[0,1],[0,2],[0,3],[1,2],[1,3],[2,3]]);
cmp_deeply(goodPairs(1,2,1,2),[[0,2],[1,3]]);

done_testing;
