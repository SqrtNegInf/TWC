#!/usr/bin/env perl
use v5.36;

my @doors = map { 1 } 0 .. 500;
for my $e ( 2 .. 500 ) {
    map { $doors[$_] = !$doors[$_] }
      grep { 0 == $_ % $e } 1 .. 500;
}
say join ' ', grep { $doors[$_] } 1 .. 500;
