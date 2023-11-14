#!/usr/bin/env perl
use v5.32;

use common::sense;

use Test2::V0 -srand => 1;

use List::MoreUtils qw(uniq);

sub missingMembers {
  my ($n,%n,$r) = ($#_ + 1);

  # Collect all numbers across input
  # and store against their input index
  for my $i (0 .. $n - 1) {
    $r->[$i] = [];
    for (uniq($_[$i]->@*)) {
      push(@{$n{$_}},$i);
    }
  }

  # Find uniq numbers across input 
  # and create output
  for my $i (sort { $a <=> $b } keys %n) {
    if ($n{$i}->@* < $n) {
      map { push($r->[$_]->@*,$i) } $n{$i}->@*;
    }
  }
  return $r;
}

is(missingMembers([1,2,3],[2,4,6]),
                  [[1,3],[4,6]]);
is(missingMembers([0,1,2,3],[1,2,3,4],[2,3,4,5]),
                  [[0,1],[1,4],[4,5]]);
is(missingMembers([1],[1]),[[],[]]);

done_testing;
