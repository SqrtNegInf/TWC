#!/usr/bin/env perl
use v5.36;

sub soeb { ($_[0] & 170) >> 1 | ($_[0] & 85) << 1 }
say soeb($_) for @ARGV ? @ARGV : qw< 101 18 >;
