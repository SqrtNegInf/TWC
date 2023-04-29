#!/usr/bin/env perl

use v5.36;
use Test::More;
#use Benchmark qw(cmpthese timethis);

my @TESTS = (
   [15,14], [35,32], [1000,738]
);

is( special( $_->[0] ), $_->[1] ) for @TESTS;
done_testing();

sub special {
  scalar grep { !m{(\d).*\1} } 1..pop
}
