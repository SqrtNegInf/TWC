#!/usr/bin/env raku

unit sub MAIN (Int $year = 2022);

for 1 .. 12 -> $month
{
  my $date = Date.new($year, $month, Date.new($year, $month, 1).days-in-month);

  $date.=pred while $date.day-of-week != 5;

  say $date.Str.trans("-" => "/");
}
