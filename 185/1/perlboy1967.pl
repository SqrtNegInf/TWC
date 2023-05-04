#!/usr/bin/env perl

use v5.36;

use Test::More;

sub macFormat {
  state $re = join '\.', ('([0-9a-f]{2})' x 2) x 3;
  join ':',($_[0] =~ /(?i)^$re$/go);
}


is(macFormat('1ac2.34f0.b1c2'),'1a:c2:34:f0:b1:c2');
is(macFormat('ABC1.20F1.345A'),'AB:C1:20:F1:34:5A');

done_testing;    
