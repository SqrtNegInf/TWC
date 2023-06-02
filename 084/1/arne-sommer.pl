#!/usr/bin/env perl
use v5.36;

my $N = -1700;

die "Integer only" unless $N =~ /^\-?\d+$/;

my $sign = $N < 0
  ? "-"
  : "";
  
my $new = $sign . reverse(abs($N));

($new >= -2147483648 && $new <= 2147483647)
  ? say $new
  : say "0";
