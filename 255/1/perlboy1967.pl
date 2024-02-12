#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;

use List::MoreUtils qw(firstidx);

sub oddCharacter ($s,$t) {
  my @s = sort split //, $s;
  my @t = sort split //, $t;
  return $t[firstidx { $s[$_] ne $t[$_] } 0 .. $#s];
}

is(oddCharacter('Perl','Preel'),'e');
is(oddCharacter('Weekly','Weeakly'),'a');
is(oddCharacter('Box','Boxy'),'y');

done_testing;
