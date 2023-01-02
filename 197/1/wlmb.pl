#!/usr/bin/env perl

use v5.36;

my @A = (1, 0, 3, 0, 0, 5);
say join " ", @A, "->", sort {$a?$b?0:-1:1} @A;
