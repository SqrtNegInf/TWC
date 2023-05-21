#!/usr/bin/env perl
use v5.36;

use Test::More;

is middle3numbers(1234567),345;
is middle3numbers(1020304050607),'040';
is middle3numbers(-123),123;
is middle3numbers(1),'too short';
is middle3numbers(1010),'even number of digits';
is middle3numbers('Perl5'),'not an integer number';

done_testing;


sub middle3numbers {
  my $n = $_[0];

  return 'not an integer number'  if  $n !~ m#^[-]?\d+$#;

  $n = abs($n);
  my $l = length($n);
  return 'too short' if $l < 3;
  return 'even number of digits' if $l % 2 == 0;
  return substr($n,int($l/2)-1,3);
}
