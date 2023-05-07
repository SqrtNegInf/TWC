#!/usr/bin/env perl
use v5.36;

my @prime = (2, 3, 5, 7, 11, 13, 17, 19, 23);

say my $x = 1;

say $x*=$prime[$_] for 0..8;

