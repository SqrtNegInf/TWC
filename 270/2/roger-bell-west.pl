#!/usr/bin/env perl
use v5.36;

use Test::More tests => 2;

is(equalizearray([4, 1], 3, 2), 9, 'example 1');
is(equalizearray([2, 3, 3, 3, 5], 2, 1), 6, 'example 2');

sub equalizearray($a0, $x, $y) {
  my @a = sort @{$a0};
  my $limit = $a[-1];
  my @queue;
  push @queue, [\@a, 0];
  my $mc = -1;
  while (scalar @queue > 0) {
    my $op = shift @queue;
    if ($mc == -1 || $mc > $op->[1]) {
      if ($op->[0][0] == $op->[0][-1]) {
        $mc = $op->[1];
      } else {
        my @p = @{$op->[0]};
        $p[0]++;
        if ($p[0] <= $limit) {
          @p = sort @p;
          push @queue,[ \@p, $op->[1] + $x];
          my @q = @{$op->[0]};
          $q[0]++;
          $q[1]++;
          if ($q[1] <= $limit) {
            @q = sort @q;
            push @queue,[ \@q, $op->[1] + $y];
          }
        }
      }
    }
  }
  return $mc;
}
