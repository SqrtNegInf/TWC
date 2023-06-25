#!/usr/bin/env perl
use v5.36.0;

use common::sense;

use List::Util qw(min);
use List::MoreUtils qw(uniq);
use Algorithm::Combinatorics qw(combinations);

use Test::More;

sub t2m ($) {
  return $1 * 60 + $2 if ($_[0] =~ m#(\d+):(\d+)#);
}

sub shortestTime (@) {
  my @l = uniq map { t2m($_) } @_;
  my @d;
  for (combinations(\@l,2)) {
    push(@d,$$_[0] - $$_[1]);
    $d[-1] += 1440 if ($d[-1] < 0);
  }
  return min(@d);
}

is(5,shortestTime(qw(00:00 23:55 20:00)));
is(4,shortestTime(qw(01:01 00:50 00:57)));
is(15,shortestTime(qw(10:10 09:30 09:00 09:55)));

done_testing;
