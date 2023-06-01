#!/usr/bin/env perl
use v5.36;

my @ARGV = <1 2 1 2>;

my @input = @ARGV;

sub advance($pos = 0) {
    return 1 if $pos == @ARGV - 1;
    return 0 if $pos >= @ARGV || $input[$pos] == 0;
    return advance($pos + $input[$pos]);
}

say advance;
