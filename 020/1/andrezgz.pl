#!/usr/bin/env perl
use v5.36;

my $s = 'bookkeeper';
while ($s =~ /(([a-z])\2*)/g) { print "$1\n"; };
