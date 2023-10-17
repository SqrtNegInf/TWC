#!/usr/bin/env perl
use v5.36;

use Test::More;
use Test::Deep qw(cmp_deeply);

use List::MoreUtils qw(slide);
use Memoize;

memoize 'cnt_steps';

sub cnt_steps($i) {
  my $n = 0;

  while (1) {
    my @d = split(//,$i);
    last if (@d == 1);
    $i = slide { $a * $b } @d;
    $n++;
  } 

  return $n;
}

sub persistenceSort (@numbers) {
  sort { cnt_steps($a) <=> cnt_steps($b) || $a <=> $b} @numbers;
}

cmp_deeply([persistenceSort(15,99,1,34)],[1,15,34,99]);
cmp_deeply([persistenceSort(50,25,33,22)],[22,33,50,25]);

done_testing;
