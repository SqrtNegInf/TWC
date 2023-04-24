#!/usr/bin/env perl

use v5.36;

my @A = <1 2 3 4 5 6>;
say join " ", @A, "->", sort {$a%2 <=> $b%2 || $a<=>$b} @A;
