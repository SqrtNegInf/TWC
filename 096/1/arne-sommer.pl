#!/usr/bin/env perl
use v5.36;

my $N = $ARGV[0] // "Specify a string";

say '"', join(" ", reverse(split(/\s+/, $N))), '"';
