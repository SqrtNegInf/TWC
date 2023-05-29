#!/usr/bin/env perl
use v5.36;

my $yr = 2022;

my @animal = qw/Rat Ox Tiger Rabbit Dragon Snake 
            Horse Goat Monkey Rooster Dog Pig/;

my @element = qw/Wood Fire Earth Metal Water/;

print "$element[ ( ($yr-4) % 10) / 2 ] $animal[$yr % 12 - 4]\n";
