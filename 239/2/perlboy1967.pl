#!/usr/bin/env perl
use v5.36;

use Test::More;

sub consistentStrings ($allowed,@strings) {
  my $re = "[^$allowed]";
  grep { length and !/$re/ } @strings;
}

is(consistentStrings('ab',qw(ad bd aaab baa badab)),2);
is(consistentStrings('abc',qw(a b c ab ac bc abc)),7);
is(consistentStrings('cad',qw(cc acd b ba bac bad ac d)),4);
is(consistentStrings('a','a',''),1);

done_testing;
