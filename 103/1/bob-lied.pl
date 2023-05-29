#!/usr/bin/env perl
use v5.36;

my @AnimalCycle = qw( Rat Ox Tiger Rabbit Dragon Snake Horse Goat Monkey Rooster Dog Pig );
my @ElementCycle = qw( Wood Wood Fire Fire Earth Earth Metal Metal Water Water );

my $BaseYear = 1924;

my $year = 2022;
die "Usage: $0 YEAR\n" unless $year;

my $relativeYear = $year - $BaseYear;

my  $animal = $relativeYear % @AnimalCycle;
my $element = $relativeYear % @ElementCycle;

say "$ElementCycle[$element] $AnimalCycle[$animal]";
