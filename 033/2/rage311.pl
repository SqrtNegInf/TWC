#!/usr/bin/env perl
use v5.36;

my @results = [ undef, 1..11 ];
for my $i (1..11) {
  push @results, [ $i, map { $_ >= $i ? $_ * $i : undef } 1..11 ]
}

say for map { join ' ', map { sprintf '%3s', $_ // '' } @$_ } @results;
