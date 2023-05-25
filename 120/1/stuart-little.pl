#!/usr/bin/env perl
use v5.36;

say oct('0b' . (join '', map {my $rev = reverse substr(sprintf("%08b", 101 & 255), 2*$_,2)} (0..3)))
