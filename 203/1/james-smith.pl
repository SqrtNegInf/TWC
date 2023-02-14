#!/usr/bin/env perl

use strict;
use warnings;
use feature qw(say);
use Test::More;

my @TESTS = (
  [ [1,2,3,6],   1 ],
  [ [1,1,1,3,5], 4 ],
  [ [3,3,6,4,5], 0 ],
);

is( special( @{$_->[0]} ), $_->[1] ) for @TESTS;
done_testing();

## Nothing really to do here other than a bit of brute
## force....

sub special {
  my $c = 0;
  for my $i     (    0 .. $#_-3 ) {
    for my $j   ( $i+1 .. $#_-2 ) {
      my $t = $_[$i]+$_[$j];
      for my $k ( $j+1 .. $#_-1 ) {
        $t+$_[$k]==$_[$_] && $c++ for $k .. $#_;
      }
    }
  }
  $c;
}
