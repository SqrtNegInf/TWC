#!/usr/bin/env perl
use v5.36;

use Test::More;

use List::Util qw(sum0);

sub concatenationValue (@ints) {
  # splice in an extra 0 if the list has odd number of elements
  splice(@ints,$#ints/2-1,1,$ints[$#ints/2-1],0) if ($#ints % 2 == 0);
  my $i = 0;
  sum0 map { "$ints[$_]$ints[--$i]" } 0 .. $#ints/2;
}

is(concatenationValue(6,12,25,1),1286);
is(concatenationValue(10,7,31,5,2,2),489);
is(concatenationValue(1,2,10),112);

done_testing;
