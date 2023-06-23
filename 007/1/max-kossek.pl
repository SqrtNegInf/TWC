#!/usr/bin/env perl
use v5.36;

print join "\n", grep { $_ % ((($_ % 10) / 1) + ($_ / 10)) == 0 } 1..50;
