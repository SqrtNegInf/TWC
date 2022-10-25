#!/usr/bin/env perl

use v5.16;
use warnings;

use Date::Simple qw(ymd);
use Date::Range;

use Test::More;

sub daysTogether ($$$$) {
  # Use 2022 as this not a leap year
  my @d = map { ymd(2022, reverse split /-/, $_) } @_;
  my @r = map { Date::Range->new(shift @d,shift @d) } (1,2);

  if ($r[0]->overlaps($r[1])) {
    return $r[0]->overlap($r[1])->length;
  } else {
    return 0;
  }
}

is(daysTogether('12-01','20-01','15-01','18-01'),4);
is(daysTogether('02-03','12-03','13-03','14-03'),0);
is(daysTogether('02-03','12-03','11-03','15-03'),2);
is(daysTogether('30-03','05-04','28-03','02-04'),4);

done_testing;
