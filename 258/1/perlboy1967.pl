#!/usr/bin/env perl
use v5.36;


use v5.32;
use feature qw(signatures);

#use common::sense;

use Test2::V0 -srand => 1;

sub evenDigits (@ints) {
  scalar grep { /^\d+$/ and (length $_) % 2 == 0 } @ints;
}

is(evenDigits(10,1,111,24,1000),3);
is(evenDigits(111,1,11111),0);
is(evenDigits(2,8,1024,256),1);
is(evenDigits(20,'Perl',1234),2);

done_testing;
