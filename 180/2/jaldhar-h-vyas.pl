#!/usr/bin/env perl
use v5.36;

my ($i, @n) = @ARGV;

say join q{, }, grep { $_ > $i } @n;
