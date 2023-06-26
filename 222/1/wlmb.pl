#!/usr/bin/env perl
use v5.36;

my @sorted=sort {$a<=>$b} my @in=(1, 1, 4, 2, 1, 3);
my @out=grep {$sorted[$_]==$in[$_]} 0..@in-1;
say "@in -> ", 0+@out;
