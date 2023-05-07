#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util 'divisor_sum';
my $want = shift // 20;
my($have,$n)=(0,1);
divisor_sum($n)-$n > $n
    and print "$n\n"
    and $have++
    while $have < $want
      and $n+=2;
