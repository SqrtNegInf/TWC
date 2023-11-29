#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;

use List::Util qw(sum0);
use List::MoreUtils qw(minmax);
use Algorithm::Combinatorics qw(combinations);

sub groupHero(@int) {
  sum0 map {
    my $s;
    for my $c (combinations(\@int,$_)) {
      my ($min,$max) = minmax @$c;
      $s += $max ** 2 * $min;
    }
    $s;
  }  1 .. $#int + 1;
}

is(groupHero(2,1,4),141);

done_testing;

