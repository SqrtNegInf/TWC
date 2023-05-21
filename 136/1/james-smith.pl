#!/usr/bin/env perl
use v5.36;

use Test::More;

my @TESTS = (
  [ [1000001,9991],  0 ],
  [ [1000000,9991],  0 ],
  [ [31,96],  0 ],
  [ [8,24],   1 ],
  [ [26,39],  0 ],
  [ [4,10],   1 ],
);

is( friendly(@{$_->[0]}), $_->[1] ) foreach @TESTS;

done_testing();

sub friendly {
  my($a,$b) = @_;
  return 0 if 1 & ($a | $b);
  ($a,$b) = ($b,$a%$b) while $b; ## Get GCD
  return 0 if $a == 1;           ## Numbers are co-prime so not friendly
  $a>>=1 until $a&1;             ## Remove trailing binary 0 digits
  return $a == 1 ? 1 : 0;        ## For powers of two $a == 1
}

