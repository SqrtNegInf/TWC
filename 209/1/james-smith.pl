#!/usr/bin/env perl

use strict;
use warnings;
use feature qw(say);
use Test::More;
use Benchmark qw(cmpthese timethis);

my @TESTS = (
  [ [1,0,0]   =>  1 ],
  [ [1,1,1,0] =>  0 ],
  [ [1,1,1]   =>  0 ],
);

sub special_bit_chars {
  return 0 if $_[-1];
  ($_[0]&&shift),shift until @_<2;
  scalar @_
}

sub special_bit_chars_reverse {
  my$f,pop?return 0:pop||return 1;
  $f++,pop||last while@_;
  1&$f
}
