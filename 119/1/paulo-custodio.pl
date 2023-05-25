#!/usr/bin/env perl
use v5.36;

my $N = shift // 101;
say ((($N >> 4) & 0x0f) | (($N << 4) & 0xf0));
