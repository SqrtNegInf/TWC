#!/usr/bin/env perl
use v5.36;

use Test2::V0 -no_srand;

sub replaceDigits ($str) {
  my $r;
  while ($str =~ s#^(?<c>[a-z])(?<d>\d+)##i) {
    $r .= $+{c} . join('', map { chr(ord($+{c})+$_) } split(//,$+{d}));
  }
  return $r.$str;
}

is(replaceDigits('a1c1e1'),'abcdef','Example 1');
is(replaceDigits('a1b2c3d4'),'abbdcfdh','Example 2');
is(replaceDigits('b2b'),'bdb','Example 3');
is(replaceDigits('a16z'),'abgz','Example 4');
is(replaceDigits('Z5'),'Z_','Own test');

done_testing;
