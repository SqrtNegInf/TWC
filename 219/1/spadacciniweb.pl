#!/usr/bin/env perl

use strict;
use warnings;

my @input = (-2,-1,0,3,4);
die "Input error\n"
    if scalar @input < 1
       or
       (scalar map { $_ =~ /[\-\d]/ ? () : 1 }
                 @input) != 0;

printf "(%s)\n", join ', ', sort { $a <=> $b } map { $_**2 } @input;
