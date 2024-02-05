#!/usr/bin/env perl

use v5.32;
use feature qw(signatures);

use common::sense;

use Test2::V0 -srand => 1;

sub isPowerN ($n,$base) {
  return 1 if $n == 0;
  my $r = $n ** (1/$base);
  $r =~ m#^\d+$# ? 1 : 0;
}


is(isPowerN($_,3),1,"isPowerN($_,3) == 1") for (0,1,8,27,64);
is(isPowerN($_,3),0,"isPowerN($_,3) == 0") for (2,7,9,26,28,63,65);
is(isPowerN($_,5),1,"isPowerN($_,5) == 1") for (1,32,243);

done_testing;
