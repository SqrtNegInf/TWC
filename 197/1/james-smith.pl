#!/usr/bin/env perl
use v5.36;
use Test::More;

my @TESTS = (
  [ [1,0,3,0,0,5], '1 3 5 0 0 0' ],
  [ [1,6,4],       '1 6 4'       ],
  [ [0,1,0,2,0],   '1 2 0 0 0'   ],
  [ [(0,1) x 100 ], "@{[ (1)x 100, (0)x 100 ]}" ],
);

is( "@{[ move_zero(@{$_->[0]}) ]}", $_->[1] ) for @TESTS;
done_testing();

sub move_zero{grep({$_}@_),grep{!$_}@_}
