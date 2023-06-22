#!/usr/bin/env perl
use v5.36;

my $x = 0;

# We know x cannot be positive because 0C = 32F...
while ($x != 32 + 1.8 * $x) { 
    $x--; # ...so count backwards.
}

say $x;
