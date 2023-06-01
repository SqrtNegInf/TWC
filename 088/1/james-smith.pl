#!/usr/bin/env perl
use v5.36;

use Test::More;

is( "@{[ prod_list( qw(5 2 1 4 3) ) ]}", '24 60 120 30 40' );
is( "@{[ prod_list( qw(2 1 4 3) ) ]}", '12 24 6 8' );

done_testing();

sub prod_list {
  my $N = 1;
  $N *= $_ foreach @_;
  return map { $N/$_} @_;
}

