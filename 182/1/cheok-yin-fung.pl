#!/usr/bin/env perl
use feature 'say';

$_ = '5, 2, 9, 1, 7, 6, 9';
chomp $_; @arr = split /\D+/, $_; $m = 0; for (1..$#arr) {$m = $_ if $arr[$_] > $arr[$m];}; say $m;
