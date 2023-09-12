#!/usr/bin/env perl

use strict;
use warnings;

my @input = (1,1,2,2,2,3);
die "Input error\n"
    if scalar @input < 1
       or
       (scalar map { $_ =~ /[\-\d]/ ? () : 1 }
                 @input) != 0;

my %freq;
$freq{$_}++
    foreach @input;


printf "(%s) -> %s \n", (join ', ', @input),
                        join ', ', sort { $freq{$a} <=> $freq{$b} || $b <=> $a } @input;
