#!/usr/bin/env perl
use v5.36;

my $num = shift // 1221;
say "$num: ", $num eq (reverse $num) ? 1 : 0;
