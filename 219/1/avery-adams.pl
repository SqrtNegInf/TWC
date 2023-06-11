#!/usr/bin/env perl
use v5.36;

say $_ for (sort {$a <=> $b} (map {$_ * $_} (-2,-1,0,3,4) ));
