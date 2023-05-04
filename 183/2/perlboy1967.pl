#!/usr/bin/env perl

use v5.36;
use Test::More;
use Test::Deep;

use DateTime;
use DateTime::Duration;


sub dateToHash($) {
  return {year => $1, month => $2, day => $3}
    if ($_[0] =~ /^(\d+)-(\d+)-(\d+)$/);
}

sub dateDifference($$) {
  my ($f,$t) = sort map { DateTime->new(dateToHash $_) } @_;

  my $year = DateTime::Duration->new(years => 1);

  my $y = 0;
  while ($f <= $t - $year) {
    $f += $year;
    $y++;
  }

  return [$y,$f->delta_days($t)->{days}];
}

my @d = (
  ['2019-02-10','2022-11-01',[3,264]],
  ['2020-09-15','2022-03-29',[1,195]],
  ['2019-12-31','2020-01-01',[0,1]],
  ['2019-12-01','2019-12-31',[0,30]],
  ['2019-12-31','2020-12-31',[1,0]],
  ['2019-12-31','2021-12-31',[2,0]],
  ['2020-09-15','2021-09-16',[1,1]],
  ['2019-09-15','2021-09-16',[2,1]],
);

foreach my $c (@d) {
  cmp_deeply(dateDifference($$c[0],$$c[1]),$c->[2]);
  cmp_deeply(dateDifference($$c[1],$$c[0]),$c->[2]);
}

done_testing;
