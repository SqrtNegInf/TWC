#!/usr/bin/env perl
use v5.36;

my @gapful;
$_ = 100;

while (@gapful < 20) {
  push @gapful, $_ unless $_ % join '', (split //)[0, -1];
  ++$_;
}

say "@gapful";
