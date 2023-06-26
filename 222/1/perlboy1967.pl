#!/usr/bin/env perl

use v5.16;

use common::sense;

use Test::More;
use Test::Deep qw(cmp_deeply);

use List::MoreUtils qw(pairwise);

sub matchingMembers (@) {
  pairwise { $a == $b ? $a : () } @_, @{[sort { $a <=> $b } @_]};
}

cmp_deeply([matchingMembers(1,1,4,2,1,3)],[1,1,2]);
cmp_deeply([matchingMembers(5,1,2,3,4)],[]);
cmp_deeply([matchingMembers(1,2,3,4,5)],[1,2,3,4,5]);

done_testing;
