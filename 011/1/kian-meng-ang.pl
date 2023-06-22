#!/usr/bin/env perl
use v5.36;

say grep { $_ == ($_ * 9 / 5) + 32 } (-100 .. 100);
