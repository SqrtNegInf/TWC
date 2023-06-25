#!/usr/bin/env perl
use v5.36.0;

use Test::More;

my @TESTS = (
  [ [1..7], 7 ],
  [ [2,4,1,3], 7 ],
  [ [10,5,7,12,8], 15 ],
);

is( max_xor( @{$_->[0]} ), $_->[1] ) for @TESTS;

done_testing();

sub max_xor {
  my $m = 0;
  while( @_ ){
    my $x=shift;
    ( $x^$_ ) > $m && ( $m = $x^$_ ) for @_;
  }
  $m;
}
