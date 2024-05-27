#!/usr/bin/env perl

use v5.32;

use feature qw(signatures);
use common::sense;

use Test2::V0 -no_srand;

# Task 2
use List::AllUtils qw(max);

sub distributeElements ($ar,$c1,$c2) {
  my ($m,$c) = (max(@$ar),0);
  my @i = grep { $_ < $m } @$ar;
  while (@i) { 
    my @n = (0);
    if ($c2 < 2 * $c1 && $#i) {
      $c += $c2; unshift(@n,1);
    } else {
      $c += $c1;
    }
    $i[$_]++ for (@n);
    @i = grep { $_ < $m } @i;
  }
  return $c;
}

is(distributeElements([4,1],3,2),9,'Example 1');
is(distributeElements([2,3,3,3,5],2,1),6,'Example 2');
is(distributeElements([3,3,4,4],1,2),2,'Own test');

done_testing;
