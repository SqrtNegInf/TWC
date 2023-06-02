#!/usr/bin/env perl
use v5.36;

my @in = grep { /^-?\d+$/ } -1700;
die "Give me an integer\n" unless @in;

my $max = int( 0xffffffff / 2 );

my $n = shift @in;

if ($n > $max) {
  say 0;
  exit;
}

if ($n < 0) {
  say -1 * reverse abs $n;
} else {
  say scalar reverse $n;
}
