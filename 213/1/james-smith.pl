#!/usr/bin/env perl

use strict;
use warnings;
use feature qw(say);
use Test::More;

my @TESTS = (
  [ [1..6], '2 4 6 1 3 5' ],
  [ [4, 3, 13, 12, 1, 6, 18, 19, 10, 7, 15, 20, 14, 2, 11, 16, 17, 8, 9, 5 ],
    '2 4 6 8 10 12 14 16 18 20 1 3 5 7 9 11 13 15 17 19' ],
  [ [94,32,20,33,6,60,82,36,92,90,65,61,88,81,97,52,85,35,51,100,74,
     48,23,5,22,8,86,4,99,49,68,27,87,73,84,19,21,50,91,42,80,77,12,
     98,55,13,72,58,29,64,37,54,24,34,43,14,25,79,41,39,31,56,47,2,
     30,10,44,3,18,75,71,46,93,53,96,17,59,78,57,76,89,63,9,62,26,
     83,45,38,15,67,11,40,28,95,69,66,70,7,16,1],
     '2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 '.
     '48 50 52 54 56 58 60 62 64 66 68 70 72 74 76 78 80 82 84 86 88 90 '.
     '92 94 96 98 100 1 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31 33 35 '.
     '37 39 41 43 45 47 49 51 53 55 57 59 61 63 65 67 69 71 73 75 77 79 '.
     '81 83 85 87 89 91 93 95 97 99' ],
  [ [1..20], '2 4 6 8 10 12 14 16 18 20 1 3 5 7 9 11 13 15 17 19' ],
  [ [1,2],  '2 1' ],
  [ [1], '1' ],
);

sub fun_sort {
  sort { $a%2 <=> $b%2 || $a <=> $b } @_
}

is( "@{[fun_sort( @{$_->[0]} )]}", $_->[1] ) for @TESTS;
done_testing();
