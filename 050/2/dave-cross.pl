#!/usr/bin/env perl
use v5.36;

my @ARGV = (19,11,9,7,20,3,17,16,2,14,1);
for my $i (@ARGV) {
  say "$i is a Noble Integer" if scalar (grep { $_ > $i } @ARGV) == $i;
}
