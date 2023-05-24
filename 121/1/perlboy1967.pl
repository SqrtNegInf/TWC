#!/usr/bin/env perl
use v5.36;

use Test::More;

my $tests = [ 
   [ 12, 3,  8],
   [ 18, 4, 26],
   [ 0b10101010, 5, 0b10111010 ],
   [ 0b111111111111, 8, 0b111101111111 ],
];

foreach my $t (@$tests) {
  printf "%s\n", join(',', @$t) unless is(invertBit($t->[0],$t->[1]), $t->[2]);
}

done_testing();

sub invertBit {
  my ($m,$n) = @_;

  return $m ^ (1 << ($n-1));
}
