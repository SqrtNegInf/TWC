#!/usr/bin/env perl
use v5.24;

say join ', ', sort { $a <=> $b } map { $_ * $_ } (-2,-1,0,3,4);
