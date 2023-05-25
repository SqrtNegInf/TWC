#!/usr/bin/env perl
use v5.36;

my $n = shift // 101;
say +( $n >> 4 ) + ( $n & 15 ) * 16;
