#!/usr/bin/env perl
use 5.020;
use warnings;

my $N = shift // 99;

my $binary = sprintf "%b", $N;
say 0+($binary eq reverse $binary) ? 1 : 0;
