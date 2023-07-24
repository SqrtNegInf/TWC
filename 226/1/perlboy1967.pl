#!/usr/bin/env perl
use v5.36;

use Test::More;

sub shuffleString {
  my ($i,@c) = (0, split //, shift);
  my @o; map {$o[$_] = $c[$i++]} @_;
  return join '', @o;
}

is(shuffleString('lacelengh', 3,2,0,5,4,8,6,7,1),'challenge');
is(shuffleString('rulepark', 4,7,3,1,0,5,2,6),'perlraku');

done_testing;
