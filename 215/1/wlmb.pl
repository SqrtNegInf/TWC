#!/usr/bin/env perl
use v5.36;

my @A = ('abc', 'xyz', 'tsu');
say "@A -> ", 0+grep {(join "", sort {$a cmp $b} split "") ne $_} @A;
