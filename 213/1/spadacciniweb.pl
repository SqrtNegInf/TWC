#!/usr/bin/env perl

use strict;
use warnings;

my @input = <1 2 3 4 5 6>;;
die "Input error\n"
    if scalar @input < 1
       or
       (scalar map { $_ =~ /\D/ ? 1 : () }
                 @input) != 0;

my @list = sort { $b <=> $a } map { $_ % 2 == 0 ? $_ : () } @input;
push @list, sort { $b <=> $a } map { $_ % 2 ? $_ : () } @input;
printf "(%s)\n", join ',', @list;
