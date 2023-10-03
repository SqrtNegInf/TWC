#!/usr/bin/env perl
use v5.36;

use common::sense;

use Test::More;

sub arrayLoops (@) {
  my ($n,%u) = (0);

  for my $i (0 .. scalar(@_)-1) {
    next if exists $u{$i};

    my $j = $_[$i];
    while (!exists $u{$j}) {
      last if ($j < 0 or $j >= scalar(@_));
      $j = $u{$j} = $_[$j];
    }

    $n++ if (exists $u{$j});
  }
  return $n;
}

is(arrayLoops(4,6,3,8,15,0,13,18,7,16,14,19,17,5,11,1,12,2,9,10),3);
is(arrayLoops(0,1,13,7,6,8,10,11,2,14,16,4,12,9,17,5,3,18,15,19),6);
is(arrayLoops(0,3,1,2),2);
is(arrayLoops(0,1,5,2),2);
is(arrayLoops(-1),0);

done_testing;
