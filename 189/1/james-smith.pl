#!/usr/bin/env perl

use v5.36;
use Test::More;

my @TESTS = (
  [ [qw(e m u g)], 'b', 'e' ],
  [ [qw(d c e f)], 'a', 'c' ],
  [ [qw(j a r)],   'o', 'r' ],
  [ [qw(d c a f)], 'a', 'c' ],
  [ [qw(t g a l)], 'v', 'v' ],
);

is( greater_char($_->[0],$_->[1]), $_->[2] ) foreach @TESTS;

done_testing();

sub greater_char {
  my $best;
  $_ gt $_[1] && !( defined $best && $_ ge $best ) && ($best=$_) for @{$_[0]};
  return $best || $_[1];
}

