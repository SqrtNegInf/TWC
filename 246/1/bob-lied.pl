#!/usr/bin/env perl
use v5.36;


srand 1;

use feature qw/say/;
say for sort { $a <=> $b} map { int(rand(49)) + 1 } 1..6;
