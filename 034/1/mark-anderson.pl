#!/usr/bin/env perl
use v5.36;

my @indices = (0 .. 25);
my @letters = ('A' .. 'Z');

my %index;
@index{@letters} = @indices;

say "array: ", @letters[9, 0, 15, 7];
say "hash:  ", join ", ", @index{'J', 'A', 'P', 'H'};
