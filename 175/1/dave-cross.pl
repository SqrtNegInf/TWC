#!/usr/bin/env perl
use v5.36;

use Time::Piece;
use Time::Seconds;

my $year = shift || localtime->year;

for (2 .. 13) {
  if ($_ == 13) {
    $year++;
    $_ = 1;
  }

  my $date_str = sprintf '%4d-%02d-01', $year, $_;
  my $date = Time::Piece->strptime($date_str, '%Y-%m-%d');

  $date -= ONE_DAY; # Last day of previous month
  # _wday() is 0 for Sun, 1 for Mon, etc...
  $date -= (ONE_DAY * $date->_wday);

  say $date->ymd;
}
