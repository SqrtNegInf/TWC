#!/usr/bin/env perl

use v5.16;
use List::Util qw(sum);

my ($i,$j) = (0,0);
while ($i < 8) {
  (say $j and $i++) if isHappy(++$j);
}

sub isHappy ($) {
  my ($n) = @_;

  my %seen;

  while ($n != 1 and !exists $seen{$n}) {
    $seen{$n}++;
    $n = sum map { $_*$_ } unpack '(A1)*', $n;
  }

  return $n == 1;
}

