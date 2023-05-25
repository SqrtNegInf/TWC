#!/usr/bin/env perl
use v5.36;

my @seq = grep { not /11/ } grep /^[1-3]+$/, 1..5000;
say $seq[$_ + 1] for (5, 10, 60);
