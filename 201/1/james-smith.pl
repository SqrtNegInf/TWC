#!/usr/bin/env perl
use v5.36.0;
use strict;
use warnings;
use feature qw(say);
use Test::More;
use List::Util qw(sum0);

my @TESTS = (
  [ [0,1,3], 2 ],
  [ [0,1],   2 ],
  [ [0..99,101..199], 100 ],
  [ [0..9999,10001..19999], 10000 ],
# [ [0..999999,1000001..1999999], 1000000 ],
# [ [0..9999999,10000001..19999999], 10000000 ],
);
is( missing( @{$_->[0]}), $_->[1] ) for @TESTS;
is( missing_sum( @{$_->[0]}), $_->[1] ) for @TESTS;
done_testing();

sub missing { my $t = @_*(@_+1)/2; $t-=$_ for @_; $t }
sub missing_sum { @_*(@_+1)/2 - sum0 @_ }
