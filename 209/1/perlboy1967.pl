#!/usr/bin/env perl

use v5.16;

use common::sense;

use Test::More;

sub isSpecialBitCharacter {
  return 0 if $_[-1];
  return (split /(11|10)/,join '',@_ )[-1] ? 0 : 1;
}

is(isSpecialBitCharacter(1,0,0),1);
is(isSpecialBitCharacter(1,1,1,0),0);
is(isSpecialBitCharacter(1,0,0,1,1,0),1);
is(isSpecialBitCharacter(1,1,0,0,0,1,0),0);
is(isSpecialBitCharacter(1,0,1,0,1,1,0),1);

done_testing;
