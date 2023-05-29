#!/usr/bin/env perl
use v5.36;

my @animalCycle = qw(
  Rat Ox Tiger Rabbit Dragon Snake
  Horse Goat Monkey Rooster Dog Pig
);
my @elementCycle = qw(
  Wood Fire Earth Metal Water
);

@ARGV = (2021)
  unless (scalar @ARGV);

my $YEAR = shift;

printf "Input: %d\n", $YEAR;
printf "Output: %s %s\n", 
       $elementCycle[int(($YEAR+6)/2)%5], 
       $animalCycle[($YEAR+8)%12];
       
