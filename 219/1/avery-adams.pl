#!/usr/bin/env perl
use strict;
use v5.24;

say $_ for (sort {$a <=> $b} (map {$_ * $_} (-2,-1,0,3,4) ));
