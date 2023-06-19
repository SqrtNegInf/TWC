#!/usr/bin/env perl

use v5.16;

use common::sense;

use Test::More;

sub goodStrings ($@) {
  my ($c,$s) = (shift,0);

  my %c; $c{$_}++ for (split //,$c);

  for (@_) {
    my %m; $m{$_}++ for (split //,$_);
    map { delete $m{$_} if ($m{$_} <= $c{$_} // 0) } keys %m;
    $s += length($_) if (keys %m == 0);
  }

  return $s
}

is(goodStrings('attach','cat','bt','hat','tree'),6);
is(goodStrings('welldonehopper','hello','world','challenge'),10);
is(goodStrings('race','ace','racecar'),3);

done_testing;
