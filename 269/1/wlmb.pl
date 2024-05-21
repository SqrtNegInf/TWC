#!/usr/bin/env perl
use v5.36;

my @ARGV = (1,2,3,4,5);
die <<~"FIN" unless @ARGV;
    Usage: $0 N1 N2...
    to find if there are two or more numbers Ni whose bitwise
    or has the zeroth bit turned off.
    FIN
say "@ARGV -> ", (my @x=grep {($_&1)==0} @ARGV)>=2?"True":"False";
