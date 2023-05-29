#!/usr/bin/env perl
use v5.36;

my @elements = qw/Metal Water Wood Fire Earth/;
my @animals  = qw/Monkey Rooster Dog Pig Rat Ox Tiger Rabbit Dragon Snake Horse Goat/;
my $year     = 2022;
my $element  = $elements[int ($year / 2) % 5];
my $animal   = $animals[$year % 12];

print "$element $animal\n";
