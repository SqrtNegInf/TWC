#!/usr/bin/env perl

use v5.36;

use common::sense;

use Test::More;
use Test::Deep qw(cmp_deeply);

sub evenOddSort {
  sort { (($a & 1) <=> ($b & 1)) || ($a <=> $b) } @_;
}

cmp_deeply([evenOddSort(1,2,3,4,5,6)],[2,4,6,1,3,5]);
cmp_deeply([evenOddSort(1,2)],[2,1]);
cmp_deeply([evenOddSort(1)],[1]);

done_testing;
