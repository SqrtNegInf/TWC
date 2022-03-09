#!/usr/bin/env raku
use v6;

# run <script> <number>

my $digSqSum = 34.comb.map(*.Int ** 2).sum;
($digSqSum.sqrt.Int ** 2 == $digSqSum).Int.say;

