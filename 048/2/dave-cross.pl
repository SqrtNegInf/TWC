#!/usr/bin/env perl
use v5.36;

use Time::Piece;
use Time::Seconds;

my $fmt = '%d%m%Y';

my ($y, $m, $d) = (2000, 1, 1);
my $str_date = sprintf '%02d%02d%d', $d, $m, $y;
my $date = Time::Piece->strptime($str_date, $fmt);

while ($date->year <= 2999) {
  $str_date = $date->strftime($fmt);
  if ($str_date eq reverse $str_date) {
    say $date->ymd, " is a palindrome ($str_date)";
  }
  $date += ONE_DAY;
}
