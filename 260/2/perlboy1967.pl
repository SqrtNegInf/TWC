#!/usr/bin/env perl

use v5.32;
use feature q(signatures);

use common::sense;

use Test2::V0 -srand => 1;

use Algorithm::Combinatorics qw(permutations);
use List::AllUtils qw(uniq firstidx);

sub dictionaryRank ($word) {
  1 + firstidx {$_ eq $word} uniq sort map {join '',@$_} permutations([split //,$word]);
}

is(dictionaryRank('CAT'),3,'CAT');
is(dictionaryRank('GOOGLE'),88,'GOOGLE');
is(dictionaryRank('SECRET'),255,'SECRET');

done_testing;
