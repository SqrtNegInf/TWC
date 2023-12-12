#!/usr/bin/env perl

srand 1;

use feature qw/say/;
say for sort { $a <=> $b} map { int(rand(49)) + 1 } 1..6;
