#!/usr/bin/env perl
use v5.36;

my $bin=sprintf("%b", 99);
say 0+($bin eq join "", reverse split("", $bin));
