#!/usr/bin/env perl
use v5.36;

use List::MoreUtils qw(uniq);

my $s = "perlweeklychallenge";
my @w = ("weekly", "challenge", "perl");

my $re = '('.join('|', @w).')';

my @found = uniq(grep(/$re/, split(/$re/, $s)));

if (@found) {
  printf qq{"%s"\n}, join('", "', @found) ;
} else {
  print "0\n";
}
