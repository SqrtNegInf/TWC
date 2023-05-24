#!/usr/bin/env perl
use v5.36;

my($m,$n) = (12, 3);
say $m ^ (1 << ($n-1));
