#!/usr/bin/env perl

=pod

The Weekly Challenge - 184
 - https://theweeklychallenge.org/blog/perl-weekly-challenge-184/#TASK2

Author: Niels 'PerlBoy' van Dijke

Task 2: Split Array
Submitted by: Mohammad S Anwar

You are given list of strings containing 0-9 and a-z separated by space only.

Write a script to split the data into two arrays, one for integers and one 
for alphabets only.

=cut

use v5.16;
use warnings;

use Test::More;
use Test::Deep qw(cmp_deeply);


sub splitArray (@) {
  my ($n,$a);

  for (@_) {
    my @s = split(/\s+/);
    push(@$n,[grep /[0-9]/,@s]);
    push(@$a,[grep /[a-z]/,@s]);
  }

  [[grep {@$_} @$n], [grep {@$_} @$a]];
}


cmp_deeply(splitArray('a 1 2 b 0','3 c 4 d'),
           [ [[1,2,0],[3,4]], [['a','b'],['c','d']] ]);
cmp_deeply(splitArray('1 2','p q r','s 3','4 5 t'),
           [ [[1,2],[3],[4,5]], [['p','q','r'],['s'],['t']] ]);

done_testing;
